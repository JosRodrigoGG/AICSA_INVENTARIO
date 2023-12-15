CREATE OR REPLACE FUNCTION SAF.GET_FDU_REPORTE_CUADRO_ORIGEN_USO_FONDOS
(
	P_EMPRESAS VARCHAR2,
    P_FECHA_INICIO DATE,
    P_FECHA_FIN DATE,
    P_MONEDA NUMBER DEFAULT 1
)
RETURN FDU_T_CUADRO_ORIGEN_USO_FONDO AS
	V_FDU_T_CUADRO_ORIGEN_USO_FONDO FDU_T_CUADRO_ORIGEN_USO_FONDO := FDU_T_CUADRO_ORIGEN_USO_FONDO();
	V_NOMBRE VARCHAR2(200);

    CURSOR C_ESTRUCTURA_TITULO IS
        SELECT
            A.ID,
            NULL ID_PADRE,
            (A.NOMBRE) AS NOMBRE,
            1 ORDEN,
            'TITULO_RENGLON' AS TIPO
        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A
        WHERE A.TIPO_REPORTE = 7;
    
    CURSOR C_ESTRUCTURA_SUB_TOTAL IS
        SELECT
            NULL ID,
            A.ID ID_PADRE,
            ('Sub Total') AS NOMBRE,
            2 ORDEN,
            'SUB_TOTAL_RENGLON' AS TIPO
        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A
        WHERE A.TIPO_REPORTE = 7;

    CURSOR C_INGRESOS_EGRESOS(V_MONEDA NUMBER, V_FECHA_INICIO DATE, V_FECHA_FIN DATE, V_EMPRESAS VARCHAR2) IS
        WITH VALORES AS
        (
            SELECT 
                E.CODIGO_EMPRESA,
                G.NUMERO_CUENTA,
                F.CODIGO_CC,
                0 VALOR_EGRESO,
                SUM(SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                )) VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            LEFT JOIN SAF.EST_PROYECTOS G
                ON G.CODIGO_PROYECTO = F.CODIGO_CC
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'C'
            )
            AND E.SERIE != 'A'
            GROUP BY E.CODIGO_EMPRESA, G.NUMERO_CUENTA, F.CODIGO_CC
            UNION ALL
            SELECT 
                E.CODIGO_EMPRESA,
                G.NUMERO_CUENTA,
                F.CODIGO_CC,
                SUM(SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                )) VALOR_EGRESO,
                0 VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            LEFT JOIN SAF.EST_PROYECTOS G
                ON G.CODIGO_PROYECTO = F.CODIGO_CC
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'A'
            )
            AND E.SERIE != 'A'
            GROUP BY E.CODIGO_EMPRESA, G.NUMERO_CUENTA, F.CODIGO_CC
        )
        SELECT
            (
                CASE 
                    WHEN NUMERO_CUENTA IS NULL THEN (CODIGO_EMPRESA || ' - Otros Registros Centro Costo (' || CODIGO_CC || ')')
                    ELSE NVL(SAF.FNC_GET_NOMBRE_CLIENTE(CODIGO_EMPRESA, NUMERO_CUENTA), CODIGO_EMPRESA || ' - Otros Registros Numero Cliente (' || NUMERO_CUENTA || ')')
                END 
            ) DESCRIPCION,
            NUMERO_CUENTA,
            NVL(SUM(VALOR_INGRESO), 0) VALOR_INGRESO,
            NVL(SUM(VALOR_EGRESO), 0) VALOR_EGRESO
        FROM VALORES
        GROUP BY 
            NUMERO_CUENTA,
            (
                CASE 
                    WHEN NUMERO_CUENTA IS NULL THEN (CODIGO_EMPRESA || ' - Otros Registros Centro Costo (' || CODIGO_CC || ')')
                    ELSE NVL(SAF.FNC_GET_NOMBRE_CLIENTE(CODIGO_EMPRESA, NUMERO_CUENTA), CODIGO_EMPRESA || ' - Otros Registros Numero Cliente (' || NUMERO_CUENTA || ')')
                END 
            );
    
    CURSOR C_INVERSION_PRESTAMO_SISTEMA(V_MONEDA NUMBER, V_FECHA_INICIO DATE, V_FECHA_FIN DATE, V_EMPRESAS VARCHAR2) IS
        WITH DATOS AS
        (
            SELECT 
                E.CODIGO_EMPRESA,
                F.CODIGO_CC,
                0 VALOR_EGRESO,
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                ) VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'C'
            )
            AND E.SERIE != 'A'
            AND F.CODIGO_CC LIKE '4%'
            UNION ALL
            SELECT 
                E.CODIGO_EMPRESA,
                F.CODIGO_CC,
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                ) VALOR_EGRESO,
                0 VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'A'
            )
            AND E.SERIE != 'A'
            AND F.CODIGO_CC LIKE '4%'
        )
        SELECT
            CODIGO_CC,
            SAF.FNC_GET_CENTROCOSTOS(CODIGO_CC) DESCRIPCION,
            SUM(VALOR_EGRESO) VALOR_EGRESO,
            SUM(VALOR_INGRESO) VALOR_INGRESO
        FROM DATOS
        GROUP BY CODIGO_CC,  SAF.FNC_GET_CENTROCOSTOS(CODIGO_CC);

    CURSOR C_PROYECTOS(V_MONEDA NUMBER, V_FECHA_INICIO DATE, V_FECHA_FIN DATE, V_EMPRESAS VARCHAR2) IS
        WITH DATOS AS
        (
            SELECT 
                F.CODIGO_CC,
                0 VALOR_EGRESO,
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                ) VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'C'
            )
            AND E.SERIE != 'A'
            AND F.CODIGO_CC LIKE '2%'
            UNION ALL
            SELECT 
                F.CODIGO_CC,
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                ) VALOR_EGRESO,
                0 VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'A'
            )
            AND E.SERIE != 'A'
            AND F.CODIGO_CC LIKE '2%'
        )
        SELECT
            B.NUMERO_CUENTA,
            B.NUMERO_CUENTA || ' - ' || SAF.FNC_GET_NOMBRE_CLIENTE(229, B.NUMERO_CUENTA) DESCRIPCION,
            (
                CASE
                    WHEN SAF.FNC_GET_NOMBRE_CLIENTE(229, B.NUMERO_CUENTA) IS NOT NULL THEN 1
                    ELSE 2
                END
            ) ESTADO_CLIENTE,
            SUM(A.VALOR_EGRESO) VALOR_EGRESO,
            SUM(A.VALOR_INGRESO) VALOR_INGRESO
        FROM DATOS A
        INNER JOIN SAF.EST_PROYECTOS B
            ON B.CODIGO_PROYECTO = A.CODIGO_CC
            AND B.NUMERO_CUENTA IS NOT NULL
        GROUP BY B.NUMERO_CUENTA, B.NUMERO_CUENTA || ' - ' || SAF.FNC_GET_NOMBRE_CLIENTE(229, B.NUMERO_CUENTA);
    
    CURSOR C_SIC(V_MONEDA NUMBER, V_FECHA_INICIO DATE, V_FECHA_FIN DATE, V_EMPRESAS VARCHAR2) IS
        WITH DATOS AS
        (
            SELECT 
                F.CODIGO_CC,
                0 VALOR_EGRESO,
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                ) VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'C'
            )
            AND E.SERIE != 'A'
            AND F.CODIGO_CC LIKE '1%'
            UNION ALL
            SELECT 
                F.CODIGO_CC,
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                ) VALOR_EGRESO,
                0 VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'A'
            )
            AND E.SERIE != 'A'
            AND F.CODIGO_CC LIKE '1%'
        )
        SELECT
            SUM(A.VALOR_EGRESO) VALOR_EGRESO,
            SUM(A.VALOR_INGRESO) VALOR_INGRESO
        FROM DATOS A;

    CURSOR C_OTROS_REGISTROS(V_MONEDA NUMBER, V_FECHA_INICIO DATE, V_FECHA_FIN DATE, V_EMPRESAS VARCHAR2) IS
        WITH DATOS AS
        (
            SELECT 
                F.CODIGO_CC,
                0 VALOR_EGRESO,
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                ) VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'C'
            )
            AND E.SERIE != 'A'
            AND F.CODIGO_CC LIKE '2%'
            UNION ALL
            SELECT 
                F.CODIGO_CC,
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                ) VALOR_EGRESO,
                0 VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND E.CODIGO_EMPRESA > 99
            AND E.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND E.TIPO_TRANSACCION IN 
            (
                SELECT 
                    TIPO_TRANSACCION
                FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
                WHERE CODIGO_MODULO = 8
                AND CARGO_ABONO   = 'A'
            )
            AND E.SERIE != 'A'
            AND F.CODIGO_CC LIKE '2%'
        )
        SELECT
            A.CODIGO_CC,
            (A.CODIGO_CC || ' - ' || B.DESCRIPCION || ': Sin cliente asignado') DESCRIPCION,
            SUM(A.VALOR_EGRESO) VALOR_EGRESO,
            SUM(A.VALOR_INGRESO) VALOR_INGRESO
        FROM DATOS A
        INNER JOIN SAF.EST_PROYECTOS B
            ON B.CODIGO_PROYECTO = A.CODIGO_CC
            AND B.NUMERO_CUENTA IS NULL
        GROUP BY A.CODIGO_CC, (A.CODIGO_CC || ' - ' || B.DESCRIPCION || ': Sin cliente asignado')
        UNION ALL
        SELECT
            A.CODIGO_CC,
            (A.CODIGO_CC || ' - Centro de Costo sin proyecto asignado') DESCRIPCION,
            SUM(A.VALOR_EGRESO) VALOR_EGRESO,
            SUM(A.VALOR_INGRESO) VALOR_INGRESO
        FROM DATOS A
        LEFT JOIN SAF.EST_PROYECTOS B
            ON B.CODIGO_PROYECTO = A.CODIGO_CC
        WHERE B.CODIGO_PROYECTO IS NULL
        GROUP BY A.CODIGO_CC, (A.CODIGO_CC || ' - Centro de Costo sin proyecto asignado');

    CURSOR C_PRESTAMOS_INVERSIONES(V_MONEDA NUMBER, V_FECHA_INICIO DATE, V_FECHA_FIN DATE, V_EMPRESAS VARCHAR2) IS
        WITH DATOS AS
        (
            SELECT 
                A.TIPO_DESTINATARIO,
                (
                    SAF.APX_FNC_CONVERSION_MONEDAS
                    (
                        NVL(A.MONTO_ORIGEN, 0),
                        A.CODIGO_MONEDA,
                        V_MONEDA,
                        A.TASA_CAMBIO,
                        NULL
                    )
                ) EGRESO,
                (
                    SAF.APX_FNC_CONVERSION_MONEDAS
                    (
                        NVL(A.MONTO_RECUPERADO_ORIGEN, 0),
                        A.CODIGO_MONEDA,
                        V_MONEDA,
                        A.TASA_CAMBIO,
                        NULL
                    )
                ) INGRESO,
                (
                    CASE 
                        WHEN A.ES_PRESTAMO = 'S' THEN 325
                        ELSE 324
                    END
                ) TIPO_RENGLON,
                A.ES_PRESTAMO
            FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
            INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG B
                ON B.ID_FDU_TRANSACCIONES_FINANCIERAS = A.ID
                AND (B.ESTADO = 'ACEPTADO' OR B.ESTADO = 'CANCELADO')
            WHERE A.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND TRUNC(B.FECHA_ACEPTACION) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            UNION ALL
            SELECT 
                A.TIPO_DESTINATARIO,
                (
                    SAF.APX_FNC_CONVERSION_MONEDAS
                    (
                        NVL(A.MONTO_RECUPERADO_ORIGEN, 0),
                        A.CODIGO_MONEDA,
                        V_MONEDA,
                        A.TASA_CAMBIO,
                        NULL
                    )
                ) EGRESO,
                (
                    SAF.APX_FNC_CONVERSION_MONEDAS
                    (
                        NVL(A.MONTO_ORIGEN, 0),
                        A.CODIGO_MONEDA,
                        V_MONEDA,
                        A.TASA_CAMBIO,
                        NULL
                    )
                ) INGRESO,
                (
                    CASE 
                        WHEN A.ES_PRESTAMO = 'S' THEN 325
                        ELSE 324
                    END
                ) TIPO_RENGLON,
                A.ES_PRESTAMO
            FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
            INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG B
                ON B.ID_FDU_TRANSACCIONES_FINANCIERAS = A.ID
                AND (B.ESTADO = 'ACEPTADO' OR B.ESTADO = 'CANCELADO')
            WHERE TRUNC(B.FECHA_ACEPTACION) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND A.TIPO_DESTINATARIO = 'EMPRESA'
            AND A.ID_ASOCIACION IN 
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
        )
        SELECT
            TIPO_DESTINATARIO,
            SUM(
                EGRESO
            ) EGRESO,
            SUM(
                INGRESO
            ) INGRESO,
            TIPO_RENGLON,
            ES_PRESTAMO
        FROM DATOS
        GROUP BY TIPO_DESTINATARIO, ES_PRESTAMO, TIPO_RENGLON;
   
	CURSOR C_SUMA_SUB_TOTAL(P_FDU_T_CUADRO_ORIGEN_USO_FONDO FDU_T_CUADRO_ORIGEN_USO_FONDO) IS
		SELECT
			ID_PADRE,
            SUM(INGRESOS) INGRESOS,
            SUM(EGRESOS) EGRESOS,
            SUM(VARIACION) VARIACION
		FROM TABLE
		(
			P_FDU_T_CUADRO_ORIGEN_USO_FONDO
		)
		WHERE TIPO_RENGLON = 'DETALLE'
        AND ID_PADRE IN
        (
            SELECT
                A.ID
            FROM SAF.PLANTILLA_ASIGNACION_NOTAS A
            WHERE TIPO_REPORTE = 7
        )
        GROUP BY ID_PADRE;
    
    CURSOR C_SUMA_TOTAL(P_FDU_T_CUADRO_ORIGEN_USO_FONDO FDU_T_CUADRO_ORIGEN_USO_FONDO) IS
		SELECT
            SUM(INGRESOS) INGRESOS,
            SUM(EGRESOS) EGRESOS,
            SUM(VARIACION) VARIACION
		FROM TABLE
		(
			P_FDU_T_CUADRO_ORIGEN_USO_FONDO
		)
		WHERE TIPO_RENGLON = 'SUB_TOTAL_RENGLON'
        AND ID_PADRE IN
        (
            SELECT
                A.ID
            FROM SAF.PLANTILLA_ASIGNACION_NOTAS A
            WHERE TIPO_REPORTE = 7
        );
   
BEGIN
    FOR R_TEMP IN C_ESTRUCTURA_TITULO
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            NULL,
            R_TEMP.NOMBRE,
            NULL,
            NULL,
            NULL,
            R_TEMP.TIPO,
            'font-weight: bold; text-decoration: underline;',
            1,
            R_TEMP.ID,
            R_TEMP.ID_PADRE
        );
    END LOOP;

    FOR R_TEMP IN C_ESTRUCTURA_SUB_TOTAL
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            NULL,
            '&emsp;&emsp;' || R_TEMP.NOMBRE,
            0,
            0,
            0,
            R_TEMP.TIPO,
            'font-weight: bold;',
            3,
            R_TEMP.ID,
            R_TEMP.ID_PADRE
        );
    END LOOP;

    /*FOR R_TEMP IN C_INGRESOS_EGRESOS(P_MONEDA, P_FECHA_INICIO, P_FECHA_FIN, P_EMPRESAS)
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            R_TEMP.NUMERO_CUENTA,
            R_TEMP.DESCRIPCION,
            R_TEMP.VALOR_INGRESO,
            R_TEMP.VALOR_EGRESO,
            R_TEMP.VALOR_INGRESO - R_TEMP.VALOR_EGRESO,
            'DETALLE',
            NULL,
            2,
            NULL,
            (
                CASE
                    WHEN SAF.FNC_GET_ES_EMPRESA_INTERCOMPANY(R_TEMP.NUMERO_CUENTA) = 'S' THEN 326
                    ELSE 327
                END
            )
        );
    END LOOP;*/
    
    FOR R_TEMP IN C_INVERSION_PRESTAMO_SISTEMA(P_MONEDA, P_FECHA_INICIO, P_FECHA_FIN, P_EMPRESAS)
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            R_TEMP.CODIGO_CC,
            R_TEMP.DESCRIPCION,
            R_TEMP.VALOR_INGRESO,
            R_TEMP.VALOR_EGRESO,
            R_TEMP.VALOR_INGRESO - R_TEMP.VALOR_EGRESO,
            'DETALLE',
            NULL,
            2,
            NULL,
            341
        );
    END LOOP;

    FOR R_TEMP IN C_PROYECTOS(P_MONEDA, P_FECHA_INICIO, P_FECHA_FIN, P_EMPRESAS)
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            R_TEMP.NUMERO_CUENTA,
            (
                CASE
                    WHEN R_TEMP.ESTADO_CLIENTE = 1 THEN R_TEMP.DESCRIPCION
                    ELSE 'Cliente ' || R_TEMP.NUMERO_CUENTA || ': No esta creado en todas las empresas'
                END
            ),
            R_TEMP.VALOR_INGRESO,
            R_TEMP.VALOR_EGRESO,
            R_TEMP.VALOR_INGRESO - R_TEMP.VALOR_EGRESO,
            'DETALLE',
            NULL,
            2,
            NULL,
            (
                CASE
                    WHEN R_TEMP.ESTADO_CLIENTE = 1 THEN
                        CASE
                            WHEN SAF.FNC_GET_ES_EMPRESA_INTERCOMPANY(R_TEMP.NUMERO_CUENTA) = 'S' THEN 326
                            ELSE 327
                        END
                    ELSE 362
                END
            )
        );
    END LOOP;

    FOR R_TEMP IN C_SIC(P_MONEDA, P_FECHA_INICIO, P_FECHA_FIN, P_EMPRESAS)
    LOOP
	    SELECT 
	    	NOMBRE
    	INTO
    		V_NOMBRE
	   	FROM SAF.PLANTILLA_ASIGNACION_NOTAS 
	  	WHERE TIPO_REPORTE = 7 
	  	AND ID = 361;
	  
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            NULL,
            V_NOMBRE,
            R_TEMP.VALOR_INGRESO,
            R_TEMP.VALOR_EGRESO,
            R_TEMP.VALOR_INGRESO - R_TEMP.VALOR_EGRESO,
            'DETALLE',
            NULL,
            2,
            NULL,
            361
        );
    END LOOP;

    FOR R_TEMP IN C_OTROS_REGISTROS(P_MONEDA, P_FECHA_INICIO, P_FECHA_FIN, P_EMPRESAS)
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            R_TEMP.CODIGO_CC,
            R_TEMP.DESCRIPCION,
            R_TEMP.VALOR_INGRESO,
            R_TEMP.VALOR_EGRESO,
            R_TEMP.VALOR_INGRESO - R_TEMP.VALOR_EGRESO,
            'DETALLE',
            NULL,
            2,
            NULL,
            362
        );
    END LOOP;

    FOR R_TEMP IN C_PRESTAMOS_INVERSIONES(P_MONEDA, P_FECHA_INICIO, P_FECHA_FIN, P_EMPRESAS)
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            NULL,
            R_TEMP.TIPO_DESTINATARIO,
            R_TEMP.INGRESO,
            R_TEMP.EGRESO,
            R_TEMP.INGRESO - R_TEMP.EGRESO,
            'DETALLE',
            NULL,
            2,
            NULL,
            R_TEMP.TIPO_RENGLON
        );
    END LOOP;

    FOR R_TEMP IN C_SUMA_SUB_TOTAL(V_FDU_T_CUADRO_ORIGEN_USO_FONDO)
    LOOP
        FOR i IN 1..V_FDU_T_CUADRO_ORIGEN_USO_FONDO.COUNT
        LOOP
            IF V_FDU_T_CUADRO_ORIGEN_USO_FONDO(i).TIPO_RENGLON = 'SUB_TOTAL_RENGLON'
                AND V_FDU_T_CUADRO_ORIGEN_USO_FONDO(i).ID_PADRE = R_TEMP.ID_PADRE THEN
                V_FDU_T_CUADRO_ORIGEN_USO_FONDO(i).INGRESOS := R_TEMP.INGRESOS;
                V_FDU_T_CUADRO_ORIGEN_USO_FONDO(i).EGRESOS := R_TEMP.EGRESOS;
                V_FDU_T_CUADRO_ORIGEN_USO_FONDO(i).VARIACION := R_TEMP.VARIACION;

                EXIT;
            END IF;
        END LOOP;
    END LOOP;

    FOR R_TEMP IN C_SUMA_TOTAL(V_FDU_T_CUADRO_ORIGEN_USO_FONDO)
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            NULL,
            '&emsp;&emsp;&emsp; TOTAL',
            R_TEMP.INGRESOS,
            R_TEMP.EGRESOS,
            R_TEMP.VARIACION,
            'TOTAL_RENGLON',
            'font-weight: bold;',
            4,
            NULL,
            NULL
        );
    END LOOP;

    RETURN V_FDU_T_CUADRO_ORIGEN_USO_FONDO;
END GET_FDU_REPORTE_CUADRO_ORIGEN_USO_FONDOS;