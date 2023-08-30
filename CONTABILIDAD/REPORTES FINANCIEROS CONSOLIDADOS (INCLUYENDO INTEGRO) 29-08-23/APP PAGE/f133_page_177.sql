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
--     PAGE: 177
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00177
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>177);
end;
/
prompt --application/pages/page_00177
begin
wwv_flow_imp_page.create_page(
 p_id=>177
,p_name=>'PLANTILLA_EERR_COST_X_UN_CORPORATIVO'
,p_alias=>'PLANTILLA-EERR-COST-X-UN-CORPORATIVO'
,p_step_title=>'PLANTILLA_EERR_COST_X_UN_CORPORATIVO'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function asociarPresupuesto(){',
'    $.event.trigger(''ASOCIAR_PRESUPUESTO'');',
'}',
'',
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
'function eliminarRegistro() {',
'    $.event.trigger(''ELIMINAR_REGISTRO'');',
'}',
'',
'function cargarDato() {',
'    $.event.trigger(''CARGAR_DATO'');',
'}',
'',
'function descargarPlantilla(){',
'    $.event.trigger(''DESCARGAR_PLANTILLA'');',
'}',
'',
'function subirPlantilla() {',
'    $.event.trigger(''SUBIR_PLANTILLA'');',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ACTIVO th#ID_NOTA, #ACTIVO td[headers=ID_NOTA]',
'{',
'    width: 250px !important;',
'    min-width: 250px !important;',
'    max-width: 250px !important;',
'}',
'',
'#LISTA_AICSA th#NUMERO_LINEA, #LISTA_AICSA td[headers=NUMERO_LINEA],',
'#LISTA_OTRAS_UNIDADES th#NUMERO_LINEA, #LISTA_OTRAS_UNIDADES td[headers=NUMERO_LINEA],',
'#LISTA_INTEGRO th#NUMERO_LINEA, #LISTA_INTEGRO td[headers=NUMERO_LINEA],',
'#LISTA_OTROS th#NUMERO_LINEA, #LISTA_OTROS td[headers=NUMERO_LINEA],',
'#LISTA_UNIDAD_NEGOCIO th#NUMERO_LINEA, #LISTA_UNIDAD_NEGOCIO td[headers=NUMERO_LINEA],',
'#UNIDAD_NEGOCIOS_OTROS th#NUMERO_LINEA, #UNIDAD_NEGOCIOS_OTROS td[headers=NUMERO_LINEA],',
'#UNIDAD_NEGOCIO_RSE th#NUMERO_LINEA, #UNIDAD_NEGOCIO_RSE td[headers=NUMERO_LINEA]',
'{',
'    width: 30px !important;',
'    min-width: 30px !important;',
'    max-width: 30px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230823105456'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(234949119991795706)
,p_plug_name=>'LISTA_2'
,p_region_name=>'LISTA_2'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(99548300376243627)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_list_id=>wwv_flow_imp.id(195531008967362855)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(99634242810244021)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1446082726968331717)
,p_plug_name=>'LISTA'
,p_region_name=>'LISTA_DESCARGAS'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(99548300376243627)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_list_id=>wwv_flow_imp.id(141338030786815689)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(99634242810244021)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1587179188079066237)
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
 p_id=>wwv_flow_imp.id(1792220512715471401)
,p_plug_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(224055496617771809)
,p_plug_name=>'AGRUPADOR DE EMPRESAS'
,p_parent_plug_id=>wwv_flow_imp.id(1792220512715471401)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P177_VERSION'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(224055501035771810)
,p_plug_name=>'Corporacion AICSA'
,p_parent_plug_id=>wwv_flow_imp.id(224055496617771809)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(224055882571771813)
,p_plug_name=>'LISTA_AICSA'
,p_region_name=>'LISTA_AICSA'
,p_parent_plug_id=>wwv_flow_imp.id(224055501035771810)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1025110645912851487)
,p_plug_display_sequence=>60
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	ROW_NUMBER() OVER (ORDER BY A.ID ASC) AS NUMERO_LINEA,',
'    A.ID ID,',
'    A.ID_ASOCIACION SECCION,',
'    (B.CODIGO_SECCION || '' - '' || B.NOMBRE_SECCION) NOMBRE',
'FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A',
'INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION',
'WHERE A.TIPO_REPORTE = 50'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P177_VERSION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LISTA_AICSA'
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
 p_id=>wwv_flow_imp.id(224056749613771822)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>224056749613771822
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226355823644277030)
,p_db_column_name=>'NUMERO_LINEA'
,p_display_order=>10
,p_column_identifier=>'Q'
,p_column_label=>'No'
,p_column_type=>'NUMBER'
,p_static_id=>'NUMERO_LINEA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226355989419277031)
,p_db_column_name=>'SECCION'
,p_display_order=>20
,p_column_identifier=>'R'
,p_column_label=>'Seccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226356015380277032)
,p_db_column_name=>'ID'
,p_display_order=>30
,p_column_identifier=>'S'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226356126270277033)
,p_db_column_name=>'NOMBRE'
,p_display_order=>40
,p_column_identifier=>'T'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOMBRE#',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="TABLA" type="hidden" value="1">'))
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(226341782116249868)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2263418'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NUMERO_LINEA:NOMBRE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(224055695281771811)
,p_plug_name=>'Otras Unidades de Negocio'
,p_parent_plug_id=>wwv_flow_imp.id(224055496617771809)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(224056196131771816)
,p_plug_name=>'LISTA_OTRAS_UNIDADES'
,p_region_name=>'LISTA_OTRAS_UNIDADES'
,p_parent_plug_id=>wwv_flow_imp.id(224055695281771811)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1025110645912851487)
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	ROW_NUMBER() OVER (ORDER BY A.ID ASC) AS NUMERO_LINEA,',
'    A.ID ID,',
'    A.ID_ASOCIACION SECCION,',
'    (B.CODIGO_SECCION || '' - '' || B.NOMBRE_SECCION) NOMBRE',
'FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A',
'INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION',
'WHERE A.TIPO_REPORTE = 51'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P177_VERSION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LISTA_OTRAS_UNIDADES'
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
 p_id=>wwv_flow_imp.id(224058413433771839)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>224058413433771839
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224058522003771840)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226356667738277038)
,p_db_column_name=>'NUMERO_LINEA'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>'No'
,p_column_type=>'NUMBER'
,p_static_id=>'NUMERO_LINEA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226356773886277039)
,p_db_column_name=>'SECCION'
,p_display_order=>30
,p_column_identifier=>'R'
,p_column_label=>'Seccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226356815967277040)
,p_db_column_name=>'NOMBRE'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOMBRE#',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="TABLA" type="hidden" value="2">'))
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(226404531243280697)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2264046'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NUMERO_LINEA:NOMBRE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(224055775072771812)
,p_plug_name=>'Integro'
,p_parent_plug_id=>wwv_flow_imp.id(224055496617771809)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(224056357786771818)
,p_plug_name=>'LISTA_INTEGRO'
,p_region_name=>'LISTA_INTEGRO'
,p_parent_plug_id=>wwv_flow_imp.id(224055775072771812)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1025110645912851487)
,p_plug_display_sequence=>70
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	ROW_NUMBER() OVER (ORDER BY A.ID ASC) AS NUMERO_LINEA,',
'    A.ID ID,',
'    A.ID_ASOCIACION SECCION,',
'    (B.CODIGO_SECCION || '' - '' || B.NOMBRE_SECCION) NOMBRE',
'FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A',
'INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION',
'WHERE A.TIPO_REPORTE = 52'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P177_VERSION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LISTA_INTEGRO'
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
 p_id=>wwv_flow_imp.id(226353463244277006)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>226353463244277006
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226353509484277007)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226614083836426606)
,p_db_column_name=>'NUMERO_LINEA'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>'No'
,p_column_type=>'NUMBER'
,p_static_id=>'NUMERO_LINEA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226614180477426607)
,p_db_column_name=>'SECCION'
,p_display_order=>30
,p_column_identifier=>'R'
,p_column_label=>'Seccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226614210062426608)
,p_db_column_name=>'NOMBRE'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOMBRE#',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="TABLA" type="hidden" value="3">'))
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(226405190670280704)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2264052'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NUMERO_LINEA:NOMBRE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(226867659477637129)
,p_plug_name=>'Otros Ingresos y Gastos'
,p_parent_plug_id=>wwv_flow_imp.id(224055496617771809)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(226868090891637133)
,p_plug_name=>'LISTA_OTROS'
,p_region_name=>'LISTA_OTROS'
,p_parent_plug_id=>wwv_flow_imp.id(226867659477637129)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1025110645912851487)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	ROW_NUMBER() OVER (ORDER BY A.ID ASC) AS NUMERO_LINEA,',
'    A.ID ID,',
'    A.ID_ASOCIACION SECCION,',
'    (B.CODIGO_SECCION || '' - '' || B.NOMBRE_SECCION) NOMBRE',
'FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A',
'INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION',
'WHERE A.TIPO_REPORTE = 53'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P177_VERSION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(226868141080637134)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>226868141080637134
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226868288094637135)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226868392365637136)
,p_db_column_name=>'NUMERO_LINEA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'No'
,p_column_type=>'NUMBER'
,p_static_id=>'NUMERO_LINEA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226868494098637137)
,p_db_column_name=>'SECCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Seccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(226868582243637138)
,p_db_column_name=>'NOMBRE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOMBRE#',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="TABLA" type="hidden" value="4">'))
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(234934640242776613)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2349347'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NUMERO_LINEA:NOMBRE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1792220765069471403)
,p_plug_name=>'BALANCE'
,p_parent_plug_id=>wwv_flow_imp.id(1792220512715471401)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>9
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P177_VERSION'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(246234565275454119)
,p_plug_name=>'Cuadro Resumen Resultados'
,p_parent_plug_id=>wwv_flow_imp.id(1792220765069471403)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>40
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(246235364146454127)
,p_plug_name=>'Unidades de Negocio'
,p_parent_plug_id=>wwv_flow_imp.id(246234565275454119)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(246234645857454120)
,p_plug_name=>'Unidades de Negocio'
,p_region_name=>'LISTA_UNIDAD_NEGOCIO'
,p_parent_plug_id=>wwv_flow_imp.id(246235364146454127)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>70
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	ROW_NUMBER() OVER (ORDER BY A.ID ASC) AS NUMERO_LINEA,',
'    A.ID ID,',
'    A.ID_ASOCIACION SECCION,',
'    (B.CODIGO_SECCION || '' - '' || B.NOMBRE_SECCION) NOMBRE',
'FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A',
'INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION',
'WHERE A.TIPO_REPORTE = 55'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Unidades de Negocio'
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
 p_id=>wwv_flow_imp.id(246234713392454121)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>246234713392454121
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(246234838227454122)
,p_db_column_name=>'NUMERO_LINEA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'NUMERO_LINEA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(246234981701454123)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(246235058365454124)
,p_db_column_name=>'SECCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Seccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(246235124279454125)
,p_db_column_name=>'NOMBRE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOMBRE#',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="TABLA" type="hidden" value="5">'))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(248274429321217432)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2482745'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NUMERO_LINEA:NOMBRE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(248336343874353903)
,p_plug_name=>'Unidades de Negocio (Otros)'
,p_parent_plug_id=>wwv_flow_imp.id(246234565275454119)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(248337509884353915)
,p_plug_name=>'Unidades de Negocio (Otros)'
,p_region_name=>'UNIDAD_NEGOCIOS_OTROS'
,p_parent_plug_id=>wwv_flow_imp.id(248336343874353903)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>80
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	ROW_NUMBER() OVER (ORDER BY A.ID ASC) AS NUMERO_LINEA,',
'    A.ID ID,',
'    A.ID_ASOCIACION SECCION,',
'    (B.CODIGO_SECCION || '' - '' || B.NOMBRE_SECCION) NOMBRE',
'FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A',
'INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION',
'WHERE A.TIPO_REPORTE = 56'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Unidades de Negocio (Otros)'
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
 p_id=>wwv_flow_imp.id(248337648613353916)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>248337648613353916
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(248337757090353917)
,p_db_column_name=>'NUMERO_LINEA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'NUMERO_LINEA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(248337883716353918)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(248337927083353919)
,p_db_column_name=>'SECCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Seccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(248338085508353920)
,p_db_column_name=>'NOMBRE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOMBRE#',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="TABLA" type="hidden" value="6">'))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(248394343028540902)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2483944'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NUMERO_LINEA:ID:SECCION:NOMBRE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(248338986187353929)
,p_plug_name=>'Unidades de Negocio (RSE)'
,p_parent_plug_id=>wwv_flow_imp.id(246234565275454119)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(248339347337353933)
,p_plug_name=>'Unidades de Negocio (RSE)'
,p_region_name=>'UNIDAD_NEGOCIO_RSE'
,p_parent_plug_id=>wwv_flow_imp.id(248338986187353929)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	ROW_NUMBER() OVER (ORDER BY A.ID ASC) AS NUMERO_LINEA,',
'    A.ID ID,',
'    A.ID_ASOCIACION SECCION,',
'    (B.CODIGO_SECCION || '' - '' || B.NOMBRE_SECCION) NOMBRE',
'FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A',
'INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION',
'WHERE A.TIPO_REPORTE = 57'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Unidades de Negocio (RSE)'
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
end;
/
begin
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(248339477312353934)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_search_bar=>'N'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>248339477312353934
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(248339544929353935)
,p_db_column_name=>'NUMERO_LINEA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'NUMERO_LINEA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(248339660230353936)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(248339788357353937)
,p_db_column_name=>'SECCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Seccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(248339889059353938)
,p_db_column_name=>'NOMBRE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOMBRE#',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="TABLA" type="hidden" value="7">'))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(248423201462608157)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2484233'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NUMERO_LINEA:ID:SECCION:NOMBRE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(246235264532454126)
,p_plug_name=>'BALANCE_DIV'
,p_parent_plug_id=>wwv_flow_imp.id(1792220765069471403)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1792221627357471412)
,p_plug_name=>'Balance'
,p_region_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(246235264532454126)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH MARGEN_BRUTO AS',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'                ''Nota '' || C.NOMBRE',
'            ELSE',
'                NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        B.ID_NOTA ID_NOTA_NUM,',
'        :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P177_VERSION',
'    LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'    WHERE A.ORDEN_1 = ''MargenBruto''',
'    AND A.TIPO_REPORTE = 6',
'    ORDER BY A.ORDEN_2 ASC',
'),',
'RESULTADOS_EN_OPERACION AS',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'                ''Nota '' || C.NOMBRE',
'            ELSE',
'                NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        B.ID_NOTA ID_NOTA_NUM,',
'        :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P177_VERSION',
'    LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'    WHERE A.ORDEN_1 = ''ResultadosEnOperacion''',
'    AND A.TIPO_REPORTE = 6',
'    ORDER BY A.ORDEN_2 ASC',
'),',
'RESULTADOS AS',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'                ''Nota '' || C.NOMBRE',
'            ELSE',
'                NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        B.ID_NOTA ID_NOTA_NUM,',
'        :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P177_VERSION',
'    LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'    WHERE A.ORDEN_1 = ''Resultado''',
'    AND A.TIPO_REPORTE = 6',
'    ORDER BY A.ORDEN_2 ASC',
'),',
'EBITDA AS',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'                ''Nota '' || C.NOMBRE',
'            ELSE',
'                NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        B.ID_NOTA ID_NOTA_NUM,',
'        :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P177_VERSION',
'    LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'    WHERE A.ORDEN_1 = ''EBITDA''',
'    AND A.TIPO_REPORTE = 6',
'    ORDER BY A.ORDEN_2 ASC',
'),',
'RESULTADOS_ANTES_INGRESOS AS',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'                ''Nota '' || C.NOMBRE',
'            ELSE',
'                NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        B.ID_NOTA ID_NOTA_NUM,',
'        :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P177_VERSION',
'    LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'    WHERE A.ORDEN_1 = ''ResultadosAntesOtrosIngresosGastos''',
'    AND A.TIPO_REPORTE = 6',
'    ORDER BY A.ORDEN_2 ASC',
'),',
'RESULTADOS_ANTES_IMPUESTOS AS',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'                ''Nota '' || C.NOMBRE',
'            ELSE',
'                NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		0,',
'    		1,',
'    		:P177_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        B.ID_NOTA ID_NOTA_NUM,',
'        :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P177_VERSION',
'    LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'    WHERE A.ORDEN_1 = ''ResultadosAntesImpuestos''',
'    AND A.TIPO_REPORTE = 6',
'    ORDER BY A.ORDEN_2 ASC',
')',
'SELECT',
'    ID,',
'    ID_NOTA,',
'    NOMBRE,',
'    COD_CTA,',
'    ORDEN_1,',
'    ORDEN_2,',
'    BOTON,',
'    ANIO_1,',
'    ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    SIMBOLO_MONEDA',
'FROM MARGEN_BRUTO',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Margen Bruto'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    0 ANIO_1,',
'    0 ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
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
'    ANIO_1,',
'    ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    SIMBOLO_MONEDA',
'FROM RESULTADOS_EN_OPERACION',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Resultados En Operacion'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    0 ANIO_1,',
'    0 ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
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
'    ANIO_1,',
'    ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    SIMBOLO_MONEDA',
'FROM RESULTADOS',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Resultado'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    0 ANIO_1,',
'    0 ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
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
'    ANIO_1,',
'    ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    SIMBOLO_MONEDA',
'FROM EBITDA',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''EBITDA'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    0 ANIO_1,',
'    0 ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
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
'    ANIO_1,',
'    ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    SIMBOLO_MONEDA',
'FROM RESULTADOS_ANTES_INGRESOS',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Resultados Antes de Otros Ingresos y Gastos'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    0 ANIO_1,',
'    0 ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
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
'    ANIO_1,',
'    ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    SIMBOLO_MONEDA',
'FROM RESULTADOS_ANTES_IMPUESTOS',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Resultados Antes de Impuestos'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    0 ANIO_1,',
'    0 ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P177_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P177_VERSION,P177_SIMBOLO_MONEDA,P177_MONEDA'
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
 p_id=>wwv_flow_imp.id(1792221727752471413)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>1792221727752471413
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220362840950418576)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220363262268418577)
,p_db_column_name=>'COD_CTA'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Cod Cta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220363637888418578)
,p_db_column_name=>'ORDEN_1'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Orden 1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220364088644418579)
,p_db_column_name=>'ORDEN_2'
,p_display_order=>60
,p_column_identifier=>'L'
,p_column_label=>'Orden 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220364406194418579)
,p_db_column_name=>'BOTON'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>'&nbsp'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_static_id=>'BOTON'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220364839500418580)
,p_db_column_name=>'ANIO_1'
,p_display_order=>80
,p_column_identifier=>'T'
,p_column_label=>'&P177_ANIO.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_static_id=>'ANIO_1'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220365245373418581)
,p_db_column_name=>'ANIO_2'
,p_display_order=>90
,p_column_identifier=>'U'
,p_column_label=>'&P177_ANIO_MENOS_1.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_static_id=>'ANIO_2'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220365692477418582)
,p_db_column_name=>'TIPO'
,p_display_order=>100
,p_column_identifier=>'V'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220365938062418582)
,p_db_column_name=>'CLASE'
,p_display_order=>110
,p_column_identifier=>'W'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220366345056418583)
,p_db_column_name=>'ID_NOTA_NUM'
,p_display_order=>120
,p_column_identifier=>'X'
,p_column_label=>'Id Nota Num'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220362427882418575)
,p_db_column_name=>'ID_NOTA'
,p_display_order=>130
,p_column_identifier=>'Y'
,p_column_label=>'Nota'
,p_column_type=>'STRING'
,p_static_id=>'ID_NOTA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220362064167418574)
,p_db_column_name=>'NOMBRE'
,p_display_order=>140
,p_column_identifier=>'AA'
,p_column_label=>'Nombre'
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
 p_id=>wwv_flow_imp.id(220361654449418573)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>150
,p_column_identifier=>'AB'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1792814008496789648)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'1834497'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:ID_NOTA:ANIO_1:ANIO_2:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1412306522758670846)
,p_plug_name=>'TITULO_REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(1792220765069471403)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:rigth; margin-left:10px;">&P177_NOMBRE_TITULO.</h4>',
'<h5 style="text-align:rigth; margin-left:10px;">&P177_ANIO_TITULO.</h5>',
'<h5 style="text-align:rigth; margin-left:10px;">&P177_FECHA_TITULO.</h5>',
'<!--<h5 style="text-align:rigth; margin-left:10px;">(Cifras Expresadas en &P177_NOMBRE_MONEDA.)</h5>-->'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(226867896117637131)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(226867659477637129)
,p_button_name=>'AGREGAR_4'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(226867905986637132)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(226867659477637129)
,p_button_name=>'CLEAR_4'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(248339178221353931)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(248338986187353929)
,p_button_name=>'AGREGAR_57'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'style="margin-top:20px"'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(248339235550353932)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(248338986187353929)
,p_button_name=>'CLEAR_57'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
,p_button_cattributes=>'style="margin-top:20px"'
,p_grid_new_row=>'N'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(224056429175771819)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(224055501035771810)
,p_button_name=>'AGREGAR_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'style="margin-top:20px"'
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(224056549751771820)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(224055695281771811)
,p_button_name=>'AGREGAR_2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(224056601488771821)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(224055775072771812)
,p_button_name=>'AGREGAR_3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(226614623556426612)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(224055695281771811)
,p_button_name=>'CLEAR_2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(246235610985454130)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(246235364146454127)
,p_button_name=>'AGREGAR_55'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'style="margin-top:20px"'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(226614569810426611)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(224055501035771810)
,p_button_name=>'CLEAR_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
,p_button_cattributes=>'style="margin-top:20px"'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(248336538838353905)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(248336343874353903)
,p_button_name=>'AGREGAR_56'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'style="margin-top:20px"'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(226614733761426613)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(224055775072771812)
,p_button_name=>'CLEAR_3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(246235765664454131)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(246235364146454127)
,p_button_name=>'CLEAR_55'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
,p_button_cattributes=>'style="margin-top:20px"'
,p_grid_new_row=>'N'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(248336602488353906)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(248336343874353903)
,p_button_name=>'CLEAR_56'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Agregar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
,p_button_cattributes=>'style="margin-top:20px"'
,p_grid_new_row=>'N'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(220352434300418547)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_button_name=>'ACTUALIZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Actualizar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-retweet'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(234949050207795705)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_button_name=>'CARGAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Cargar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-wrench'
,p_button_cattributes=>'style="margin-top:30px"; data-menu="LISTA_2_menu"'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(248437541164635105)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_button_name=>'ASOCIAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Presupuesto'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-calculator'
,p_button_cattributes=>'style="margin-top:30px";'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(220391400549418625)
,p_branch_name=>'CARGAR_DATOS'
,p_branch_action=>'f?p=&APP_ID.:177:&SESSION.::&DEBUG.:177:P177_VERSION:&P177_VERSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CARGAR_DATOS'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(234949753686795712)
,p_branch_name=>'DESCARGAR'
,p_branch_action=>'f?p=202:38:&SESSION.::&DEBUG.::P38_FILE_NAME,P38_ID_EN_REPOSITORIO:&P177_NOMBRE_ARCHIVO.,&P177_ID_REPOSITORIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DESCARGAR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216560435061949624)
,p_name=>'P177_ANIO_TITULO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220353226168418549)
,p_name=>'P177_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220353620126418551)
,p_name=>'P177_MES_INICIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220354021217418552)
,p_name=>'P177_MES_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220354417589418552)
,p_name=>'P177_ANIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_item_default=>'TO_CHAR(SYSDATE, ''YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220354853522418553)
,p_name=>'P177_VERSION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
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
 p_id=>wwv_flow_imp.id(220355297220418553)
,p_name=>'P177_MONEDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS',
'WHERE MONEDA_LOCAL IS NOT NULL'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220355629943418554)
,p_name=>'P177_ANIO_MENOS_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220356064732418554)
,p_name=>'P177_NOMBRE_TITULO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220356409553418555)
,p_name=>'P177_FECHA_TITULO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220356830972418555)
,p_name=>'P177_NOMBRE_MONEDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220357271510418556)
,p_name=>'P177_SIMBOLO_MONEDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220357643724418557)
,p_name=>'P177_VECTOR_EMPRESA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(1587179188079066237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220358307593418558)
,p_name=>'P177_ID_NOTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1792220512715471401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220358779160418559)
,p_name=>'P177_ID_REGISTRO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1792220512715471401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220359148460418559)
,p_name=>'P177_TIPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1792220512715471401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220359536912418560)
,p_name=>'P177_URL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1792220512715471401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220359953201418560)
,p_name=>'P177_CODIGO_USUARIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1792220512715471401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220360304306418561)
,p_name=>'P177_DIA_FINAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1792220512715471401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220367362557418590)
,p_name=>'P177_JASPER'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220367711626418591)
,p_name=>'P177_AUTENTICATION'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220368179336418591)
,p_name=>'P177_DIA_FIN'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(220368573988418592)
,p_name=>'P177_PERMISOS'
,p_item_sequence=>80
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(224055998864771814)
,p_name=>'P177_DIVISION_AICSA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(224055501035771810)
,p_prompt=>'Seccion'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	(CODIGO_SECCION || '' - '' || NOMBRE_SECCION) NOMBRE,',
'	CODIGO_SECCION',
'FROM SAF.GRAL_SECCIONES',
'WHERE ESTADO = ''ACTIVA''',
'AND CODIGO_DIVISION IS NOT NULL',
'AND CODIGO_SECCION NOT IN ',
'(',
'	SELECT',
'		ID_ASOCIACION',
'	FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'	WHERE (TIPO_REPORTE = 50 OR TIPO_REPORTE = 51 OR TIPO_REPORTE = 52 OR TIPO_REPORTE = 53)',
')',
'ORDER BY CODIGO_SECCION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(224056013587771815)
,p_name=>'P177_DIVISION_OTRAS_UNIDADES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(224055695281771811)
,p_prompt=>'Seccion'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	(CODIGO_SECCION || '' - '' || NOMBRE_SECCION) NOMBRE,',
'	CODIGO_SECCION',
'FROM SAF.GRAL_SECCIONES',
'WHERE ESTADO = ''ACTIVA''',
'AND CODIGO_DIVISION IS NOT NULL',
'AND CODIGO_SECCION NOT IN ',
'(',
'	SELECT',
'		ID_ASOCIACION',
'	FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'	WHERE (TIPO_REPORTE = 50 OR TIPO_REPORTE = 51 OR TIPO_REPORTE = 52 OR TIPO_REPORTE = 53)',
')',
'ORDER BY CODIGO_SECCION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(224056207133771817)
,p_name=>'P177_DIVISION_INTEGRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(224055775072771812)
,p_prompt=>'Seccion'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	(CODIGO_SECCION || '' - '' || NOMBRE_SECCION) NOMBRE,',
'	CODIGO_SECCION',
'FROM SAF.GRAL_SECCIONES',
'WHERE ESTADO = ''ACTIVA''',
'AND CODIGO_DIVISION IS NOT NULL',
'AND CODIGO_SECCION NOT IN ',
'(',
'	SELECT',
'		ID_ASOCIACION',
'	FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'	WHERE (TIPO_REPORTE = 50 OR TIPO_REPORTE = 51 OR TIPO_REPORTE = 52 OR TIPO_REPORTE = 53)',
')',
'ORDER BY CODIGO_SECCION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(226867766942637130)
,p_name=>'P177_DIVISION_OTROS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(226867659477637129)
,p_prompt=>'Seccion'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	(CODIGO_SECCION || '' - '' || NOMBRE_SECCION) NOMBRE,',
'	CODIGO_SECCION',
'FROM SAF.GRAL_SECCIONES',
'WHERE ESTADO = ''ACTIVA''',
'AND CODIGO_DIVISION IS NOT NULL',
'AND CODIGO_SECCION NOT IN ',
'(',
'	SELECT',
'		ID_ASOCIACION',
'	FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'	WHERE (TIPO_REPORTE = 50 OR TIPO_REPORTE = 51 OR TIPO_REPORTE = 52 OR TIPO_REPORTE = 53)',
')',
'ORDER BY CODIGO_SECCION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(234949452849795709)
,p_name=>'P177_NOMBRE_ARCHIVO'
,p_item_sequence=>90
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(234949508787795710)
,p_name=>'P177_ID_REPOSITORIO'
,p_item_sequence=>100
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(246235576727454129)
,p_name=>'P177_UNIDAD_NEGOCIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(246235364146454127)
,p_prompt=>'Unidad Negocio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	(CODIGO_SECCION || '' - '' || NOMBRE_SECCION) NOMBRE,',
'	CODIGO_SECCION',
'FROM SAF.GRAL_SECCIONES',
'WHERE ESTADO = ''ACTIVA''',
'AND CODIGO_DIVISION IS NOT NULL',
'AND CODIGO_SECCION NOT IN ',
'(',
'	SELECT',
'		ID_ASOCIACION',
'	FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'	WHERE (TIPO_REPORTE = 55 OR TIPO_REPORTE = 56 OR TIPO_REPORTE = 57)',
')',
'ORDER BY CODIGO_SECCION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>10
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
 p_id=>wwv_flow_imp.id(246237395147454147)
,p_name=>'P177_TABLA_ORIGEN'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1792220512715471401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(248336479153353904)
,p_name=>'P177_UNIDAD_NEGOCIO_OTROS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(248336343874353903)
,p_prompt=>'Unidad Negocio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	(CODIGO_SECCION || '' - '' || NOMBRE_SECCION) NOMBRE,',
'	CODIGO_SECCION',
'FROM SAF.GRAL_SECCIONES',
'WHERE ESTADO = ''ACTIVA''',
'AND CODIGO_DIVISION IS NOT NULL',
'AND CODIGO_SECCION NOT IN ',
'(',
'	SELECT',
'		ID_ASOCIACION',
'	FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'	WHERE (TIPO_REPORTE = 55 OR TIPO_REPORTE = 56 OR TIPO_REPORTE = 57)',
')',
'ORDER BY CODIGO_SECCION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>10
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
 p_id=>wwv_flow_imp.id(248339060595353930)
,p_name=>'P177_UNIDAD_NEGOCIO_RSE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(248338986187353929)
,p_prompt=>'Unidad Negocio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	(CODIGO_SECCION || '' - '' || NOMBRE_SECCION) NOMBRE,',
'	CODIGO_SECCION',
'FROM SAF.GRAL_SECCIONES',
'WHERE ESTADO = ''ACTIVA''',
'AND CODIGO_DIVISION IS NOT NULL',
'AND CODIGO_SECCION NOT IN ',
'(',
'	SELECT',
'		ID_ASOCIACION',
'	FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'	WHERE (TIPO_REPORTE = 55 OR TIPO_REPORTE = 56 OR TIPO_REPORTE = 57)',
')',
'ORDER BY CODIGO_SECCION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>10
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(220380520856418611)
,p_name=>'EDITAR_LISTA_AICSA'
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
 p_id=>wwv_flow_imp.id(226615499798426620)
,p_event_id=>wwv_flow_imp.id(220380520856418611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID_NOTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_NOTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226615530525426621)
,p_event_id=>wwv_flow_imp.id(220380520856418611)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226615751487426623)
,p_event_id=>wwv_flow_imp.id(220380520856418611)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_TIPO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(220381041107418612)
,p_event_id=>wwv_flow_imp.id(220380520856418611)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA_EERR_CxU'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "EDITAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P177_ID_NOTA'').getValue() != '''') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "CARGAR_DATO": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return false;',
'        }',
'    },',
'    "ASOCIAR_PRESUPUESTO": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "VER_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "CREAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P177_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                return false;',
'            }',
'        }',
'    },',
'    "ELIMINAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P177_ID_NOTA'').getValue() != '''') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "ASOCIAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P177_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                return false;',
'            }',
'        }',
'    }',
'};'))
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P177_TIPO'').getValue() == ''DETALLE'''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226617738803426643)
,p_name=>'EDITAR_LISTA_AICSA_MENU'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA_AICSA td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226618209790426648)
,p_event_id=>wwv_flow_imp.id(226617738803426643)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246237470155454148)
,p_event_id=>wwv_flow_imp.id(226617738803426643)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'TABLA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_TABLA_ORIGEN'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TABLA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226618130275426647)
,p_event_id=>wwv_flow_imp.id(226617738803426643)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'CRUD'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "CREAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "EDITAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226618322621426649)
,p_name=>'EDITAR_LISTA_OTRAS_UNIDADES'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA_OTRAS_UNIDADES td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226618416089426650)
,p_event_id=>wwv_flow_imp.id(226618322621426649)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246237519800454149)
,p_event_id=>wwv_flow_imp.id(226618322621426649)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'TABLA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_TABLA_ORIGEN'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TABLA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226864838513637101)
,p_event_id=>wwv_flow_imp.id(226618322621426649)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'CRUD'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "CREAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "EDITAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226864950201637102)
,p_name=>'EDITAR_LISTA_INTEGRO'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA_INTEGRO td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226865059933637103)
,p_event_id=>wwv_flow_imp.id(226864950201637102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246237641968454150)
,p_event_id=>wwv_flow_imp.id(226864950201637102)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'TABLA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_TABLA_ORIGEN'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TABLA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226865135613637104)
,p_event_id=>wwv_flow_imp.id(226864950201637102)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'CRUD'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "CREAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "EDITAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(246236968963454143)
,p_name=>'EDITAR_UNIDADES_NEGOCIO'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA_UNIDAD_NEGOCIO td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246237030119454144)
,p_event_id=>wwv_flow_imp.id(246236968963454143)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248336184113353901)
,p_event_id=>wwv_flow_imp.id(246236968963454143)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'TABLA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_TABLA_ORIGEN'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TABLA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246237128344454145)
,p_event_id=>wwv_flow_imp.id(246236968963454143)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'CRUD'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "CREAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "EDITAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248338436197353924)
,p_name=>'LISTA_UNIDAD_NEGOCIOS_OTROS'
,p_event_sequence=>60
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#UNIDAD_NEGOCIOS_OTROS td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248338575167353925)
,p_event_id=>wwv_flow_imp.id(248338436197353924)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248338658291353926)
,p_event_id=>wwv_flow_imp.id(248338436197353924)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'TABLA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_TABLA_ORIGEN'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TABLA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248338785494353927)
,p_event_id=>wwv_flow_imp.id(248338436197353924)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'CRUD'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "CREAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "EDITAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248437183195635101)
,p_name=>'LISTA_UNIDAD_NEGOCIO_RSE'
,p_event_sequence=>70
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#UNIDAD_NEGOCIO_RSE td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248437234370635102)
,p_event_id=>wwv_flow_imp.id(248437183195635101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248437361171635103)
,p_event_id=>wwv_flow_imp.id(248437183195635101)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'TABLA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_TABLA_ORIGEN'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TABLA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248437477315635104)
,p_event_id=>wwv_flow_imp.id(248437183195635101)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'CRUD'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "CREAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "EDITAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226869521592637148)
,p_name=>'EDITAR_LISTA_OTROS'
,p_event_sequence=>80
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA_OTROS td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226869632431637149)
,p_event_id=>wwv_flow_imp.id(226869521592637148)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248336278735353902)
,p_event_id=>wwv_flow_imp.id(226869521592637148)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'TABLA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_TABLA_ORIGEN'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TABLA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226869757685637150)
,p_event_id=>wwv_flow_imp.id(226869521592637148)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'CRUD'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "CREAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "EDITAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(220387635720418620)
,p_name=>'REFRESH_REPORTE'
,p_event_sequence=>90
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(220388118879418621)
,p_event_id=>wwv_flow_imp.id(220387635720418620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ACTIVOS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1792221627357471412)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(220385745946418617)
,p_name=>'GENERAR_DATOS'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(220352434300418547)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.item(''P177_EMPRESA'').getValue() != '''' &&',
'//apex.item(''P177_MES_INICIO'').getValue() != '''' &&',
'//apex.item(''P177_MES_FINAL'').getValue() != '''' &&',
'//apex.item(''P177_ANIO'').getValue() != '''' &&',
'apex.item(''P177_VERSION'').getValue() != ''''',
'//apex.item(''P177_MONEDA'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(220386269920418619)
,p_event_id=>wwv_flow_imp.id(220385745946418617)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_VECTOR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VECTOR IS',
'        SELECT',
'            COUNT(*) CONTADOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P177_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P177_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
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
'            REGEXP_SUBSTR(:P177_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P177_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
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
'    :P177_VECTOR_EMPRESA := V_VECTOR;',
'END;'))
,p_attribute_02=>'P177_DIVISION_AICSA'
,p_attribute_03=>'P177_VECTOR_EMPRESA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(220386740193418619)
,p_event_id=>wwv_flow_imp.id(220385745946418617)
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
 p_id=>wwv_flow_imp.id(220387211352418620)
,p_event_id=>wwv_flow_imp.id(220385745946418617)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR_DATOS'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(220376207102418606)
,p_name=>'CALCULAR_DIA_FIN'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P177_MES_FINAL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(220376726102418607)
,p_event_id=>wwv_flow_imp.id(220376207102418606)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DIA'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'SELECT TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P177_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'') INTO :P177_DIA_FIN FROM DUAL;'
,p_attribute_02=>'P177_MES_FINAL'
,p_attribute_03=>'P177_DIA_FIN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226355101144277023)
,p_name=>'AGREGAR_1'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(224056429175771819)
,p_condition_element=>'P177_DIVISION_AICSA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226355228453277024)
,p_event_id=>wwv_flow_imp.id(226355101144277023)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'INGRESSAR_BLOQUE_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'(',
'	TIPO_REPORTE,',
'	ID_ASOCIACION,',
'	CONCEPTO,',
'	USUARIO_GRABACION,',
'	FECHA_GRABACION',
')',
'VALUES',
'(',
'    50,',
'    :P177_DIVISION_AICSA,',
'    ''BLOQUE 1 DE LA CONFIGURACION DEL REPORTE'',',
'    :GLOBAL_CODIGO_USUARIO,',
'    SYSDATE',
');'))
,p_attribute_02=>'P177_DIVISION_AICSA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226614496807426610)
,p_event_id=>wwv_flow_imp.id(226355101144277023)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_AICSA,P177_DIVISION_OTRAS_UNIDADES,P177_DIVISION_INTEGRO,P177_DIVISION_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226355472106277026)
,p_event_id=>wwv_flow_imp.id(226355101144277023)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ITEMS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_AICSA,P177_DIVISION_OTRAS_UNIDADES,P177_DIVISION_INTEGRO,P177_DIVISION_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226355594820277027)
,p_event_id=>wwv_flow_imp.id(226355101144277023)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_REGION'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(224055882571771813)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226355645912277028)
,p_name=>'LISTA_AICSA'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(224055882571771813)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226355700720277029)
,p_event_id=>wwv_flow_imp.id(226355645912277028)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroLineasIR(''LISTA_AICSA'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226356337980277035)
,p_name=>'LISTA_OTRAS_UNIDADES'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(224056196131771816)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226356517516277037)
,p_event_id=>wwv_flow_imp.id(226356337980277035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroLineasIR(''LISTA_OTRAS_UNIDADES'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226356937808277041)
,p_name=>'AGREGAR_2'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(224056549751771820)
,p_condition_element=>'P177_DIVISION_OTRAS_UNIDADES'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226357199378277043)
,p_event_id=>wwv_flow_imp.id(226356937808277041)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'INGRESSAR_BLOQUE_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'(',
'	TIPO_REPORTE,',
'	ID_ASOCIACION,',
'	CONCEPTO,',
'	USUARIO_GRABACION,',
'	FECHA_GRABACION',
')',
'VALUES',
'(',
'    51,',
'    :P177_DIVISION_OTRAS_UNIDADES,',
'    ''BLOQUE 2 DE LA CONFIGURACION DEL REPORTE'',',
'    :GLOBAL_CODIGO_USUARIO,',
'    SYSDATE',
');'))
,p_attribute_02=>'P177_DIVISION_OTRAS_UNIDADES'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226614387195426609)
,p_event_id=>wwv_flow_imp.id(226356937808277041)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_AICSA,P177_DIVISION_OTRAS_UNIDADES,P177_DIVISION_INTEGRO,P177_DIVISION_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226357337785277045)
,p_event_id=>wwv_flow_imp.id(226356937808277041)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ITEMS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_AICSA,P177_DIVISION_OTRAS_UNIDADES,P177_DIVISION_INTEGRO,P177_DIVISION_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226357443280277046)
,p_event_id=>wwv_flow_imp.id(226356937808277041)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_REGION'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(224056196131771816)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226357583446277047)
,p_name=>'AGREGAR_3'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(224056601488771821)
,p_condition_element=>'P177_DIVISION_INTEGRO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226357749548277049)
,p_event_id=>wwv_flow_imp.id(226357583446277047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'INGRESSAR_BLOQUE_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'(',
'	TIPO_REPORTE,',
'	ID_ASOCIACION,',
'	CONCEPTO,',
'	USUARIO_GRABACION,',
'	FECHA_GRABACION',
')',
'VALUES',
'(',
'    52,',
'    :P177_DIVISION_INTEGRO,',
'    ''BLOQUE 3 DE LA CONFIGURACION DEL REPORTE'',',
'    :GLOBAL_CODIGO_USUARIO,',
'    SYSDATE',
');'))
,p_attribute_02=>'P177_DIVISION_INTEGRO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226357823124277050)
,p_event_id=>wwv_flow_imp.id(226357583446277047)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_AICSA,P177_DIVISION_OTRAS_UNIDADES,P177_DIVISION_INTEGRO,P177_DIVISION_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226613541337426601)
,p_event_id=>wwv_flow_imp.id(226357583446277047)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ITEMS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_AICSA,P177_DIVISION_OTRAS_UNIDADES,P177_DIVISION_INTEGRO,P177_DIVISION_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226613629793426602)
,p_event_id=>wwv_flow_imp.id(226357583446277047)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_REGION'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(224056357786771818)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226613731448426603)
,p_name=>'LISTA_INTEGRO'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(224056357786771818)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226613932714426605)
,p_event_id=>wwv_flow_imp.id(226613731448426603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroLineasIR(''LISTA_INTEGRO'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226614813684426614)
,p_name=>'CLEAR_1'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(226614569810426611)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226614907654426615)
,p_event_id=>wwv_flow_imp.id(226614813684426614)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_AICSA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226615041417426616)
,p_name=>'CLEAR_2'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(226614623556426612)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226615176481426617)
,p_event_id=>wwv_flow_imp.id(226615041417426616)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_OTRAS_UNIDADES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226615231685426618)
,p_name=>'CLEAR_3'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(226614733761426613)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226615337708426619)
,p_event_id=>wwv_flow_imp.id(226615231685426618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_INTEGRO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226615911293426625)
,p_name=>'EDITAR_NOTA'
,p_event_sequence=>210
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'EDITAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226616141449426627)
,p_event_id=>wwv_flow_imp.id(226615911293426625)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID,P158_ID_ASOCIACION:''||',
'        :P177_ID_NOTA || '','' || :P177_ID_REGISTRO,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P177_URL',
'FROM DUAL;'))
,p_attribute_02=>'P177_ID_NOTA,P177_ID_REGISTRO'
,p_attribute_03=>'P177_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226616046248426626)
,p_event_id=>wwv_flow_imp.id(226615911293426625)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P177_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226616244119426628)
,p_name=>'CREAR_NOTA'
,p_event_sequence=>220
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P177_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CREAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226616397693426629)
,p_event_id=>wwv_flow_imp.id(226616244119426628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID_ASOCIACION,P158_CTA_VERSION:''|| :P177_ID_REGISTRO || '','' || :P177_VERSION,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P177_URL',
'FROM DUAL;'))
,p_attribute_02=>'P177_ID_NOTA,P177_ID_REGISTRO,P177_VERSION'
,p_attribute_03=>'P177_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226616490504426630)
,p_event_id=>wwv_flow_imp.id(226616244119426628)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P177_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226616588317426631)
,p_name=>'ELIMINAR_NOTA'
,p_event_sequence=>230
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P177_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ELIMINAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226616652162426632)
,p_event_id=>wwv_flow_imp.id(226616588317426631)
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
'WHERE ID = :P174_ID_REGISTRO',
'AND TIPO_REPORTE = 1;*/',
'',
'DELETE FROM SAF.ASOCIACION_PLANTILLA_NOTA_VERSION',
'WHERE ID_PLANTILLA = :P177_ID_REGISTRO',
'AND VERSION = :P177_VERSION;'))
,p_attribute_02=>'P177_ID_NOTA,P177_ID_REGISTRO,P177_VERSION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226616863288426634)
,p_event_id=>wwv_flow_imp.id(226616588317426631)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_ASIGNACION'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA,P177_ID_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226616740551426633)
,p_event_id=>wwv_flow_imp.id(226616588317426631)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1792221627357471412)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226616957169426635)
,p_name=>'ASOCIAR_NOTA'
,p_event_sequence=>240
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P177_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ASOCIAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226617248551426638)
,p_event_id=>wwv_flow_imp.id(226616957169426635)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P177_ID_REGISTRO'').getValue();',
'let version = apex.item(''P177_VERSION'').getValue();',
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
 p_id=>wwv_flow_imp.id(226617323378426639)
,p_name=>'MODIFICAR_RENGLON'
,p_event_sequence=>250
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P177_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODIFICAR_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226617498430426640)
,p_event_id=>wwv_flow_imp.id(226617323378426639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P177_ID_REGISTRO'').getValue();',
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
 p_id=>wwv_flow_imp.id(226865210739637105)
,p_name=>'ELIMINAR_REGISTRO'
,p_event_sequence=>260
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P177_ID_NOTA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ELIMINAR_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226865390554637106)
,p_event_id=>wwv_flow_imp.id(226865210739637105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DELETE'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'    WHERE ID = :P177_ID_NOTA;'))
,p_attribute_02=>'P177_ID_NOTA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226865724368637110)
,p_event_id=>wwv_flow_imp.id(226865210739637105)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226865433224637107)
,p_event_id=>wwv_flow_imp.id(226865210739637105)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(224055882571771813)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P177_TABLA_ORIGEN'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226865530984637108)
,p_event_id=>wwv_flow_imp.id(226865210739637105)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(224056357786771818)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P177_TABLA_ORIGEN'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226865657659637109)
,p_event_id=>wwv_flow_imp.id(226865210739637105)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(224056196131771816)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P177_TABLA_ORIGEN'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234948690367795701)
,p_event_id=>wwv_flow_imp.id(226865210739637105)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(226868090891637133)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P177_TABLA_ORIGEN'
,p_client_condition_expression=>'4'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246237248132454146)
,p_event_id=>wwv_flow_imp.id(226865210739637105)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(246234645857454120)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P177_TABLA_ORIGEN'
,p_client_condition_expression=>'5'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248338869733353928)
,p_event_id=>wwv_flow_imp.id(226865210739637105)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248337509884353915)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P177_TABLA_ORIGEN'
,p_client_condition_expression=>'6'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248341064915353950)
,p_event_id=>wwv_flow_imp.id(226865210739637105)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248339347337353933)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P177_TABLA_ORIGEN'
,p_client_condition_expression=>'7'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226867451286637127)
,p_name=>'CARGAR_DATO'
,p_event_sequence=>270
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P177_ID_REGISTRO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CARGAR_DATO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234950717889795722)
,p_event_id=>wwv_flow_imp.id(226867451286637127)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let registro = apex.item(''P177_ID_REGISTRO'').getValue();',
'',
'var url = `f?p=&APP_ID.:84000:&APP_SESSION.::NO:84000:P84000_ID_REGISTRO,P84000_TIPO_REPORTE:${registro},6`;',
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
 p_id=>wwv_flow_imp.id(226868653181637139)
,p_name=>'AGREGAR_4'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(226867896117637131)
,p_condition_element=>'P177_DIVISION_OTROS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226868848313637141)
,p_event_id=>wwv_flow_imp.id(226868653181637139)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'INGRESSAR_BLOQUE_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'(',
'	TIPO_REPORTE,',
'	ID_ASOCIACION,',
'	CONCEPTO,',
'	USUARIO_GRABACION,',
'	FECHA_GRABACION',
')',
'VALUES',
'(',
'    53,',
'    :P177_DIVISION_OTROS,',
'    ''BLOQUE 4 DE LA CONFIGURACION DEL REPORTE'',',
'    :GLOBAL_CODIGO_USUARIO,',
'    SYSDATE',
');'))
,p_attribute_02=>'P177_DIVISION_OTROS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226868976975637142)
,p_event_id=>wwv_flow_imp.id(226868653181637139)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_AICSA,P177_DIVISION_OTRAS_UNIDADES,P177_DIVISION_INTEGRO,P177_DIVISION_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226869089095637143)
,p_event_id=>wwv_flow_imp.id(226868653181637139)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ITEMS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_AICSA,P177_DIVISION_OTRAS_UNIDADES,P177_DIVISION_INTEGRO,P177_DIVISION_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226869125969637144)
,p_event_id=>wwv_flow_imp.id(226868653181637139)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_REGION'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(226868090891637133)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226869261945637145)
,p_name=>'CLEAR_4'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(226867905986637132)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226869441033637147)
,p_event_id=>wwv_flow_imp.id(226869261945637145)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_DIVISION_OTROS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(234948702800795702)
,p_name=>'LISTA_OTROS'
,p_event_sequence=>300
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(226868090891637133)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234948975717795704)
,p_event_id=>wwv_flow_imp.id(234948702800795702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroLineasIR(''LISTA_OTROS'');'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(234949283676795707)
,p_name=>'DESCARGAR_PLANTILLA'
,p_event_sequence=>310
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'DESCARGAR_PLANTILLA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234949354724795708)
,p_event_id=>wwv_flow_imp.id(234949283676795707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_NOMBRE_ARCHIVO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'PLANTILLA - EERR Costo Unidad.xlsx'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234949694775795711)
,p_event_id=>wwv_flow_imp.id(234949283676795707)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_ID_REPOSITORIO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0000002355'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234949816846795713)
,p_event_id=>wwv_flow_imp.id(234949283676795707)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DESCARGAR'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(234949916817795714)
,p_name=>'SUBIR_PLANTILLA'
,p_event_sequence=>320
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'SUBIR_PLANTILLA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234950047569795715)
,p_event_id=>wwv_flow_imp.id(234949916817795714)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var url = `f?p=&APP_ID.:159:&APP_SESSION.::NO:159:P159_TIPO_REPORTE:6`;',
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
 p_id=>wwv_flow_imp.id(244970983774886621)
,p_name=>'ASOCIAR_PRESUPUESTO'
,p_event_sequence=>330
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ASOCIAR_PRESUPUESTO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244971046022886622)
,p_event_id=>wwv_flow_imp.id(244970983774886621)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var id_registro = apex.item(''P177_ID_REGISTRO'').getValue();',
'',
'var url = `f?p=&APP_ID.:84001:&APP_SESSION.::NO:84001:P84001_TIPO_REPORTE,P84001_ID_REGISTRO:6,${id_registro}`;',
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
 p_id=>wwv_flow_imp.id(246235810835454132)
,p_name=>'CLEAR_55'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(246235765664454131)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246235905673454133)
,p_event_id=>wwv_flow_imp.id(246235810835454132)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_UNIDAD_NEGOCIO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(246236003598454134)
,p_name=>'LISTA_UNIDAD_NEGOCIO'
,p_event_sequence=>350
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(246234645857454120)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246236267511454136)
,p_event_id=>wwv_flow_imp.id(246236003598454134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroLineasIR(''LISTA_UNIDAD_NEGOCIO'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(246236387979454137)
,p_name=>'AGREGAR_55'
,p_event_sequence=>360
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(246235610985454130)
,p_condition_element=>'P177_UNIDAD_NEGOCIO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246236581099454139)
,p_event_id=>wwv_flow_imp.id(246236387979454137)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'(',
'	TIPO_REPORTE,',
'	ID_ASOCIACION,',
'	CONCEPTO,',
'	USUARIO_GRABACION,',
'	FECHA_GRABACION',
')',
'VALUES',
'(',
'    55,',
'    :P177_UNIDAD_NEGOCIO,',
'    ''BLOQUE 1 DE LA CONFIGURACION DEL REPORTE RESUMEN ESTADO DE RESULTADOS'',',
'    :GLOBAL_CODIGO_USUARIO,',
'    SYSDATE',
');'))
,p_attribute_02=>'P177_UNIDAD_NEGOCIO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246236674617454140)
,p_event_id=>wwv_flow_imp.id(246236387979454137)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_UNIDAD_NEGOCIO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246236778916454141)
,p_event_id=>wwv_flow_imp.id(246236387979454137)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ITEMS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_UNIDAD_NEGOCIO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246236837896454142)
,p_event_id=>wwv_flow_imp.id(246236387979454137)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_REGION'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(246234645857454120)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248336784027353907)
,p_name=>'CLEAR_56'
,p_event_sequence=>370
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(248336602488353906)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248336859496353908)
,p_event_id=>wwv_flow_imp.id(248336784027353907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_UNIDAD_NEGOCIO_OTROS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248336927507353909)
,p_name=>'AGREGAR_56'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(248336538838353905)
,p_condition_element=>'P177_UNIDAD_NEGOCIO_OTROS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248337184258353911)
,p_event_id=>wwv_flow_imp.id(248336927507353909)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'(',
'	TIPO_REPORTE,',
'	ID_ASOCIACION,',
'	CONCEPTO,',
'	USUARIO_GRABACION,',
'	FECHA_GRABACION',
')',
'VALUES',
'(',
'    56,',
'    :P177_UNIDAD_NEGOCIO_OTROS,',
'    ''BLOQUE 2 DE LA CONFIGURACION DEL REPORTE RESUMEN ESTADO DE RESULTADOS'',',
'    :GLOBAL_CODIGO_USUARIO,',
'    SYSDATE',
');'))
,p_attribute_02=>'P177_UNIDAD_NEGOCIO_OTROS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248337254791353912)
,p_event_id=>wwv_flow_imp.id(248336927507353909)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_UNIDAD_NEGOCIO_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248337346402353913)
,p_event_id=>wwv_flow_imp.id(248336927507353909)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ITEMS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_UNIDAD_NEGOCIO_OTROS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248337491754353914)
,p_event_id=>wwv_flow_imp.id(248336927507353909)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_REGION'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248337509884353915)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248338177961353921)
,p_name=>'UNIDAD_NEGOCIOS_OTROS'
,p_event_sequence=>390
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(248337509884353915)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248338330348353923)
,p_event_id=>wwv_flow_imp.id(248338177961353921)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroLineasIR(''UNIDAD_NEGOCIOS_OTROS'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248339991565353939)
,p_name=>'CLEAR_57'
,p_event_sequence=>400
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(248339235550353932)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248340072649353940)
,p_event_id=>wwv_flow_imp.id(248339991565353939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_UNIDAD_NEGOCIO_RSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248340171678353941)
,p_name=>'AGREGAR_57'
,p_event_sequence=>410
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(248339178221353931)
,p_condition_element=>'P177_UNIDAD_NEGOCIO_RSE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248340354332353943)
,p_event_id=>wwv_flow_imp.id(248340171678353941)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'(',
'	TIPO_REPORTE,',
'	ID_ASOCIACION,',
'	CONCEPTO,',
'	USUARIO_GRABACION,',
'	FECHA_GRABACION',
')',
'VALUES',
'(',
'    57,',
'    :P177_UNIDAD_NEGOCIO_RSE,',
'    ''BLOQUE 3 DE LA CONFIGURACION DEL REPORTE RESUMEN ESTADO DE RESULTADOS'',',
'    :GLOBAL_CODIGO_USUARIO,',
'    SYSDATE',
');'))
,p_attribute_02=>'P177_UNIDAD_NEGOCIO_RSE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248340483844353944)
,p_event_id=>wwv_flow_imp.id(248340171678353941)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_UNIDAD_NEGOCIO_RSE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248340567787353945)
,p_event_id=>wwv_flow_imp.id(248340171678353941)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ITEMS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P177_UNIDAD_NEGOCIO_RSE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248340680760353946)
,p_event_id=>wwv_flow_imp.id(248340171678353941)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_REGION'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248339347337353933)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248340701976353947)
,p_name=>'UNIDAD_NEGOCIO_RSE'
,p_event_sequence=>420
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(248339347337353933)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248340994912353949)
,p_event_id=>wwv_flow_imp.id(248340701976353947)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroLineasIR(''UNIDAD_NEGOCIO_RSE'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248437677996635106)
,p_name=>'ASOCIAR'
,p_event_sequence=>430
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(248437541164635105)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248437881492635108)
,p_event_id=>wwv_flow_imp.id(248437677996635106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var id_registro = apex.item(''P177_ID_REGISTRO'').getValue();',
'',
'var url = `f?p=&APP_ID.:84001:&APP_SESSION.::NO:84001:P84001_TIPO_REPORTE,P84001_ID_REGISTRO:6,${id_registro}`;',
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(220372161313418600)
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
'    :P177_PERMISOS := 0;',
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
'                :P177_PERMISOS := 1;',
'            END IF;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(220368943335418592)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARAMETOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P177_NOMBRE_TITULO := ''AICSA CORP.'';',
'',
'    /*SELECT',
'        NOMBRE_MONEDA,',
'        SIMBOLO_MONEDA',
'        INTO ',
'        :P177_NOMBRE_MONEDA,',
'        :P177_SIMBOLO_MONEDA',
'    FROM SAF.GRAL_MONEDAS',
'    WHERE CODIGO_MONEDA = :P177_MONEDA;*/',
'',
'    :P177_ANIO_MENOS_1 := TO_NUMBER(:P177_ANIO) - 1;',
'',
'    :P177_FECHA_TITULO := ''Enero a Diciembre'';',
'    ',
unistr('    :P177_ANIO_TITULO := ''A\00F1o '' || TO_CHAR(SYSDATE, ''YYYY'');'),
'',
'    --:P177_DIA_FIN := TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P177_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P177_VERSION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(220370940274418597)
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
