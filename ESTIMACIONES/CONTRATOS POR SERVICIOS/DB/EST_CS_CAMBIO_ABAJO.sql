CREATE OR REPLACE PROCEDURE SAF.EST_CS_CAMBIO_ABAJO
(
    V_CS_COTRATOID NUMBER,
    v_ID_RENGLON NUMBER,
    V_TIPO_CODIGO NUMBER
) AS
    CURSOR C_RENGLON_SUPERIOR(P_CONTRATOID NUMBER, P_RENGLON NUMBER) IS
        WITH DATOS AS
                 (SELECT B.ID,
                         B.CODIGO_RENGLON,
                         B.ORDEN
                  FROM SAF.EST_CS_RENGLONES A
                           INNER JOIN SAF.EST_CS_RENGLONES B ON
                      B.NIVEL = A.NIVEL AND
                      B.ORDEN > A.ORDEN
                  WHERE A.ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID
                    AND A.ID = P_RENGLON)
        SELECT
            A.ID,
            A.CODIGO_RENGLON
        FROM DATOS A
        WHERE A.ORDEN = (SELECT MIN(B.ORDEN) FROM DATOS B);

    CURSOR C_RENGLON_INFERIOR(P_CONTRATOID NUMBER, P_RENGLON NUMBER) IS
        SELECT
            CODIGO_RENGLON
        FROM SAF.EST_CS_RENGLONES
        WHERE ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID AND
            ID = P_RENGLON;

    CURSOR C_UPDATE_CODIGOS_LIKE (P_CONTRATOID NUMBER, P_RENGLON VARCHAR2) IS
        SELECT
            ID,
            CODIGO_RENGLON
        FROM SAF.EST_CS_RENGLONES
        WHERE ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID
          AND CODIGO_RENGLON LIKE P_RENGLON || '.%';

    CURSOR C_UPDATE_CODIGOS (P_CONTRATOID NUMBER, P_RENGLON VARCHAR2) IS
        SELECT
            ID,
            CODIGO_RENGLON
        FROM SAF.EST_CS_RENGLONES
        WHERE ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID
          AND CODIGO_RENGLON = P_RENGLON;

    CURSOR C_UPDATE_PADRES_LIKE (P_CONTRATOID NUMBER, P_RENGLON VARCHAR2) IS
        SELECT
            ID,
            CODIGO_RENGLON_PADRE
        FROM SAF.EST_CS_RENGLONES
        WHERE ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID
          AND CODIGO_RENGLON_PADRE LIKE P_RENGLON || '.%';

    CURSOR C_UPDATE_PADRES (P_CONTRATOID NUMBER, P_RENGLON VARCHAR2) IS
        SELECT
            ID,
            CODIGO_RENGLON_PADRE
        FROM SAF.EST_CS_RENGLONES
        WHERE ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID
          AND CODIGO_RENGLON_PADRE = P_RENGLON;

    V_CODIGO_SUPERIOR VARCHAR2(1024);
    V_CODIGO_INFERIOR VARCHAR2(1024);
    V_TEMP_CODIGO VARCHAR2(1024);
BEGIN
    IF V_TIPO_CODIGO = 1 THEN
        FOR R_RENGLON_SUPERIOR IN C_RENGLON_SUPERIOR(V_CS_COTRATOID, v_ID_RENGLON)
            LOOP
                OPEN C_RENGLON_INFERIOR(V_CS_COTRATOID, v_ID_RENGLON);
                FETCH C_RENGLON_INFERIOR INTO V_CODIGO_INFERIOR;
                CLOSE C_RENGLON_INFERIOR;

                V_CODIGO_SUPERIOR := R_RENGLON_SUPERIOR.CODIGO_RENGLON;

                -- RENGLON TEMPORAL
                FOR R_TEMP IN C_UPDATE_CODIGOS_LIKE(V_CS_COTRATOID, R_RENGLON_SUPERIOR.CODIGO_RENGLON)
                    LOOP
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON = 'TEMP.' || SUBSTR(R_TEMP.CODIGO_RENGLON, LENGTH(R_RENGLON_SUPERIOR.CODIGO_RENGLON || '.') + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                FOR R_TEMP IN C_UPDATE_CODIGOS(V_CS_COTRATOID, R_RENGLON_SUPERIOR.CODIGO_RENGLON)
                    LOOP
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON = 'TEMP'
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                FOR R_TEMP IN C_UPDATE_PADRES_LIKE(V_CS_COTRATOID, R_RENGLON_SUPERIOR.CODIGO_RENGLON)
                    LOOP
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON_PADRE = 'TEMP.' || SUBSTR(R_TEMP.CODIGO_RENGLON_PADRE, LENGTH(R_RENGLON_SUPERIOR.CODIGO_RENGLON || '.') + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                FOR R_TEMP IN C_UPDATE_PADRES(V_CS_COTRATOID, R_RENGLON_SUPERIOR.CODIGO_RENGLON)
                    LOOP
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON_PADRE = 'TEMP'
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                -- RENGLON INFERIOR
                FOR R_TEMP IN C_UPDATE_CODIGOS_LIKE(V_CS_COTRATOID, V_CODIGO_INFERIOR)
                    LOOP
                        V_TEMP_CODIGO := V_CODIGO_SUPERIOR || '.' || SUBSTR(R_TEMP.CODIGO_RENGLON, LENGTH(V_CODIGO_INFERIOR || '.') + 1);
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON = V_TEMP_CODIGO,
                            ORDEN = SUBSTR(V_TEMP_CODIGO, INSTR(V_TEMP_CODIGO, '.', -1) + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                FOR R_TEMP IN C_UPDATE_CODIGOS(V_CS_COTRATOID, V_CODIGO_INFERIOR)
                    LOOP
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON = V_CODIGO_SUPERIOR,
                            ORDEN = SUBSTR(V_CODIGO_SUPERIOR, INSTR(V_CODIGO_SUPERIOR, '.', -1) + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                FOR R_TEMP IN C_UPDATE_PADRES_LIKE(V_CS_COTRATOID, V_CODIGO_INFERIOR)
                    LOOP
                        V_TEMP_CODIGO := V_CODIGO_SUPERIOR || '.' || SUBSTR(R_TEMP.CODIGO_RENGLON_PADRE, LENGTH(V_CODIGO_INFERIOR || '.') + 1);
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON_PADRE = V_TEMP_CODIGO,
                            ORDEN = SUBSTR(V_TEMP_CODIGO, INSTR(V_TEMP_CODIGO, '.', -1) + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                FOR R_TEMP IN C_UPDATE_PADRES(V_CS_COTRATOID, V_CODIGO_INFERIOR)
                    LOOP
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON_PADRE = V_CODIGO_SUPERIOR,
                            ORDEN = SUBSTR(V_CODIGO_SUPERIOR, INSTR(V_CODIGO_SUPERIOR, '.', -1) + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                -- RENGLON SUPERIOR TEMP
                FOR R_TEMP IN C_UPDATE_CODIGOS_LIKE(V_CS_COTRATOID, 'TEMP')
                    LOOP
                        V_TEMP_CODIGO := V_CODIGO_INFERIOR || '.' || SUBSTR(R_TEMP.CODIGO_RENGLON, LENGTH('TEMP.') + 1);
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON = V_TEMP_CODIGO,
                            ORDEN = SUBSTR(V_TEMP_CODIGO, INSTR(V_TEMP_CODIGO, '.', -1) + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                FOR R_TEMP IN C_UPDATE_CODIGOS(V_CS_COTRATOID, 'TEMP')
                    LOOP
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON = V_CODIGO_INFERIOR,
                            ORDEN = SUBSTR(V_CODIGO_INFERIOR, INSTR(V_CODIGO_INFERIOR, '.', -1) + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                FOR R_TEMP IN C_UPDATE_PADRES_LIKE(V_CS_COTRATOID, 'TEMP')
                    LOOP
                        V_TEMP_CODIGO := V_CODIGO_INFERIOR || '.' || SUBSTR(R_TEMP.CODIGO_RENGLON_PADRE, LENGTH('TEMP.') + 1);
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON_PADRE = V_TEMP_CODIGO,
                            ORDEN = SUBSTR(V_TEMP_CODIGO, INSTR(V_TEMP_CODIGO, '.', -1) + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;

                FOR R_TEMP IN C_UPDATE_PADRES(V_CS_COTRATOID, 'TEMP')
                    LOOP
                        UPDATE SAF.EST_CS_RENGLONES
                        SET CODIGO_RENGLON_PADRE = V_CODIGO_INFERIOR,
                            ORDEN = SUBSTR(V_CODIGO_INFERIOR, INSTR(V_CODIGO_INFERIOR, '.', -1) + 1)
                        WHERE ID = R_TEMP.ID;
                    END LOOP;
            END LOOP;
    END IF;

    SAF.EST_CS_SUMARIZACION_RENGLONES(V_CS_COTRATOID);
END;