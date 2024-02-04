CREATE OR REPLACE PROCEDURE SAF.HT_RECALCULAR_REGISTROS
(
    V_CODIGO_USUARIO NUMBER,
    V_ID_HOJA_TIEMPO NUMBER,
    V_FECHA_INICIO DATE DEFAULT SYSDATE,
    V_DIAS_CALCULAR NUMBER DEFAULT 7
) AS
    CURSOR C_FECHAS(P_HOJA_TIEMPO NUMBER) IS
        SELECT
            DISTINCT
            FECHA
        FROM SAF.HT_RENGLONES_SERVICOS
        WHERE ID_HT_HOJA_DE_TIEMPOS = P_HOJA_TIEMPO
        ORDER BY FECHA;

    CURSOR C_FECHAS_MIN(P_HOJA_TIEMPO NUMBER, P_FECHA_NUEVA DATE) IS
        SELECT
            NVL(TRUNC(P_FECHA_NUEVA) - TRUNC(MIN(FECHA)), 0)
        FROM SAF.HT_RENGLONES_SERVICOS
        WHERE ID_HT_HOJA_DE_TIEMPOS = P_HOJA_TIEMPO;

    CURSOR C_VISTA(P_HOJA_TIEMPO NUMBER) IS
        SELECT
            NVL(TIPO_VISTA, 1)
        FROM SAF.HT_HOJA_DE_TIEMPOS
        WHERE ID = P_HOJA_TIEMPO;

    CURSOR C_FECHAS_GENERAR(P_FECHA DATE, P_DIAS_GENERAR NUMBER) IS
        SELECT
            ROW_NUMBER() OVER (ORDER BY TRUNC(P_FECHA + LEVEL - 1) ASC) AS NUMERO_LINEA,
            TRUNC(P_FECHA + LEVEL - 1) AS FECHA,
            INITCAP(TO_CHAR(P_FECHA + LEVEL - 1, 'DAY DD')) AS FECHA_NOMBRE
        FROM DUAL
        CONNECT BY LEVEL <= P_DIAS_GENERAR;

    CURSOR C_GENERAR_RENGLONES(P_HOJA_TIEMPO NUMBER) IS
        SELECT
            DISTINCT
            ID_EST_CS_RENGLONES,
            ID_EST_CS_CONTRATOS_SERVICIO,
            ID_PADRE,
            TITULO,
            TIPO_REGISTRO,
            CODIGO_RENGLON,
            CODIGO_RENGLON_PADRE,
            ORDEN
        FROM SAF.HT_RENGLONES_SERVICOS
        WHERE ID_HT_HOJA_DE_TIEMPOS = P_HOJA_TIEMPO;

    CURSOR C_ACTIVIDADES(P_HOJA_TIEMPO NUMBER, P_CODIGO_RENGLON VARCHAR2) IS
        SELECT
            A.*
        FROM SAF.HT_ACTIVIDADES_SERVICOS A
        WHERE A.ID_HT_HOJA_DE_TIEMPOS = P_HOJA_TIEMPO
          AND A.ID_HT_RENGLONES_SERVICOS IN
              (
                  SELECT
                      MIN(B.ID)
                  FROM SAF.HT_RENGLONES_SERVICOS B
                  WHERE B.CODIGO_RENGLON = P_CODIGO_RENGLON
                    AND B.ID_HT_HOJA_DE_TIEMPOS = P_HOJA_TIEMPO
              );

    CURSOR C_TAREAS(P_HOJA_TIEMPO NUMBER) IS
        SELECT
            DISTINCT
            TITULO,
            CODIGO_RENGLON,
            CODIGO_RENGLON_PADRE,
            ORDEN,
            ID_REGISTRO
        FROM SAF.HT_TAREAS_ADMINISTRATIVAS
        WHERE ID_HT_HOJA_DE_TIEMPOS = P_HOJA_TIEMPO;

    CURSOR C_TAREAS_GENERAL(P_HOJA_TIEMPO NUMBER) IS
        SELECT
            *
        FROM SAF.HT_TAREAS_ADMINISTRATIVAS
        WHERE ID_HT_HOJA_DE_TIEMPOS = P_HOJA_TIEMPO;

    V_NUMERO_DIFERENCIA NUMBER;
    V_CONTADOR NUMBER;
    V_TIPO_VISTA NUMBER;
    V_ID_RENGLON NUMBER;

    V_FECHAS_GENERADAS NUMBER;
BEGIN
    UPDATE SAF.HT_HOJA_DE_TIEMPOS
    SET TIPO_VISTA = (CASE WHEN V_DIAS_CALCULAR = 7 THEN 1 ELSE 2 END),
        FECHA_INICIO = V_FECHA_INICIO,
        FECHA_FIN = (V_FECHA_INICIO + (V_DIAS_CALCULAR - 1))
    WHERE ID = V_ID_HOJA_TIEMPO;

    SELECT
        COUNT(DISTINCT FECHA)
    INTO
        V_CONTADOR
    FROM SAF.HT_RENGLONES_SERVICOS
    WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO;

    OPEN C_FECHAS_MIN(V_ID_HOJA_TIEMPO, V_FECHA_INICIO);
        FETCH C_FECHAS_MIN INTO V_NUMERO_DIFERENCIA;
    CLOSE C_FECHAS_MIN;

    OPEN C_VISTA(V_ID_HOJA_TIEMPO);
        FETCH C_VISTA INTO V_TIPO_VISTA;
    CLOSE C_VISTA;

    SELECT
        COUNT(DISTINCT FECHA)
    INTO
        V_FECHAS_GENERADAS
    FROM SAF.HT_RENGLONES_SERVICOS
    WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO;

    IF V_FECHAS_GENERADAS = V_DIAS_CALCULAR THEN
        FOR R_FECHAS IN C_FECHAS(V_ID_HOJA_TIEMPO)
        LOOP
            UPDATE SAF.HT_RENGLONES_SERVICOS
            SET FECHA = TRUNC(R_FECHAS.FECHA) + V_NUMERO_DIFERENCIA,
                USUARIO_MODIFICACION = V_CODIGO_USUARIO,
                FECHA_MODIFICACION = SYSDATE
            WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
              AND TRUNC(FECHA) = TRUNC(R_FECHAS.FECHA);

            UPDATE SAF.HT_ACTIVIDADES_SERVICOS
            SET FECHA = TRUNC(R_FECHAS.FECHA) + V_NUMERO_DIFERENCIA,
                USUARIO_MODIFICACION = V_CODIGO_USUARIO,
                FECHA_MODIFICACION = SYSDATE
            WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
              AND TRUNC(FECHA) = TRUNC(R_FECHAS.FECHA);

            UPDATE SAF.HT_TAREAS_ADMINISTRATIVAS
                SET FECHA = TRUNC(R_FECHAS.FECHA) + V_NUMERO_DIFERENCIA,
                    USUARIO_MODIFICACION = V_CODIGO_USUARIO,
                    FECHA_MODIFICACION = SYSDATE
            WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
                AND TRUNC(FECHA) = TRUNC(R_FECHAS.FECHA);
        END LOOP;
    ELSIF V_FECHAS_GENERADAS < V_DIAS_CALCULAR THEN
        FOR R_FECHAS IN C_FECHAS(V_ID_HOJA_TIEMPO)
        LOOP
            UPDATE SAF.HT_RENGLONES_SERVICOS
            SET FECHA = TRUNC(R_FECHAS.FECHA) + V_NUMERO_DIFERENCIA,
                USUARIO_MODIFICACION = V_CODIGO_USUARIO,
                FECHA_MODIFICACION = SYSDATE
            WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
              AND TRUNC(FECHA) = TRUNC(R_FECHAS.FECHA);

            UPDATE SAF.HT_ACTIVIDADES_SERVICOS
            SET FECHA = TRUNC(R_FECHAS.FECHA) + V_NUMERO_DIFERENCIA,
                USUARIO_MODIFICACION = V_CODIGO_USUARIO,
                FECHA_MODIFICACION = SYSDATE
            WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
              AND TRUNC(FECHA) = TRUNC(R_FECHAS.FECHA);

            UPDATE SAF.HT_TAREAS_ADMINISTRATIVAS
            SET FECHA = TRUNC(R_FECHAS.FECHA) + V_NUMERO_DIFERENCIA,
                USUARIO_MODIFICACION = V_CODIGO_USUARIO,
                FECHA_MODIFICACION = SYSDATE
            WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
              AND TRUNC(FECHA) = TRUNC(R_FECHAS.FECHA);
        END LOOP;

        FOR R_FECHAS_GENERAR IN C_FECHAS_GENERAR(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY'), V_DIAS_CALCULAR)
        LOOP
            IF R_FECHAS_GENERAR.NUMERO_LINEA > 7 THEN
                FOR R_GENERAR_RENGLONES IN C_GENERAR_RENGLONES(V_ID_HOJA_TIEMPO)
                LOOP
                    INSERT INTO SAF.HT_RENGLONES_SERVICOS
                    (
                        ID_HT_HOJA_DE_TIEMPOS,
                        ID_EST_CS_RENGLONES,
                        ID_EST_CS_CONTRATOS_SERVICIO,
                        ID_PADRE,
                        TITULO,
                        TIPO_REGISTRO,
                        FECHA,
                        CANTIDAD_HORAS,
                        ESTADO,
                        CODIGO_RENGLON,
                        CODIGO_RENGLON_PADRE,
                        ORDEN,
                        USUARIO_GRABACION,
                        FECHA_GRABACION
                    )
                    VALUES
                    (
                        V_ID_HOJA_TIEMPO,
                        R_GENERAR_RENGLONES.ID_EST_CS_RENGLONES,
                        R_GENERAR_RENGLONES.ID_EST_CS_CONTRATOS_SERVICIO,
                        R_GENERAR_RENGLONES.ID_PADRE,
                        R_GENERAR_RENGLONES.TITULO,
                        R_GENERAR_RENGLONES.TIPO_REGISTRO,
                        TRUNC(R_FECHAS_GENERAR.FECHA),
                        0,
                        'BORRADOR',
                        R_GENERAR_RENGLONES.CODIGO_RENGLON,
                        R_GENERAR_RENGLONES.CODIGO_RENGLON_PADRE,
                        R_GENERAR_RENGLONES.ORDEN,
                        V_CODIGO_USUARIO,
                        SYSDATE
                    ) RETURNING ID INTO V_ID_RENGLON;

                    FOR R_ACTIVIDADES IN C_ACTIVIDADES(V_ID_HOJA_TIEMPO, R_GENERAR_RENGLONES.CODIGO_RENGLON)
                    LOOP
                            INSERT INTO SAF.HT_ACTIVIDADES_SERVICOS
                            (
                                ID_HT_HOJA_DE_TIEMPOS,
                                ID_EST_CS_ACTIVIDADES,
                                ID_HT_RENGLONES_SERVICOS,
                                TITULO,
                                TIPO_REGISTRO,
                                FECHA,
                                CANTIDAD_HORAS,
                                ESTADO,
                                CODIGO_RENGLON,
                                CODIGO_RENGLON_PADRE,
                                USUARIO_GRABACION,
                                FECHA_GRABACION
                            )
                            VALUES
                            (
                                V_ID_HOJA_TIEMPO,
                                R_ACTIVIDADES.ID_EST_CS_ACTIVIDADES,
                                V_ID_RENGLON,
                                R_ACTIVIDADES.TITULO,
                                R_ACTIVIDADES.TIPO_REGISTRO,
                                R_FECHAS_GENERAR.FECHA,
                                0,
                                'BORRADOR',
                                R_ACTIVIDADES.CODIGO_RENGLON,
                                R_ACTIVIDADES.CODIGO_RENGLON_PADRE,
                                V_CODIGO_USUARIO,
                                SYSDATE
                            );
                    END LOOP;
                END LOOP;

                FOR R_TAREAS IN C_TAREAS(V_ID_HOJA_TIEMPO)
                LOOP
                    INSERT INTO SAF.HT_TAREAS_ADMINISTRATIVAS
                    (
                        ID_HT_HOJA_DE_TIEMPOS,
                        TITULO,
                        TIPO_REGISTRO,
                        FECHA,
                        CANTIDAD_HORAS,
                        ESTADO,
                        CODIGO_RENGLON,
                        CODIGO_RENGLON_PADRE,
                        ORDEN,
                        ID_REGISTRO,
                        USUARIO_GRABACION,
                        FECHA_GRABACION
                    )
                    VALUES
                    (
                        V_ID_HOJA_TIEMPO,
                        R_TAREAS.TITULO,
                        'TA',
                        R_FECHAS_GENERAR.FECHA,
                        0,
                        'BORRADOR',
                        R_TAREAS.CODIGO_RENGLON,
                        R_TAREAS.CODIGO_RENGLON_PADRE,
                        R_TAREAS.ORDEN,
                        R_TAREAS.ID_REGISTRO,
                        V_CODIGO_USUARIO,
                        SYSDATE
                    );
                END LOOP;
            END IF;
        END LOOP;
    ELSIF V_FECHAS_GENERADAS > V_DIAS_CALCULAR THEN
        FOR R_FECHAS_GENERAR IN C_FECHAS_GENERAR(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY'), V_FECHAS_GENERADAS)
        LOOP
            IF R_FECHAS_GENERAR.NUMERO_LINEA > 7 THEN
                FOR R_TAREAS_GENERAL IN C_TAREAS_GENERAL(V_ID_HOJA_TIEMPO)
                LOOP
                    DELETE FROM SAF.HT_TAREAS_ADMINISTRATIVAS
                    WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
                        AND TRUNC(FECHA) = TRUNC(R_FECHAS_GENERAR.FECHA)
                        AND USUARIO_GRABACION = V_CODIGO_USUARIO
                        AND ID_REGISTRO = R_TAREAS_GENERAL.ID_REGISTRO
                        AND CODIGO_RENGLON = R_TAREAS_GENERAL.CODIGO_RENGLON;
                END LOOP;

                FOR R_GENERAR_RENGLONES IN C_GENERAR_RENGLONES(V_ID_HOJA_TIEMPO)
                LOOP
                    FOR R_ACTIVIDADES IN C_ACTIVIDADES(V_ID_HOJA_TIEMPO, R_GENERAR_RENGLONES.CODIGO_RENGLON)
                    LOOP
                        DELETE FROM SAF.HT_ACTIVIDADES_SERVICOS
                        WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
                          AND TRUNC(FECHA) = TRUNC(R_FECHAS_GENERAR.FECHA)
                          AND USUARIO_GRABACION = V_CODIGO_USUARIO
                          AND ID_EST_CS_ACTIVIDADES = R_ACTIVIDADES.ID_EST_CS_ACTIVIDADES
                          AND CODIGO_RENGLON = R_ACTIVIDADES.CODIGO_RENGLON;
                    END LOOP;

                    DELETE FROM SAF.HT_RENGLONES_SERVICOS
                        WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
                        AND TRUNC(FECHA) = TRUNC(R_FECHAS_GENERAR.FECHA)
                        AND USUARIO_GRABACION = V_CODIGO_USUARIO
                        AND ID_EST_CS_CONTRATOS_SERVICIO = R_GENERAR_RENGLONES.ID_EST_CS_CONTRATOS_SERVICIO
                        AND CODIGO_RENGLON = R_GENERAR_RENGLONES.CODIGO_RENGLON;
                END LOOP;
            END IF;
        END LOOP;
        --raise_application_error(-20111,'VISTA BORRAR DATOS');
    ELSE
        raise_application_error(-20111,'ERROR_EN_GENERAL');
    END IF;
END;