CREATE OR REPLACE FUNCTION SAF.GET_FDU_REPORTE_CUADRO_ORIGEN_USO_FONDOS
(
	P_EMPRESAS VARCHAR2,
    P_FECHA_INICIO DATE,
    P_FECHA_FIN DATE,
    P_MONEDA NUMBER DEFAULT 1
)
RETURN FDU_T_CUADRO_ORIGEN_USO_FONDO AS
	V_FDU_T_CUADRO_ORIGEN_USO_FONDO FDU_T_CUADRO_ORIGEN_USO_FONDO := FDU_T_CUADRO_ORIGEN_USO_FONDO();

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
                A.CODIGO_EMPRESA,
                B.NUMERO_CUENTA,
                SUM(SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(C.VALOR_ORIGEN, 0),
                    NVL(C.CODIGO_MONEDA, 1),
                    V_MONEDA,
                    NULL,
                    NULL
                )) VALOR_EGRESO,
                0 VALOR_INGRESO
            FROM CXP_TRANSACCIONES A, EST_PROYECTOS B, CXP_RELACION_DOCUMENTOS C
            WHERE A.TIPO_TRANSACCION = 34
            AND A.CODIGO_CC = B.CODIGO_CC(+)
            AND A.TIPO_TRANSACCION = C.TIPO_TRANSACCION_CARGO
            AND A.CODIGO_PROVEEDOR = C.CODIGO_PROVEEDOR
            AND A.SERIE_DOCUMENTO  = C.SERIE_DOCUMENTO_CARGO
            AND A.NUMERO_DOCUMENTO = C.NUMERO_DOCUMENTO_CARGO
            AND TRUNC(C.FECHA_RELACION) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
            AND A.CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
            )
            AND C.TIPO_TRANSACCION_ABONO NOT IN (957, 972)
            AND C.SERIE_DOCUMENTO_ABONO != 'A'
            AND C.SERIE_DOCUMENTO_CARGO != 'A'
            GROUP BY A.CODIGO_EMPRESA, B.NUMERO_CUENTA
            UNION ALL
            SELECT 
                E.CODIGO_EMPRESA, 
                G.NUMERO_CUENTA,
                0 VALOR_EGRESO,
                SUM(SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(F.VALOR, 0),
                    1,
                    V_MONEDA,
                    NULL,
                    NULL
                )) VALOR_INGRESO
            FROM BCOMOVIG E, BCOMOVID F, EST_PROYECTOS G
            WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
            AND F.CODIGO_CC = G.CODIGO_CC
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
                --AND TIPO_TRANSACCION NOT IN (14)
            )
            AND E.SERIE != 'A'
            GROUP BY E.CODIGO_EMPRESA, G.NUMERO_CUENTA
        )
        SELECT
            NVL(SAF.FNC_GET_NOMBRE_CLIENTE(CODIGO_EMPRESA, NUMERO_CUENTA), CODIGO_EMPRESA || ' - Otros Registros') DESCRIPCION,
            NUMERO_CUENTA,
            NVL(SUM(VALOR_INGRESO), 0) VALOR_INGRESO,
            NVL(SUM(VALOR_EGRESO), 0) VALOR_EGRESO
        FROM VALORES
        GROUP BY NUMERO_CUENTA, NVL(SAF.FNC_GET_NOMBRE_CLIENTE(CODIGO_EMPRESA, NUMERO_CUENTA), CODIGO_EMPRESA || ' - Otros Registros');
    
    CURSOR C_PRESTAMOS_INVERSIONES(V_MONEDA NUMBER, V_FECHA_INICIO DATE, V_FECHA_FIN DATE, V_EMPRESAS VARCHAR2) IS
        SELECT 
            A.TIPO_DESTINATARIO,
            SUM(
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    NVL(A.MONTO_ORIGEN, 0),
                    A.CODIGO_MONEDA,
                    V_MONEDA,
                    A.TASA_CAMBIO,
                    NULL
                )
            ) EGRESO,
            SUM(
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
            ) TIPO_RENGLON
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
        GROUP BY A.TIPO_DESTINATARIO, A.ES_PRESTAMO;
   
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

    FOR R_TEMP IN C_INGRESOS_EGRESOS(P_MONEDA, P_FECHA_INICIO, P_FECHA_FIN, P_EMPRESAS)
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