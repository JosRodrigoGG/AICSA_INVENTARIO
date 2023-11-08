CREATE OR REPLACE FUNCTION SAF.GET_INDICADOR_GERENCIAL_OPERACION_DIVISION
(
	V_EMPRESA VARCHAR2,
    V_DIVISION VARCHAR2,
    V_FECHA_INICIO DATE,
    V_FECHA_FIN DATE,
    V_INDICADOR NUMBER
) 
RETURN NUMBER AS
    CURSOR C_DATO IS
        WITH DATOS_VENTAS_TOTALES AS (
            SELECT
                (
                	TO_NUMBER(DECODE(A.DB_HB,'D', A.VALOR, (A.VALOR * -1)))
                ) SALDO
            FROM SAF.CON_POLDETXHEAD A
            INNER JOIN SAF.CON_INDICADORES_FORMULAS B
                ON A.COD_CTA = B.COD_CTA
                AND NVL(A.CODIGO_GASTO, '(en blanco)') = B.CODIGO_GASTO
                AND B.ID_INDICADOR = V_INDICADOR
                AND B.FUNCION = '+'
            WHERE A.CODIGO_EMPRESA IN 
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) IS NOT NULL
            )
            AND A.CODIGO_DIVISION IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_DIVISION, '[^\|]+', 1, level) AS CODIGO_DIVISION
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_DIVISION, '[^\|]+', 1, level) IS NOT NULL
            )
            AND TRUNC(A.FPOL) BETWEEN TRUNC(V_FECHA_INICIO) AND TRUNC(V_FECHA_FIN)
            --AND A.USUARIO_GRABACION = 1
            AND A.EJERCICIO = '2023'
            AND A.COD_TIPOL NOT IN (30)
        ),
        DATOS_ACTIVOS_MEDIOS_TOTALES AS (
            SELECT 
                (
                	TO_NUMBER(DECODE(A.DB_HB,'D', A.VALOR, (A.VALOR * -1)))
                ) SALDO
            FROM SAF.CON_POLDETXHEAD A
            INNER JOIN SAF.CON_INDICADORES_FORMULAS B
                ON A.COD_CTA = B.COD_CTA
                AND NVL(A.CODIGO_GASTO, '(en blanco)') = B.CODIGO_GASTO
                AND B.ID_INDICADOR = V_INDICADOR
                AND B.FUNCION = '/'
            WHERE A.CODIGO_EMPRESA IN 
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) IS NOT NULL
            )
            AND A.CODIGO_DIVISION IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_DIVISION, '[^\|]+', 1, level) AS CODIGO_DIVISION
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_DIVISION, '[^\|]+', 1, level) IS NOT NULL
            )
            AND TRUNC(A.FPOL) BETWEEN TRUNC(V_FECHA_INICIO) AND TRUNC(V_FECHA_FIN)
            --AND A.USUARIO_GRABACION = 1
            AND A.EJERCICIO = '2023'
            AND A.COD_TIPOL NOT IN (30)
        )
        SELECT
            (
                CASE WHEN (SELECT NVL((SUM(SALDO)), 0) FROM DATOS_ACTIVOS_MEDIOS_TOTALES) = 0 THEN
                    0
                ELSE
                    (SELECT NVL((SUM(SALDO)), 0) FROM DATOS_VENTAS_TOTALES) / (SELECT NVL((SUM(SALDO)), 0) FROM DATOS_ACTIVOS_MEDIOS_TOTALES)
                END
            ) SALDO
        FROM DUAL;

    P_SALDO NUMBER;
BEGIN
    OPEN C_DATO;
        FETCH C_DATO INTO P_SALDO;
    CLOSE C_DATO;

    RETURN NVL(P_SALDO, 0);
END GET_INDICADOR_GERENCIAL_OPERACION_DIVISION;