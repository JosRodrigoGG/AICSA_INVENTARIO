create or replace PROCEDURE     SAF.RENGLONES_ACTIVIDADES_ORDENES_CAMBIO_SUMARIZACION (
    VID_ORDEN_CAMBIO ORDENES_CAMBIO.ID%TYPE,
    VCODIGO_CONTRATO EST_CONTRATOS.CODIGO_CONTRATO%TYPE,
    VCODIGO_RENGLON_PADRE VARCHAR2,
    VORDEN NUMBER,
    VTIPO_SUMA NUMBER
) AS
    CURSOR C_RENGLONES(P_ORDEN NUMBER, P_CONTRATO NUMBER) IS
        SELECT
            ID,
            CODIGO_RENGLON,
            PORCENTAJE_INDIRECTO_ESTIMADO,
            CANTIDAD,
            COSTO_TOTAL_ESTIMADO
        FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
        WHERE ES_PADRE = 1
        AND ID_ORDEN_CAMBIO = P_ORDEN
        AND ID_CONTRATO = P_CONTRATO;

    CURSOR C_ACTIVIDADES(P_ORDEN NUMBER, P_CONTRATO NUMBER, P_CODIGO_RENGLON VARCHAR2) IS
        WITH DATO AS
        (SELECT
            DISTINCT
                B.*
        FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES B
                 INNER JOIN SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES A
                            ON NVL(A.CODIGO_RENGLON, 'SIN_RENGLON') = NVL(B.CODIGO_RENGLON_PADRE, 'SIN_RENGLON')
                                AND A.ES_PADRE = 1
                                AND A.ID_ORDEN_CAMBIO = B.ID_ORDEN_CAMBIO
                                AND A.ID_CONTRATO = B.ID_CONTRATO
        WHERE B.ES_PADRE = 2
          AND B.ID_ORDEN_CAMBIO = P_ORDEN
          AND B.ID_CONTRATO = P_CONTRATO
        START WITH A.CODIGO_RENGLON = P_CODIGO_RENGLON
        CONNECT BY PRIOR A.CODIGO_RENGLON = A.CODIGO_RENGLON_PADRE)
        SELECT
            NVL(SUM(CANTIDAD), 0) AS CANTIDAD,
            NVL(SUM(CANTIDAD * COSTO_TOTAL_ESTIMADO), 0) AS COSTO_UNITARIO_ESTIMADO,
            NVL(SUM(COSTO_TOTAL_ESTIMADO), 0) AS COSTO_TOTAL_ESTIMADO
        FROM DATO;

    CURSOR C_NIVEL(P_ORDEN NUMBER, P_CONTRATO NUMBER) IS
        WITH DATOS_RENGLON AS
                 (SELECT
                      *
                  FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                  WHERE ES_PADRE = 1
                    AND ID_ORDEN_CAMBIO = P_ORDEN
                    AND ID_CONTRATO = P_CONTRATO),
             DATOS AS
                 (SELECT
                      ID,
                      LEVEL AS NIVEL,
                      CODIGO_RENGLON
                  FROM DATOS_RENGLON
                  START WITH CODIGO_RENGLON_PADRE IS NULL
                  CONNECT BY PRIOR CODIGO_RENGLON = CODIGO_RENGLON_PADRE
                  ORDER SIBLINGS BY CODIGO_RENGLON)
        SELECT
            ID,
            NIVEL
        FROM DATOS;

    CURSOR C_RENGLONES_NIVEL (P_ORDEN NUMBER, P_CONTRATO NUMBER, P_NIVEL NUMBER) IS
        WITH DATOS_RENGLON AS
                 (SELECT
                      *
                  FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                  WHERE ES_PADRE = 1
                    AND ID_ORDEN_CAMBIO = P_ORDEN
                    AND ID_CONTRATO = P_CONTRATO),
             DATOS AS
                 (SELECT
                      ID,
                      LEVEL AS NIVEL,
                      CODIGO_RENGLON,
                      CODIGO_RENGLON_PADRE
                  FROM DATOS_RENGLON
                  START WITH CODIGO_RENGLON_PADRE IS NULL
                  CONNECT BY PRIOR CODIGO_RENGLON = CODIGO_RENGLON_PADRE
                  ORDER SIBLINGS BY CODIGO_RENGLON)
        SELECT
            ID,
            CODIGO_RENGLON,
            CODIGO_RENGLON_PADRE,
            (ROW_NUMBER() OVER (ORDER BY CODIGO_RENGLON)) NUEVO_ORDEN
        FROM DATOS
        WHERE NIVEL = P_NIVEL
        ORDER BY CODIGO_RENGLON;

    CURSOR C_RENGLONES_SUMATORIA(P_ORDEN NUMBER, P_CONTRATO NUMBER) IS
        WITH DATOS_RENGLON AS
                 (SELECT
                      *
                  FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                  WHERE ES_PADRE = 1
                    AND ID_ORDEN_CAMBIO = P_ORDEN
                    AND ID_CONTRATO = P_CONTRATO),
             DATOS AS
                 (SELECT
                      ID,
                      LEVEL AS NIVEL,
                      CODIGO_RENGLON,
                      CODIGO_RENGLON_PADRE,
                      CANTIDAD,
                      PORCENTAJE_INDIRECTO_ESTIMADO
                  FROM DATOS_RENGLON
                  START WITH CODIGO_RENGLON_PADRE IS NULL
                  CONNECT BY PRIOR CODIGO_RENGLON = CODIGO_RENGLON_PADRE
                  ORDER SIBLINGS BY CODIGO_RENGLON)
        SELECT
            ID,
            CODIGO_RENGLON,
            CODIGO_RENGLON_PADRE,
            NIVEL,
            CANTIDAD,
            PORCENTAJE_INDIRECTO_ESTIMADO
        FROM DATOS
        ORDER BY NIVEL DESC;

    CURSOR C_RENGLONES_BUSCAR(P_ORDEN NUMBER, P_CONTRATO NUMBER, P_CODIGO_RENGLON VARCHAR2) IS
        SELECT
            SUM(COSTO_TOTAL_ESTIMADO) AS COSTO_TOTAL
        FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
        WHERE ES_PADRE = 1
          AND ID_ORDEN_CAMBIO = P_ORDEN
          AND ID_CONTRATO = P_CONTRATO
          AND CODIGO_RENGLON_PADRE = P_CODIGO_RENGLON;

    V_CONTADOR NUMBER := 1;
    V_CONTADOR_MAX NUMBER := 0;

    V_SUMA NUMBER;
BEGIN
    FOR R_RENGLONES IN C_RENGLONES(VID_ORDEN_CAMBIO, VCODIGO_CONTRATO)
        LOOP
            FOR R_ACTIVIDADES IN C_ACTIVIDADES(VID_ORDEN_CAMBIO, VCODIGO_CONTRATO, R_RENGLONES.CODIGO_RENGLON)
                LOOP
                    IF R_ACTIVIDADES.COSTO_TOTAL_ESTIMADO IS NOT NULL THEN
                        UPDATE SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES SET
                            COSTO_UNITARIO_ESTIMADO = R_ACTIVIDADES.COSTO_TOTAL_ESTIMADO / R_RENGLONES.CANTIDAD,
                            COSTO_TOTAL_ESTIMADO = R_ACTIVIDADES.COSTO_TOTAL_ESTIMADO,
                            MONTO_INDIRECTO_ESTIMADO = (R_ACTIVIDADES.COSTO_TOTAL_ESTIMADO) * ((SELECT
                                                                                                    (NVL(SUM(MONTO_INDIRECTO_ESTIMADO), 0) / NVL(SUM(COSTO_TOTAL_ESTIMADO), 1)) * 100
                                                                                                FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                                                                                                WHERE ES_PADRE = 2
                                                                                                  AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                                                                                                  AND ID_CONTRATO = VCODIGO_CONTRATO
                                                                                                  AND CODIGO_RENGLON_PADRE = R_RENGLONES.CODIGO_RENGLON) / 100),
                            PRECIO_UNITARIO_ESTIMADO = (((R_ACTIVIDADES.COSTO_TOTAL_ESTIMADO) * ((SELECT
                                                                                                      (NVL(SUM(MONTO_INDIRECTO_ESTIMADO), 0) / NVL(SUM(COSTO_TOTAL_ESTIMADO), 1)) * 100
                                                                                                  FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                                                                                                  WHERE ES_PADRE = 2
                                                                                                    AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                                                                                                    AND ID_CONTRATO = VCODIGO_CONTRATO
                                                                                                    AND CODIGO_RENGLON_PADRE = R_RENGLONES.CODIGO_RENGLON) / 100)) + R_ACTIVIDADES.COSTO_TOTAL_ESTIMADO) / R_RENGLONES.CANTIDAD,
                            PRECIO_TOTAL_ESTIMADO = (((R_ACTIVIDADES.COSTO_TOTAL_ESTIMADO) * ((SELECT
                                                                                                   (NVL(SUM(MONTO_INDIRECTO_ESTIMADO), 0) / NVL(SUM(COSTO_TOTAL_ESTIMADO), 1)) * 100
                                                                                               FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                                                                                               WHERE ES_PADRE = 2
                                                                                                 AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                                                                                                 AND ID_CONTRATO = VCODIGO_CONTRATO
                                                                                                 AND CODIGO_RENGLON_PADRE = R_RENGLONES.CODIGO_RENGLON) / 100)) + R_ACTIVIDADES.COSTO_TOTAL_ESTIMADO),
                            CANTIDAD = R_ACTIVIDADES.CANTIDAD
                        WHERE ID = R_RENGLONES.ID;
                    END IF;
                END LOOP;
        END LOOP;

    FOR R_RENGLONES_SUMATORIA IN C_RENGLONES_SUMATORIA(VID_ORDEN_CAMBIO, VCODIGO_CONTRATO)
    LOOP
        OPEN C_RENGLONES_BUSCAR(VID_ORDEN_CAMBIO, VCODIGO_CONTRATO, R_RENGLONES_SUMATORIA.CODIGO_RENGLON);
            FETCH C_RENGLONES_BUSCAR INTO V_SUMA;
        CLOSE C_RENGLONES_BUSCAR;

        IF V_SUMA IS NOT NULL THEN
            UPDATE SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES SET
                COSTO_UNITARIO_ESTIMADO = V_SUMA / (SELECT
                                                        (NVL(SUM(CANTIDAD), 1))
                                                    FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                                                    WHERE ES_PADRE = 1
                                                      AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                                                      AND ID_CONTRATO = VCODIGO_CONTRATO
                                                      AND CODIGO_RENGLON_PADRE = R_RENGLONES_SUMATORIA.CODIGO_RENGLON),
                COSTO_TOTAL_ESTIMADO = V_SUMA,
                MONTO_INDIRECTO_ESTIMADO = (
                    SELECT
                         (NVL(SUM(MONTO_INDIRECTO_ESTIMADO), 0))
                     FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                     WHERE ES_PADRE = 1
                       AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                       AND ID_CONTRATO = VCODIGO_CONTRATO
                       AND CODIGO_RENGLON_PADRE = R_RENGLONES_SUMATORIA.CODIGO_RENGLON
                    ),
                /*PRECIO_UNITARIO_ESTIMADO = (V_SUMA + (
                    SELECT
                        (NVL(SUM(MONTO_INDIRECTO_ESTIMADO), 0))
                    FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                    WHERE ES_PADRE = 1
                      AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                      AND ID_CONTRATO = VCODIGO_CONTRATO
                      AND CODIGO_RENGLON_PADRE = R_RENGLONES_SUMATORIA.CODIGO_RENGLON
                )/ (SELECT
                        (NVL(SUM(CANTIDAD), 1))
                    FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                    WHERE ES_PADRE = 1
                      AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                      AND ID_CONTRATO = VCODIGO_CONTRATO
                      AND CODIGO_RENGLON_PADRE = R_RENGLONES_SUMATORIA.CODIGO_RENGLON)),*/
                PRECIO_UNITARIO_ESTIMADO = (V_SUMA + (
                     SELECT
                         (NVL(SUM(MONTO_INDIRECTO_ESTIMADO), 0))
                     FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                     WHERE ES_PADRE = 1
                       AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                       AND ID_CONTRATO = VCODIGO_CONTRATO
                       AND CODIGO_RENGLON_PADRE = R_RENGLONES_SUMATORIA.CODIGO_RENGLON
                 )) / (SELECT
                          (NVL(SUM(CANTIDAD), 1))
                       FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                       WHERE ES_PADRE = 1
                         AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                         AND ID_CONTRATO = VCODIGO_CONTRATO
                         AND CODIGO_RENGLON_PADRE = R_RENGLONES_SUMATORIA.CODIGO_RENGLON),
                PRECIO_TOTAL_ESTIMADO = (V_SUMA + (
                              SELECT
                                  (NVL(SUM(MONTO_INDIRECTO_ESTIMADO), 0))
                              FROM SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES
                              WHERE ES_PADRE = 1
                                AND ID_ORDEN_CAMBIO = VID_ORDEN_CAMBIO
                                AND ID_CONTRATO = VCODIGO_CONTRATO
                                AND CODIGO_RENGLON_PADRE = R_RENGLONES_SUMATORIA.CODIGO_RENGLON
                          ))
            WHERE ID = R_RENGLONES_SUMATORIA.ID;
        END IF;
    END LOOP;

    IF VCODIGO_RENGLON_PADRE IS NOT NULL THEN
        PR_CORRECCION_CODIGOS_ORDENES_CAMBIO(VID_ORDEN_CAMBIO,VCODIGO_CONTRATO,VCODIGO_RENGLON_PADRE,VORDEN);
        COMMIT;
    END IF;
END;