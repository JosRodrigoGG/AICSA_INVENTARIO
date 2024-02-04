CREATE OR REPLACE PROCEDURE SAF.EST_CS_COPIA_CONTRATO
(
    V_CS_COTRATOID NUMBER,
    V_CODIGO_USUARIO NUMBER
) AS
    CURSOR C_CONTRATO(P_CONTRATOID NUMBER) IS
        SELECT
            *
        FROM SAF.EST_CS_CONTRATOS_SERVICIO
        WHERE ID = P_CONTRATOID;

    CURSOR C_RENGLONES(P_CONTRATOID NUMBER) IS
        SELECT
            *
        FROM SAF.EST_CS_RENGLONES
        WHERE ID_CS_CONTRATOS_SERVICIO = P_CONTRATOID;

    CURSOR C_ACTIVIDADES(P_RENGLONID NUMBER) IS
        SELECT
            *
        FROM SAF.EST_CS_ACTIVIDADES
        WHERE ID_EST_CS_RENGLONES = P_RENGLONID;

    V_CONTRATO_ID NUMBER;
    V_RENGLON_ID NUMBER;
BEGIN
    FOR R_CONTRATO IN C_CONTRATO(V_CS_COTRATOID)
    LOOP
        INSERT INTO SAF.EST_CS_CONTRATOS_SERVICIO
            (
                CODIGO_EMPRESA,
                CODIGO_DIVISION,
                CODIGO_PROYECTO,
                NUMERO_CUENTA,
                CODIGO_MONEDA,
                TASA_CAMBIO,
                ESTADO_RESOLUCION,
                FECHA_ENTREGA,
                ALCANCE_TRABAJO,
                TITULO_CONTRATO,
                GERENTE_RESPONSABLE,
                TIPO_CONTRATO,
                FECHA_INICIO,
                FECHA_FIN,
                MONTO_ANTICIPO,
                PORCENTAJE_ANTICIPO,
                PORCENTAJE_INDIRECTO,
                PORCENTAJE_RETENIDO,
                USUARIO_GRABACION,
                FECHA_GRABACION
            )
        VALUES
            (
                R_CONTRATO.CODIGO_EMPRESA,
                R_CONTRATO.CODIGO_DIVISION,
                R_CONTRATO.CODIGO_PROYECTO,
                R_CONTRATO.NUMERO_CUENTA,
                R_CONTRATO.CODIGO_MONEDA,
                R_CONTRATO.TASA_CAMBIO,
                'BORRADOR',
                R_CONTRATO.FECHA_ENTREGA,
                R_CONTRATO.ALCANCE_TRABAJO,
                R_CONTRATO.TITULO_CONTRATO,
                R_CONTRATO.GERENTE_RESPONSABLE,
                R_CONTRATO.TIPO_CONTRATO,
                R_CONTRATO.FECHA_INICIO,
                R_CONTRATO.FECHA_FIN,
                R_CONTRATO.MONTO_ANTICIPO,
                R_CONTRATO.PORCENTAJE_ANTICIPO,
                R_CONTRATO.PORCENTAJE_INDIRECTO,
                R_CONTRATO.PORCENTAJE_RETENIDO,
                V_CODIGO_USUARIO,
                SYSDATE
            ) RETURNING ID INTO V_CONTRATO_ID;

        FOR R_RENGLONES IN C_RENGLONES(V_CS_COTRATOID)
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
                    V_CONTRATO_ID,
                    R_RENGLONES.ID_CTS_TIPO_SERVICIO,
                    R_RENGLONES.CODIGO_RENGLON,
                    R_RENGLONES.CODIGO_RENGLON_PADRE,
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
                    V_CODIGO_USUARIO,
                    SYSDATE
                ) RETURNING ID INTO V_RENGLON_ID;

            FOR R_ACTIVIDADES IN C_ACTIVIDADES(R_RENGLONES.ID)
            LOOP
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
                VALUES
                    (
                        V_RENGLON_ID,
                        R_ACTIVIDADES.ORDEN,
                        R_ACTIVIDADES.TITULO,
                        R_ACTIVIDADES.DESCRIPCION,
                        R_ACTIVIDADES.CODIGO_MEDIDA,
                        R_ACTIVIDADES.CODIGO_ACTIVIDAD,
                        R_ACTIVIDADES.COSTO_UNITARIO,
                        R_ACTIVIDADES.COSTO_TOTAL,
                        R_ACTIVIDADES.INDIRECTO,
                        R_ACTIVIDADES.PRECIO_UNITARIO,
                        R_ACTIVIDADES.PRECIO_TOTAL,
                        R_ACTIVIDADES.ID_EST_CS_PLANTILLA_ACTIVIDADE,
                        R_ACTIVIDADES.CANTIDAD,
                        R_ACTIVIDADES.INDIRECTO_PORCENTAJE,
                        R_ACTIVIDADES.ID_EST_CS_ACTIVIDADES_LISTA,
                        V_CODIGO_USUARIO,
                        SYSDATE
                    );
            END LOOP;
        END LOOP;

        INSERT INTO SAF.ROLES_PERMISOS_USUARIO
            (
                CODIGO_USUARIO,
                TABLA,
                ID_REGISTRO,
                ID_ROLE,
                USUARIO_GRABACION,
                FECHA_GRABACION
            )
        VALUES
            (
                V_CODIGO_USUARIO,
                'EST_CS_CONTRATOS_SERVICIO',
                V_CONTRATO_ID,
                1,
                V_CODIGO_USUARIO,
                SYSDATE
            );

        SAF.EST_CS_SUMARIZACION_RENGLONES(V_CONTRATO_ID);
    END LOOP;
END;