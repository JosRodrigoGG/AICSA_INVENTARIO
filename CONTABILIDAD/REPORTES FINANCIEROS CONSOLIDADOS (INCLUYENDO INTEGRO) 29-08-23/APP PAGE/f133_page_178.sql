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
--   Date and Time:   17:02 Tuesday August 29, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 178
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00178
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>178);
end;
/
prompt --application/pages/page_00178
begin
wwv_flow_imp_page.create_page(
 p_id=>178
,p_name=>'PRESTAMOS_BANCARIOS_INTEGRO'
,p_alias=>'PRESTAMOS-BANCARIOS-INTEGRO'
,p_step_title=>'Planilla Prestamos Bancarios'
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
'#ACTIVO th#ANIO_2, #ACTIVO td[headers=ANIO_2]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#ACTIVO th#ID_NOTA, #ACTIVO td[headers=ID_NOTA]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#ACTIVO th#BOTON, #ACTIVO td[headers=BOTON]',
'{',
'    width: 80px !important;',
'    min-width: 80px !important;',
'    max-width: 80px !important;',
'}',
'',
'#ACTIVO th#NOMBRE, #ACTIVO td[headers=NOMBRE]',
'{',
'    width: 400px !important;',
'    min-width: 400px !important;',
'    max-width: 400px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230810095044'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(213171665222476150)
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
 p_id=>wwv_flow_imp.id(2072463135946186588)
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
 p_id=>wwv_flow_imp.id(2137331957791455689)
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
 p_id=>wwv_flow_imp.id(2277504460582591752)
,p_plug_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P178_EMPRESA IS NOT NULL AND',
':P178_MES_INICIO IS NOT NULL AND',
':P178_MES_FINAL IS NOT NULL AND',
':P178_ANIO IS NOT NULL AND',
'--:P178_VERSION IS NOT NULL AND',
':P178_MONEDA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2103556292725794823)
,p_plug_name=>'TITULO_REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(2277504460582591752)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:center;">&P178_NOMBRE_TITULO.</h4>',
'<h5 style="text-align:center;">Prestamos Bancarios</h5>',
'<h5 style="text-align:center;">&P178_FECHA_TITULO.</h5>',
'<h5 style="text-align:center;">(Cifras Expresadas en &P178_NOMBRE_MONEDA.)</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2277504712936591754)
,p_plug_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(2277504460582591752)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>8
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2277505575224591763)
,p_plug_name=>'Activo'
,p_region_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(2277504712936591754)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    A.ID,',
'    NULL ID_NOTA,',
'    A.NOMBRE AS NOMBRE,',
'    A.COD_CTA,',
'    A.ORDEN_1,',
'    A.ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'	NULL ANIO_2,',
'    ''DETALLE'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    B.ID_NOTA ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P178_VERSION',
'LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'WHERE A.ORDEN_1 = ''Corriente''',
'AND A.TIPO_REPORTE = 5',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    (',
'    	(SELECT',
'    		BB.CONCEPTO',
'		FROM SAF.REPORTES_FINANCIEROS_INTEGRO BB',
'		WHERE BB.NUMERO_PRESTAMO = A.NUMERO_PRESTAMO',
'		AND BB.ID = (SELECT MAX(CC.ID) FROM SAF.REPORTES_FINANCIEROS_INTEGRO CC WHERE CC.NUMERO_PRESTAMO = A.NUMERO_PRESTAMO AND CC.ID_PLANTILLA_NOTA = A.ID_PLANTILLA_NOTA))',
'    ) NOMBRE,',
'    A.NUMERO_PRESTAMO COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P178_ANIO THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P178_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ) ANIO_1,',
'    SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P178_ANIO_MENOS_1 THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P178_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ) ANIO_2,',
'    ''DETALLE_PRESTAMO'' AS TIPO,',
'    NULL CLASE,',
'    A.ID_PLANTILLA_NOTA ID_NOTA_NUM,',
'    :P178_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.REPORTES_FINANCIEROS_INTEGRO A',
'WHERE A.TIPO_REPORTE = 5',
'AND A.ID_PLANTILLA_NOTA = 283',
'AND (A.ANIO = :P178_ANIO OR A.ANIO = :P178_ANIO_MENOS_1)',
'AND A.MES_INICIO = 1',
'AND A.MES_FIN = :P178_MES_FINAL',
'AND A.CODIGO_EMPRESA = :P178_EMPRESA',
'GROUP BY A.NUMERO_PRESTAMO, A.ID_PLANTILLA_NOTA',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    (',
'    	''&emsp;'' || ''Total '' || B.NOMBRE',
'    ) NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL(SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P178_ANIO THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P178_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ), 0) ANIO_1,',
'    NVL(SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P178_ANIO_MENOS_1 THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P178_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ), 0) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P178_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS B',
'LEFT JOIN SAF.REPORTES_FINANCIEROS_INTEGRO A ON B.ID = A.ID_PLANTILLA_NOTA',
'WHERE A.TIPO_REPORTE = 5',
'AND B.ID = 283',
'AND (A.ANIO = :P178_ANIO OR A.ANIO = :P178_ANIO_MENOS_1)',
'AND A.MES_INICIO = 1',
'AND A.MES_FIN = :P178_MES_FINAL',
'AND A.CODIGO_EMPRESA = :P178_EMPRESA',
'GROUP BY B.NOMBRE',
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
'    A.ID,',
'    (',
'        CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'            NULL',
'        ELSE',
'            NULL',
'        END',
'    ) ID_NOTA,',
'    A.NOMBRE AS NOMBRE,',
'    A.COD_CTA,',
'    A.ORDEN_1,',
'    A.ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'	NULL ANIO_2,',
'    ''DETALLE'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    B.ID_NOTA ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P178_VERSION',
'LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'WHERE A.ORDEN_1 = ''No Corriente''',
'AND A.TIPO_REPORTE = 5',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    (',
'    	(SELECT',
'    		BB.CONCEPTO',
'		FROM SAF.REPORTES_FINANCIEROS_INTEGRO BB',
'		WHERE BB.NUMERO_PRESTAMO = A.NUMERO_PRESTAMO',
'		AND BB.ID = (SELECT MAX(CC.ID) FROM SAF.REPORTES_FINANCIEROS_INTEGRO CC WHERE CC.NUMERO_PRESTAMO = A.NUMERO_PRESTAMO AND CC.ID_PLANTILLA_NOTA = A.ID_PLANTILLA_NOTA))',
'    ) NOMBRE,',
'    A.NUMERO_PRESTAMO COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P178_ANIO THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P178_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ) ANIO_1,',
'    SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P178_ANIO_MENOS_1 THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P178_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ) ANIO_2,',
'    ''DETALLE_PRESTAMO'' AS TIPO,',
'    NULL CLASE,',
'    A.ID_PLANTILLA_NOTA ID_NOTA_NUM,',
'    :P178_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.REPORTES_FINANCIEROS_INTEGRO A',
'WHERE A.TIPO_REPORTE = 5',
'AND A.ID_PLANTILLA_NOTA = 284',
'AND (A.ANIO = :P178_ANIO OR A.ANIO = :P178_ANIO_MENOS_1)',
'AND A.MES_INICIO = 1',
'AND A.MES_FIN = :P178_MES_FINAL',
'AND A.CODIGO_EMPRESA = :P178_EMPRESA',
'GROUP BY A.NUMERO_PRESTAMO, A.ID_PLANTILLA_NOTA',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    (',
'    	''&emsp;'' || ''Total '' || B.NOMBRE',
'    ) NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL(SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P178_ANIO THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P178_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ), 0) ANIO_1,',
'    NVL(SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P178_ANIO_MENOS_1 THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P178_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ), 0) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P178_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS B',
'LEFT JOIN SAF.REPORTES_FINANCIEROS_INTEGRO A ON B.ID = A.ID_PLANTILLA_NOTA',
'WHERE A.TIPO_REPORTE = 5',
'AND B.ID = 284',
'AND (A.ANIO = :P178_ANIO OR A.ANIO = :P178_ANIO_MENOS_1)',
'AND A.MES_INICIO = 1',
'AND A.MES_FIN = :P178_MES_FINAL',
'AND A.CODIGO_EMPRESA = :P178_EMPRESA',
'GROUP BY B.NOMBRE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P178_ANIO,P178_MES_FINAL,P178_VERSION,P178_SIMBOLO_MONEDA,P178_MONEDA,P178_MES_INICIO,P178_ANIO_MENOS_1,P178_VECTOR_EMPRESA,P178_EMPRESA'
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
 p_id=>wwv_flow_imp.id(2277505675619591764)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>2277505675619591764
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213340950144788658)
,p_db_column_name=>'NOMBRE'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Descripcion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="padding-left:0; display:inline-block; white-space:nowrap; width:calc(100%); overflow: hidden; white-space: normal; #CLASE#">  ',
'    #NOMBRE#',
'</span>',
'',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="ID_NOTA" type="hidden" value="#ID_NOTA_NUM#">',
'<input id="TIPO" type="hidden" value="#TIPO#">',
'<input id="COD_CTA" type="hidden" value="#COD_CTA#">'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'NOMBRE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213341360676788658)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213341761297788659)
,p_db_column_name=>'COD_CTA'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Cod Cta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213342110541788660)
,p_db_column_name=>'ORDEN_1'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Orden 1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213342581323788660)
,p_db_column_name=>'ORDEN_2'
,p_display_order=>60
,p_column_identifier=>'L'
,p_column_label=>'Orden 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213342916717788661)
,p_db_column_name=>'ANIO_1'
,p_display_order=>80
,p_column_identifier=>'T'
,p_column_label=>'&P178_ANIO.'
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
 p_id=>wwv_flow_imp.id(213343372231788661)
,p_db_column_name=>'ANIO_2'
,p_display_order=>90
,p_column_identifier=>'U'
,p_column_label=>'&P178_ANIO_MENOS_1.'
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
 p_id=>wwv_flow_imp.id(213343792016788662)
,p_db_column_name=>'TIPO'
,p_display_order=>100
,p_column_identifier=>'V'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213344178700788662)
,p_db_column_name=>'CLASE'
,p_display_order=>110
,p_column_identifier=>'W'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213344522683788663)
,p_db_column_name=>'ID_NOTA_NUM'
,p_display_order=>120
,p_column_identifier=>'X'
,p_column_label=>'Id Nota Num'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213340528689788657)
,p_db_column_name=>'ID_NOTA'
,p_display_order=>130
,p_column_identifier=>'Y'
,p_column_label=>'Nota'
,p_column_type=>'STRING'
,p_static_id=>'ID_NOTA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213340194250788657)
,p_db_column_name=>'BOTON'
,p_display_order=>140
,p_column_identifier=>'AA'
,p_column_label=>'Boton'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213339793167788656)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>150
,p_column_identifier=>'AB'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2278097956363909999)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'1834497'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:ID_NOTA:ANIO_1:ANIO_2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(213330609668788642)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(2072463135946186588)
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
 p_id=>wwv_flow_imp.id(213171511812476149)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(2072463135946186588)
,p_button_name=>'CARGAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
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
 p_id=>wwv_flow_imp.id(213331086217788643)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(2072463135946186588)
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
 p_id=>wwv_flow_imp.id(213370985729788688)
,p_branch_name=>'CARGAR_DATOS'
,p_branch_action=>'f?p=&APP_ID.:178:&SESSION.::&DEBUG.:178:P178_MES_INICIO,P178_MES_FINAL,P178_ANIO,P178_MONEDA,P178_EMPRESA,P178_VECTOR_EMPRESA:&P178_MES_INICIO.,&P178_MES_FINAL.,&P178_ANIO.,&P178_MONEDA.,&P178_EMPRESA.,&P178_VECTOR_EMPRESA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CARGAR_DATOS'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(224055257131771807)
,p_branch_name=>'DESCARGAR'
,p_branch_action=>'f?p=202:38:&SESSION.::&DEBUG.::P38_FILE_NAME,P38_ID_EN_REPOSITORIO:&P178_NOMBRE_ARCHIVO.,&P178_ID_REPOSITORIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DESCARGAR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213331490757788643)
,p_name=>'P178_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
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
 p_id=>wwv_flow_imp.id(213331838806788644)
,p_name=>'P178_MES_INICIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213332210024788645)
,p_name=>'P178_MES_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
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
 p_id=>wwv_flow_imp.id(213332685649788645)
,p_name=>'P178_ANIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
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
 p_id=>wwv_flow_imp.id(213333060110788646)
,p_name=>'P178_VERSION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
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
 p_id=>wwv_flow_imp.id(213333412899788646)
,p_name=>'P178_MONEDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
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
 p_id=>wwv_flow_imp.id(213333821409788646)
,p_name=>'P178_ANIO_MENOS_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213334230462788647)
,p_name=>'P178_NOMBRE_TITULO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213334688379788647)
,p_name=>'P178_FECHA_TITULO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213335037933788648)
,p_name=>'P178_NOMBRE_MONEDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213335433233788648)
,p_name=>'P178_SIMBOLO_MONEDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213335851596788648)
,p_name=>'P178_VECTOR_EMPRESA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(2072463135946186588)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213336892740788650)
,p_name=>'P178_ID_NOTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2277504460582591752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213337252104788650)
,p_name=>'P178_ID_REGISTRO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2277504460582591752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213337690226788651)
,p_name=>'P178_TIPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2277504460582591752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213338080892788651)
,p_name=>'P178_URL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2277504460582591752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213338434413788652)
,p_name=>'P178_COD_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2277504460582591752)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213345285395788665)
,p_name=>'P178_JASPER'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213345616932788665)
,p_name=>'P178_AUTENTICATION'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213346088250788666)
,p_name=>'P178_DIA_FIN'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213346498997788666)
,p_name=>'P178_CODIGO_USUARIO'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213346821233788666)
,p_name=>'P178_PERMISOS'
,p_item_sequence=>70
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(224054881261771803)
,p_name=>'P178_NOMBRE_ARCHIVO'
,p_item_sequence=>80
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(224054906746771804)
,p_name=>'P178_ID_REPOSITORIO'
,p_item_sequence=>90
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213367491906788686)
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
 p_id=>wwv_flow_imp.id(213369471647788687)
,p_event_id=>wwv_flow_imp.id(213367491906788686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID_NOTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_NOTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213369932958788688)
,p_event_id=>wwv_flow_imp.id(213367491906788686)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213370481212788688)
,p_event_id=>wwv_flow_imp.id(213367491906788686)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_TIPO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213368438669788686)
,p_event_id=>wwv_flow_imp.id(213367491906788686)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'COD_CTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_COD_CTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=COD_CTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213368918664788687)
,p_event_id=>wwv_flow_imp.id(213367491906788686)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA_223'
,p_attribute_02=>'SEP'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P178_TIPO'').getValue() == ''DETALLE'''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213170327900476137)
,p_event_id=>wwv_flow_imp.id(213367491906788686)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA_DETALLE'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA_223'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "CARGAR_DATO": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return false;',
'        }',
'    },',
'    "MODIFICAR_NOMBRE": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P178_TIPO'').getValue() == ''DETALLE_PRESTAMO'''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213349296468788670)
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
 p_id=>wwv_flow_imp.id(213351283018788672)
,p_event_id=>wwv_flow_imp.id(213349296468788670)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID_NOTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_NOTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213349774614788670)
,p_event_id=>wwv_flow_imp.id(213349296468788670)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213350261930788671)
,p_event_id=>wwv_flow_imp.id(213349296468788670)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_TIPO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213350754032788672)
,p_event_id=>wwv_flow_imp.id(213349296468788670)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "EDITAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P178_ID_NOTA'').getValue() != '''' && apex.item(''P178_ID_REGISTRO'').getValue() != ''25'') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "VER_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P178_ID_NOTA'').getValue() != '''' && apex.item(''P178_ID_REGISTRO'').getValue() != ''25'') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "CREAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P178_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                if (apex.item(''P178_ID_REGISTRO'').getValue() == ''25'') {',
'                    return true;',
'                } else {',
'                    return false;',
'                }',
'            }',
'        }',
'    },',
'    "ELIMINAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P178_ID_NOTA'').getValue() != '''' && apex.item(''P178_ID_REGISTRO'').getValue() != ''25'') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "ASOCIAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P178_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                if (apex.item(''P178_ID_REGISTRO'').getValue() == ''25'') {',
'                    return true;',
'                } else {',
'                    return false;',
'                }',
'            }',
'        }',
'    }',
'};'))
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P178_TIPO'').getValue() == ''DETALLE'' /*&& $(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value != 25*/'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213351602323788672)
,p_name=>'EDITAR_NOTA'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P178_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'EDITAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213352188637788673)
,p_event_id=>wwv_flow_imp.id(213351602323788672)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID,P158_ID_ASOCIACION:''||',
'        :P178_ID_NOTA || '','' || :P178_ID_REGISTRO,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P178_URL',
'FROM DUAL;'))
,p_attribute_02=>'P178_ID_NOTA,P178_ID_REGISTRO'
,p_attribute_03=>'P178_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213352605683788673)
,p_event_id=>wwv_flow_imp.id(213351602323788672)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P178_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213353068794788674)
,p_name=>'CREAR_NOTA'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P178_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CREAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213353582266788674)
,p_event_id=>wwv_flow_imp.id(213353068794788674)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID_ASOCIACION,P158_CTA_VERSION:''|| :P178_ID_REGISTRO || '','' || :P178_VERSION,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P178_URL',
'FROM DUAL;'))
,p_attribute_02=>'P178_ID_REGISTRO,P178_VERSION'
,p_attribute_03=>'P178_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213354084122788675)
,p_event_id=>wwv_flow_imp.id(213353068794788674)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P178_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213354475163788675)
,p_name=>'REFRESH_REPORTE'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213354911956788675)
,p_event_id=>wwv_flow_imp.id(213354475163788675)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ACTIVOS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2277505575224591763)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213355341139788676)
,p_name=>'ELIMINAR_NOTA'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P178_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ELIMINAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213355818964788676)
,p_event_id=>wwv_flow_imp.id(213355341139788676)
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
'WHERE ID = :P178_ID_REGISTRO',
'AND TIPO_REPORTE = 1;*/',
'',
'DELETE FROM SAF.ASOCIACION_PLANTILLA_NOTA_VERSION',
'WHERE ID_PLANTILLA = :P178_ID_REGISTRO',
'AND VERSION = :P178_VERSION;'))
,p_attribute_02=>'P178_ID_REGISTRO,P178_VERSION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213356340262788677)
,p_event_id=>wwv_flow_imp.id(213355341139788676)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_ASIGNACION'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_ID_NOTA,P178_ID_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213356812195788677)
,p_event_id=>wwv_flow_imp.id(213355341139788676)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ACTIVO'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2277505575224591763)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213357274954788677)
,p_name=>'GENERAR_DATOS'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(213330609668788642)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P178_EMPRESA'').getValue() != '''' &&',
'apex.item(''P178_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P178_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P178_ANIO'').getValue() != '''' &&',
'//apex.item(''P178_VERSION'').getValue() != '''' &&',
'apex.item(''P178_MONEDA'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213357741786788678)
,p_event_id=>wwv_flow_imp.id(213357274954788677)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR VECTOR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VECTOR IS',
'        SELECT',
'            COUNT(*) CONTADOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P178_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P178_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        )',
'        WHERE TO_NUMBER(CODIGO_DIVISION) = 0; ',
'    ',
'    V_CONTADOR NUMBER := 0;',
'    V_VECTOR VARCHAR2(1124);',
'BEGIN',
'    OPEN C_VECTOR;',
'        FETCH C_VECTOR INTO V_CONTADOR;',
'    CLOSE C_VECTOR;',
'',
'    IF V_CONTADOR = 0 THEN',
'        SELECT',
'            LISTAGG(CODIGO_DIVISION, '':'') INTO V_VECTOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P178_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P178_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        );',
'    ELSE',
'        SELECT',
'	        LISTAGG(DISTINCT CODIGO_EMPRESA, '':'') INTO V_VECTOR',
'        FROM',
'        (',
'        Select codigo_empresa||'' - ''||nvl(Nombre_Persona,Razon_Social) nombre, codigo_empresa',
'          FROM Gral_personas_Table e, gral_empresas p',
'         Where e.codigo_persona = p.codigo_persona',
'           And p.Codigo_Empresa in',
'               (Select a.Codigo_Empresa',
'                  From Gral_Empresas_Usuarios a,',
'                       Gral_Empresas          b,',
'                       Gral_Personas_Table    c',
'                 Where upper(globalfunc.Fnc_NUsuario(Codigo_Usuario)) = upper(NVL(V(''APP_USER''),user))',
'                   And a.Codigo_Empresa = b.Codigo_Empresa',
'                   And b.Codigo_Persona = c.Codigo_Persona)',
'                   ',
'           And p.Codigo_Estado in (Select Codigo_Estatus',
'                                    From Gral_Estatus_Modulos',
'                                   Where Codigo_Modulo = 1',
'                                     And Permite_Movtos = ''S'')    ',
'         Order by p.codigo_empresa',
'         );',
'    END IF;',
'',
'    :P178_VECTOR_EMPRESA := V_VECTOR;',
'END;'))
,p_attribute_02=>'P178_EMPRESA'
,p_attribute_03=>'P178_VECTOR_EMPRESA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213358279937788679)
,p_event_id=>wwv_flow_imp.id(213357274954788677)
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
 p_id=>wwv_flow_imp.id(213358799756788679)
,p_event_id=>wwv_flow_imp.id(213357274954788677)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR_DATOS'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213359103444788679)
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
 p_id=>wwv_flow_imp.id(213359611774788680)
,p_event_id=>wwv_flow_imp.id(213359103444788679)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let mesInicio = apex.item("P178_MES_INICIO").getValue();',
'let mesFin = apex.item(''P178_MES_FINAL'').getValue();',
'let anio = apex.item(''P178_ANIO'').getValue();',
'let nota = apex.item(''P178_ID_REGISTRO'').getValue();',
'let moneda = apex.item(''P178_MONEDA'').getValue();',
'let version = apex.item(''P178_VERSION'').getValue();',
'let cod_cta = apex.item(''P178_COD_CTA'').getValue();',
'let vector = apex.item(''P178_VECTOR_EMPRESA'').getValue();',
'',
'var url = `f?p=&APP_ID.:176:&APP_SESSION.::NO:176:P176_MONEDA,P176_FECHA_INICIO,P176_FECHA_FIN,P176_ANIO,P176_NOTA,P176_VERSION,P176_COD_CTA,P176_EMPRESA:${moneda},${mesInicio},${mesFin},${anio},${nota},${version},${cod_cta},${vector}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        //console.log(pData.url);',
'        apex.navigation.redirect(pData.url);',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213360083011788680)
,p_name=>'ASOCIAR_NOTA'
,p_event_sequence=>110
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P178_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ASOCIAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213360596519788681)
,p_event_id=>wwv_flow_imp.id(213360083011788680)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P178_ID_REGISTRO'').getValue();',
'let version = apex.item(''P178_VERSION'').getValue();',
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
 p_id=>wwv_flow_imp.id(213360965375788681)
,p_name=>'MODIFICAR_RENGLON'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P178_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODIFICAR_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213361483735788681)
,p_event_id=>wwv_flow_imp.id(213360965375788681)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P178_ID_REGISTRO'').getValue();',
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213361848798788682)
,p_name=>'IMPRIMIR_REPORTE'
,p_event_sequence=>130
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P178_EMPRESA'').getValue() != '''' &&',
'apex.item(''P178_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P178_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P178_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_REPORTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213362280614788682)
,p_event_id=>wwv_flow_imp.id(213361848798788682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/Balance_Situacion_Financiera.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P178_JASPER,:P178_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P178_JASPER,P178_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213362763864788682)
,p_event_id=>wwv_flow_imp.id(213361848798788682)
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
 p_id=>wwv_flow_imp.id(213363245543788683)
,p_event_id=>wwv_flow_imp.id(213361848798788682)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P178_JASPER" ).getValue() +',
'    "&P_EMPRESA="+ apex.item( "P178_EMPRESA" ).getValue() +',
'    "&FECHA_FIN=" + apex.item( "P178_DIA_FIN" ).getValue() +',
'    "&MES_FIN="+ apex.item( "P178_MES_FINAL" ).getValue() +',
'    "&ANIO=" + apex.item( "P178_ANIO" ).getValue() +',
'    "&P_VERSION=" + apex.item( "P178_VERSION" ).getValue() +',
'    "&P_VERSION_CTA=" + apex.item( "P178_VERSION" ).getValue() +',
'    apex.item( "P178_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213363618312788683)
,p_name=>'CALCULAR_DIA_FIN'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P178_MES_FINAL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213364177197788683)
,p_event_id=>wwv_flow_imp.id(213363618312788683)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DIA'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'SELECT TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P178_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'') INTO :P178_DIA_FIN FROM DUAL;'
,p_attribute_02=>'P178_MES_FINAL'
,p_attribute_03=>'P178_DIA_FIN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213364568618788684)
,p_name=>'IMPRIMIR_NOTAS'
,p_event_sequence=>150
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P178_EMPRESA'').getValue() != '''' &&',
'apex.item(''P178_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P178_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P178_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_NOTAS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213365083787788684)
,p_event_id=>wwv_flow_imp.id(213364568618788684)
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
 p_id=>wwv_flow_imp.id(213365597844788684)
,p_event_id=>wwv_flow_imp.id(213364568618788684)
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
 p_id=>wwv_flow_imp.id(213366036205788685)
,p_event_id=>wwv_flow_imp.id(213364568618788684)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/Balance_Situacion_Financiera_Notas.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P178_JASPER,:P178_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P178_JASPER,P178_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213366522007788685)
,p_event_id=>wwv_flow_imp.id(213364568618788684)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_USUARIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_CODIGO_USUARIO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':GLOBAL_CODIGO_USUARIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213367000187788685)
,p_event_id=>wwv_flow_imp.id(213364568618788684)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P178_JASPER" ).getValue() +',
'    "&P_CODIGO_EMPRESA="+ apex.item( "P178_EMPRESA" ).getValue() +',
'    "&P_FECHA_INICIO=" + apex.item( "P178_DIA_FIN" ).getValue() +',
'    "&P_MES_INICIO="+ apex.item( "P178_MES_FINAL" ).getValue() +',
'    "&P_ANIO=" + apex.item( "P178_ANIO" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P178_CODIGO_USUARIO" ).getValue() +',
'    "&P_TIPO_PARAMETRO=" + "1" +',
'    apex.item( "P178_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213167862919476112)
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
 p_id=>wwv_flow_imp.id(213167906327476113)
,p_event_id=>wwv_flow_imp.id(213167862919476112)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:165:&APP_SESSION.::NO:165:P165_REGISTRO,P165_ANIO,P165_ANIO_1,P165_MES_INICIO,P165_MES_FIN,P165_TIPO_REPORTE,P165_EMPRESA,P165_TIPO_REGISTRO:''',
'        || :P178_ID_REGISTRO || '','' || :P178_ANIO || '','' ',
'        || :P178_ANIO_MENOS_1 || '','' || :P178_MES_INICIO || '','' || :P178_MES_FINAL || '',5,'' || :P178_EMPRESA || '',1'',',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P178_URL',
'FROM DUAL;'))
,p_attribute_02=>'P178_ID_REGISTRO,P178_ANIO,P178_ANIO_MENOS_1,P178_MES_INICIO,P178_MES_FINAL,P178_EMPRESA'
,p_attribute_03=>'P178_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P178_TIPO'
,p_client_condition_expression=>'DETALLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213170692489476140)
,p_event_id=>wwv_flow_imp.id(213167862919476112)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:165:&APP_SESSION.::NO:165:P165_REGISTRO,P165_ANIO,P165_ANIO_1,P165_MES_INICIO,P165_MES_FIN,P165_TIPO_REPORTE,P165_EMPRESA,P165_TIPO_REGISTRO,P165_COD_CTA:''',
'        || :P178_ID_NOTA || '','' || :P178_ANIO || '','' ',
'        || :P178_ANIO_MENOS_1 || '','' || :P178_MES_INICIO || '','' || :P178_MES_FINAL || '',5,'' || :P178_EMPRESA || '',2,'' || :P178_COD_CTA,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P178_URL',
'FROM DUAL;'))
,p_attribute_02=>'P178_ID_REGISTRO,P178_ANIO,P178_ANIO_MENOS_1,P178_MES_INICIO,P178_MES_FINAL,P178_EMPRESA,P178_COD_CTA,P178_ID_NOTA'
,p_attribute_03=>'P178_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P178_TIPO'
,p_client_condition_expression=>'DETALLE_PRESTAMO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213168075531476114)
,p_event_id=>wwv_flow_imp.id(213167862919476112)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P178_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213170481734476138)
,p_name=>'BLOQUEAR_CAMPOS'
,p_event_sequence=>170
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213170525143476139)
,p_event_id=>wwv_flow_imp.id(213170481734476138)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'ITEM'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_VERSION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(216558114990949601)
,p_name=>'SUBIR_PLANTILLA'
,p_event_sequence=>180
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'SUBIR_PLANTILLA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216558292562949602)
,p_event_id=>wwv_flow_imp.id(216558114990949601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresa = apex.item(''P178_EMPRESA'').getValue();',
'',
'var url = `f?p=&APP_ID.:159:&APP_SESSION.::NO:159:P159_TIPO_REPORTE,P159_EMPRESA:5,${empresa}`;',
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
 p_id=>wwv_flow_imp.id(224054633015771801)
,p_name=>'DESCARGAR_PLANTILLA'
,p_event_sequence=>190
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'DESCARGAR_PLANTILLA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(224054779358771802)
,p_event_id=>wwv_flow_imp.id(224054633015771801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_NOMBRE_ARCHIVO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'PLANTILLA - Prestamos Bancarios.xlsx'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(224055073256771805)
,p_event_id=>wwv_flow_imp.id(224054633015771801)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P178_ID_REPOSITORIO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0000002297'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(224055108476771806)
,p_event_id=>wwv_flow_imp.id(224054633015771801)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DESCARGAR'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(213347635095788668)
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
 p_id=>wwv_flow_imp.id(213348828105788669)
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
'    :P178_PERMISOS := 0;',
'    --:P178_EMPRESA := 0;',
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
'                :P178_PERMISOS := 1;',
'            END IF;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(213347296865788667)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VECTOR_EMPRESA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VECTOR IS',
'        SELECT',
'            COUNT(*) CONTADOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P178_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P178_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        )',
'        WHERE TO_NUMBER(CODIGO_DIVISION) = 0; ',
'    ',
'    V_CONTADOR NUMBER := 0;',
'    V_VECTOR VARCHAR2(1124);',
'BEGIN',
'    OPEN C_VECTOR;',
'        FETCH C_VECTOR INTO V_CONTADOR;',
'    CLOSE C_VECTOR;',
'',
'    IF V_CONTADOR = 0 THEN',
'        SELECT',
'            LISTAGG(CODIGO_DIVISION, ''|'') INTO V_VECTOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P178_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P178_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        );',
'    ELSE',
'        SELECT',
'	        LISTAGG(DISTINCT CODIGO_EMPRESA, ''|'') INTO V_VECTOR',
'        FROM',
'        (',
'        Select codigo_empresa||'' - ''||nvl(Nombre_Persona,Razon_Social) nombre, codigo_empresa',
'          FROM Gral_personas_Table e, gral_empresas p',
'         Where e.codigo_persona = p.codigo_persona',
'           And p.Codigo_Empresa in',
'               (Select a.Codigo_Empresa',
'                  From Gral_Empresas_Usuarios a,',
'                       Gral_Empresas          b,',
'                       Gral_Personas_Table    c',
'                 Where upper(globalfunc.Fnc_NUsuario(Codigo_Usuario)) = upper(NVL(V(''APP_USER''),user))',
'                   And a.Codigo_Empresa = b.Codigo_Empresa',
'                   And b.Codigo_Persona = c.Codigo_Persona)',
'                   ',
'           And p.Codigo_Estado in (Select Codigo_Estatus',
'                                    From Gral_Estatus_Modulos',
'                                   Where Codigo_Modulo = 1',
'                                     And Permite_Movtos = ''S'')    ',
'         Order by p.codigo_empresa',
'         );',
'    END IF;',
'',
'    :P178_VECTOR_EMPRESA := V_VECTOR;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P178_MES_INICIO IS NOT NULL AND',
':P178_MES_FINAL IS NOT NULL AND',
':P178_ANIO IS NOT NULL AND',
'--:P178_VERSION IS NOT NULL AND',
':P178_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(213348497628788669)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARAMETOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VECTOR IS',
'        SELECT',
'            COUNT(*) CONTADOR',
'        FROM',
'        (',
'            SELECT ',
'                REGEXP_SUBSTR(:P178_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'            FROM ',
'                dual CONNECT BY REGEXP_SUBSTR(:P178_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'        ); ',
'    ',
'    V_CONTADOR NUMBER := 0;',
'BEGIN',
'    OPEN C_VECTOR;',
'        FETCH C_VECTOR INTO V_CONTADOR;',
'    CLOSE C_VECTOR;',
'',
'    IF V_CONTADOR = 1 THEN',
'        :P178_NOMBRE_TITULO := SAF.FN_NOMBRE_EMPRESA(:P178_VECTOR_EMPRESA);',
'    ELSE',
'        :P178_NOMBRE_TITULO := ''AICSA CORP.'';',
'    END IF;',
'',
'    SELECT',
'        NOMBRE_MONEDA,',
'        SIMBOLO_MONEDA',
'        INTO ',
'        :P178_NOMBRE_MONEDA,',
'        :P178_SIMBOLO_MONEDA',
'    FROM SAF.GRAL_MONEDAS',
'    WHERE CODIGO_MONEDA = :P178_MONEDA;',
'',
'    :P178_ANIO_MENOS_1:= TO_NUMBER(:P178_ANIO) - 1;',
'',
'    :P178_FECHA_TITULO := '' Al mes de '' || TO_CHAR(TO_DATE(:P178_MES_FINAL, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' '' || :P178_ANIO || '' y '' || :P178_ANIO_MENOS_1;',
'',
'    :P178_DIA_FIN := TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P178_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P178_MES_INICIO IS NOT NULL AND',
':P178_MES_FINAL IS NOT NULL AND',
':P178_ANIO IS NOT NULL AND',
'--:P178_VERSION IS NOT NULL AND',
':P178_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(213348026365788668)
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
