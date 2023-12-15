CREATE OR REPLACE FUNCTION SAF.GET_FDU_DETALLE_PROYECTOS_CC_2
(
	P_EMPRESAS VARCHAR2,
    P_FECHA_INICIO VARCHAR2,
    P_FECHA_FIN VARCHAR2,
    P_MONEDA NUMBER DEFAULT 1,
    P_FILTRO VARCHAR2 DEFAULT 'N',
    P_NUMERO_CUENTA NUMBER DEFAULT NULL,
    P_VECTOR_CUENTA VARCHAR2 DEFAULT NULL,
    P_VECTOR_PROYECTO VARCHAR2 DEFAULT NULL
)
RETURN FDU_T_CUADRO_ORIGEN_USO_FONDO AS
	V_FDU_T_CUADRO_ORIGEN_USO_FONDO FDU_T_CUADRO_ORIGEN_USO_FONDO := FDU_T_CUADRO_ORIGEN_USO_FONDO();
	V_NOMBRE VARCHAR2(200);
    V_CONTADOR NUMBER;

    CURSOR C_DATOS(V_MONEDA NUMBER, V_EMPRESAS VARCHAR2, V_FECHA_INICIO VARCHAR2, V_FECHA_FIN VARCHAR2, V_NUMERO_CUENTA NUMBER) IS
        SELECT
            E.CODIGO_EMPRESA,
            B.NUMERO_CUENTA,
            NVL(F.CODIGO_CC, E.CODIGO_CC) CODIGO_CENTRO_COSTO,
            0 VALOR_EGRESO,
            SAF.APX_FNC_CONVERSION_MONEDAS
            (
                NVL(NVL(F.VALOR, E.VALOR * E.TASAC), 0),
                1,
                V_MONEDA,
                NULL,
                NULL
            ) VALOR_INGRESO
        FROM BCOMOVIG E
        INNER JOIN BCOMOVID F
            ON E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
        INNER JOIN SAF.EST_PROYECTOS B
            ON B.CODIGO_PROYECTO = NVL(F.CODIGO_CC, E.CODIGO_CC)
            AND B.NUMERO_CUENTA IS NOT NULL
        WHERE E.CODIGO_EMPRESA > 99
        AND E.CODIGO_EMPRESA IN
        (
            SELECT 
                REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) AS CODIGO_EMPRESA
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) IS NOT NULL
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
        AND E.TIPO_TRANSACCION NOT IN (14, 15)
        AND E.SERIE NOT IN ('PD')
        AND E.FANULA IS NULL
        AND NVL(F.CODIGO_CC, E.CODIGO_CC) LIKE '2%'
        AND B.NUMERO_CUENTA = V_NUMERO_CUENTA
        UNION ALL
        SELECT 
            E.CODIGO_EMPRESA,
            B.NUMERO_CUENTA,
            NVL(F.CODIGO_CC, E.CODIGO_CC) CODIGO_CENTRO_COSTO,
            SAF.APX_FNC_CONVERSION_MONEDAS
            (
                NVL(NVL(F.VALOR, E.VALOR * E.TASAC), 0),
                1,
                V_MONEDA,
                NULL,
                NULL
            ) VALOR_EGRESO,
            0 VALOR_INGRESO
        FROM BCOMOVIG E
        INNER JOIN BCOMOVID F
            ON E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
        INNER JOIN SAF.EST_PROYECTOS B
            ON B.CODIGO_PROYECTO = NVL(F.CODIGO_CC, E.CODIGO_CC)
            AND B.NUMERO_CUENTA IS NOT NULL
        WHERE E.CODIGO_EMPRESA > 99
        AND E.CODIGO_EMPRESA IN
        (
            SELECT 
                REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) AS CODIGO_EMPRESA
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) IS NOT NULL
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
        AND E.TIPO_TRANSACCION NOT IN (14, 15)
        AND E.FANULA IS NULL
        AND NVL(F.CODIGO_CC, E.CODIGO_CC) LIKE '2%'
        AND B.NUMERO_CUENTA = V_NUMERO_CUENTA;
    
    CURSOR C_DATOS_TODOS(V_MONEDA NUMBER, V_EMPRESAS VARCHAR2, V_FECHA_INICIO VARCHAR2, V_FECHA_FIN VARCHAR2, 
            V_NUMERO_CUENTA NUMBER) IS
        SELECT
            E.CODIGO_EMPRESA,
            B.NUMERO_CUENTA,
            NVL(F.CODIGO_CC, E.CODIGO_CC) CODIGO_CENTRO_COSTO,
            0 VALOR_EGRESO,
            SAF.APX_FNC_CONVERSION_MONEDAS
            (
                NVL(NVL(F.VALOR, E.VALOR * E.TASAC), 0),
                1,
                V_MONEDA,
                NULL,
                NULL
            ) VALOR_INGRESO
        FROM BCOMOVIG E
        INNER JOIN BCOMOVID F
            ON E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
        INNER JOIN SAF.EST_PROYECTOS B
            ON B.CODIGO_PROYECTO = NVL(F.CODIGO_CC, E.CODIGO_CC)
            AND B.NUMERO_CUENTA IS NOT NULL
        WHERE E.CODIGO_EMPRESA > 99
        AND E.CODIGO_EMPRESA IN
        (
            SELECT 
                REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) AS CODIGO_EMPRESA
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) IS NOT NULL
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
        AND E.TIPO_TRANSACCION NOT IN (14, 15)
        AND E.SERIE NOT IN ('PD')
        AND E.FANULA IS NULL
        AND NVL(F.CODIGO_CC, E.CODIGO_CC) LIKE '2%'
        AND B.NUMERO_CUENTA = V_NUMERO_CUENTA
        UNION ALL
        SELECT 
            E.CODIGO_EMPRESA,
            B.NUMERO_CUENTA,
            NVL(F.CODIGO_CC, E.CODIGO_CC) CODIGO_CENTRO_COSTO,
            SAF.APX_FNC_CONVERSION_MONEDAS
            (
                NVL(NVL(F.VALOR, E.VALOR * E.TASAC), 0),
                1,
                V_MONEDA,
                NULL,
                NULL
            ) VALOR_EGRESO,
            0 VALOR_INGRESO
        FROM BCOMOVIG E
        INNER JOIN BCOMOVID F
            ON E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
        INNER JOIN SAF.EST_PROYECTOS B
            ON B.CODIGO_PROYECTO = NVL(F.CODIGO_CC, E.CODIGO_CC)
            AND B.NUMERO_CUENTA IS NOT NULL
        WHERE E.CODIGO_EMPRESA > 99
        AND E.CODIGO_EMPRESA IN
        (
            SELECT 
                REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) AS CODIGO_EMPRESA
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) IS NOT NULL
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
        AND E.TIPO_TRANSACCION NOT IN (14, 15)
        AND E.FANULA IS NULL
        AND NVL(F.CODIGO_CC, E.CODIGO_CC) LIKE '2%'
        AND B.NUMERO_CUENTA = V_NUMERO_CUENTA;

    CURSOR C_DATOS_FILTRO(V_MONEDA NUMBER, V_EMPRESAS VARCHAR2, V_FECHA_INICIO VARCHAR2, V_FECHA_FIN VARCHAR2, 
            V_NUMERO_CUENTA NUMBER, V_VECTOR_PROYECTO VARCHAR2) IS
        SELECT
            E.CODIGO_EMPRESA,
            B.NUMERO_CUENTA,
            NVL(F.CODIGO_CC, E.CODIGO_CC) CODIGO_CENTRO_COSTO,
            0 VALOR_EGRESO,
            SAF.APX_FNC_CONVERSION_MONEDAS
            (
                NVL(NVL(F.VALOR, E.VALOR * E.TASAC), 0),
                1,
                V_MONEDA,
                NULL,
                NULL
            ) VALOR_INGRESO
        FROM BCOMOVIG E
        INNER JOIN BCOMOVID F
            ON E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
        INNER JOIN SAF.EST_PROYECTOS B
            ON B.CODIGO_PROYECTO = NVL(F.CODIGO_CC, E.CODIGO_CC)
            AND B.NUMERO_CUENTA IS NOT NULL
        WHERE E.CODIGO_EMPRESA > 99
        AND E.CODIGO_EMPRESA IN
        (
            SELECT 
                REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) AS CODIGO_EMPRESA
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) IS NOT NULL
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
        AND E.TIPO_TRANSACCION NOT IN (14, 15)
        AND E.SERIE NOT IN ('PD')
        AND E.FANULA IS NULL
        AND NVL(F.CODIGO_CC, E.CODIGO_CC) LIKE '2%'
        AND B.NUMERO_CUENTA = V_NUMERO_CUENTA
        AND TO_NUMBER(B.CODIGO_PROYECTO) IN 
        (
            select COLUMN_VALUE from
            table ( apex_string.split_numbers(V_VECTOR_PROYECTO,'|') )
        )
        UNION ALL
        SELECT 
            E.CODIGO_EMPRESA,
            B.NUMERO_CUENTA,
            NVL(F.CODIGO_CC, E.CODIGO_CC) CODIGO_CENTRO_COSTO,
            SAF.APX_FNC_CONVERSION_MONEDAS
            (
                NVL(NVL(F.VALOR, E.VALOR * E.TASAC), 0),
                1,
                V_MONEDA,
                NULL,
                NULL
            ) VALOR_EGRESO,
            0 VALOR_INGRESO
        FROM BCOMOVIG E
        INNER JOIN BCOMOVID F
            ON E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
        INNER JOIN SAF.EST_PROYECTOS B
            ON B.CODIGO_PROYECTO = NVL(F.CODIGO_CC, E.CODIGO_CC)
            AND B.NUMERO_CUENTA IS NOT NULL
        WHERE E.CODIGO_EMPRESA > 99
        AND E.CODIGO_EMPRESA IN
        (
            SELECT 
                REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) AS CODIGO_EMPRESA
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\|]+', 1, level) IS NOT NULL
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
        AND E.TIPO_TRANSACCION NOT IN (14, 15)
        AND E.FANULA IS NULL
        AND NVL(F.CODIGO_CC, E.CODIGO_CC) LIKE '2%'
        AND B.NUMERO_CUENTA = V_NUMERO_CUENTA
        AND TO_NUMBER(B.CODIGO_PROYECTO) IN
        (
           select COLUMN_VALUE from
            table ( apex_string.split_numbers(V_VECTOR_PROYECTO,'|') )
        );

    CURSOR C_VECTOR(P_VECTOR VARCHAR2) IS
        SELECT
            COUNT(*) CONTADOR
        FROM
        (
            SELECT 
                REGEXP_SUBSTR(P_VECTOR, '[^\|]+', 1, level) AS NUMERO_CUENTA
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(P_VECTOR, '[^\|]+', 1, level) IS NOT NULL
        )
        WHERE TO_NUMBER(NUMERO_CUENTA) = '0';

BEGIN
    IF P_FILTRO = 'N' THEN
        FOR R_TEMP IN C_DATOS(P_MONEDA, P_EMPRESAS, P_FECHA_INICIO, P_FECHA_FIN, P_NUMERO_CUENTA)
        LOOP
            V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
            V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
            (
                R_TEMP.CODIGO_EMPRESA,
                R_TEMP.NUMERO_CUENTA,
                R_TEMP.CODIGO_CENTRO_COSTO,
                R_TEMP.VALOR_INGRESO,
                R_TEMP.VALOR_EGRESO,
                NULL,
                NULL,
                NULL,
                NULL,
                NULL,
                NULL
            );
        END LOOP;                     
    ELSE
        OPEN C_VECTOR(P_VECTOR_PROYECTO);
            FETCH C_VECTOR INTO V_CONTADOR;
        CLOSE C_VECTOR;

        IF V_CONTADOR > 0 THEN
            FOR R_TEMP IN C_DATOS_TODOS(P_MONEDA, P_EMPRESAS, P_FECHA_INICIO, P_FECHA_FIN, P_NUMERO_CUENTA)
            LOOP
                V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
                V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
                (
                    R_TEMP.CODIGO_EMPRESA,
                    R_TEMP.NUMERO_CUENTA,
                    R_TEMP.CODIGO_CENTRO_COSTO,
                    R_TEMP.VALOR_INGRESO,
                    R_TEMP.VALOR_EGRESO,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL
                );
            END LOOP;  
        ELSE
            FOR R_TEMP IN C_DATOS_FILTRO(P_MONEDA, P_EMPRESAS, P_FECHA_INICIO, P_FECHA_FIN, P_NUMERO_CUENTA, P_VECTOR_PROYECTO)
            LOOP
                V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
                V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
                (
                    R_TEMP.CODIGO_EMPRESA,
                    R_TEMP.NUMERO_CUENTA,
                    R_TEMP.CODIGO_CENTRO_COSTO,
                    R_TEMP.VALOR_INGRESO,
                    R_TEMP.VALOR_EGRESO,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL
                );
            END LOOP; 
        END IF;
    END IF;
    RETURN V_FDU_T_CUADRO_ORIGEN_USO_FONDO;
END GET_FDU_DETALLE_PROYECTOS_CC_2;