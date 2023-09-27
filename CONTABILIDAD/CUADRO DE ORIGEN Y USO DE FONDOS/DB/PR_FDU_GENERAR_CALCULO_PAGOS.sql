CREATE OR REPLACE PROCEDURE SAF.PR_FDU_GENERAR_CALCULO_PAGOS 
(
    V_ID_TRANSACCION NUMBER
) IS
    CURSOR C_ESTADOS_LOG_ID (P_ID NUMBER) IS
        SELECT
            MAX(A.ID)
        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG A
        WHERE A.ESTADO = 'ACEPTADO'
        AND A.ID_FDU_TRANSACCIONES_FINANCIERAS = P_ID;

    V_ESTADO VARCHAR2(100);
    V_ID NUMBER;
BEGIN
    OPEN C_ESTADOS_LOG_ID(V_ID_TRANSACCION);
        FETCH C_ESTADOS_LOG_ID INTO V_ID;
    CLOSE C_ESTADOS_LOG_ID;

    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL
    (
        ID_FDU_TRANSACCIONES_FINANCIERA,
        CODIGO_MONEDA,
        TASA_MONEDA,
        MONTO_ORIGEN,
        MONTO_LOCAL,
        MES,
        ANIO,
        TIPO_PAGO,
        ESTADO,
        USUARIO_GRABACION,
        FECHA_GRABACION
    )
    SELECT
        A.ID,
    	A.CODIGO_MONEDA,
        A.TASA_CAMBIO,
        (
            A.MONTO_ORIGEN /
            (
                CASE WHEN A.MEDIDA_PLAZO = 511 THEN
                    A.PLAZO * 12
                ELSE
                    A.PLAZO
                END
            )
        ) MONTO_ORIGEN,
        SAF.APX_FNC_CONVERSION_MONEDAS
        (
            (
                A.MONTO_ORIGEN /
                (
                    CASE WHEN A.MEDIDA_PLAZO = 511 THEN
                        A.PLAZO * 12
                    ELSE
                        A.PLAZO
                    END
                )
            ),
            A.CODIGO_MONEDA,
            1,
            A.TASA_CAMBIO,
            NULL
        ) MONTO_LOCAL,
        TO_NUMBER(TO_CHAR(LAST_DAY(ADD_MONTHS(B.FECHA_ACEPTACION, LEVEL - 1)), 'MM')) MES,
        TO_CHAR(LAST_DAY(ADD_MONTHS(B.FECHA_ACEPTACION, LEVEL - 1)), 'YYYY') ANIO,
        1 TIPO_PAGO,
        1 ESTADO,
        1 USUARIO_GRABACION,
        SYSDATE FECHA_GRABACION
    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
    INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG B
        ON B.ID_FDU_TRANSACCIONES_FINANCIERAS = A.ID
        AND B.ID = V_ID
    WHERE A.ID = V_ID_TRANSACCION
    CONNECT BY LEVEL <= 
    (
        CASE WHEN A.MEDIDA_PLAZO = 511 THEN
            A.PLAZO * 12
        ELSE
            A.PLAZO
        END
    );
END;