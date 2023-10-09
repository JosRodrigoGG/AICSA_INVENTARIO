CREATE OR REPLACE FUNCTION SAF.GET_INDICADOR_GERENCIAL_OPERACION_RESTA
(
	V_EMPRESA VARCHAR2,
    V_DIVISION VARCHAR2,
    V_FECHA_INICIO DATE,
    V_FECHA_FIN DATE,
    V_INDICADOR NUMBER
) 
RETURN NUMBER AS
    CURSOR C_DATO IS
        WITH DATOS_INGRESOS AS (
            SELECT 
                DISTINCT A.ID,
                'I-' || B.COD_CTA AS CODIGO_PADRE,
                A.NOMBRE_GASTO AS NOMBRE_GASTO,
                (
                    CASE
                        WHEN V_INDICADOR = 8 THEN
                            A.SALDO
                        ELSE
                            A.SALDO * -1
                    END
                ) AS SALDO,
                A.MES
            FROM SAF.CON_INTEGRACION_GERENCIAL A
            INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO
            WHERE B.ID_INDICADOR = V_INDICADOR
            AND A.CODIGO_EMPRESA IN 
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) IS NOT NULL
            )
            AND A.CODIGO_DIVISION IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_DIVISION, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_DIVISION, '[^\|]+', 1, level) IS NOT NULL
            )
            AND TRUNC(A.FECHA_POLIZA) BETWEEN TRUNC(V_FECHA_INICIO) AND TRUNC(V_FECHA_FIN)
            AND B.FUNCION = '+'
            AND A.USUARIO_GRABACION = 1
        ), DATOS_EGRESO AS (
            SELECT 
                DISTINCT A.ID,
                'E-' || B.COD_CTA AS CODIGO_PADRE,
                A.NOMBRE_GASTO AS NOMBRE_GASTO,
                A.SALDO,
                A.MES
            FROM SAF.CON_INTEGRACION_GERENCIAL A
            INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO
            WHERE B.ID_INDICADOR = V_INDICADOR
            AND A.CODIGO_EMPRESA IN 
            (
                SELECT 
                    REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) IS NOT NULL
            )
            AND A.CODIGO_DIVISION IN
            (
                SELECT 
                    REGEXP_SUBSTR(V_DIVISION, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(V_DIVISION, '[^\|]+', 1, level) IS NOT NULL
            )
            AND TRUNC(A.FECHA_POLIZA) BETWEEN TRUNC(V_FECHA_INICIO) AND TRUNC(V_FECHA_FIN)
            AND B.FUNCION = '-'
            AND A.USUARIO_GRABACION = 1
        )
        SELECT
            (
                (SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_INGRESOS)
                -
                (SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_EGRESO)
            ) SALDO
        FROM DUAL;

    P_SALDO NUMBER;
BEGIN
    OPEN C_DATO;
        FETCH C_DATO INTO P_SALDO;
    CLOSE C_DATO;

    RETURN NVL(P_SALDO, 0);
END GET_INDICADOR_GERENCIAL_OPERACION_RESTA;