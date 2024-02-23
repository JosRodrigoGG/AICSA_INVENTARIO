CREATE OR REPLACE FUNCTION SAF.GET_INDICADOR_GERENCIAL_PERIODO_DE_PAGO
(
    V_EMPRESA VARCHAR2,
    V_FECHA_INICIO DATE,
    V_FECHA_FIN DATE,
    V_INDICADOR NUMBER
)
    RETURN NUMBER AS
    CURSOR C_MESES_EVALUAR IS
        SELECT
            TRUNC
            (
                    MONTHS_BETWEEN
                    (
                            V_FECHA_FIN,
                            V_FECHA_INICIO
                    )
            ) + 1
        FROM DUAL;

    CURSOR C_FECHAS(P_LEVEL NUMBER) IS
        SELECT
            LEVEL - 1 AS MES,
            (
                CASE
                    WHEN LEVEL = 1 THEN
                        TRUNC(V_FECHA_INICIO)
                    ELSE
                        TRUNC(ADD_MONTHS(TRUNC(V_FECHA_INICIO), LEVEL - 1), 'MM')
                    END
                ) FECHA_INICIAL,
            (
                CASE
                    WHEN LEVEL = P_LEVEL THEN
                        TRUNC(V_FECHA_FIN)
                    ELSE
                        LAST_DAY(TRUNC(ADD_MONTHS(TRUNC(V_FECHA_INICIO), LEVEL - 1), 'MM'))
                    END
                ) FECHA_FINAL
        FROM DUAL
        CONNECT BY LEVEL <= P_LEVEL;

    CURSOR C_VENTAS (P_FECHA_INICIO DATE, P_FECHA_FIN DATE) IS
        /*SELECT
            NVL(SUM(B.VALOR_LOCAL), 0) AS TOTAL
        FROM SAF.Vw_cxp_TransaccionesxProveedor A
                 LEFT JOIN SAF.CXP_RELACION_DOCUMENTOS B
                           ON B.CODIGO_PROVEEDOR = A.CODIGO_PROVEEDOR
                               AND B.SERIE_DOCUMENTO_CARGO = A.SERIE_DOCUMENTO
                               AND B.NUMERO_DOCUMENTO_CARGO = A.NUMERO_DOCUMENTO
                               AND B.CODIGO_EMPRESA = A.CODIGO_EMPRESA
        WHERE A.FECHA_TRANSACCION BETWEEN TRUNC(P_FECHA_INICIO) AND TRUNC(P_FECHA_FIN)
          AND A.CODIGO_EMPRESA IN
              (
                  SELECT
                      REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                  FROM
                      dual CONNECT BY REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) IS NOT NULL
              )
          AND A.TIPO_TRANSACCION = 34
          AND NVL(B.TIPO_TRANSACCION_ABONO, -1) != 972;*/
        SELECT
            SUM(A.CARGO_LOCAL - NVL(B.VALOR_LOCAL, 0)) TOTAL
        FROM SAF.VW_CXP_TRANSACCIONESXPROVEEDOR A
             LEFT JOIN SAF.CXP_RELACION_DOCUMENTOS B
                   ON B.CODIGO_EMPRESA = A.CODIGO_EMPRESA
                   AND B.CODIGO_PROVEEDOR = A.CODIGO_PROVEEDOR
                   AND B.SERIE_DOCUMENTO_CARGO = A.SERIE_DOCUMENTO
                   AND B.NUMERO_DOCUMENTO_CARGO = A.NUMERO_DOCUMENTO
                   AND B.TIPO_TRANSACCION_CARGO = A.TIPO_TRANSACCION
                   AND B.TIPO_TRANSACCION_ABONO = 972
        WHERE A.TIPO_TRANSACCION = 34
          AND TRUNC(A.FECHA_TRANSACCION) BETWEEN TRUNC(P_FECHA_INICIO) AND TRUNC(P_FECHA_FIN)
          AND A.CODIGO_EMPRESA IN
              (
                  SELECT
                      REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) AS CODIGO_EMPRESA
                  FROM
                      dual CONNECT BY REGEXP_SUBSTR(V_EMPRESA, '[^\|]+', 1, level) IS NOT NULL
              );

    P_SALDO NUMBER := 0;
    P_SALDO_INICIAL NUMBER;
    P_SALDO_FINAL NUMBER;
    P_SALDO_VENTA NUMBER;
    P_LEVEL NUMBER := 0;

    P_CONTADOR NUMBER := 0;
BEGIN
    OPEN C_MESES_EVALUAR;
    FETCH C_MESES_EVALUAR INTO P_LEVEL;
    CLOSE C_MESES_EVALUAR;

    IF V_INDICADOR = 10 THEN
        FOR R_FECHAS IN C_FECHAS(P_LEVEL)
            LOOP
                P_SALDO_INICIAL := NVL(
                        SAF.FNC_CXP_TRANSACCIONES_SUMA_SALDO_INICIAL(V_EMPRESA,TO_CHAR(R_FECHAS.FECHA_INICIAL, 'DD/MM/YYYY'), 'Y'), 0);
                P_SALDO_FINAL := NVL(
                        SAF.FNC_CXP_TRANSACCIONES_SUMA_SALDO_FINAL(V_EMPRESA, TO_CHAR(R_FECHAS.FECHA_FINAL, 'DD/MM/YYYY'), 'Y'), 0);

                OPEN C_VENTAS(R_FECHAS.FECHA_INICIAL, R_FECHAS.FECHA_FINAL);
                    FETCH C_VENTAS INTO P_SALDO_VENTA;
                CLOSE C_VENTAS;

                IF P_SALDO_VENTA = 0 THEN
                    P_SALDO := P_SALDO + 0;
                ELSE
                    P_SALDO := P_SALDO + (365 * (P_SALDO_VENTA / ((P_SALDO_INICIAL + P_SALDO_FINAL) / 2)));
                END IF;

                P_CONTADOR := P_CONTADOR + 1;
            END LOOP;
    ELSE
        FOR R_FECHAS IN C_FECHAS(P_LEVEL)
            LOOP
                P_SALDO_INICIAL := NVL(
                        SAF.FNC_CXP_TRANSACCIONES_SUMA_SALDO_INICIAL(V_EMPRESA,TO_CHAR(R_FECHAS.FECHA_INICIAL, 'DD/MM/YYYY'), 'Y'), 0);
                P_SALDO_FINAL := NVL(
                        SAF.FNC_CXP_TRANSACCIONES_SUMA_SALDO_FINAL(V_EMPRESA, TO_CHAR(R_FECHAS.FECHA_FINAL, 'DD/MM/YYYY'), 'Y'), 0);

                OPEN C_VENTAS(R_FECHAS.FECHA_INICIAL, R_FECHAS.FECHA_FINAL);
                FETCH C_VENTAS INTO P_SALDO_VENTA;
                CLOSE C_VENTAS;

                IF P_SALDO_VENTA = 0 THEN
                    P_SALDO := P_SALDO + 0;
                ELSE
                    P_SALDO := P_SALDO + ((P_SALDO_VENTA / ((P_SALDO_INICIAL + P_SALDO_FINAL) / 2)));
                END IF;

                P_CONTADOR := P_CONTADOR + 1;
            END LOOP;
    END IF;

    RETURN CASE WHEN P_CONTADOR != 0 THEN P_SALDO / P_CONTADOR ELSE 0 END;
END GET_INDICADOR_GERENCIAL_PERIODO_DE_PAGO;