CREATE OR REPLACE PROCEDURE SAF.EST_CS_CAMBIO_MONEDA_CONTRATO
(
    V_CS_COTRATOID NUMBER,
    V_CS_TASA_CAMBIO NUMBER,
    V_CS_NUEVA_MONEDA NUMBER
) AS 
    CURSOR C_ACTIVIDADES(P_CS_COTRATOID NUMBER, P_DE NUMBER, P_A NUMBER, P_TASA_DE NUMBER, P_TASA_A NUMBER) IS
        SELECT
            A.ID,
            A.CANTIDAD,
            SAF.APX_FNC_CONVERSION_MONEDAS
            (
                NVL(A.COSTO_UNITARIO, 0),
                P_DE,
                P_A,
                P_TASA_DE,
                P_TASA_A
            ) COSTO_UNITARIO,
            A.INDIRECTO_PORCENTAJE
        FROM SAF.EST_CS_ACTIVIDADES A
        INNER JOIN SAF.EST_CS_RENGLONES B
            ON B.ID = A.ID_EST_CS_RENGLONES3
            AND B.ID_CS_CONTRATOS_SERVICIO = P_CS_COTRATOID;

    P_MONEDA_CS NUMBER;
    P_TASA_CAMBIO_CS NUMBER;
BEGIN 
	SELECT
        CODIGO_MONEDA,
        TASA_CAMBIO
    INTO
        P_MONEDA_CS,
        P_TASA_CAMBIO_CS
    FROM SAF.EST_CS_CONTRATOS_SERVICIO
    WHERE ID = V_CS_COTRATOID;

    IF P_MONEDA_CS IS NOT NULL AND P_TASA_CAMBIO_CS IS NOT NULL THEN
        FOR R_ACTIVIDADES IN C_ACTIVIDADES(V_CS_COTRATOID, P_MONEDA_CS, V_CS_NUEVA_MONEDA, P_TASA_CAMBIO_CS, V_CS_TASA_CAMBIO)
        LOOP
            UPDATE SAF.EST_CS_ACTIVIDADES SET
                COSTO_UNITARIO = R_ACTIVIDADES.COSTO_UNITARIO,
                COSTO_TOTAL = (R_ACTIVIDADES.COSTO_UNITARIO * R_ACTIVIDADES.CANTIDAD),
                INDIRECTO = (R_ACTIVIDADES.COSTO_UNITARIO * R_ACTIVIDADES.CANTIDAD) * (R_ACTIVIDADES.INDIRECTO_PORCENTAJE / 100),
                PRECIO_UNITARIO = (((R_ACTIVIDADES.COSTO_UNITARIO * R_ACTIVIDADES.CANTIDAD) * (R_ACTIVIDADES.INDIRECTO_PORCENTAJE / 100)) + (R_ACTIVIDADES.COSTO_UNITARIO * R_ACTIVIDADES.CANTIDAD)) / R_ACTIVIDADES.CANTIDAD,
                PRECIO_TOTAL = (((R_ACTIVIDADES.COSTO_UNITARIO * R_ACTIVIDADES.CANTIDAD) * (R_ACTIVIDADES.INDIRECTO_PORCENTAJE / 100)) + (R_ACTIVIDADES.COSTO_UNITARIO * R_ACTIVIDADES.CANTIDAD))
            WHERE ID = R_ACTIVIDADES.ID;
        END LOOP;
    END IF;
END;