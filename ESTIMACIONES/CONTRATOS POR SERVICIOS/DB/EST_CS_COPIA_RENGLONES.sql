CREATE OR REPLACE PROCEDURE SAF.EST_CS_COPIA_RENGLONES
(
    V_CS_COTRATOID NUMBER,
    V_CS_RENGLON NUMBER
) AS
    CURSOR C_RENGLONES(P_CONTRATOID NUMBER, P_RENGLON NUMBER) IS
        SELECT
            *
        FROM SAF.EST_CS_RENGLONES
        WHERE ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID
          AND CODIGO_RENGLON = (SELECT CODIGO_RENGLON FROM SAF.EST_CS_RENGLONES WHERE ID = P_RENGLON)
        UNION ALL
        SELECT
            *
        FROM SAF.EST_CS_RENGLONES
        WHERE ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID
        START WITH CODIGO_RENGLON_PADRE = (SELECT CODIGO_RENGLON FROM SAF.EST_CS_RENGLONES WHERE ID = P_RENGLON)
        CONNECT BY PRIOR CODIGO_RENGLON = CODIGO_RENGLON_PADRE;

    V_CODIGO VARCHAR2(1024);
    V_CODIGO_RENGLON VARCHAR2(1024);
    V_ID NUMBER;

    V_USUARIO SAF.GRAL_USUARIOS.CODIGO_USUARIO%TYPE := Pck_Gral.fnc_trae_no_usuario(NVL(V('APP_USER'),user));
BEGIN
    SELECT
        CODIGO_RENGLON_PADRE
    INTO
        V_CODIGO
    FROM SAF.EST_CS_RENGLONES
    WHERE ID_CS_CONTRATOS_SERVICIO = V_CS_COTRATOID
    AND ID = V_CS_RENGLON;

    SELECT
        SAF.EST_CS_GET_GENERADOR_CODIGOS
        (
                V_CS_COTRATOID,
                2,
                V_CODIGO,
                1
        )
    INTO
        V_CODIGO_RENGLON
    FROM DUAL;

    FOR R_RENGLONES IN C_RENGLONES(V_CS_COTRATOID, V_CS_RENGLON)
    LOOP
            INSERT INTO SAF.EST_CS_RENGLONES
            (
                ID_CS_CONTRATOS_SERVICIO,
                ID_CTS_TIPO_SERVICIO,
                CODIGO_RENGLON,
                CODIGO_RENGLON_PADRE,
                ORDEN,
                TITULO,
                DESCRIPCION,
                CODIGO_MEDIDA,
                TIPO_COSTO,
                COSTO_UNITARIO,
                COSTO_TOTAL,
                INDIRECTO,
                PRECIO_UNITARIO,
                PRECIO_TOTAL,
                ID_EST_CS_PLANTILLA_RENGLONES,
                CANTIDAD,
                INDIRECTO_PORCENTAJE,
                ID_EST_CS_RENGLONES_LISTA,
                TIPO_RENGLON,
                NIVEL,
                USUARIO_GRABACION,
                FECHA_GRABACION
            )
            VALUES
            (
                R_RENGLONES.ID_CS_CONTRATOS_SERVICIO,
                R_RENGLONES.ID_CTS_TIPO_SERVICIO,
                (
                    CASE
                        WHEN R_RENGLONES.CODIGO_RENGLON != (SELECT CODIGO_RENGLON FROM SAF.EST_CS_RENGLONES WHERE ID = V_CS_RENGLON) THEN V_CODIGO_RENGLON || '.' || SUBSTR(R_RENGLONES.CODIGO_RENGLON, LENGTH((SELECT CODIGO_RENGLON FROM SAF.EST_CS_RENGLONES WHERE ID = V_CS_RENGLON) || '.') + 1)
                        ELSE V_CODIGO_RENGLON
                    END
                ),
                (
                    CASE
                        WHEN R_RENGLONES.CODIGO_RENGLON = (SELECT CODIGO_RENGLON FROM SAF.EST_CS_RENGLONES WHERE ID = V_CS_RENGLON) THEN R_RENGLONES.CODIGO_RENGLON_PADRE
                        ELSE
                            CASE
                                WHEN R_RENGLONES.CODIGO_RENGLON_PADRE != (SELECT CODIGO_RENGLON FROM SAF.EST_CS_RENGLONES WHERE ID = V_CS_RENGLON) THEN V_CODIGO_RENGLON || '.' || SUBSTR(R_RENGLONES.CODIGO_RENGLON, LENGTH((SELECT CODIGO_RENGLON FROM SAF.EST_CS_RENGLONES WHERE ID = V_CS_RENGLON) || '.') + 1)
                                ELSE V_CODIGO_RENGLON
                            END
                    END
                ),
                R_RENGLONES.ORDEN,
                R_RENGLONES.TITULO,
                R_RENGLONES.DESCRIPCION,
                R_RENGLONES.CODIGO_MEDIDA,
                R_RENGLONES.TIPO_COSTO,
                R_RENGLONES.COSTO_UNITARIO,
                R_RENGLONES.COSTO_TOTAL,
                R_RENGLONES.INDIRECTO,
                R_RENGLONES.PRECIO_UNITARIO,
                R_RENGLONES.PRECIO_TOTAL,
                R_RENGLONES.ID_EST_CS_PLANTILLA_RENGLONES,
                R_RENGLONES.CANTIDAD,
                R_RENGLONES.INDIRECTO_PORCENTAJE,
                R_RENGLONES.ID_EST_CS_RENGLONES_LISTA,
                R_RENGLONES.TIPO_RENGLON,
                R_RENGLONES.NIVEL,
                V_USUARIO,
                SYSDATE
            ) RETURNING ID INTO V_ID;

            INSERT INTO SAF.EST_CS_ACTIVIDADES
            (
                ID_EST_CS_RENGLONES,
                ORDEN,
                TITULO,
                DESCRIPCION,
                CODIGO_MEDIDA,
                CODIGO_ACTIVIDAD,
                COSTO_UNITARIO,
                COSTO_TOTAL,
                INDIRECTO,
                PRECIO_UNITARIO,
                PRECIO_TOTAL,
                ID_EST_CS_PLANTILLA_ACTIVIDADE,
                CANTIDAD,
                INDIRECTO_PORCENTAJE,
                ID_EST_CS_ACTIVIDADES_LISTA,
                USUARIO_GRABACION,
                FECHA_GRABACION
            )
            SELECT
                V_ID,
                ORDEN,
                TITULO,
                DESCRIPCION,
                CODIGO_MEDIDA,
                CODIGO_ACTIVIDAD,
                COSTO_UNITARIO,
                COSTO_TOTAL,
                INDIRECTO,
                PRECIO_UNITARIO,
                PRECIO_TOTAL,
                ID_EST_CS_PLANTILLA_ACTIVIDADE,
                CANTIDAD,
                INDIRECTO_PORCENTAJE,
                ID_EST_CS_ACTIVIDADES_LISTA,
                V_USUARIO,
                SYSDATE
            FROM SAF.EST_CS_ACTIVIDADES
            WHERE ID_EST_CS_RENGLONES = R_RENGLONES.ID;
    END LOOP;
END;