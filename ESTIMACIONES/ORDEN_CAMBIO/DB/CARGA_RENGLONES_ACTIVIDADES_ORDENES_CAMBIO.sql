create or replace PROCEDURE     SAF.CARGA_RENGLONES_ACTIVIDADES_ORDENES_CAMBIO (
    VID_ORDEN_CAMBIO ORDENES_CAMBIO.ID%TYPE,
    VCODIGO_CONTRATO EST_CONTRATOS.CODIGO_CONTRATO%TYPE,
    VID_CAMBIO_POTENCIAL  ORDENES_CAMBIO_SOLICITUDES.ID_CAMBIO_POTENCIAL%TYPE
) AS
    CURSOR DATOS_DE_LA_SOLICITUD IS
        SELECT
            CODIGO_RENGLON_PADRE,
            CODIGO_RENGLON,
            ORDEN,
            ID2,
            NOMBRE_REGISTRO,
            ICON,
            CANTIDAD,
            UM,
            ID_CAMBIO_POTENCIAL,
            ID_CONTRATO,
            COSTO_UNITARIO,
            COSTO_TOTAL,
            INDIRECTO,
            PRECIO_TOTAL,
            PRECIO_UNITARIO,
            ID_BLOQUE,
            SIMBOLO_MONEDA,
            DESCRIPCION_MEDIDA,
            ORIGEN,
            TIPO_COSTO,
            COSTO_UNITARIO_PRE,
            COSTO_TOTAL_PRE,
            INDIRECTO_PRE,
            PRECIO_TOTAL_PRE,
            PRECIO_UNTARIO_PRE,
            TOTAL_MATERIALES,
            TOTAL_EQUIPO,
            TOTAL_MANO_OBRA,
            TOTAL_RECURSOS,
            TIPO_RENGLON,
            CORREC_INDIRECTO,
            CORREC_INDIRECTO_PRESUPUESTADO,
            CODIGO_ACTIVIDAD_MANUAL
        FROM CPOT_CAMBIOS_POTENCIALES_RENGLONES_CAMBIO
        WHERE ID_CAMBIO_POTENCIAL = VID_CAMBIO_POTENCIAL
          AND ID_CONTRATO = VCODIGO_CONTRATO
          AND NOMBRE_REGISTRO IS NOT NULL;


    CURSOR DATOS_ENCABEZADO_CAMBIOS IS
        SELECT *
        FROM SAF.CPOT_CAMBIOS_POTENCIALES A
        WHERE A.ID = VID_CAMBIO_POTENCIAL;


    VCODIGO_RENGLON  VARCHAR2(1024);
    RENGLON_PRINCIPAL VARCHAR2(1024);
    VRENGLON_PADRE VARCHAR2(1024);
    VORDEN_REGLON NUMBER := 0;
    VES_PADRE VARCHAR2(2);
    VCODIGO  VARCHAR2(1024);

BEGIN

    SELECT
        FNC_ORDEN_MAXIMO_ORDENES_CAMBIO_RENGLONES(VID_ORDEN_CAMBIO,VCODIGO_CONTRATO)+1 NUMERO_MAXIMO,
        GET_GENERADOR_CODIGOS_RENGLONES_ORDENES_CAMBIO(VCODIGO_CONTRATO,null,1,1,VID_ORDEN_CAMBIO) CODIGO_RENGLON
    INTO
        VORDEN_REGLON,
        VCODIGO_RENGLON
    FROM DUAL;


    FOR A IN DATOS_ENCABEZADO_CAMBIOS LOOP
            INSERT INTO ORDENES_CAMBIO_RENGLONES_ACTIVIDADES(
                CODIGO_RENGLON_PADRE,
                CODIGO_RENGLON,
                NOMBRE,
                ID_CONTRATO,
                ID_ORDEN_CAMBIO,
                ICON,
                ORDEN,
                TIPO_RENGLON,
                UM,
                ES_PADRE

            )VALUES (
                        null,
                        VCODIGO_RENGLON,
                        A.TITULO,
                        VCODIGO_CONTRATO,
                        VID_ORDEN_CAMBIO,
                        'fa fa-folder',
                        VORDEN_REGLON,
                        'ESTIMADO',
                        552,
                        1
                    )
            RETURNING CODIGO_RENGLON INTO RENGLON_PRINCIPAL;
        END LOOP;


    FOR B IN DATOS_DE_LA_SOLICITUD LOOP

            IF B.CODIGO_RENGLON_PADRE IS NULL THEN
                VRENGLON_PADRE := RENGLON_PRINCIPAL;
                --VCODIGO_RENGLON := 	GET_GENERADOR_CODIGOS_RENGLONES_ORDENES_CAMBIO(VCODIGO_CONTRATO,RENGLON_PRINCIPAL,2,1,VID_ORDEN_CAMBIO);
            ELSE
                VRENGLON_PADRE := B.CODIGO_RENGLON_PADRE; --VCODIGO;

            END IF;

            IF B.ICON = 'fa fa-folder' THEN
                VES_PADRE := 1;
            ELSE
                VES_PADRE := 2;
            END IF;

            INSERT INTO SAF.ORDENES_CAMBIO_RENGLONES_ACTIVIDADES (
                ID_ORDEN_CAMBIO,
                ID_CONTRATO,
                ID_BLOQUE,
                NOMBRE,
                CANTIDAD,
                UM,
                DESCRIPCION_MEDIDA,
                TIPO_COSTO,
                CODIGO_RENGLON_PADRE,
                CODIGO_RENGLON,
                ORDEN,
                ICON,
                COSTO_UNITARIO_ESTIMADO,
                COSTO_TOTAL_ESTIMADO,
                PORCENTAJE_INDIRECTO_ESTIMADO,
                MONTO_INDIRECTO_ESTIMADO,
                PRECIO_UNITARIO_ESTIMADO,
                PRECIO_TOTAL_ESTIMADO,
                COSTO_UNITARIO_PRESUPUESTADO,
                COSTO_TOTAL_PRESUPUESTADO,
                PORCENTAJE_INDIRECTO_PRESUPUESTADO,
                MONTO_INDIRECTO_PRESUPUESTADO,
                PRECIO_UNTARIO_PRESUPUESTADO,
                PRECIO_TOTAL_PRESUPUESTADO,
                TOTAL_MATERIALES,
                TOTAL_EQUIPO,
                TOTAL_MANO_OBRA,
                TOTAL_RECURSOS,
                ORIGEN_REGISTRO,
                TIPO_RENGLON,
                ID2,
                CORREC_INDIRECTO, --% De Indirecto
                CORREC_INDIRECTO_PRESUPUESTADO,
                INDIRECTO_PRESUPUESTADO,
                ES_PADRE
            )VALUES (
                        VID_ORDEN_CAMBIO,
                        B.ID_CONTRATO,
                        1,
                        B.NOMBRE_REGISTRO,
                        B.CANTIDAD,
                        B.UM,
                        B.DESCRIPCION_MEDIDA,
                        B.TIPO_COSTO,
                        VRENGLON_PADRE, --B.CODIGO_RENGLON_PADRE,
                        B.CODIGO_RENGLON,
                        VORDEN_REGLON, --B.ORDEN,
                        B.ICON,
                        B.COSTO_UNITARIO,
                        B.COSTO_TOTAL,
                        B.CORREC_INDIRECTO,
                        B.INDIRECTO,
                        B.PRECIO_UNITARIO,
                        B.PRECIO_TOTAL,
                        B.COSTO_UNITARIO_PRE,
                        B.COSTO_TOTAL_PRE,
                        B.CORREC_INDIRECTO_PRESUPUESTADO,
                        B.INDIRECTO_PRE,
                        B.PRECIO_UNTARIO_PRE,
                        B.PRECIO_TOTAL_PRE,
                        B.TOTAL_MATERIALES,
                        B.TOTAL_EQUIPO,
                        B.TOTAL_MANO_OBRA,
                        B.TOTAL_RECURSOS,
                        B.ORIGEN,
                        B.TIPO_RENGLON,
                        B.ID2,
                        B.CORREC_INDIRECTO,
                        B.CORREC_INDIRECTO_PRESUPUESTADO,
                        B.INDIRECTO,
                        VES_PADRE
                    )
            RETURNING CODIGO_RENGLON INTO VCODIGO;
            COMMIT;
        END LOOP;
    --RENGLONES_ACTIVIDADES_ORDENES_CAMBIO_SUMARIZACION(VID_ORDEN_CAMBIO,VCODIGO_CONTRATO);
    COMMIT;
END;