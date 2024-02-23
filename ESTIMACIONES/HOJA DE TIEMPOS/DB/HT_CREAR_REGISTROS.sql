CREATE OR REPLACE PROCEDURE SAF.HT_CREAR_REGISTROS
(
    V_CODIGO_EMPRESA NUMBER,
    V_CODIGO_DIVISION NUMBER,
    V_CODIGO_PROYECTO VARCHAR2,
    V_ANIO NUMBER DEFAULT EXTRACT(YEAR FROM SYSDATE),
    V_TIPO_PERIODO VARCHAR2,
    V_SERIE VARCHAR2
) AS
    CURSOR C_PERIODOS IS
        SELECT
            ID,
            CORRELATIVO,
            FECHA_INICIO,
            FECHA_FINAL
        FROM SAF.HT_LISTADO_PERIODOS
        WHERE ANIO = V_ANIO
        AND TIPO_PERIODO = V_TIPO_PERIODO
        AND SERIE = V_SERIE
        ORDER BY CORRELATIVO;

    CURSOR C_REGISTROS_CONTRATOS(P_DIVISION NUMBER, P_EMPRESA NUMBER, P_PROYECTO VARCHAR2) IS
        SELECT
            'CS' || LPAD(ID, 8, '0') || ' : ' || TITULO_CONTRATO AS TITULO,
            'CS' AS TIPO_REGISTRO,
            ID
        FROM SAF.EST_CS_CONTRATOS_SERVICIO
        WHERE ESTADO_RESOLUCION NOT IN ('BORRADOR', 'N', 'ELIMINADO')
          AND
            (
                ((CODIGO_PROYECTO = P_PROYECTO) OR (P_PROYECTO IS NULL)) AND
                ((CODIGO_EMPRESA = P_EMPRESA) OR (P_EMPRESA IS NULL)) AND
                ((CODIGO_DIVISION = P_DIVISION) OR (P_DIVISION IS NULL))
            )
        ORDER BY ID;

    CURSOR C_REGISTROS_RENGLONES(P_CONTRATO NUMBER) IS
        WITH DATOS_RENGLON AS
                 (SELECT
                      A.ID,
                      A.CODIGO_RENGLON,
                      A.CODIGO_RENGLON_PADRE,
                      A.CODIGO_RENGLON || ' - ' || A.TITULO AS TITULO
                  FROM SAF.EST_CS_RENGLONES A
                  WHERE A.ID_CS_CONTRATOS_SERVICIO = P_CONTRATO)
        SELECT
            *
        FROM DATOS_RENGLON
        START WITH CODIGO_RENGLON_PADRE IS NULL
        CONNECT BY PRIOR CODIGO_RENGLON = CODIGO_RENGLON_PADRE
        ORDER SIBLINGS BY CODIGO_RENGLON;

    CURSOR C_REGISTROS_ACTIVIDADES(P_RENGLONID NUMBER) IS
        SELECT
            ID,
            CODIGO_ACTIVIDAD,
            CODIGO_ACTIVIDAD || ' - ' || TITULO AS TITULO,
            ID_EST_CS_RENGLONES
        FROM SAF.EST_CS_ACTIVIDADES
        WHERE ID_EST_CS_RENGLONES = P_RENGLONID;

    CURSOR C_FECHAS(P_FECHA DATE, P_DIAS NUMBER) IS
        SELECT
            ROW_NUMBER() OVER (ORDER BY TRUNC(P_FECHA + LEVEL - 1) ASC) AS NUMERO_LINEA,
            TRUNC(P_FECHA + LEVEL - 1) AS FECHA,
            INITCAP(TO_CHAR(P_FECHA + LEVEL - 1, 'DAY DD')) AS FECHA_NOMBRE
        FROM DUAL
        CONNECT BY LEVEL <= P_DIAS;

    V_USUARIO NUMBER := PCK_GRAL.FNC_TRAE_NO_USUARIO(NVL(V('APP_USER'), USER));
    V_ID_HOJA_TIEMPO NUMBER;
    V_ID_RENGLON NUMBER;
BEGIN
    FOR R_PERIODOS IN C_PERIODOS
    LOOP
        INSERT INTO SAF.HT_HOJA_DE_TIEMPOS
        (
            FECHA_INICIO,
            FECHA_FIN,
            TIPO_VISTA,
            ESTADO,
            CODIGO_EMPRESA,
            CODIGO_DIVISION,
            CODIGO_PROYECTO,
            TIPO_PERIODO,
            ANIO,
            SERIE,
            USUARIO_GRABACION,
            FECHA_GRABACION
        )
        VALUES
        (
            R_PERIODOS.FECHA_INICIO,
            R_PERIODOS.FECHA_FINAL,
            1,
            'BORRADOR',
            V_CODIGO_EMPRESA,
            V_CODIGO_DIVISION,
            V_CODIGO_PROYECTO,
            V_TIPO_PERIODO,
            V_ANIO,
            V_SERIE,
            V_USUARIO,
            SYSDATE
        ) RETURNING ID INTO V_ID_HOJA_TIEMPO;

        FOR R_FECHAS IN C_FECHAS(R_PERIODOS.FECHA_INICIO, TRUNC(R_PERIODOS.FECHA_FINAL - R_PERIODOS.FECHA_INICIO))
        LOOP
            FOR R_REGISTROS_CONTRATOS IN C_REGISTROS_CONTRATOS(V_CODIGO_DIVISION, V_CODIGO_EMPRESA, V_CODIGO_PROYECTO)
            LOOP
                INSERT INTO SAF.HT_RENGLONES_SERVICOS
                (
                    ID_HT_HOJA_DE_TIEMPOS,
                    ID_EST_CS_RENGLONES,
                    ID_EST_CS_CONTRATOS_SERVICIO,
                    CODIGO_RENGLON,
                    CODIGO_RENGLON_PADRE,
                    TITULO,
                    TIPO_REGISTRO,
                    FECHA,
                    CANTIDAD_HORAS,
                    ESTADO,
                    ORDEN,
                    USUARIO_GRABACION,
                    FECHA_GRABACION
                )
                VALUES
                (
                    V_ID_HOJA_TIEMPO,
                    NULL,
                    R_REGISTROS_CONTRATOS.ID,
                    'CS' || LPAD(R_REGISTROS_CONTRATOS.ID, 8, '0'),
                    NULL,
                    R_REGISTROS_CONTRATOS.TITULO,
                    'CS',
                    R_FECHAS.FECHA,
                    0,
                    'BORRADOR',
                    1,
                    V_USUARIO,
                    SYSDATE
                );

                FOR R_REGISTROS_RENGLONES IN C_REGISTROS_RENGLONES(R_REGISTROS_CONTRATOS.ID)
                LOOP
                    INSERT INTO SAF.HT_RENGLONES_SERVICOS
                    (
                        ID_HT_HOJA_DE_TIEMPOS,
                        ID_EST_CS_RENGLONES,
                        ID_EST_CS_CONTRATOS_SERVICIO,
                        CODIGO_RENGLON,
                        CODIGO_RENGLON_PADRE,
                        TITULO,
                        TIPO_REGISTRO,
                        FECHA,
                        CANTIDAD_HORAS,
                        ESTADO,
                        ORDEN,
                        USUARIO_GRABACION,
                        FECHA_GRABACION
                    )
                    VALUES
                    (
                        V_ID_HOJA_TIEMPO   ,
                        R_REGISTROS_RENGLONES.ID,
                        R_REGISTROS_CONTRATOS.ID,
                        'CS' || LPAD(R_REGISTROS_CONTRATOS.ID, 8, '0') || '-' || R_REGISTROS_RENGLONES.CODIGO_RENGLON,
                        (
                            CASE
                                WHEN R_REGISTROS_RENGLONES.CODIGO_RENGLON_PADRE IS NULL THEN
                                    (SELECT
                                         DISTINCT
                                         CODIGO_RENGLON
                                     FROM SAF.HT_RENGLONES_SERVICOS
                                     WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
                                       AND ID_EST_CS_CONTRATOS_SERVICIO = R_REGISTROS_CONTRATOS.ID
                                       AND TIPO_REGISTRO = 'CS')
                                ELSE (SELECT
                                          DISTINCT
                                          CODIGO_RENGLON
                                      FROM SAF.HT_RENGLONES_SERVICOS
                                      WHERE ID_HT_HOJA_DE_TIEMPOS = V_ID_HOJA_TIEMPO
                                        AND TIPO_REGISTRO = 'R'
                                        AND ID_EST_CS_CONTRATOS_SERVICIO = R_REGISTROS_CONTRATOS.ID
                                        AND CODIGO_RENGLON = 'CS' || LPAD(R_REGISTROS_CONTRATOS.ID, 8, '0') || '-' || R_REGISTROS_RENGLONES.CODIGO_RENGLON_PADRE)
                                END
                            ),
                        R_REGISTROS_RENGLONES.TITULO,
                        'R',
                        R_FECHAS.FECHA,
                        0,
                        'BORRADOR',
                        1,
                        V_USUARIO,
                        SYSDATE
                    ) RETURNING ID INTO V_ID_RENGLON;

                    FOR R_REGISTROS_ACTIVIDADES IN C_REGISTROS_ACTIVIDADES(R_REGISTROS_RENGLONES.ID)
                    LOOP
                        INSERT INTO SAF.HT_ACTIVIDADES_SERVICOS
                        (
                            ID_HT_HOJA_DE_TIEMPOS,
                            ID_EST_CS_ACTIVIDADES,
                            ID_HT_RENGLONES_SERVICOS,
                            CODIGO_RENGLON,
                            TITULO,
                            TIPO_REGISTRO,
                            FECHA,
                            CANTIDAD_HORAS,
                            ESTADO,
                            USUARIO_GRABACION,
                            FECHA_GRABACION
                        )
                        VALUES
                        (
                            V_ID_HOJA_TIEMPO,
                            R_REGISTROS_ACTIVIDADES.ID,
                            V_ID_RENGLON,
                            'CS' || LPAD(R_REGISTROS_CONTRATOS.ID, 8, '0') || '-' ||  R_REGISTROS_ACTIVIDADES.ID,
                            R_REGISTROS_ACTIVIDADES.TITULO,
                            'A',
                            R_FECHAS.FECHA,
                            0,
                            'BORRADOR',
                            V_USUARIO,
                            SYSDATE
                        );
                    END LOOP;
                END LOOP;
            END LOOP;

            INSERT INTO SAF.HT_RENGLONES_SERVICOS
            (
                ID_HT_HOJA_DE_TIEMPOS,
                ID_EST_CS_RENGLONES,
                ID_EST_CS_CONTRATOS_SERVICIO,
                CODIGO_RENGLON,
                CODIGO_RENGLON_PADRE,
                TITULO,
                TIPO_REGISTRO,
                FECHA,
                CANTIDAD_HORAS,
                ESTADO,
                ORDEN,
                USUARIO_GRABACION,
                FECHA_GRABACION
            )
            VALUES
            (
                V_ID_HOJA_TIEMPO,
                NULL,
                NULL,
                'TA',
                NULL,
                'Tareas Administrativas',
                'TA',
                R_FECHAS.FECHA,
                0,
                'BORRADOR',
                2,
                V_USUARIO,
                SYSDATE
            );
        END LOOP;
    END LOOP;
END;