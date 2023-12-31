CREATE OR REPLACE PROCEDURE SAF.EST_CS_CAMBIO_IZQUIERDA
(
    V_CS_COTRATOID NUMBER,
    v_ID_RENGLON NUMBER,
    V_TIPO_CODIGO NUMBER
) AS
    CURSOR C_RENGLONES(P_CONTRATOID NUMBER, P_RENGLON NUMBER) IS
        SELECT
            A.CODIGO_RENGLON
        FROM SAF.EST_CS_RENGLONES A
         INNER JOIN SAF.EST_CS_RENGLONES B ON
            B.CODIGO_RENGLON_PADRE = A.CODIGO_RENGLON
        WHERE A.ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID
          AND B.ID = P_RENGLON;

    V_CODIGO VARCHAR2(1024);
BEGIN
    IF V_TIPO_CODIGO = 1 THEN
        FOR R_RENGLONES IN C_RENGLONES(V_CS_COTRATOID, v_ID_RENGLON)
        LOOP
            SELECT
                SAF.EST_CS_GET_GENERADOR_CODIGOS
                (
                        V_CS_COTRATOID,
                        2,
                        R_RENGLONES.CODIGO_RENGLON,
                        1
                )
            INTO
                V_CODIGO
            FROM DUAL;

            UPDATE SAF.EST_CS_RENGLONES SET
                CODIGO_RENGLON_PADRE = V_CODIGO
            WHERE CODIGO_RENGLON_PADRE = (SELECT CODIGO_RENGLON FROM SAF.EST_CS_RENGLONES WHERE ID = v_ID_RENGLON);

            IF V_CODIGO IS NOT NULL THEN
                UPDATE SAF.EST_CS_RENGLONES SET
                    CODIGO_RENGLON = V_CODIGO,
                    CODIGO_RENGLON_PADRE = R_RENGLONES.CODIGO_RENGLON,
                    ORDEN = TO_NUMBER(REPLACE(V_CODIGO, R_RENGLONES.CODIGO_RENGLON || '.', ''))
                WHERE ID = v_ID_RENGLON;
            END IF;
        END LOOP;
    END IF;

    SAF.EST_CS_SUMARIZACION_RENGLONES(V_CS_COTRATOID);
END;