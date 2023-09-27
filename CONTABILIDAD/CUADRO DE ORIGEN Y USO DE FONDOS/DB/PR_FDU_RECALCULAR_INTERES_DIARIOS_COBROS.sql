CREATE OR REPLACE PROCEDURE SAF.PR_FDU_RECALCULAR_INTERES_DIARIOS_COBROS
    (
        V_FECHA_INICIO DATE, 
        V_ID_TRANSACCION NUMBER
    ) IS
    CURSOR C_DATOS IS
        SELECT
            A.ID
        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
        WHERE A.ESTADO = 'ACEPTADO'
        AND A.ES_PRESTAMO = 'S'
        AND A.ID = V_ID_TRANSACCION;
    
    CURSOR C_ESTADOS_LOG_ID (P_ID NUMBER) IS
        SELECT
            MAX(A.ID)
        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG A
        WHERE A.ESTADO = 'ACEPTADO'
        AND A.ID_FDU_TRANSACCIONES_FINANCIERAS = P_ID;

    V_ESTADO VARCHAR2(100);
    V_ID NUMBER;
    V_ID_NUMBE VARCHAR2(200);
BEGIN
    FOR R_DATOS IN C_DATOS
    LOOP
        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE
        (
            ID_FDU_TRANSACCIONES_FINANCIERAS,
            FECHA_INTERES,
            CODIGO_MONEDA,
            TASA_MONEDA,
            MONTO_ORIGEN,
            MONTO_LOCAL,
            ESTADO,
            CAPITAL,
            USUARIO_GRABACION,
            FECHA_GRABACION
        )
        SELECT
            ID,
            FECHA_COBRO,
            CODIGO_MONEDA,
            TASA_CAMBIO,
            (
            	MONTO_VALUAR * (TASA_INTERES / 100)
            ) MONTO_ORIGEN,
            (
            SAF.APX_FNC_CONVERSION_MONEDAS(MONTO_VALUAR * (TASA_INTERES / 100), CODIGO_MONEDA, 1, TASA_CAMBIO, NULL)
            ) MONTO_LOCAL,
            1,
            MONTO_VALUAR,
            1,
            SYSDATE
        FROM
        (
            SELECT
                A.ID,
                ROUND(A.MONTO_ORIGEN - NVL(A.MONTO_RECUPERADO_ORIGEN, 0), 2) MONTO_VALUAR,
                (
                    CASE WHEN A.TIPO_TASA = 1 THEN
                    A.TASA_INTERES / 30
                    ELSE
                    A.TASA_INTERES / 360
                    END
                ) TASA_INTERES,
                A.TASA_CAMBIO,
                A.CODIGO_MONEDA,
                V_FECHA_INICIO AS FECHA_COBRO
            FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
            WHERE A.ID = R_DATOS.ID
            AND TRUNC(V_FECHA_INICIO) NOT IN
            (
            	SELECT TRUNC(FECHA_INTERES) FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE WHERE ID_FDU_TRANSACCIONES_FINANCIERAS = R_DATOS.ID
            )
        );

        V_ID := NULL;
        
        OPEN C_ESTADOS_LOG_ID(R_DATOS.ID);
            FETCH C_ESTADOS_LOG_ID INTO V_ID;
        CLOSE C_ESTADOS_LOG_ID;

        IF V_ID IS NOT NULL THEN
            IF EXTRACT(DAY FROM V_FECHA_INICIO) = (EXTRACT(DAY FROM LAST_DAY(V_FECHA_INICIO)) - 1) THEN
                INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE
                (
                    ID_FDU_TRANSACCIONES_FINANCIERAS,
                    FECHA_INTERES,
                    CODIGO_MONEDA,
                    TASA_MONEDA,
                    MONTO_ORIGEN,
                    MONTO_LOCAL,
                    ESTADO,
                    CAPITAL,
                    USUARIO_GRABACION,
                    FECHA_GRABACION
                )
                SELECT
                    ID,
                    FECHA_COBRO,
                    CODIGO_MONEDA,
                    TASA_CAMBIO,
                    (
                        MONTO_VALUAR * (TASA_INTERES / 100)
                    ) MONTO_ORIGEN,
                    (
                        SAF.APX_FNC_CONVERSION_MONEDAS(MONTO_VALUAR * (TASA_INTERES / 100), CODIGO_MONEDA, 1, TASA_CAMBIO, NULL)
                    ) MONTO_LOCAL,
                    1,
                    MONTO_VALUAR,
                    1,
                    SYSDATE
                FROM
                (
                    SELECT
                        A.ID,
                        ROUND(A.MONTO_ORIGEN - NVL(A.MONTO_RECUPERADO_ORIGEN, 0), 2) MONTO_VALUAR,
                        (
                            CASE WHEN A.TIPO_TASA = 1 THEN
                            A.TASA_INTERES / 30
                            ELSE
                            A.TASA_INTERES / 360
                            END
                        ) TASA_INTERES,
                        A.TASA_CAMBIO,
                        A.CODIGO_MONEDA,
                        (V_FECHA_INICIO + 1) AS FECHA_COBRO
                    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
                    WHERE A.ID = R_DATOS.ID
                    AND TRUNC(V_FECHA_INICIO + 1) NOT IN
                    (
                        SELECT TRUNC(FECHA_INTERES) FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE WHERE ID_FDU_TRANSACCIONES_FINANCIERAS = R_DATOS.ID
                    )
                );

                INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS
                (
                    ID_FDU_TRANSACCIONES_FINANCIERAS,
                    CODIGO_MONEDA,
                    TASA_MONEDA,
                    MONTO_ORIGEN,
                    MONTO_LOCAL,
                    MES,
                    ANIO,
                    ESTADO,
                    USUARIO_GRABACION,
                    FECHA_GRABACION
                )
                SELECT
                    A.ID,
                    A.CODIGO_MONEDA,
                    A.TASA_CAMBIO,
                    SUM(C.MONTO_ORIGEN) MONTO_ORIGEN,
                    SUM(C.MONTO_LOCAL) MONTO_LOCAL,
                    TO_NUMBER(TO_CHAR(V_FECHA_INICIO, 'MM'))  MES,
                    TO_CHAR(V_FECHA_INICIO, 'YYYY') ANIO,
                    1,
                    1 USUARIO_GRABACION,
                    SYSDATE FECHA_GRABACION
                FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
                INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE C
                    ON C.ID_FDU_TRANSACCIONES_FINANCIERAS = A.ID
                WHERE A.ID = R_DATOS.ID
                AND (A.MONTO_ORIGEN - NVL(A.MONTO_RECUPERADO_ORIGEN, 0)) > 0
                AND TO_NUMBER(TO_CHAR(C.FECHA_INTERES, 'MM')) <= TO_NUMBER(TO_CHAR(V_FECHA_INICIO, 'MM'))
                AND TO_NUMBER(TO_CHAR(C.FECHA_INTERES, 'YYYY')) <= TO_NUMBER(TO_CHAR(V_FECHA_INICIO, 'YYYY'))
                AND C.ESTADO = 1
                AND C.ID_INTERES_COBRADO IS NULL
                GROUP BY A.ID, A.CODIGO_MONEDA, A.TASA_CAMBIO;

                SELECT 
                    MAX(A.ID)
                    INTO
                    V_ID_NUMBE
                FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS A
                WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = R_DATOS.ID
                AND A.MES = TO_NUMBER(TO_CHAR(V_FECHA_INICIO, 'MM'))
                AND TO_NUMBER(A.ANIO) = TO_NUMBER(TO_CHAR(V_FECHA_INICIO, 'YYYY'));

                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE C SET 
                    C.ESTADO = 2, 
                    C.ID_INTERES_COBRADO = V_ID_NUMBE
                WHERE C.ID_FDU_TRANSACCIONES_FINANCIERAS = R_DATOS.ID
                AND TO_NUMBER(TO_CHAR(C.FECHA_INTERES, 'MM')) <= TO_NUMBER(TO_CHAR(V_FECHA_INICIO, 'MM'))
                AND TO_NUMBER(TO_CHAR(C.FECHA_INTERES, 'YYYY')) <= TO_NUMBER(TO_CHAR(V_FECHA_INICIO, 'YYYY'))
                AND C.ESTADO = 1
                AND C.ID_INTERES_COBRADO IS NULL;
            END IF;

            IF EXTRACT(DAY FROM V_FECHA_INICIO) = 1 THEN
                DECLARE
                    CURSOR C_CAPITAL IS
                        SELECT
                            A.ESTADO
                        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL A
                        WHERE A.MES = EXTRACT(MONTH FROM (V_FECHA_INICIO - 1))
                        AND A.ANIO = EXTRACT(YEAR FROM (V_FECHA_INICIO - 1))
                        AND A.ID_FDU_TRANSACCIONES_FINANCIERA = R_DATOS.ID
                        AND A.TIPO_PAGO = 1;

                    CURSOR C_INTERES IS
                        SELECT
                            B.ESTADO
                        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS B
                        WHERE B.MES = EXTRACT(MONTH FROM (V_FECHA_INICIO - 1))
                        AND B.ANIO = EXTRACT(YEAR FROM (V_FECHA_INICIO - 1))
                        AND B.ID_FDU_TRANSACCIONES_FINANCIERAS = R_DATOS.ID;

                    V_ESTADO_CAPITAL NUMBER;
                    V_ESTADO_INTERES NUMBER;

                    V_MONTO_CAPITAL NUMBER;
                    V_MONTO_INTERES NUMBER;

                    V_TIPO_COBRO_MORA NUMBER;
                    V_TIPO_MORA NUMBER;
                    V_FECHA_ACEPTACION DATE;
                    V_MORA NUMBER;
                BEGIN
                    OPEN C_CAPITAL;
                        FETCH C_CAPITAL INTO V_ESTADO_CAPITAL;
                    CLOSE C_CAPITAL;

                    OPEN C_INTERES;
                        FETCH C_INTERES INTO V_ESTADO_INTERES;
                    CLOSE C_INTERES;

                    V_ESTADO_CAPITAL := NVL(V_ESTADO_CAPITAL, 0);
                    V_ESTADO_INTERES := NVL(V_ESTADO_INTERES, 0);

                    IF V_ESTADO_CAPITAL != 3 AND V_ESTADO_INTERES != 3 THEN
                        SELECT
                            A.TIPO_COBRO_MORA,
                            A.TIPO_MORA,
                            B.FECHA_ACEPTACION
                        INTO
                            V_TIPO_COBRO_MORA,
                            V_TIPO_MORA,
                            V_FECHA_ACEPTACION
                        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
                        INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG B
                            ON B.ID = V_ID
                        WHERE A.ID = R_DATOS.ID;

                        IF V_TIPO_COBRO_MORA = 1 THEN
                            IF V_TIPO_MORA = 1 THEN
                                SELECT 
                                    A.MONTO_ORIGEN
                                    INTO
                                    V_MONTO_INTERES
                                FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS A
                                WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = R_DATOS.ID
                                AND A.MES = EXTRACT(MONTH FROM (V_FECHA_INICIO - 1))
                                AND A.ANIO = EXTRACT(YEAR FROM (V_FECHA_INICIO - 1))
                                AND A.ESTADO != 3;

                                SELECT
                                    B.MONTO_ORIGEN
                                    INTO
                                    V_MONTO_CAPITAL
                                FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL B
                                WHERE B.ID_FDU_TRANSACCIONES_FINANCIERA = R_DATOS.ID
                                AND B.MES = EXTRACT(MONTH FROM (V_FECHA_INICIO - 1))
                                AND B.ANIO = EXTRACT(YEAR FROM (V_FECHA_INICIO - 1))
                                AND B.ESTADO != 3
                                AND B.TIPO_PAGO = 1;

                                INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS
                                (
                                    ID_FDU_TRANSACCIONES_FINANCIERAS,
                                    CODIGO_MONEDA,
                                    TASA_MONEDA,
                                    MONTO_ORIGEN,
                                    MONTO_LOCAL,
                                    MES,
                                    ANIO,
                                    ESTADO,
                                    USUARIO_GRABACION,
                                    FECHA_GRABACION
                                )
                                SELECT
                                    ID,
                                    CODIGO_MONEDA,
                                    TASA_CAMBIO,
                                    (
                                        (NVL(V_MONTO_INTERES, 0) + NVL(V_MONTO_CAPITAL, 0)) * (NVL(PORCENTAJE_MORA, 0) / 100)
                                    ),
                                    SAF.APX_FNC_CONVERSION_MONEDAS(((NVL(V_MONTO_INTERES, 0) + NVL(V_MONTO_CAPITAL, 0)) * (NVL(PORCENTAJE_MORA, 0) / 100)), CODIGO_MONEDA, 1, TASA_CAMBIO, NULL),
                                    EXTRACT(MONTH FROM (V_FECHA_INICIO - 1)),
                                    EXTRACT(YEAR FROM (V_FECHA_INICIO - 1)),
                                    1,
                                    1,
                                    SYSDATE
                                FROM SAF.FDU_TRANSACCIONES_FINANCIERAS
                                WHERE ID = R_DATOS.ID;
                            ELSE
                                INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS
                                (
                                    ID_FDU_TRANSACCIONES_FINANCIERAS,
                                    CODIGO_MONEDA,
                                    TASA_MONEDA,
                                    MONTO_ORIGEN,
                                    MONTO_LOCAL,
                                    MES,
                                    ANIO,
                                    ESTADO,
                                    USUARIO_GRABACION,
                                    FECHA_GRABACION
                                )
                                SELECT
                                    ID,
                                    CODIGO_MONEDA,
                                    TASA_CAMBIO,
                                    (
                                        NVL(MONTO_MORA_LOCAL, 0)
                                    ),
                                    SAF.APX_FNC_CONVERSION_MONEDAS(MONTO_MORA_LOCAL, CODIGO_MONEDA, 1, TASA_CAMBIO, NULL),
                                    EXTRACT(MONTH FROM (V_FECHA_INICIO - 1)),
                                    EXTRACT(YEAR FROM (V_FECHA_INICIO - 1)),
                                    1,
                                    1,
                                    SYSDATE
                                FROM SAF.FDU_TRANSACCIONES_FINANCIERAS
                                WHERE ID = R_DATOS.ID;
                            END IF;
                        ELSE
                            SELECT
                                ADD_MONTHS
                                (
                                    B.FECHA_ACEPTACION,
                                    CASE WHEN A.MEDIDA_PLAZO = 511 THEN
                                        A.PLAZO * 12
                                    ELSE
                                        A.PLAZO
                                    END
                                )
                                INTO
                                V_FECHA_ACEPTACION
                            FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
                            INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG B
                                ON B.ID = V_ID
                            WHERE A.ID = R_DATOS.ID;

                            IF V_FECHA_ACEPTACION = V_FECHA_INICIO THEN
                                IF V_TIPO_MORA = 1 THEN
                                    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS
                                    (
                                        ID_FDU_TRANSACCIONES_FINANCIERAS,
                                        CODIGO_MONEDA,
                                        TASA_MONEDA,
                                        MONTO_ORIGEN,
                                        MONTO_LOCAL,
                                        MES,
                                        ANIO,
                                        ESTADO,
                                        USUARIO_GRABACION,
                                        FECHA_GRABACION
                                    )
                                    SELECT
                                        A.ID,
                                        A.CODIGO_MONEDA,
                                        A.TASA_CAMBIO,
                                        (A.MONTO_ORIGEN * (NVL(A.PORCENTAJE_MORA, 0) / 100)) MONTO_LOCAL,
                                        SAF.APX_FNC_CONVERSION_MONEDAS((A.MONTO_ORIGEN * (NVL(A.PORCENTAJE_MORA, 0) / 100)), A.CODIGO_MONEDA, 1, A.TASA_CAMBIO, NULL) MONTO_LOCAL,
                                        EXTRACT(MONTH FROM V_FECHA_INICIO),
                                        EXTRACT(YEAR FROM V_FECHA_INICIO),
                                        1,
                                        1,
                                        SYSDATE
                                    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
                                    WHERE A.ID = R_DATOS.ID;
                                ELSE
                                    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS
                                    (
                                        ID_FDU_TRANSACCIONES_FINANCIERAS,
                                        CODIGO_MONEDA,
                                        TASA_MONEDA,
                                        MONTO_ORIGEN,
                                        MONTO_LOCAL,
                                        MES,
                                        ANIO,
                                        ESTADO,
                                        USUARIO_GRABACION,
                                        FECHA_GRABACION
                                    )
                                    SELECT
                                        A.ID,
                                        A.CODIGO_MONEDA,
                                        A.TASA_CAMBIO,
                                        NVL(A.MONTO_MORA_ORIGEN, 0) MONTO_LOCAL,
                                        SAF.APX_FNC_CONVERSION_MONEDAS(NVL(A.MONTO_MORA_ORIGEN, 0), A.CODIGO_MONEDA, 1, A.TASA_CAMBIO, NULL) MONTO_LOCAL,
                                        EXTRACT(MONTH FROM V_FECHA_INICIO),
                                        EXTRACT(YEAR FROM V_FECHA_INICIO),
                                        1,
                                        1,
                                        SYSDATE
                                    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A
                                    WHERE A.ID = R_DATOS.ID;
                                END IF;
                            END IF;
                        END IF;
                    END IF;
                END;
            END IF;
        END IF;
    END LOOP;
END;