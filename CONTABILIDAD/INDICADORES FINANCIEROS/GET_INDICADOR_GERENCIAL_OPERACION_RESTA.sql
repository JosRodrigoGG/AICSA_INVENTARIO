create or replace FUNCTION     SAF.GET_INDICADOR_GERENCIAL_OPERACION_RESTA
(
    V_EMPRESA VARCHAR2,
    --  V_DIVISION VARCHAR2,
    V_FECHA_INICIO DATE,
    V_FECHA_FIN DATE,
    V_INDICADOR NUMBER
)
    RETURN NUMBER AS
    CURSOR C_DATO IS
        WITH DATOS_INGRESOS AS (
            SELECT
                --DISTINCT  A.ID,
                'I-' || B.COD_CTA AS CODIGO_PADRE,
                FNC_GET_GASTO(A.CODIGO_GASTO)  AS NOMBRE_GASTO,
                (
                    CASE
                        WHEN V_INDICADOR = 8 THEN
                            GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020)
                        ELSE
                            GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020) --* -1 --[TEMPORALMENTE DESHABILITADO]
                        END
                    ) AS SALDO,
                A.MES
            --FROM SAF.CON_INTEGRACION_GERENCIAL A
            FROM SAF.CON_POLDETXHEAD A
                     INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO
            WHERE B.ID_INDICADOR = V_INDICADOR
              AND A.CODIGO_EMPRESA IN
                  (
                      SELECT
                          REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                      FROM
                          dual CONNECT BY REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) IS NOT NULL
                  )AND TRUNC(TO_DATE(A.FPOL)) BETWEEN TRUNC(V_FECHA_INICIO) AND TRUNC(V_FECHA_FIN)
              AND B.FUNCION = '+'
        ), DATOS_EGRESO AS (
            SELECT
                -- DISTINCT A.ID,
                'E-' || B.COD_CTA AS CODIGO_PADRE,
                FNC_GET_GASTO(A.CODIGO_GASTO) AS NOMBRE_GASTO,
                GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020) SALDO,
                A.MES
            FROM SAF.CON_POLDETXHEAD A
                     INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO
            WHERE B.ID_INDICADOR = V_INDICADOR
              AND A.CODIGO_EMPRESA IN
                  (
                      SELECT
                          REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                      FROM
                          dual CONNECT BY REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) IS NOT NULL
                  )AND TRUNC(TO_DATE(A.FPOL)) BETWEEN TRUNC(V_FECHA_INICIO) AND TRUNC(V_FECHA_FIN)

              AND B.FUNCION = '-'

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