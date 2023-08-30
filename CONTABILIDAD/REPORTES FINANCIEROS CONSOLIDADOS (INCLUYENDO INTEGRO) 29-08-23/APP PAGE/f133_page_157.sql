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
--     PAGE: 157
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00157
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>157);
end;
/
prompt --application/pages/page_00157
begin
wwv_flow_imp_page.create_page(
 p_id=>157
,p_name=>'PLANTILLA_ESTADO_RESULTADO_INTEGRO'
,p_alias=>'PLANTILLA-ESTADO-RESULTADO-INTEGRO'
,p_step_title=>'PLANTILLA_ESTADO_RESULTADO_INTEGRO'
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
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
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
,p_last_upd_yyyymmddhh24miss=>'20230828163630'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195731067874568504)
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
 p_id=>wwv_flow_imp.id(1217075464652064776)
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
 p_id=>wwv_flow_imp.id(1358171925762799296)
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
 p_id=>wwv_flow_imp.id(1563213250399204460)
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
 p_id=>wwv_flow_imp.id(1563213502753204462)
,p_plug_name=>'BALANCE'
,p_parent_plug_id=>wwv_flow_imp.id(1563213250399204460)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>9
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P157_MES_INICIO IS NOT NULL AND',
':P157_MES_FINAL IS NOT NULL AND',
':P157_ANIO IS NOT NULL AND ',
':P157_MONEDA IS NOT NULL AND',
':P157_EMPRESA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1183299260442403905)
,p_plug_name=>'TITULO_REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(1563213502753204462)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:center;">&P157_NOMBRE_TITULO.</h4>',
'<h5 style="text-align:center;">Estado de Resultado</h5>',
'<h5 style="text-align:center;">&P157_FECHA_TITULO.</h5>',
'<h5 style="text-align:center;">(Cifras Expresadas en &P157_NOMBRE_MONEDA.)</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1563214365041204471)
,p_plug_name=>'Balance'
,p_region_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(1563213502753204462)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    TO_NUMBER(C001) ID,',
'    C002 ID_NOTA,',
'    C003 NOMBRE,',
'    C004 COD_CTA,',
'    C005 ORDEN_1,',
'    C006 ORDEN_2,',
'    C007 BOTON,',
'    TO_NUMBER(C008) ANIO_1,',
'    TO_NUMBER(C009) ANIO_2,',
'    C010 TIPO,',
'    C011 CLASE,',
'    TO_NUMBER(C012) ID_NOTA_NUM,',
'    C013 SIMBOLO_MONEDA',
'FROM APEX_COLLECTIONS ',
'WHERE COLLECTION_NAME = ''COLLECTION_INFORME'''))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_imp.id(1563214465436204472)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>1563214465436204472
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195701394605557835)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195701736952557836)
,p_db_column_name=>'COD_CTA'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Cod Cta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195702164768557837)
,p_db_column_name=>'ORDEN_1'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Orden 1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195702507416557837)
,p_db_column_name=>'ORDEN_2'
,p_display_order=>60
,p_column_identifier=>'L'
,p_column_label=>'Orden 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195702995053557838)
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
 p_id=>wwv_flow_imp.id(195703341573557839)
,p_db_column_name=>'ANIO_1'
,p_display_order=>80
,p_column_identifier=>'T'
,p_column_label=>'&P157_ANIO.'
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
 p_id=>wwv_flow_imp.id(195703720213557840)
,p_db_column_name=>'ANIO_2'
,p_display_order=>90
,p_column_identifier=>'U'
,p_column_label=>'&P157_ANIO_MENOS_1.'
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
 p_id=>wwv_flow_imp.id(195704193397557840)
,p_db_column_name=>'TIPO'
,p_display_order=>100
,p_column_identifier=>'V'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195704566974557841)
,p_db_column_name=>'CLASE'
,p_display_order=>110
,p_column_identifier=>'W'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195704934059557842)
,p_db_column_name=>'ID_NOTA_NUM'
,p_display_order=>120
,p_column_identifier=>'X'
,p_column_label=>'Id Nota Num'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195700983398557834)
,p_db_column_name=>'ID_NOTA'
,p_display_order=>130
,p_column_identifier=>'Y'
,p_column_label=>'Nota'
,p_column_type=>'STRING'
,p_static_id=>'ID_NOTA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195700584995557833)
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
 p_id=>wwv_flow_imp.id(195731458241568508)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>150
,p_column_identifier=>'AB'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1563806746180522707)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'1834497'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:ID_NOTA:ANIO_1:ANIO_2:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(195692902499557816)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(1358171925762799296)
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
 p_id=>wwv_flow_imp.id(195731164813568505)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(1358171925762799296)
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
 p_id=>wwv_flow_imp.id(195693377863557817)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(1358171925762799296)
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
 p_id=>wwv_flow_imp.id(195728882521557874)
,p_branch_name=>'CARGAR_DATOS'
,p_branch_action=>'f?p=&APP_ID.:157:&SESSION.::&DEBUG.:157:P157_MES_INICIO,P157_MES_FINAL,P157_ANIO,P157_MONEDA,P157_EMPRESA:&P157_MES_INICIO.,&P157_MES_FINAL.,&P157_ANIO.,&P157_MONEDA.,&P157_EMPRESA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CARGAR_DATOS'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(216563097080949650)
,p_branch_name=>'DESCARGAR'
,p_branch_action=>'f?p=202:38:&SESSION.::&DEBUG.::P38_FILE_NAME,P38_ID_EN_REPOSITORIO:&P157_NOMBRE_ARCHIVO.,&P157_ID_REPOSITORIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DESCARGAR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195693792419557817)
,p_name=>'P157_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
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
 p_id=>wwv_flow_imp.id(195694189612557818)
,p_name=>'P157_MES_INICIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
,p_prompt=>'Mes Inicio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'GRAL_MESES321'
,p_lov=>'.'||wwv_flow_imp.id(141331722281815680)||'.'
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
 p_id=>wwv_flow_imp.id(195694544922557819)
,p_name=>'P157_MES_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
,p_prompt=>'Mes Final'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'GRAL_MESES321'
,p_lov=>'.'||wwv_flow_imp.id(141331722281815680)||'.'
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
 p_id=>wwv_flow_imp.id(195694971253557819)
,p_name=>'P157_ANIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
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
 p_id=>wwv_flow_imp.id(195695330374557820)
,p_name=>'P157_VERSION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
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
 p_id=>wwv_flow_imp.id(195695762287557821)
,p_name=>'P157_ANIO_MENOS_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195696141953557821)
,p_name=>'P157_NOMBRE_TITULO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195696509686557821)
,p_name=>'P157_FECHA_TITULO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195697274153557823)
,p_name=>'P157_ID_NOTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1563213250399204460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195697677910557823)
,p_name=>'P157_ID_REGISTRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1563213250399204460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195698071969557824)
,p_name=>'P157_TIPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1563213250399204460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195698408586557824)
,p_name=>'P157_URL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1563213250399204460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195698846764557825)
,p_name=>'P157_CODIGO_USUARIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1563213250399204460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195699293519557825)
,p_name=>'P157_DIA_FINAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1563213250399204460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195705697171557844)
,p_name=>'P157_JASPER'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195706030105557845)
,p_name=>'P157_AUTENTICATION'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195706411160557845)
,p_name=>'P157_DIA_FIN'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195706831541557846)
,p_name=>'P157_PERMISOS'
,p_item_sequence=>80
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195730981936568503)
,p_name=>'P157_MONEDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
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
 p_id=>wwv_flow_imp.id(195731222774568506)
,p_name=>'P157_NOMBRE_MONEDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195731318594568507)
,p_name=>'P157_SIMBOLO_MONEDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1358171925762799296)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216562660239949646)
,p_name=>'P157_NOMBRE_ARCHIVO'
,p_item_sequence=>90
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216562784254949647)
,p_name=>'P157_ID_REPOSITORIO'
,p_item_sequence=>100
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195710429627557854)
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
 p_id=>wwv_flow_imp.id(195710985864557854)
,p_event_id=>wwv_flow_imp.id(195710429627557854)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID_NOTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P157_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_NOTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195711467083557855)
,p_event_id=>wwv_flow_imp.id(195710429627557854)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P157_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195711969012557855)
,p_event_id=>wwv_flow_imp.id(195710429627557854)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P157_TIPO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195712462210557856)
,p_event_id=>wwv_flow_imp.id(195710429627557854)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'EDITAR_NOTA_223'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA_223'
,p_attribute_02=>'SEP'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P157_TIPO'').getValue() == ''DETALLE'''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195712859671557857)
,p_name=>'EDITAR_NOTA'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P157_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'EDITAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195713316689557857)
,p_event_id=>wwv_flow_imp.id(195712859671557857)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID,P158_ID_ASOCIACION:''||',
'        :P157_ID_NOTA || '','' || :P157_ID_REGISTRO,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P157_URL',
'FROM DUAL;'))
,p_attribute_02=>'P157_ID_NOTA,P157_ID_REGISTRO'
,p_attribute_03=>'P157_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195713892120557858)
,p_event_id=>wwv_flow_imp.id(195712859671557857)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P157_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195714200789557858)
,p_name=>'CREAR_NOTA'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P157_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CREAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195714714273557859)
,p_event_id=>wwv_flow_imp.id(195714200789557858)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID_ASOCIACION,P158_CTA_VERSION:''|| :P157_ID_REGISTRO || '','' || :P157_VERSION,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P157_URL',
'FROM DUAL;'))
,p_attribute_02=>'P157_ID_REGISTRO,P157_VERSION'
,p_attribute_03=>'P157_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195715298832557859)
,p_event_id=>wwv_flow_imp.id(195714200789557858)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P157_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195715618624557859)
,p_name=>'REFRESH_REPORTE'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202307991245953425)
,p_event_id=>wwv_flow_imp.id(195715618624557859)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_REPORTE'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195716585416557861)
,p_name=>'ELIMINAR_NOTA'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P157_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ELIMINAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195717064850557861)
,p_event_id=>wwv_flow_imp.id(195716585416557861)
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
'WHERE ID = :P157_ID_REGISTRO',
'AND TIPO_REPORTE = 2;*/',
'',
'DELETE FROM SAF.ASOCIACION_PLANTILLA_NOTA_VERSION',
'WHERE ID_PLANTILLA = :P157_ID_REGISTRO',
'AND VERSION = :P157_VERSION;'))
,p_attribute_02=>'P157_ID_REGISTRO,P157_VERSION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195717508427557862)
,p_event_id=>wwv_flow_imp.id(195716585416557861)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_ASIGNACION'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P157_ID_NOTA,P157_ID_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195718057972557862)
,p_event_id=>wwv_flow_imp.id(195716585416557861)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ACTIVO'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1563214365041204471)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195718470902557863)
,p_name=>'GENERAR_DATOS'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(195692902499557816)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P157_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P157_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P157_ANIO'').getValue() != '''' &&',
'apex.item(''P157_MONEDA'').getValue() != '''' &&',
'apex.item(''P157_EMPRESA'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195718934836557863)
,p_event_id=>wwv_flow_imp.id(195718470902557863)
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
 p_id=>wwv_flow_imp.id(195719442127557864)
,p_event_id=>wwv_flow_imp.id(195718470902557863)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR_DATOS'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195719809692557864)
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
 p_id=>wwv_flow_imp.id(195720389288557865)
,p_event_id=>wwv_flow_imp.id(195719809692557864)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P157_EMPRESA").getValue();',
'let mesInicio = apex.item("P157_MES_INICIO").getValue();',
'let mesFin = apex.item(''P157_MES_FINAL'').getValue();',
'let anio = apex.item(''P157_ANIO'').getValue();',
'let nota = apex.item(''P157_ID_REGISTRO'').getValue();',
'',
'console.log(empresas.toString());',
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
 p_id=>wwv_flow_imp.id(195720708965557865)
,p_name=>'ASOCIAR_NOTA'
,p_event_sequence=>110
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P157_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ASOCIAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195721201527557866)
,p_event_id=>wwv_flow_imp.id(195720708965557865)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P157_ID_REGISTRO'').getValue();',
'let version = apex.item(''P157_VERSION'').getValue();',
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
 p_id=>wwv_flow_imp.id(195721641278557866)
,p_name=>'MODIFICAR_RENGLON'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P157_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODIFICAR_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195722142813557866)
,p_event_id=>wwv_flow_imp.id(195721641278557866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P157_ID_REGISTRO'').getValue();',
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
 p_id=>wwv_flow_imp.id(195722520683557867)
,p_name=>'IMPRIMIR_REPORTE'
,p_event_sequence=>130
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P157_EMPRESA'').getValue() != '''' &&',
'apex.item(''P157_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P157_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P157_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_REPORTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195723056570557867)
,p_event_id=>wwv_flow_imp.id(195722520683557867)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/Estado_de_Resultados.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P157_JASPER,:P157_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P157_JASPER,P157_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195723523845557868)
,p_event_id=>wwv_flow_imp.id(195722520683557867)
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
 p_id=>wwv_flow_imp.id(195724099312557869)
,p_event_id=>wwv_flow_imp.id(195722520683557867)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P157_JASPER" ).getValue() +',
'    "&P_EMPRESA="+ apex.item( "P157_EMPRESA" ).getValue() +',
'    "&FECHA_FIN=" + apex.item( "P157_DIA_FIN" ).getValue() +',
'    "&MES_FIN="+ apex.item( "P157_MES_FINAL" ).getValue() +',
'    "&ANIO=" + apex.item( "P157_ANIO" ).getValue() +',
'    "&FECHA_INICIO=" + ''1'' +',
'    "&MES_INICIO=" + apex.item( "P157_MES_INICIO" ).getValue() +',
'    "&P_VERSION=" + apex.item( "P157_VERSION" ).getValue() +',
'    "&P_VERSION_CTA=" + apex.item( "P157_VERSION" ).getValue() +',
'    apex.item( "P157_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195724436454557869)
,p_name=>'CALCULAR_DIA_FIN'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P157_MES_FINAL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195724994142557869)
,p_event_id=>wwv_flow_imp.id(195724436454557869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DIA'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'SELECT TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P157_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'') INTO :P157_DIA_FIN FROM DUAL;'
,p_attribute_02=>'P157_MES_FINAL'
,p_attribute_03=>'P157_DIA_FIN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195725302848557870)
,p_name=>'IMPRIMIR_NOTAS'
,p_event_sequence=>150
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P157_EMPRESA'').getValue() != '''' &&',
'apex.item(''P157_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P157_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P157_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_NOTAS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195727364741557872)
,p_event_id=>wwv_flow_imp.id(195725302848557870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_USUARIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P157_CODIGO_USUARIO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':GLOBAL_CODIGO_USUARIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195727851990557873)
,p_event_id=>wwv_flow_imp.id(195725302848557870)
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
 p_id=>wwv_flow_imp.id(195728341210557873)
,p_event_id=>wwv_flow_imp.id(195725302848557870)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DIA_FIN'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P157_DIA_FIN'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'TO_CHAR(LAST_DAY(TO_DATE(''1/'' || :P157_MES_FINAL || ''/'' || :P157_ANIO, ''DD/MM/YYYY'')), ''DD'')'
,p_attribute_07=>'P157_MES_FINAL,P157_ANIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195725841270557871)
,p_event_id=>wwv_flow_imp.id(195725302848557870)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
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
'    DELETE FROM SAF.CON_NOTAS_DETALLE_JASPER WHERE TIPO_REPORTE = 2 AND USUARIO_GRABACION = :GLOBAL_CODIGO_USUARIO;',
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
'                2,',
'                :GLOBAL_CODIGO_USUARIO,',
'                SYSDATE',
'            );',
'    END LOOP;',
'END;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195726384247557871)
,p_event_id=>wwv_flow_imp.id(195725302848557870)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/Estado_de_Resultados_Notas.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P157_JASPER,:P157_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P157_JASPER,P157_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195726869158557872)
,p_event_id=>wwv_flow_imp.id(195725302848557870)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P157_JASPER" ).getValue() +',
'    "&P_CODIGO_EMPRESA="+ apex.item( "P157_EMPRESA" ).getValue() +',
'    "&P_FECHA_INICIO=" + "1" +',
'    "&P_MES_INICIO="+ apex.item( "P157_MES_INICIO" ).getValue() +',
'    "&P_ANIO=" + apex.item( "P157_ANIO" ).getValue() +',
'    "&P_FECHA_FIN=" + apex.item( "P157_DIA_FIN" ).getValue() +',
'    "&P_MES_FIN=" + apex.item( "P157_MES_FINAL" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P157_CODIGO_USUARIO" ).getValue() +',
'    "&P_TIPO_PARAMETRO=" + ''2'' +',
'    apex.item( "P157_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(195730712412568501)
,p_name=>'DATOS_INICIO'
,p_event_sequence=>160
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(195730857117568502)
,p_event_id=>wwv_flow_imp.id(195730712412568501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'BLOQUEAR CAMPOS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P157_VERSION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(202306049082953406)
,p_name=>'CARGAR_DATO_UNITARIO'
,p_event_sequence=>170
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CARGAR_DATO_UNITARIO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202306299162953408)
,p_event_id=>wwv_flow_imp.id(202306049082953406)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:165:&APP_SESSION.::NO:165:P165_REGISTRO,P165_ANIO,P165_ANIO_1,P165_MES_INICIO,P165_MES_FIN,P165_TIPO_REPORTE,P165_EMPRESA:''',
'        || :P157_ID_REGISTRO || '','' || :P157_ANIO || '','' ',
'        || :P157_ANIO_MENOS_1 || '','' || :P157_MES_INICIO || '','' || :P157_MES_FINAL || '',2,'' || :P157_EMPRESA,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P157_URL',
'FROM DUAL;'))
,p_attribute_02=>'P157_ID_REGISTRO,P157_ANIO,P157_ANIO_MENOS_1,P157_MES_INICIO,P157_MES_FINAL,P157_EMPRESA'
,p_attribute_03=>'P157_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202306315856953409)
,p_event_id=>wwv_flow_imp.id(202306049082953406)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P157_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(202306483039953410)
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
 p_id=>wwv_flow_imp.id(202306539737953411)
,p_event_id=>wwv_flow_imp.id(202306483039953410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresa = apex.item(''P157_EMPRESA'').getValue();',
'',
'var url = `f?p=&APP_ID.:159:&APP_SESSION.::NO:159:P159_TIPO_REPORTE,P159_EMPRESA:2,${empresa}`;',
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
 p_id=>wwv_flow_imp.id(216562418142949644)
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
 p_id=>wwv_flow_imp.id(216562518846949645)
,p_event_id=>wwv_flow_imp.id(216562418142949644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P157_NOMBRE_ARCHIVO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'PLANTILLA - Estado de Resultado.xlsx'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216562898176949648)
,p_event_id=>wwv_flow_imp.id(216562418142949644)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P157_ID_REPOSITORIO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0000002296'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216562995580949649)
,p_event_id=>wwv_flow_imp.id(216562418142949644)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DESCARGAR'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(195707214578557847)
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
 p_id=>wwv_flow_imp.id(195710023207557853)
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
'    :P157_PERMISOS := 0;',
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
'                :P157_PERMISOS := 1;',
'            END IF;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(195709605039557852)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARAMETOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NOMBRE_MONEDA,',
'    SIMBOLO_MONEDA',
'    INTO ',
'    :P157_NOMBRE_MONEDA,',
'    :P157_SIMBOLO_MONEDA',
'FROM SAF.GRAL_MONEDAS',
'WHERE CODIGO_MONEDA = :P157_MONEDA;',
'',
':P157_ANIO_MENOS_1 := TO_NUMBER(:P157_ANIO) - 1;',
'',
':P157_NOMBRE_TITULO := SAF.FN_NOMBRE_EMPRESA(:P157_EMPRESA);',
'',
':P157_FECHA_TITULO := ''Del 01 de '' || TO_CHAR(TO_DATE(:P157_MES_INICIO, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' al '' ',
'    || TO_CHAR(LAST_DAY(TO_DATE(''01/''||:P157_MES_FINAL||''/''||:P157_ANIO_MENOS_1,''DD/MM/YYYY'')), ''DD'')',
'    || '' de '' || TO_CHAR(TO_DATE(:P157_MES_FINAL, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' de '' || :P157_ANIO || '' y '' || :P157_ANIO_MENOS_1;',
'',
':P157_DIA_FIN := TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P157_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'');'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P157_MES_INICIO IS NOT NULL AND',
':P157_MES_FINAL IS NOT NULL AND',
':P157_ANIO IS NOT NULL AND',
':P157_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202306614844953412)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            UPPER(''Ingresos Ordinarios'') NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ENCABEZADO'' AS TIPO,',
'            ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            ID,',
'            ID_NOTA,',
'            NOMBRE,',
'            COD_CTA,',
'            ORDEN_1,',
'            ORDEN_2,',
'            BOTON,',
'            NVL(ANIO_1, 0) ANIO_1,',
'            NVL(ANIO_2, 0) ANIO_2,',
'            TIPO,',
'            CLASE,',
'            ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM',
'        (',
'            SELECT',
'                A.ID,',
'                (',
'                    CASE',
'                        WHEN',
'                        (',
'                            SELECT',
'                            	COUNT(B.ID)',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND (B.ANIO = :P157_ANIO OR B.ANIO = :P157_ANIO_MENOS_1)',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                            AND B.VALOR != 0',
'                        ) != 0',
'                        THEN',
'                            ''Registros Cargados: '' ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO ||'' ''',
'                                    ELSE',
'                                        NULL',
'                                END',
'                            ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO_MENOS_1',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO_MENOS_1',
'                                    ELSE',
'                                        NULL',
'                                END',
'                        ELSE',
'                            NULL',
'                    END',
'                ) ID_NOTA,',
'                ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'                A.COD_CTA,',
'                A.ORDEN_1,',
'                A.ORDEN_2,',
'                NULL BOTON,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_1,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO_MENOS_1',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_2,',
'                ''DETALLE'' AS TIPO,',
'                NULL CLASE,',
'                NULL ID_NOTA_NUM',
'            FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'            WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'            AND A.TIPO_REPORTE = 2',
'            ORDER BY A.ID ASC',
'        )',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            ''&emsp;&emsp;'' || ''Total Ingresos Ordinarios'' NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NVL((',
'                SELECT',
'                    SUM((',
'                        SELECT',
'                            SAF.APX_FNC_CONVERSION_MONEDAS',
'                                (',
'                                    B.VALOR,',
'                                    B.MONEDA_ORIGEN,',
'                                    :P157_MONEDA,',
'                                    B.VALOR_CAMBIO,',
'                                    NULL',
'                                )',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                        AND B.ANIO = :P157_ANIO',
'                        AND B.MES_INICIO = :P157_MES_INICIO',
'                        AND B.MES_FIN = :P157_MES_FINAL',
'                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                    ))',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'                AND A.TIPO_REPORTE = 2',
'            ), 0) ANIO_1,',
'            NVL((',
'                SELECT',
'                    SUM((',
'                        SELECT',
'                            SAF.APX_FNC_CONVERSION_MONEDAS',
'                                (',
'                                    B.VALOR,',
'                                    B.MONEDA_ORIGEN,',
'                                    :P157_MONEDA,',
'                                    B.VALOR_CAMBIO,',
'                                    NULL',
'                                )',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                        AND B.ANIO = :P157_ANIO_MENOS_1',
'                        AND B.MES_INICIO = :P157_MES_INICIO',
'                        AND B.MES_FIN = :P157_MES_FINAL',
'                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                    ))',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'                AND A.TIPO_REPORTE = 2',
'            ), 0) ANIO_2,',
'            ''TOTAL'' AS TIPO,',
'            ''font-weight: bold;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            NULL NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ESPACIO'' AS TIPO,',
'            NULL CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            UPPER(''Costos de Ventas'') NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ENCABEZADO'' AS TIPO,',
'            ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            ID,',
'            ID_NOTA,',
'            NOMBRE,',
'            COD_CTA,',
'            ORDEN_1,',
'            ORDEN_2,',
'            BOTON,',
'            NVL(ANIO_1, 0) ANIO_1,',
'            NVL(ANIO_2, 0) ANIO_2,',
'            TIPO,',
'            CLASE,',
'            ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM',
'        (',
'            SELECT',
'                A.ID,',
'                (',
'                    CASE',
'                        WHEN',
'                        (',
'                            SELECT',
'                            	COUNT(B.ID)',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND (B.ANIO = :P157_ANIO OR B.ANIO = :P157_ANIO_MENOS_1)',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                            AND B.VALOR != 0',
'                        ) != 0',
'                        THEN',
'                            ''Registros Cargados: '' ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO ||'' ''',
'                                    ELSE',
'                                        NULL',
'                                END',
'                            ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO_MENOS_1',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO_MENOS_1',
'                                    ELSE',
'                                        NULL',
'                                END',
'                        ELSE',
'                            NULL',
'                    END',
'                ) ID_NOTA,',
'                ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'                A.COD_CTA,',
'                A.ORDEN_1,',
'                A.ORDEN_2,',
'                NULL BOTON,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_1,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO_MENOS_1',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_2,',
'                ''DETALLE'' AS TIPO,',
'                NULL CLASE,',
'                NULL ID_NOTA_NUM',
'            FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'            WHERE A.ORDEN_1 = ''Costos Ventas''',
'            AND A.TIPO_REPORTE = 2',
'            ORDER BY A.ID ASC',
'        )',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            ''&emsp;&emsp;'' || ''Total Costo de Ventas'' NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NVL((',
'                SELECT',
'                    SUM((',
'                        SELECT',
'                            SAF.APX_FNC_CONVERSION_MONEDAS',
'                                (',
'                                    B.VALOR,',
'                                    B.MONEDA_ORIGEN,',
'                                    :P157_MONEDA,',
'                                    B.VALOR_CAMBIO,',
'                                    NULL',
'                                )',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                        AND B.ANIO = :P157_ANIO',
'                        AND B.MES_INICIO = :P157_MES_INICIO',
'                        AND B.MES_FIN = :P157_MES_FINAL',
'                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                    ))',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                WHERE A.ORDEN_1 = ''Costos Ventas''',
'                AND A.TIPO_REPORTE = 2',
'            ), 0) ANIO_1,',
'            NVL((',
'                SELECT',
'                    SUM((',
'                        SELECT',
'                            SAF.APX_FNC_CONVERSION_MONEDAS',
'                                (',
'                                    B.VALOR,',
'                                    B.MONEDA_ORIGEN,',
'                                    :P157_MONEDA,',
'                                    B.VALOR_CAMBIO,',
'                                    NULL',
'                                )',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                        AND B.ANIO = :P157_ANIO_MENOS_1',
'                        AND B.MES_INICIO = :P157_MES_INICIO',
'                        AND B.MES_FIN = :P157_MES_FINAL',
'                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                    ))',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                WHERE A.ORDEN_1 = ''Costos Ventas''',
'                AND A.TIPO_REPORTE = 2',
'            ), 0) ANIO_2,',
'            ''TOTAL'' AS TIPO,',
'            ''font-weight: bold;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            NULL NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ESPACIO'' AS TIPO,',
'            NULL CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            ''&emsp;&emsp;'' || ''Ganancia Bruta'' NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            (',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Costos Ventas''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'            ) ANIO_1,',
'            (',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Costos Ventas''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'            ) ANIO_2,',
'            ''TOTAL'' AS TIPO,',
'            ''font-weight: bold;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            NULL NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ESPACIO'' AS TIPO,',
'            NULL CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            ID,',
'            ID_NOTA,',
'            NOMBRE,',
'            COD_CTA,',
'            ORDEN_1,',
'            ORDEN_2,',
'            BOTON,',
'            NVL(ANIO_1, 0) ANIO_1,',
'            NVL(ANIO_2, 0) ANIO_2,',
'            TIPO,',
'            CLASE,',
'            ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM',
'        (',
'            SELECT',
'                A.ID,',
'                (',
'                    CASE',
'                        WHEN',
'                        (',
'                            SELECT',
'                            	COUNT(B.ID)',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND (B.ANIO = :P157_ANIO OR B.ANIO = :P157_ANIO_MENOS_1)',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                            AND B.VALOR != 0',
'                        ) != 0',
'                        THEN',
'                            ''Registros Cargados: '' ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO ||'' ''',
'                                    ELSE',
'                                        NULL',
'                                END',
'                            ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO_MENOS_1',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO_MENOS_1',
'                                    ELSE',
'                                        NULL',
'                                END',
'                        ELSE',
'                            NULL',
'                    END',
'                ) ID_NOTA,',
'                ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'                A.COD_CTA,',
'                A.ORDEN_1,',
'                A.ORDEN_2,',
'                NULL BOTON,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_1,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO_MENOS_1',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_2,',
'                ''DETALLE'' AS TIPO,',
'                NULL CLASE,',
'                NULL ID_NOTA_NUM',
'            FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'            WHERE A.ORDEN_1 = ''Otros Ingresos''',
'            AND A.TIPO_REPORTE = 2',
'            ORDER BY A.ID ASC',
'        )',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            NULL NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ESPACIO'' AS TIPO,',
'            NULL CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            UPPER(''Gastos de Operacion'') NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ENCABEZADO'' AS TIPO,',
'            ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        APEX_COLLECTION.ADD_MEMBER',
'        (',
'            p_collection_name => ''COLLECTION_INFORME'',',
'            p_c001 => R_DATOS.ID,',
'            p_c002 => R_DATOS.ID_NOTA,',
'            p_c003 => R_DATOS.NOMBRE,',
'            p_c004 => R_DATOS.COD_CTA,',
'            p_c005 => R_DATOS.ORDEN_1,',
'            p_c006 => R_DATOS.ORDEN_2,',
'            p_c007 => R_DATOS.BOTON,',
'            p_c008 => R_DATOS.ANIO_1,',
'            p_c009 => R_DATOS.ANIO_2,',
'            p_c010 => R_DATOS.TIPO,',
'            p_c011 => R_DATOS.CLASE,',
'            p_c012 => R_DATOS.ID_NOTA_NUM,',
'            p_c013 => R_DATOS.SIMBOLO_MONEDA',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P157_MES_INICIO IS NOT NULL AND',
':P157_MES_FINAL IS NOT NULL AND',
':P157_ANIO IS NOT NULL AND',
':P157_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202308053443953426)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            ID,',
'            ID_NOTA,',
'            NOMBRE,',
'            COD_CTA,',
'            ORDEN_1,',
'            ORDEN_2,',
'            BOTON,',
'            NVL(ANIO_1, 0) ANIO_1,',
'            NVL(ANIO_2, 0) ANIO_2,',
'            TIPO,',
'            CLASE,',
'            ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM',
'        (',
'            SELECT',
'                A.ID,',
'                (',
'                    CASE',
'                        WHEN',
'                        (',
'                            SELECT',
'                            	COUNT(B.ID)',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND (B.ANIO = :P157_ANIO OR B.ANIO = :P157_ANIO_MENOS_1)',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                            AND B.VALOR != 0',
'                        ) != 0',
'                        THEN',
'                            ''Registros Cargados: '' ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO ||'' ''',
'                                    ELSE',
'                                        NULL',
'                                END',
'                            ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO_MENOS_1',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO_MENOS_1',
'                                    ELSE',
'                                        NULL',
'                                END',
'                        ELSE',
'                            NULL',
'                    END',
'                ) ID_NOTA,',
'                ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'                A.COD_CTA,',
'                A.ORDEN_1,',
'                A.ORDEN_2,',
'                NULL BOTON,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_1,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO_MENOS_1',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_2,',
'                ''DETALLE'' AS TIPO,',
'                NULL CLASE,',
'                NULL ID_NOTA_NUM',
'            FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'            WHERE A.ORDEN_1 = ''Gastos de Operacion''',
'            AND A.TIPO_REPORTE = 2',
'            ORDER BY A.ID ASC',
'        )',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            NULL NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ESPACIO'' AS TIPO,',
'            NULL CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            ''&emsp;&emsp;'' || ''Total Gastos de Operacion'' NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NVL((',
'                SELECT',
'                    SUM((',
'                        SELECT',
'                            SAF.APX_FNC_CONVERSION_MONEDAS',
'                                (',
'                                    B.VALOR,',
'                                    B.MONEDA_ORIGEN,',
'                                    :P157_MONEDA,',
'                                    B.VALOR_CAMBIO,',
'                                    NULL',
'                                )',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                        AND B.ANIO = :P157_ANIO',
'                        AND B.MES_INICIO = :P157_MES_INICIO',
'                        AND B.MES_FIN = :P157_MES_FINAL',
'                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                    ))',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                WHERE A.ORDEN_1 = ''Gastos de Operacion''',
'                AND A.TIPO_REPORTE = 2',
'            ), 0) ANIO_1,',
'            NVL((',
'                SELECT',
'                    SUM((',
'                        SELECT',
'                            SAF.APX_FNC_CONVERSION_MONEDAS',
'                                (',
'                                    B.VALOR,',
'                                    B.MONEDA_ORIGEN,',
'                                    :P157_MONEDA,',
'                                    B.VALOR_CAMBIO,',
'                                    NULL',
'                                )',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                        AND B.ANIO = :P157_ANIO_MENOS_1',
'                        AND B.MES_INICIO = :P157_MES_INICIO',
'                        AND B.MES_FIN = :P157_MES_FINAL',
'                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                    ))',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                WHERE A.ORDEN_1 = ''Gastos de Operacion''',
'                AND A.TIPO_REPORTE = 2',
'            ), 0) ANIO_2,',
'            ''TOTAL'' AS TIPO,',
'            ''font-weight: bold;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            NULL NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ESPACIO'' AS TIPO,',
'            NULL CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            UPPER(''Otros Gastos'') NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ENCABEZADO'' AS TIPO,',
'            ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            ID,',
'            ID_NOTA,',
'            NOMBRE,',
'            COD_CTA,',
'            ORDEN_1,',
'            ORDEN_2,',
'            BOTON,',
'            NVL(ANIO_1, 0) ANIO_1,',
'            NVL(ANIO_2, 0) ANIO_2,',
'            TIPO,',
'            CLASE,',
'            ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM',
'        (',
'            SELECT',
'                A.ID,',
'                (',
'                    CASE',
'                        WHEN',
'                        (',
'                            SELECT',
'                            	COUNT(B.ID)',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND (B.ANIO = :P157_ANIO OR B.ANIO = :P157_ANIO_MENOS_1)',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                            AND B.VALOR != 0',
'                        ) != 0',
'                        THEN',
'                            ''Registros Cargados: '' ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO ||'' ''',
'                                    ELSE',
'                                        NULL',
'                                END',
'                            ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO_MENOS_1',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO_MENOS_1',
'                                    ELSE',
'                                        NULL',
'                                END',
'                        ELSE',
'                            NULL',
'                    END',
'                ) ID_NOTA,',
'                ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'                A.COD_CTA,',
'                A.ORDEN_1,',
'                A.ORDEN_2,',
'                NULL BOTON,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_1,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO_MENOS_1',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_2,',
'                ''DETALLE'' AS TIPO,',
'                NULL CLASE,',
'                NULL ID_NOTA_NUM',
'            FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'            WHERE A.ORDEN_1 = ''Otros Gastos''',
'            AND A.TIPO_REPORTE = 2',
'            ORDER BY A.ID ASC',
'        )',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            NULL NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ESPACIO'' AS TIPO,',
'            NULL CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            ''&emsp;&emsp;'' || ''Resultado Antes de Impuesto Sobre la Renta'' NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            (',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Costos Ventas''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                +',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Otros Ingresos''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Gastos de Operacion''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Otros Gastos''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'            ) ANIO_1,',
'            (',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Costos Ventas''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                +',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Otros Ingresos''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Gastos de Operacion''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Otros Gastos''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'            ) ANIO_2,',
'            ''TOTAL'' AS TIPO,',
'            ''font-weight: bold;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            NULL NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ESPACIO'' AS TIPO,',
'            NULL CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        APEX_COLLECTION.ADD_MEMBER',
'        (',
'            p_collection_name => ''COLLECTION_INFORME'',',
'            p_c001 => R_DATOS.ID,',
'            p_c002 => R_DATOS.ID_NOTA,',
'            p_c003 => R_DATOS.NOMBRE,',
'            p_c004 => R_DATOS.COD_CTA,',
'            p_c005 => R_DATOS.ORDEN_1,',
'            p_c006 => R_DATOS.ORDEN_2,',
'            p_c007 => R_DATOS.BOTON,',
'            p_c008 => R_DATOS.ANIO_1,',
'            p_c009 => R_DATOS.ANIO_2,',
'            p_c010 => R_DATOS.TIPO,',
'            p_c011 => R_DATOS.CLASE,',
'            p_c012 => R_DATOS.ID_NOTA_NUM,',
'            p_c013 => R_DATOS.SIMBOLO_MONEDA',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P157_MES_INICIO IS NOT NULL AND',
':P157_MES_FINAL IS NOT NULL AND',
':P157_ANIO IS NOT NULL AND',
':P157_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202308100229953427)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            ID,',
'            ID_NOTA,',
'            NOMBRE,',
'            COD_CTA,',
'            ORDEN_1,',
'            ORDEN_2,',
'            BOTON,',
'            NVL(ANIO_1, 0) ANIO_1,',
'            NVL(ANIO_2, 0) ANIO_2,',
'            TIPO,',
'            CLASE,',
'            ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM',
'        (',
'            SELECT',
'                A.ID,',
'                (',
'                    CASE',
'                        WHEN',
'                        (',
'                            SELECT',
'                            	COUNT(B.ID)',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND (B.ANIO = :P157_ANIO OR B.ANIO = :P157_ANIO_MENOS_1)',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                            AND B.VALOR != 0',
'                        ) != 0',
'                        THEN',
'                            ''Registros Cargados: '' ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO ||'' ''',
'                                    ELSE',
'                                        NULL',
'                                END',
'                            ||',
'                                CASE',
'                                    WHEN',
'                                    (',
'                                        SELECT',
'                                        	COUNT(B.ID)',
'                                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                                        WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                                        AND B.ANIO = :P157_ANIO_MENOS_1',
'                                        AND B.MES_INICIO = :P157_MES_INICIO',
'                                        AND B.MES_FIN = :P157_MES_FINAL',
'                                        AND B.ID_PLANTILLA_NOTA = A.ID',
'                                        AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                                        AND B.VALOR != 0',
'                                    ) != 0',
'                                    THEN',
'                                        :P157_ANIO_MENOS_1',
'                                    ELSE',
'                                        NULL',
'                                END',
'                        ELSE',
'                            NULL',
'                    END',
'                ) ID_NOTA,',
'                ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'                A.COD_CTA,',
'                A.ORDEN_1,',
'                A.ORDEN_2,',
'                NULL BOTON,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_1,',
'                (',
'                    SELECT',
'                    	SAF.APX_FNC_CONVERSION_MONEDAS',
'                    		(',
'                    			B.VALOR,',
'                    			B.MONEDA_ORIGEN,',
'                    			:P157_MONEDA,',
'                    			B.VALOR_CAMBIO,',
'                    			NULL',
'                    		)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                    WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                    AND B.ANIO = :P157_ANIO_MENOS_1',
'                    AND B.MES_INICIO = :P157_MES_INICIO',
'                    AND B.MES_FIN = :P157_MES_FINAL',
'                    AND B.ID_PLANTILLA_NOTA = A.ID',
'                    AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                ) ANIO_2,',
'                ''DETALLE'' AS TIPO,',
'                NULL CLASE,',
'                NULL ID_NOTA_NUM',
'            FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'            WHERE A.ORDEN_1 = ''Impuesto''',
'            AND A.TIPO_REPORTE = 2',
'            ORDER BY A.ID ASC',
'        )',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            NULL NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            NULL ANIO_1,',
'            NULL ANIO_2,',
'            ''ESPACIO'' AS TIPO,',
'            NULL CLASE,',
'            NULL ID_NOTA_NUM,',
'            NULL SIMBOLO_MONEDA',
'        FROM DUAL',
'        UNION ALL',
'        SELECT',
'            NULL ID,',
'            NULL ID_NOTA,',
'            ''&emsp;&emsp;'' || ''Resultado del Periodo'' NOMBRE,',
'            NULL COD_CTA,',
'            NULL ORDEN_1,',
'            NULL ORDEN_2,',
'            NULL BOTON,',
'            (',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Costos Ventas''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                +',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Otros Ingresos''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Gastos de Operacion''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Otros Gastos''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Impuesto''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'            ) ANIO_1,',
'            (',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Costos Ventas''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                +',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Otros Ingresos''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Gastos de Operacion''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Otros Gastos''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'                -',
'                NVL((',
'                    SELECT',
'                        SUM((',
'                            SELECT',
'                                SAF.APX_FNC_CONVERSION_MONEDAS',
'                                    (',
'                                        B.VALOR,',
'                                        B.MONEDA_ORIGEN,',
'                                        :P157_MONEDA,',
'                                        B.VALOR_CAMBIO,',
'                                        NULL',
'                                    )',
'                            FROM SAF.REPORTES_FINANCIEROS_INTEGRO B',
'                            WHERE B.TIPO_REPORTE = A.TIPO_REPORTE',
'                            AND B.ANIO = :P157_ANIO_MENOS_1',
'                            AND B.MES_INICIO = :P157_MES_INICIO',
'                            AND B.MES_FIN = :P157_MES_FINAL',
'                            AND B.ID_PLANTILLA_NOTA = A.ID',
'                            AND B.CODIGO_EMPRESA = :P157_EMPRESA',
'                        ))',
'                    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'                    WHERE A.ORDEN_1 = ''Impuesto''',
'                    AND A.TIPO_REPORTE = 2',
'                ), 0)',
'            ) ANIO_2,',
'            ''TOTAL'' AS TIPO,',
'            ''font-weight: bold;'' AS CLASE,',
'            NULL ID_NOTA_NUM,',
'            :P157_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'        FROM DUAL;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        APEX_COLLECTION.ADD_MEMBER',
'        (',
'            p_collection_name => ''COLLECTION_INFORME'',',
'            p_c001 => R_DATOS.ID,',
'            p_c002 => R_DATOS.ID_NOTA,',
'            p_c003 => R_DATOS.NOMBRE,',
'            p_c004 => R_DATOS.COD_CTA,',
'            p_c005 => R_DATOS.ORDEN_1,',
'            p_c006 => R_DATOS.ORDEN_2,',
'            p_c007 => R_DATOS.BOTON,',
'            p_c008 => R_DATOS.ANIO_1,',
'            p_c009 => R_DATOS.ANIO_2,',
'            p_c010 => R_DATOS.TIPO,',
'            p_c011 => R_DATOS.CLASE,',
'            p_c012 => R_DATOS.ID_NOTA_NUM,',
'            p_c013 => R_DATOS.SIMBOLO_MONEDA',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P157_MES_INICIO IS NOT NULL AND',
':P157_MES_FINAL IS NOT NULL AND',
':P157_ANIO IS NOT NULL AND',
':P157_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(195708855381557850)
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
null;
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
