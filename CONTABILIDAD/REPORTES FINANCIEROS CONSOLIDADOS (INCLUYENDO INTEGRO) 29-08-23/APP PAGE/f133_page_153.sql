prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the owner (parsing schema)
-- of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.5'
,p_default_workspace_id=>1410670577065694
,p_default_application_id=>133
,p_default_id_offset=>0
,p_default_owner=>'SAF'
);
end;
/
 
prompt APPLICATION 133 - Contabilidad
--
-- Application Export:
--   Application:     133
--   Name:            Contabilidad
--   Date and Time:   17:01 Tuesday August 29, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 153
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00153
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>153);
end;
/
prompt --application/pages/page_00153
begin
wwv_flow_imp_page.create_page(
 p_id=>153
,p_name=>'PLANTILLA_BALANCE_SITUACION_FINANCIERA_INTEGRO'
,p_alias=>'PLANTILLA-BALANCE-SITUACION-FINANCIERA-INTEGRO'
,p_step_title=>'PLANTILLA_BALANCE_SITUACION_FINANCIERA_INTEGRO'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function editarNota() {',
'    $.event.trigger(''EDITAR_NOTA'');',
'}',
'',
'function crearNota() {',
'    $.event.trigger(''CREAR_NOTA'');',
'}',
'',
'function eliminarNota() {',
'    $.event.trigger(''ELIMINAR_NOTA'');',
'}',
'',
'function verNota() {',
'    $.event.trigger(''VER_NOTA'');',
'}',
'',
'function asociarNota() {',
'    $.event.trigger(''ASOCIAR_NOTA'');',
'}',
'',
'function modificarRenglon() {',
'    $.event.trigger(''MODIFICAR_RENGLON'');',
'}',
'',
'function descargarReporte() {',
'    $.event.trigger(''IMPRIMIR_REPORTE'');',
'}',
'',
'function descargarNotas() {',
'    $.event.trigger(''IMPRIMIR_NOTAS'');',
'}',
'',
'function descargarTodos() {',
'    $.event.trigger(''IMPRIMIR_REPORTE'');',
'    $.event.trigger(''IMPRIMIR_NOTAS'');',
'}',
'',
'function cargarDatoRenglon () {',
'    $.event.trigger(''CARGAR_DATO_UNITARIO'');',
'}',
'',
'function subirPlantilla() {',
'    $.event.trigger(''SUBIR_PLANTILLA'');',
'}',
'',
'function descargarPlantilla() {',
'    $.event.trigger(''DESCARGAR_PLANTILLA'');',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ACTIVO th#ANIO_1, #ACTIVO td[headers=ANIO_1],',
'#ACTIVO th#ANIO_2, #ACTIVO td[headers=ANIO_2],',
'#PASIVO th#ANIO_1, #PASIVO td[headers=ANIO_1],',
'#PASIVO th#ANIO_2, #PASIVO td[headers=ANIO_2]',
'{',
'    width: 130px !important;',
'    min-width: 130px !important;',
'    max-width: 130px !important;',
'}',
'',
'#ACTIVO th#ID_NOTA, #ACTIVO td[headers=ID_NOTA],',
'#PASIVO th#ID_NOTA, #PASIVO td[headers=ID_NOTA]',
'{',
'    width: 250px !important;',
'    min-width: 250px !important;',
'    max-width: 250px !important;',
'}',
'',
'#ACTIVO th#BOTON, #ACTIVO td[headers=BOTON],',
'#PASIVO th#BOTON, #PASIVO td[headers=BOTON]',
'{',
'    width: 80px !important;',
'    min-width: 80px !important;',
'    max-width: 80px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230828163358'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(690438386386028182)
,p_plug_name=>'LISTA_2'
,p_region_name=>'LISTA_2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(99548300376243627)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_list_id=>wwv_flow_imp.id(195531008967362855)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(99634242810244021)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1646898414645419934)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1711767236490689035)
,p_plug_name=>'LISTA'
,p_region_name=>'LISTA_DESCARGAS'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(99548300376243627)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_list_id=>wwv_flow_imp.id(121822620578484049)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(99634242810244021)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1851939739281825098)
,p_plug_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P153_EMPRESA IS NOT NULL AND',
':P153_MES_INICIO IS NOT NULL AND',
':P153_MES_FINAL IS NOT NULL AND',
':P153_ANIO IS NOT NULL AND',
':P153_VERSION IS NOT NULL AND',
':P153_MONEDA IS NOT NULL AND',
':P153_EMPRESA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1677991571425028169)
,p_plug_name=>'TITULO_REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(1851939739281825098)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:center;">&P153_NOMBRE_TITULO.</h4>',
'<h5 style="text-align:center;">Balance de Situacion Financiera</h5>',
'<h5 style="text-align:center;">&P153_FECHA_TITULO.</h5>',
'<h5 style="text-align:center;">(Cifras Expresadas en &P153_NOMBRE_MONEDA.)</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1851939991635825100)
,p_plug_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(1851939739281825098)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1677991895972028173)
,p_plug_name=>'TITULO_REGION'
,p_parent_plug_id=>wwv_flow_imp.id(1851939991635825100)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_source=>'<h5 style="text-align:center;">Activo</h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1851940853923825109)
,p_plug_name=>'Activo'
,p_region_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(1851939991635825100)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Activo Corriente'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ENCABEZADO'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    ID,',
'    ID_NOTA,',
'    NOMBRE,',
'    COD_CTA,',
'    ORDEN_1,',
'    ORDEN_2,',
'    BOTON,',
'    NVL(ANIO_1, 0) ANIO_1,',
'    NVL(ANIO_2, 0) ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE',
'                WHEN',
'                (',
'                    SELECT',
'                    	COUNT(B.ID)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND (B.ANIO = :P153_ANIO OR B.ANIO = :P153_ANIO_MENOS_1)',
'                    AND B.MES_INICIO = :P153_MES_INICIO',
'                    AND B.MES_FIN = :P153_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                    AND B.VALOR != 0',
'                ) != 0',
'                THEN',
'                    ''Registros Cargados: '' ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO ||'' ''',
'                            ELSE',
'                                NULL',
'                        END',
'                    ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO_MENOS_1',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO_MENOS_1',
'                            ELSE',
'                                NULL',
'                        END',
'                ELSE',
'                    NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_1,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO_MENOS_1',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        NULL ID_NOTA_NUM',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    WHERE A.ORDEN_1 = ''Activo''',
'    AND A.ORDEN_2 = ''Activo Corriente''',
'    AND A.TIPO_REPORTE = 1',
'    ORDER BY A.ID ASC',
')',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Total Activo Corriente'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Activo''',
'        AND A.ORDEN_2 = ''Activo Corriente''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_1,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO_MENOS_1',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Activo''',
'        AND A.ORDEN_2 = ''Activo Corriente''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Activo No Corriente'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ENCABEZADO'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    ID,',
'    ID_NOTA,',
'    NOMBRE,',
'    COD_CTA,',
'    ORDEN_1,',
'    ORDEN_2,',
'    BOTON,',
'    NVL(ANIO_1, 0) ANIO_1,',
'    NVL(ANIO_2, 0) ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE',
'                WHEN',
'                (',
'                    SELECT',
'                    	COUNT(B.ID)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND (B.ANIO = :P153_ANIO OR B.ANIO = :P153_ANIO_MENOS_1)',
'                    AND B.MES_INICIO = :P153_MES_INICIO',
'                    AND B.MES_FIN = :P153_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                    AND B.VALOR != 0',
'                ) != 0',
'                THEN',
'                    ''Registros Cargados: '' ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO ||'' ''',
'                            ELSE',
'                                NULL',
'                        END',
'                    ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO_MENOS_1',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO_MENOS_1',
'                            ELSE',
'                                NULL',
'                        END',
'                ELSE',
'                    NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_1,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO_MENOS_1',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        NULL ID_NOTA_NUM',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    WHERE A.ORDEN_1 = ''Activo''',
'    AND A.ORDEN_2 = ''Activo No Corriente''',
'    AND A.TIPO_REPORTE = 1',
'    ORDER BY A.ID ASC',
')',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Total Activo No Corriente'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            )) ANIO_1',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Activo''',
'        AND A.ORDEN_2 = ''Activo No Corriente''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_1,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO_MENOS_1',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            )) ANIO_2',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Activo''',
'        AND A.ORDEN_2 = ''Activo No Corriente''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''Total Activo'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Activo''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_1,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO_MENOS_1',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Activo''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P153_SIMBOLO_MONEDA,P153_MONEDA,P153_ANIO,P153_MES_INICIO,P153_MES_FINAL,P153_ANIO_MENOS_1,P153_EMPRESA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Activo'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1851940954318825110)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>1851940954318825110
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195491747764362794)
,p_db_column_name=>'NOMBRE'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Descripcion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="#CLASE#">  ',
'    #NOMBRE#',
'</span>',
'',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="ID_NOTA" type="hidden" value="#ID_NOTA_NUM#">',
'<input id="TIPO" type="hidden" value="#TIPO#">'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195492196237362794)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195492555396362795)
,p_db_column_name=>'COD_CTA'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Cod Cta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195492957934362796)
,p_db_column_name=>'ORDEN_1'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Orden 1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195493316302362797)
,p_db_column_name=>'ORDEN_2'
,p_display_order=>60
,p_column_identifier=>'L'
,p_column_label=>'Orden 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195493757742362797)
,p_db_column_name=>'ANIO_1'
,p_display_order=>80
,p_column_identifier=>'T'
,p_column_label=>'&P153_ANIO.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA#</div> <div style="float:right; #CLASE#">#ANIO_1#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'ANIO_1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195494137824362798)
,p_db_column_name=>'ANIO_2'
,p_display_order=>90
,p_column_identifier=>'U'
,p_column_label=>'&P153_ANIO_MENOS_1.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA#</div> <div style="float:right; #CLASE#">#ANIO_2#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'ANIO_2'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195494527462362798)
,p_db_column_name=>'TIPO'
,p_display_order=>100
,p_column_identifier=>'V'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195494952068362799)
,p_db_column_name=>'CLASE'
,p_display_order=>110
,p_column_identifier=>'W'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195491330536362793)
,p_db_column_name=>'ID_NOTA'
,p_display_order=>130
,p_column_identifier=>'Y'
,p_column_label=>'Nota'
,p_column_type=>'STRING'
,p_static_id=>'ID_NOTA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195490987878362793)
,p_db_column_name=>'BOTON'
,p_display_order=>140
,p_column_identifier=>'AA'
,p_column_label=>'Boton'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195490583003362791)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>150
,p_column_identifier=>'AB'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197235343338878829)
,p_db_column_name=>'ID_NOTA_NUM'
,p_display_order=>160
,p_column_identifier=>'AC'
,p_column_label=>'Id Nota Num'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1852533235063143345)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'1834497'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:ID_NOTA:ANIO_1:ANIO_2'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1851940103470825101)
,p_plug_name=>'PASIVO Y CAPITAL'
,p_parent_plug_id=>wwv_flow_imp.id(1851939739281825098)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1677991997913028174)
,p_plug_name=>'TITULO_REGION'
,p_parent_plug_id=>wwv_flow_imp.id(1851940103470825101)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_source=>'<h5 style="text-align:center;">Pasivo y Patrimonio</h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1853359770517657384)
,p_plug_name=>'Pasivo'
,p_region_name=>'PASIVO'
,p_parent_plug_id=>wwv_flow_imp.id(1851940103470825101)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Pasivo Corriente'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ENCABEZADO'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    ID,',
'    ID_NOTA,',
'    NOMBRE,',
'    COD_CTA,',
'    ORDEN_1,',
'    ORDEN_2,',
'    BOTON,',
'    NVL(ANIO_1, 0) ANIO_1,',
'    NVL(ANIO_2, 0) ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE',
'                WHEN',
'                (',
'                    SELECT',
'                    	COUNT(B.ID)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND (B.ANIO = :P153_ANIO OR B.ANIO = :P153_ANIO_MENOS_1)',
'                    AND B.MES_INICIO = :P153_MES_INICIO',
'                    AND B.MES_FIN = :P153_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                    AND B.VALOR != 0',
'                ) != 0',
'                THEN',
'                    ''Registros Cargados: '' ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO ||'' ''',
'                            ELSE',
'                                NULL',
'                        END',
'                    ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO_MENOS_1',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO_MENOS_1',
'                            ELSE',
'                                NULL',
'                        END',
'                ELSE',
'                    NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_1,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO_MENOS_1',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        NULL ID_NOTA_NUM',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    WHERE A.ORDEN_1 = ''Pasivo''',
'    AND A.ORDEN_2 = ''Pasivo Corriente''',
'    AND A.TIPO_REPORTE = 1',
'    ORDER BY A.ID ASC',
')',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Total Pasivo Corriente'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Pasivo''',
'        AND A.ORDEN_2 = ''Pasivo Corriente''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_1,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO_MENOS_1',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Pasivo''',
'        AND A.ORDEN_2 = ''Pasivo Corriente''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Pasivo No Corriente'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ENCABEZADO'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    ID,',
'    ID_NOTA,',
'    NOMBRE,',
'    COD_CTA,',
'    ORDEN_1,',
'    ORDEN_2,',
'    BOTON,',
'    NVL(ANIO_1, 0) ANIO_1,',
'    NVL(ANIO_2, 0) ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE',
'                WHEN',
'                (',
'                    SELECT',
'                    	COUNT(B.ID)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND (B.ANIO = :P153_ANIO OR B.ANIO = :P153_ANIO_MENOS_1)',
'                    AND B.MES_INICIO = :P153_MES_INICIO',
'                    AND B.MES_FIN = :P153_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                    AND B.VALOR != 0',
'                ) != 0',
'                THEN',
'                    ''Registros Cargados: '' ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO ||'' ''',
'                            ELSE',
'                                NULL',
'                        END',
'                    ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO_MENOS_1',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO_MENOS_1',
'                            ELSE',
'                                NULL',
'                        END',
'                ELSE',
'                    NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_1,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO_MENOS_1',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        NULL ID_NOTA_NUM',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    WHERE A.ORDEN_1 = ''Pasivo''',
'    AND A.ORDEN_2 = ''Pasivo No Corriente''',
'    AND A.TIPO_REPORTE = 1',
'    ORDER BY A.ID ASC',
')',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Total Pasivo No Corriente'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Pasivo''',
'        AND A.ORDEN_2 = ''Pasivo No Corriente''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_1,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO_MENOS_1',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Pasivo''',
'        AND A.ORDEN_2 = ''Pasivo No Corriente''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''Total Pasivo'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Pasivo''',
'        AND (A.ORDEN_2 = ''Pasivo Corriente'' OR A.ORDEN_2 = ''Pasivo No Corriente'')',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_1,',
'    NVL((',
'        SELECT',
'        SUM((',
'            SELECT',
'                SAF.APX_FNC_CONVERSION_MONEDAS',
'                    (',
'                        B.VALOR,',
'                        B.MONEDA_ORIGEN,',
'                        :P153_MONEDA,',
'                        B.VALOR_CAMBIO,',
'                        NULL',
'                    )',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO_MENOS_1',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ))',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    WHERE A.ORDEN_1 = ''Pasivo''',
'    AND (A.ORDEN_2 = ''Pasivo Corriente'' OR A.ORDEN_2 = ''Pasivo No Corriente'')',
'    AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Patrimonio'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ENCABEZADO'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    ID,',
'    ID_NOTA,',
'    NOMBRE,',
'    COD_CTA,',
'    ORDEN_1,',
'    ORDEN_2,',
'    BOTON,',
'    NVL(ANIO_1, 0) ANIO_1,',
'    NVL(ANIO_2, 0) ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE',
'                WHEN',
'                (',
'                    SELECT',
'                    	COUNT(B.ID)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND (B.ANIO = :P153_ANIO OR B.ANIO = :P153_ANIO_MENOS_1)',
'                    AND B.MES_INICIO = :P153_MES_INICIO',
'                    AND B.MES_FIN = :P153_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                    AND B.VALOR != 0',
'                ) != 0',
'                THEN',
'                    ''Registros Cargados: '' ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO ||'' ''',
'                            ELSE',
'                                NULL',
'                        END',
'                    ||',
'                        CASE',
'                            WHEN',
'                            (',
'                                SELECT',
'                                	COUNT(B.ID)',
'                                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                AND B.ANIO = :P153_ANIO_MENOS_1',
'                                AND B.MES_INICIO = :P153_MES_INICIO',
'                                AND B.MES_FIN = :P153_MES_FINAL',
'                                AND B.ID_PLANTILLA_NOTA = A.ID',
'                                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                                AND B.VALOR != 0',
'                            ) != 0',
'                            THEN',
'                                :P153_ANIO_MENOS_1',
'                            ELSE',
'                                NULL',
'                        END',
'                ELSE',
'                    NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_1,',
'        (',
'            SELECT',
'            	SAF.APX_FNC_CONVERSION_MONEDAS',
'            		(',
'            			B.VALOR,',
'            			B.MONEDA_ORIGEN,',
'            			:P153_MONEDA,',
'            			B.VALOR_CAMBIO,',
'            			NULL',
'            		)',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'            AND B.ANIO = :P153_ANIO_MENOS_1',
'            AND B.MES_INICIO = :P153_MES_INICIO',
'            AND B.MES_FIN = :P153_MES_FINAL',
'            AND B.ID_PLANTILLA_NOTA = A.ID',
'            AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'        ) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        NULL ID_NOTA_NUM',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    WHERE A.ORDEN_1 = ''Pasivo''',
'    AND A.ORDEN_2 = ''Patrimonio''',
'    AND A.TIPO_REPORTE = 1',
'    ORDER BY A.ID ASC',
')',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Total Patrimonio'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Pasivo''',
'        AND A.ORDEN_2 = ''Patrimonio''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_1,',
'    NVL((',
'        SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO_MENOS_1',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            )) ANIO_2',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Pasivo''',
'        AND A.ORDEN_2 = ''Patrimonio''',
'        AND A.TIPO_REPORTE = 1',
'    ), 0) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''Total Pasivo y Patrimonio'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    (',
'        NVL(',
'            (SELECT',
'                SUM((',
'                    SELECT',
'                        SAF.APX_FNC_CONVERSION_MONEDAS',
'                            (',
'                                B.VALOR,',
'                                B.MONEDA_ORIGEN,',
'                                :P153_MONEDA,',
'                                B.VALOR_CAMBIO,',
'                                NULL',
'                            )',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P153_ANIO',
'                    AND B.MES_INICIO = :P153_MES_INICIO',
'                    AND B.MES_FIN = :P153_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'                ))',
'            FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'            WHERE A.ORDEN_1 = ''Pasivo''',
'            AND A.TIPO_REPORTE = 1)',
'            ,0)',
'    ) ANIO_1,',
'    (',
'        NVL((',
'            SELECT',
'            SUM((',
'                SELECT',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                        (',
'                            B.VALOR,',
'                            B.MONEDA_ORIGEN,',
'                            :P153_MONEDA,',
'                            B.VALOR_CAMBIO,',
'                            NULL',
'                        )',
'                FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                AND B.ANIO = :P153_ANIO_MENOS_1',
'                AND B.MES_INICIO = :P153_MES_INICIO',
'                AND B.MES_FIN = :P153_MES_FINAL',
'                AND B.ID_PLANTILLA_NOTA = A.ID',
'                AND B.CODIGO_EMPRESA = :P153_EMPRESA',
'            ))',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        WHERE A.ORDEN_1 = ''Pasivo''',
'        AND A.TIPO_REPORTE = 1',
'        ), 0)',
'    ) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P153_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P153_SIMBOLO_MONEDA,P153_MONEDA,P153_ANIO,P153_MES_INICIO,P153_MES_FINAL,P153_ANIO_MENOS_1,P153_EMPRESA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pasivo'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1853359901155657385)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>1853359901155657385
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195497799709362808)
,p_db_column_name=>'NOMBRE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Descripcion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="#CLASE#">  ',
'    #NOMBRE#',
'</span>',
'',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="ID_NOTA" type="hidden" value="#ID_NOTA_NUM#">',
'<input id="TIPO" type="hidden" value="#TIPO#">'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195498120716362808)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195498535877362809)
,p_db_column_name=>'COD_CTA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Cod Cta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195498987319362810)
,p_db_column_name=>'ORDEN_1'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Orden 1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195499323286362810)
,p_db_column_name=>'ORDEN_2'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Orden 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195499782195362811)
,p_db_column_name=>'BOTON'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'&nbsp'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_static_id=>'BOTON'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195500104864362812)
,p_db_column_name=>'ANIO_1'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'&P153_ANIO.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA#</div> <div style="float:right; #CLASE#">#ANIO_1#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'ANIO_1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195500554841362812)
,p_db_column_name=>'ANIO_2'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'&P153_ANIO_MENOS_1.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA#</div> <div style="float:right; #CLASE#">#ANIO_2#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'ANIO_2'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195500921414362813)
,p_db_column_name=>'TIPO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195501326426362814)
,p_db_column_name=>'CLASE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195497360365362807)
,p_db_column_name=>'ID_NOTA'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Nota'
,p_column_type=>'STRING'
,p_static_id=>'ID_NOTA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195496941170362806)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197235459733878830)
,p_db_column_name=>'ID_NOTA_NUM'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Id Nota Num'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1853671184843920086)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1845876'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:ID_NOTA:ANIO_1:ANIO_2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(195481699236362776)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_button_name=>'ACTUALIZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Actualizar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-retweet'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(195482070695362777)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_button_name=>'CARGAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Cargar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-wrench'
,p_button_cattributes=>'style="margin-top:30px"; data-menu="LISTA_2_menu"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(195482459206362777)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_button_name=>'REPORTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Reporte'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_button_cattributes=>'style="margin-top:30px"; data-menu="LISTA_DESCARGAS_menu"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(195529859106362849)
,p_branch_name=>'CARGAR_DATOS'
,p_branch_action=>'f?p=&APP_ID.:153:&SESSION.::&DEBUG.:153:P153_MES_INICIO,P153_MES_FINAL,P153_ANIO,P153_MONEDA,P153_EMPRESA:&P153_MES_INICIO.,&P153_MES_FINAL.,&P153_ANIO.,&P153_MONEDA.,&P153_EMPRESA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CARGAR_DATOS'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(216561953360949639)
,p_branch_name=>'DESCARGAR'
,p_branch_action=>'f?p=202:38:&SESSION.::&DEBUG.::P38_FILE_NAME,P38_ID_EN_REPOSITORIO:&P153_NOMBRE_ARCHIVO.,&P153_ID_REPOSITORIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DESCARGAR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195482864264362778)
,p_name=>'P153_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_prompt=>'Empresa'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_EMPRESA || '' - '' || SAF.FN_NOMBRE_EMPRESA(CODIGO_EMPRESA) AS NOMBRE,',
'	CODIGO_EMPRESA',
'FROM SAF.GRAL_EMPRESAS ',
'WHERE ID_GRUPO = 2',
'ORDER BY CODIGO_EMPRESA ASC;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195483283264362779)
,p_name=>'P153_MES_INICIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195483653530362779)
,p_name=>'P153_MES_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_prompt=>'Mes Final'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'GRAL_MESES'
,p_lov=>'.'||wwv_flow_imp.id(105398202110893169)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195484044090362780)
,p_name=>'P153_ANIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_item_default=>'TO_CHAR(SYSDATE, ''YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>unistr('A\00F1o')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    YEAR,',
'    YEAR ID',
'FROM',
'(',
'    SELECT ',
'        TO_CHAR(add_months(sysdate,-61) + (LEVEL-1)*365, ''YYYY'') AS YEAR',
'    FROM DUAL',
'    CONNECT BY LEVEL <= 11',
')'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195484416700362780)
,p_name=>'P153_VERSION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_item_default=>'2020'
,p_prompt=>'Version'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	DISTINCT',
'	VERSION,',
'	VERSION ID',
'FROM SAF.CON_CATCTAS',
'ORDER BY VERSION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195484829325362781)
,p_name=>'P153_MONEDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS',
'WHERE MONEDA_LOCAL IS NOT NULL'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	NOMBRE_MONEDA,',
'    CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS;'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195485224501362781)
,p_name=>'P153_ANIO_MENOS_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195485673197362782)
,p_name=>'P153_NOMBRE_TITULO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195485908807362782)
,p_name=>'P153_FECHA_TITULO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195486398939362783)
,p_name=>'P153_NOMBRE_MONEDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195486793048362783)
,p_name=>'P153_SIMBOLO_MONEDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1646898414645419934)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195487741766362785)
,p_name=>'P153_ID_NOTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1851939739281825098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195488193239362785)
,p_name=>'P153_ID_REGISTRO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1851939739281825098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195488555460362786)
,p_name=>'P153_TIPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1851939739281825098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195488953795362786)
,p_name=>'P153_URL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1851939739281825098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195502447376362816)
,p_name=>'P153_JASPER'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195502891729362817)
,p_name=>'P153_AUTENTICATION'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195503283794362818)
,p_name=>'P153_DIA_FIN'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195503625277362818)
,p_name=>'P153_CODIGO_USUARIO'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195504021332362819)
,p_name=>'P153_PERMISOS'
,p_item_sequence=>70
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216561772878949637)
,p_name=>'P153_NOMBRE_ARCHIVO'
,p_item_sequence=>80
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216561831930949638)
,p_name=>'P153_ID_REPOSITORIO'
,p_item_sequence=>90
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195507694728362827)
,p_name=>'DATOS_INICIO'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195508118248362827)
,p_event_id=>wwv_flow_imp.id(195507694728362827)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'BLOQUEAR CAMPOS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_VERSION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195508506172362828)
,p_name=>'EDITAR_NOTAS_ACTIVO'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#ACTIVO td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined &&',
'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0] != undefined'))
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195509026952362828)
,p_event_id=>wwv_flow_imp.id(195508506172362828)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID_NOTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_NOTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195509535595362829)
,p_event_id=>wwv_flow_imp.id(195508506172362828)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195510079988362830)
,p_event_id=>wwv_flow_imp.id(195508506172362828)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_TIPO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195510540362362830)
,p_event_id=>wwv_flow_imp.id(195508506172362828)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'EDITAR_NOTA_223'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA_223'
,p_attribute_02=>'SEP'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P153_TIPO'').getValue() == ''DETALLE'''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195510911371362830)
,p_name=>'EDITAR_NOTAS_PASIVO'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#PASIVO td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined &&',
'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0] != undefined'))
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195511490319362831)
,p_event_id=>wwv_flow_imp.id(195510911371362830)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID_NOTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_NOTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195511940715362832)
,p_event_id=>wwv_flow_imp.id(195510911371362830)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195512417777362832)
,p_event_id=>wwv_flow_imp.id(195510911371362830)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_TIPO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195512927041362833)
,p_event_id=>wwv_flow_imp.id(195510911371362830)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'EDITAR_NOTA_223'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA_223'
,p_attribute_02=>'SEP'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P153_TIPO'').getValue() == ''DETALLE'' /*&& $(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value != 25*/'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195513311339362833)
,p_name=>'EDITAR_NOTA'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P153_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'EDITAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195513894713362834)
,p_event_id=>wwv_flow_imp.id(195513311339362833)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID,P158_ID_ASOCIACION:''||',
'        :P153_ID_NOTA || '','' || :P153_ID_REGISTRO,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P153_URL',
'FROM DUAL;'))
,p_attribute_02=>'P153_ID_NOTA,P153_ID_REGISTRO'
,p_attribute_03=>'P153_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195514354299362834)
,p_event_id=>wwv_flow_imp.id(195513311339362833)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P153_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195514706695362835)
,p_name=>'CREAR_NOTA'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P153_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CREAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195515295271362835)
,p_event_id=>wwv_flow_imp.id(195514706695362835)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID_ASOCIACION,P158_CTA_VERSION:''|| :P153_ID_REGISTRO || '','' || :P153_VERSION,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P153_URL',
'FROM DUAL;'))
,p_attribute_02=>'P153_ID_REGISTRO,P153_VERSION'
,p_attribute_03=>'P153_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195515779364362836)
,p_event_id=>wwv_flow_imp.id(195514706695362835)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P153_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195516194517362836)
,p_name=>'REFRESH_REPORTE'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195516641850362837)
,p_event_id=>wwv_flow_imp.id(195516194517362836)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ACTIVOS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1851940853923825109)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195517125194362837)
,p_event_id=>wwv_flow_imp.id(195516194517362836)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'PASIVOS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1853359770517657384)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195517502708362838)
,p_name=>'ELIMINAR_NOTA'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P153_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ELIMINAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195518096898362838)
,p_event_id=>wwv_flow_imp.id(195517502708362838)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_ASIGNACION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*UPDATE SAF.PLANTILLA_ASIGNACION_NOTAS SET ',
'    ID_NOTA = NULL,',
'    USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'    FECHA_MODIFICACION = SYSDATE',
'WHERE ID = :P153_ID_REGISTRO',
'AND TIPO_REPORTE = 1;*/',
'',
'DELETE FROM SAF.ASOCIACION_PLANTILLA_NOTA_VERSION',
'WHERE ID_PLANTILLA = :P153_ID_REGISTRO',
'AND VERSION = :P153_VERSION;'))
,p_attribute_02=>'P153_ID_REGISTRO,P153_VERSION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195518564803362839)
,p_event_id=>wwv_flow_imp.id(195517502708362838)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_ASIGNACION'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_ID_NOTA,P153_ID_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195519079236362839)
,p_event_id=>wwv_flow_imp.id(195517502708362838)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ACTIVO'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1851940853923825109)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195519561907362840)
,p_event_id=>wwv_flow_imp.id(195517502708362838)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_PASIVO'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1853359770517657384)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195519957619362840)
,p_name=>'GENERAR_DATOS'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(195481699236362776)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P153_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P153_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P153_ANIO'').getValue() != '''' &&',
'apex.item(''P153_MONEDA'').getValue() != '''' &&',
'apex.item(''P153_EMPRESA'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195520401950362841)
,p_event_id=>wwv_flow_imp.id(195519957619362840)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DATOS_NO_COMPLETADOS'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Los campos requeridos no han sigo ingresados'
,p_attribute_02=>'Campos Requeridos'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195520903246362841)
,p_event_id=>wwv_flow_imp.id(195519957619362840)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR_DATOS'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195521305486362842)
,p_name=>'VER_NOTA'
,p_event_sequence=>100
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'VER_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195521819856362842)
,p_event_id=>wwv_flow_imp.id(195521305486362842)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P153_EMPRESA").getValue();',
'let mesInicio = apex.item("P153_MES_INICIO").getValue();',
'let mesFin = apex.item(''P153_MES_FINAL'').getValue();',
'let anio = apex.item(''P153_ANIO'').getValue();',
'let nota = apex.item(''P153_ID_REGISTRO'').getValue();',
'',
'var url = `f?p=&APP_ID.:156:&APP_SESSION.::NO:156:P156_EMPRESA,P156_FECHA_INICIO,P156_FECHA_FIN,P156_ANIO,P156_NOTA:${empresas},${mesInicio},${mesFin},${anio},${nota}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195522227098362843)
,p_name=>'ASOCIAR_NOTA'
,p_event_sequence=>110
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P153_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ASOCIAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195522741798362843)
,p_event_id=>wwv_flow_imp.id(195522227098362843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P153_ID_REGISTRO'').getValue();',
'let version = apex.item(''P153_VERSION'').getValue();',
'',
'var url = `f?p=&APP_ID.:168:&APP_SESSION.::NO:168:P168_NOTA,P168_VERSION:${nota},${version}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195523156214362844)
,p_name=>'MODIFICAR_RENGLON'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P153_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODIFICAR_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195523670161362844)
,p_event_id=>wwv_flow_imp.id(195523156214362844)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P153_ID_REGISTRO'').getValue();',
'',
'var url = `f?p=&APP_ID.:169:&APP_SESSION.::NO:169:P169_NOTA:${nota}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195524026696362845)
,p_name=>'IMPRIMIR_REPORTE'
,p_event_sequence=>130
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P153_EMPRESA'').getValue() != '''' &&',
'apex.item(''P153_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P153_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P153_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_REPORTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195524577585362845)
,p_event_id=>wwv_flow_imp.id(195524026696362845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/Balance_Situacion_Financiera.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P153_JASPER,:P153_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P153_JASPER,P153_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195525063561362846)
,p_event_id=>wwv_flow_imp.id(195524026696362845)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DATOS_NO_COMPLETADOS'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Los campos requeridos no han sigo ingresados'
,p_attribute_02=>'Campos Requeridos'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195525593752362846)
,p_event_id=>wwv_flow_imp.id(195524026696362845)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P153_JASPER" ).getValue() +',
'    "&P_EMPRESA="+ apex.item( "P153_EMPRESA" ).getValue() +',
'    "&FECHA_FIN=" + apex.item( "P153_DIA_FIN" ).getValue() +',
'    "&MES_FIN="+ apex.item( "P153_MES_FINAL" ).getValue() +',
'    "&ANIO=" + apex.item( "P153_ANIO" ).getValue() +',
'    "&P_VERSION=" + apex.item( "P153_VERSION" ).getValue() +',
'    "&P_VERSION_CTA=" + apex.item( "P153_VERSION" ).getValue() +',
'    apex.item( "P153_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195525955376362846)
,p_name=>'CALCULAR_DIA_FIN'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P153_MES_FINAL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195526423966362847)
,p_event_id=>wwv_flow_imp.id(195525955376362846)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DIA'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'SELECT TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P153_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'') INTO :P153_DIA_FIN FROM DUAL;'
,p_attribute_02=>'P153_MES_FINAL'
,p_attribute_03=>'P153_DIA_FIN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195526893026362847)
,p_name=>'IMPRIMIR_NOTAS'
,p_event_sequence=>150
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P153_EMPRESA'').getValue() != '''' &&',
'apex.item(''P153_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P153_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P153_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_NOTAS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195527328999362847)
,p_event_id=>wwv_flow_imp.id(195526893026362847)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_NOTAS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_NOTAS IS',
'        SELECT',
'            C001 AS NOTA,',
'            C002 AS ID,',
'            C003 AS ID_PADRE,',
'            C004 AS NUMERO,',
'            C005 AS NOMBRE,',
'            TO_NUMBER(C006) AS SALDO_1,',
'            TO_NUMBER(C007) AS SALDO_2,',
'            TO_NUMBER(C008) AS ORDER_1,',
'            TO_NUMBER(C009) AS ORDER_2,',
'            TO_NUMBER(C010) AS ORDER_3,',
'            C011 AS TIPO,',
'            LEVEL NIVEL',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'        START WITH C003 IS NULL ',
'        CONNECT BY PRIOR C002 = C003',
'        ORDER SIBLINGS BY (C008), (C009);',
'BEGIN',
'    DELETE FROM SAF.CON_NOTAS_DETALLE_JASPER WHERE TIPO_REPORTE = 1 AND USUARIO_GRABACION = :GLOBAL_CODIGO_USUARIO;',
'    COMMIT;',
'    FOR R_NOTAS IN C_NOTAS',
'    LOOP',
'        INSERT INTO SAF.CON_NOTAS_DETALLE_JASPER',
'            (',
'                NOTA, ',
'                CODIGO_ID, ',
'                CODIGO_ID_PADRE, ',
'                NOMBRE, ',
'                SALDO_1, ',
'                SALDO_2, ',
'                ORDEN_1, ',
'                ORDEN_2, ',
'                ORDEN_3,',
'                TIPO,',
'                NIVEL,',
'                TIPO_REPORTE,',
'                USUARIO_GRABACION,',
'                FECHA_GRABACION',
'            )',
'        VALUES',
'            (',
'                R_NOTAS.NOTA,',
'                R_NOTAS.ID,',
'                R_NOTAS.ID_PADRE,',
'                R_NOTAS.NOMBRE,',
'                R_NOTAS.SALDO_1,',
'                R_NOTAS.SALDO_2,',
'                R_NOTAS.ORDER_1,',
'                R_NOTAS.ORDER_2,',
'                R_NOTAS.ORDER_3,',
'                R_NOTAS.TIPO,',
'                R_NOTAS.NIVEL,',
'                1,',
'                :GLOBAL_CODIGO_USUARIO,',
'                SYSDATE',
'            );',
'    END LOOP;',
'END;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195527833015362848)
,p_event_id=>wwv_flow_imp.id(195526893026362847)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DATOS_NO_COMPLETADOS'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Los campos requeridos no han sigo ingresados'
,p_attribute_02=>'Campos Requeridos'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195528346183362848)
,p_event_id=>wwv_flow_imp.id(195526893026362847)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/Balance_Situacion_Financiera_Notas.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P153_JASPER,:P153_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P153_JASPER,P153_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195528892638362848)
,p_event_id=>wwv_flow_imp.id(195526893026362847)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_USUARIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_CODIGO_USUARIO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':GLOBAL_CODIGO_USUARIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195529379454362849)
,p_event_id=>wwv_flow_imp.id(195526893026362847)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P153_JASPER" ).getValue() +',
'    "&P_CODIGO_EMPRESA="+ apex.item( "P153_EMPRESA" ).getValue() +',
'    "&P_FECHA_INICIO=" + apex.item( "P153_DIA_FIN" ).getValue() +',
'    "&P_MES_INICIO="+ apex.item( "P153_MES_FINAL" ).getValue() +',
'    "&P_ANIO=" + apex.item( "P153_ANIO" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P153_CODIGO_USUARIO" ).getValue() +',
'    "&P_TIPO_PARAMETRO=" + "1" +',
'    apex.item( "P153_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195731824632568512)
,p_name=>'CARGAR_DATO_UNITARIO'
,p_event_sequence=>160
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CARGAR_DATO_UNITARIO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195732042989568514)
,p_event_id=>wwv_flow_imp.id(195731824632568512)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:165:&APP_SESSION.::NO:165:P165_REGISTRO,P165_ANIO,P165_ANIO_1,P165_MES_INICIO,P165_MES_FIN,P165_TIPO_REPORTE,P165_EMPRESA:''',
'        || :P153_ID_REGISTRO || '','' || :P153_ANIO || '','' ',
'        || :P153_ANIO_MENOS_1 || '',1,'' || :P153_MES_FINAL || '',1,'' || :P153_EMPRESA,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P153_URL',
'FROM DUAL;'))
,p_attribute_02=>'P153_ID_REGISTRO,P153_ANIO,P153_ANIO_MENOS_1,P153_MES_FINAL,P153_EMPRESA'
,p_attribute_03=>'P153_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195732188754568515)
,p_event_id=>wwv_flow_imp.id(195731824632568512)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P153_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(197235566526878831)
,p_name=>'SUBIR_PLANTILLA'
,p_event_sequence=>170
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'SUBIR_PLANTILLA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197235865006878834)
,p_event_id=>wwv_flow_imp.id(197235566526878831)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresa = apex.item(''P153_EMPRESA'').getValue();',
'',
'var url = `f?p=&APP_ID.:159:&APP_SESSION.::NO:159:P159_TIPO_REPORTE,P159_EMPRESA:1,${empresa}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        apex.navigation.redirect(pData.url);',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(216562034331949640)
,p_name=>'DESCARGAR_PLANTILLA'
,p_event_sequence=>180
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'DESCARGAR_PLANTILLA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216562100575949641)
,p_event_id=>wwv_flow_imp.id(216562034331949640)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_NOMBRE_ARCHIVO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'PLANTILLA - Balance de Situacion Financiera.xlsx'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216562227717949642)
,p_event_id=>wwv_flow_imp.id(216562034331949640)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P153_ID_REPOSITORIO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0000002295'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216562373196949643)
,p_event_id=>wwv_flow_imp.id(216562034331949640)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DESCARGAR'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(195504417239362819)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'COLLECTIONS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''COLLECTION_INFORME'') THEN',
'	APEX_COLLECTION.CREATE_COLLECTION(''COLLECTION_INFORME'');',
'ELSE',
'	APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_INFORME'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(195507281195362826)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_PERMISOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_PERMISOS IS',
'        SELECT',
'            CODIGO_USUARIO',
'        FROM GRAL_REGISTROS_PERMISOS_USUARIOS',
'        WHERE TABLE_NAME = ''PLANTILLA_ASIGNACION_NOTAS'';',
'BEGIN',
'    :P153_PERMISOS := 0;',
'    --:P153_EMPRESA := 0;',
'    ',
'    FOR R_PERMISOS IN C_PERMISOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_USUARIOS IS',
'                SELECT',
'                    COUNT(*)',
'                FROM SAF.GRAL_USUARIOS_ROLES',
'                WHERE CODIGO_USUARIO = :GLOBAL_CODIGO_USUARIO',
'                AND CODIGO_ROLE = R_PERMISOS.CODIGO_USUARIO;',
'',
'            V_PERMISO NUMBER := 0;',
'        BEGIN',
'            OPEN C_USUARIOS;',
'                FETCH C_USUARIOS INTO V_PERMISO;',
'            CLOSE C_USUARIOS;',
'',
'            IF NVL(V_PERMISO, 0) > 0 THEN',
'                :P153_PERMISOS := 1;',
'            END IF;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(195506830184362825)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARAMETOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NOMBRE_MONEDA,',
'    SIMBOLO_MONEDA',
'    INTO ',
'    :P153_NOMBRE_MONEDA,',
'    :P153_SIMBOLO_MONEDA',
'FROM SAF.GRAL_MONEDAS',
'WHERE CODIGO_MONEDA = :P153_MONEDA;',
'',
':P153_ANIO_MENOS_1:= TO_NUMBER(:P153_ANIO) - 1;',
'',
':P153_NOMBRE_TITULO := SAF.FN_NOMBRE_EMPRESA(:P153_EMPRESA);',
'',
':P153_FECHA_TITULO := ''Al '' ',
'    || TO_CHAR(LAST_DAY(TO_DATE(''01/''||:P153_MES_FINAL||''/''||:P153_ANIO_MENOS_1,''DD/MM/YYYY'')), ''DD'')',
'    || '' de '' || TO_CHAR(TO_DATE(:P153_MES_FINAL, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' de '' || :P153_ANIO || '' y '' || :P153_ANIO_MENOS_1;',
'',
':P153_DIA_FIN := TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P153_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'');'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P153_MES_INICIO IS NOT NULL AND',
':P153_MES_FINAL IS NOT NULL AND',
':P153_ANIO IS NOT NULL AND',
':P153_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(195506081885362823)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREPARE_URL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   result varchar2(32767);',
'begin',
'   result:=apex_util.prepare_url(',
'       p_url => apex_application.g_x01,',
'       p_triggering_element => ''document''',
'       );',
'   apex_json.open_object;',
'   apex_json.write(''success'', true);',
'   apex_json.write(''url'', result);',
'   apex_json.close_object;',
'exception',
' when others then',
'   apex_json.open_object;',
'   apex_json.write(''success'', false);',
'   apex_json.write(''message'', sqlerrm);',
'   apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
