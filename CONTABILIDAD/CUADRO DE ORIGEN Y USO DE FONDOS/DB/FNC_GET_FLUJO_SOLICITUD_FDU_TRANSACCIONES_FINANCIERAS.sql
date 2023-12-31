CREATE OR REPLACE FUNCTION SAF.FNC_GET_FLUJO_SOLICITUD_FDU_TRANSACCIONES_FINANCIERAS
(
    PEMPRESA NUMBER,
    PID_FLUJO NUMBER,
    PMONEDA NUMBER
)
RETURN NUMBER IS
L_MONTO_APLICADO NUMBER;
BEGIN
    BEGIN
       SELECT
            SUM
            (
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    MONTO_ORIGEN,
                    CODIGO_MONEDA,
                    PMONEDA,
                    TASA_CAMBIO,
                    NULL
                )
            ) MONTO_APLICAR
        INTO
            L_MONTO_APLICADO
        FROM SAF.FLUJO_EFECTIVO_FDU_TRANSACCIONES_FINANCIERAS
        WHERE CODIGO_EMPRESA IN
        (
            SELECT 
                CODIGO_EMPRESA
            FROM SAF.FLUJO_EMPRESAS_CONSOLIDADORAS
            WHERE CODIGO_EMPRESA_CONSOLIDADORA = PEMPRESA
        )
        AND ID_FLUJO = PID_FLUJO
        AND APLICA_PAGO = 'S'
        AND CODIGO_MONEDA = PMONEDA;

    EXCEPTION WHEN NO_DATA_FOUND THEN
        L_MONTO_APLICADO := 0;
    END;
    
    RETURN NVL(L_MONTO_APLICADO, 0);
END;
