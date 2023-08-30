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
--     PAGE: 84000
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84000
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84000);
end;
/
prompt --application/pages/page_84000
begin
wwv_flow_imp_page.create_page(
 p_id=>84000
,p_name=>'EERR_COST_UNIDAD_CARGA_INTEGRO'
,p_alias=>'EERR-COST-UNIDAD-CARGA-INTEGRO'
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function eliminarRegistro() {',
'    $.event.trigger(''ELIMINAR_REGISTRO'');',
'}',
'',
'function editarRegistro() {',
'    $.event.trigger(''EDITAR_REGISTRO'');',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#LISTA_R6 th#ICON, #LISTA_R6 td[headers=ICON]',
'{',
'    width: 50px !important;',
'    min-width: 50px !important;',
'    max-width: 50px !important;',
'}',
'',
'#LISTA_R6 th#MONEDA, #LISTA_R6 td[headers=MONEDA],',
'#LISTA_R6 th#MES, #LISTA_R6 td[headers=MES]',
'{',
'    width: 200px !important;',
'    min-width: 200px !important;',
'    max-width: 200px !important;',
'}',
'',
'#LISTA_R6 th#VALOR, #LISTA_R6 td[headers=VALOR]',
'{',
'    width: 300px !important;',
'    min-width: 300px !important;',
'    max-width: 300px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'MODAL_CRUD_EERR'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230821101840'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(234950856942795723)
,p_plug_name=>'LISTA_R6'
,p_region_name=>'LISTA_R6'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	A.ID,',
'	A.MONEDA_ORIGEN,',
'	A.VALOR_CAMBIO,',
'	A.VALOR,',
'    A.MES_FIN,',
'    A.CONCEPTO,',
'	A.CODIGO_EMPRESA,',
'	(B.CODIGO_SECCION || '' - '' || B.NOMBRE_SECCION) NOMBRE,',
'    C.SIMBOLO_MONEDA,',
'    C.NOMBRE_MONEDA,',
'    (',
'        CASE',
'            WHEN A.CONCEPTO IS NULL THEN',
'                NULL',
'            ELSE',
'                ''fa-file-x''',
'        END',
'    ) ICON',
'FROM SAF.REPORTES_FINANCIEROS_INTEGRO A',
'LEFT JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.CODIGO_EMPRESA',
'INNER JOIN SAF.GRAL_MONEDAS C ON C.CODIGO_MONEDA = A.MONEDA_ORIGEN',
'WHERE A.TIPO_REPORTE = :P84000_TIPO_REPORTE',
'AND A.ANIO = :P84000_ANIO',
'AND A.ID_PLANTILLA_NOTA = :P84000_ID_REGISTRO',
'AND A.CODIGO_EMPRESA = :P84000_SECCION',
'ORDER BY A.MES_FIN ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84000_TIPO_REPORTE,P84000_ANIO,P84000_ID_REGISTRO,P84000_SECCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P84000_TIPO_REPORTE'
,p_plug_display_when_cond2=>'6'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LISTA_R6'
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
 p_id=>wwv_flow_imp.id(242188745612549303)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>242188745612549303
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242188853372549304)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242188992556549305)
,p_db_column_name=>'MONEDA_ORIGEN'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Moneda Origen'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242189056708549306)
,p_db_column_name=>'VALOR_CAMBIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Cambio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242189134169549307)
,p_db_column_name=>'VALOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="float:left; padding-right: 2px;">#SIMBOLO_MONEDA#</div> <div style="float:right;">#VALOR#</div>',
'',
'<input id="ID" type="hidden" value="#ID#">'))
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'VALOR'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242189210006549308)
,p_db_column_name=>'CODIGO_EMPRESA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Codigo Empresa'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242189384530549309)
,p_db_column_name=>'NOMBRE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242189489618549310)
,p_db_column_name=>'CONCEPTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242189585627549311)
,p_db_column_name=>'MES_FIN'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Mes'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_static_id=>'MES'
,p_rpt_named_lov=>wwv_flow_imp.id(105398202110893169)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242189625700549312)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242189749584549313)
,p_db_column_name=>'NOMBRE_MONEDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Moneda'
,p_column_type=>'STRING'
,p_static_id=>'MONEDA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(242189846015549314)
,p_db_column_name=>'ICON'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'<i class="fa fa-file-x"></i> '
,p_column_html_expression=>'<span class="fa fa #ICON#"></span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'ICON'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(242211412739558233)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2422115'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'ICON:CONCEPTO:MES_FIN:NOMBRE_MONEDA:VALOR:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(234951044425795725)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(242190167820549317)
,p_plug_name=>'CARGAR DATOS'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P84000_TIPO_REPORTE'
,p_plug_display_when_cond2=>'6'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(234951513972795730)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(234951044425795725)
,p_button_name=>'BUSCAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Buscar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(242193001808549346)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(242190167820549317)
,p_button_name=>'Cancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(242193199760549347)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(242190167820549317)
,p_button_name=>'Guardar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Guardar'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(234950616883795721)
,p_name=>'P84000_ID_REGISTRO'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(234951159190795726)
,p_name=>'P84000_SECCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(234951044425795725)
,p_prompt=>'Seccion'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	(CODIGO_SECCION || '' - '' || NOMBRE_SECCION) NOMBRE,',
'	CODIGO_SECCION',
'FROM SAF.GRAL_SECCIONES ',
'WHERE CODIGO_DIVISION IS NOT NULL',
'ORDER BY CODIGO_SECCION ASC;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>5
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
 p_id=>wwv_flow_imp.id(234951466997795729)
,p_name=>'P84000_ANIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(234951044425795725)
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
 p_id=>wwv_flow_imp.id(234952310751795738)
,p_name=>'P84000_TIPO_REPORTE'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242191628560549332)
,p_name=>'P84000_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(242190167820549317)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242191728520549333)
,p_name=>'P84000_MES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(242190167820549317)
,p_prompt=>'Mes'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'GRAL_MESES'
,p_lov=>'.'||wwv_flow_imp.id(105398202110893169)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(242191856246549334)
,p_name=>'P84000_MONEDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(242190167820549317)
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	NOMBRE_MONEDA,',
'	CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(242191953540549335)
,p_name=>'P84000_TIPO_CAMBIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(242190167820549317)
,p_prompt=>'Cambio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242192079313549336)
,p_name=>'P84000_VALOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(242190167820549317)
,p_prompt=>'Valor'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242192135000549337)
,p_name=>'P84000_ES_ELIMINACION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(242190167820549317)
,p_prompt=>'Es Eliminacion'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636457529244025)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'S'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242192411437549340)
,p_name=>'P84000_ID_LISTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(234950856942795723)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(244970745245886619)
,p_name=>'P84000_NOMBRE_MODAL'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(244970579929886617)
,p_name=>'CARGAR_NOMBRE'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244970821890886620)
,p_event_id=>wwv_flow_imp.id(244970579929886617)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_NOMBRE_MODAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	''Renglon: '' || NOMBRE',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS',
'WHERE TIPO_REPORTE = :P84000_TIPO_REPORTE',
'AND ID = :P84000_ID_REGISTRO'))
,p_attribute_07=>'P84000_ID_REGISTRO,P84000_TIPO_REPORTE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244970655605886618)
,p_event_id=>wwv_flow_imp.id(244970579929886617)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".MODAL_CRUD_EERR .ui-dialog-title").text(apex.item(''P84000_NOMBRE_MODAL'').getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(234952470758795739)
,p_name=>'CARGA_DATOS'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234952517125795740)
,p_event_id=>wwv_flow_imp.id(234952470758795739)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'REGION_R6'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(234950856942795723)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242191411335549330)
,p_event_id=>wwv_flow_imp.id(234952470758795739)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'CARGAR_DATOS_R6'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(242190167820549317)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(234952623891795741)
,p_name=>'BUSCAR'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(234951513972795730)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84000_SECCION'').getValue() != '''' &&',
'apex.item(''P84000_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234952786957795742)
,p_event_id=>wwv_flow_imp.id(234952623891795741)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'REGION_R6'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(234950856942795723)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84000_TIPO_REPORTE'
,p_client_condition_expression=>'6'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234952808661795743)
,p_event_id=>wwv_flow_imp.id(234952623891795741)
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
 p_id=>wwv_flow_imp.id(242191523511549331)
,p_event_id=>wwv_flow_imp.id(234952623891795741)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_R6'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(242190167820549317)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84000_TIPO_REPORTE'
,p_client_condition_expression=>'6'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(234953015507795745)
,p_event_id=>wwv_flow_imp.id(234952623891795741)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_R6'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(234950856942795723)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84000_TIPO_REPORTE'
,p_client_condition_expression=>'6'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(242189975249549315)
,p_name=>'LISTA_R6'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(234950856942795723)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242190085825549316)
,p_event_id=>wwv_flow_imp.id(242189975249549315)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroRegistrosIR(''LISTA_R6'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(242192280145549338)
,p_name=>'EDITAR_CARGA_DATOS'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA_R6 td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242192323813549339)
,p_event_id=>wwv_flow_imp.id(242192280145549338)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ID_LISTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242192547666549341)
,p_event_id=>wwv_flow_imp.id(242192280145549338)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'EDICION'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'CRUD'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "CREAR": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(242192604884549342)
,p_name=>'ELIMINAR_REGISTRO'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ELIMINAR_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242192858662549344)
,p_event_id=>wwv_flow_imp.id(242192604884549342)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ELIMINAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'DELETE FROM SAF.REPORTES_FINANCIEROS_INTEGRO WHERE ID = :P84000_ID_LISTA;'
,p_attribute_02=>'P84000_ID_LISTA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84000_TIPO_REPORTE'
,p_client_condition_expression=>'6'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242192917462549345)
,p_event_id=>wwv_flow_imp.id(242192604884549342)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ID_R6'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ID_LISTA'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84000_TIPO_REPORTE'
,p_client_condition_expression=>'6'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242192733399549343)
,p_event_id=>wwv_flow_imp.id(242192604884549342)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REPORTE_R6'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(234950856942795723)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84000_TIPO_REPORTE'
,p_client_condition_expression=>'6'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(242193220573549348)
,p_name=>'CANCELAR'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(242193001808549346)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242193330638549349)
,p_event_id=>wwv_flow_imp.id(242193220573549348)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR_CAMPOS'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ID,P84000_MES,P84000_MONEDA,P84000_TIPO_CAMBIO,P84000_VALOR,P84000_ID_LISTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(242193464965549350)
,p_event_id=>wwv_flow_imp.id(242193220573549348)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ES_ELIMINACION'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ES_ELIMINACION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244969150808886603)
,p_event_id=>wwv_flow_imp.id(242193220573549348)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'ENABLE_ITEMS'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ES_ELIMINACION,P84000_MES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(244968948516886601)
,p_name=>'EDITAR'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(242193199760549347)
,p_condition_element=>'P84000_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244969002467886602)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'EDITAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO SET',
'    MONEDA_ORIGEN = :P84000_MONEDA,',
'    VALOR_CAMBIO = :P84000_TIPO_CAMBIO,',
'    VALOR = :P84000_VALOR,',
'    USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'    FECHA_MODIFICACION = SYSDATE',
'WHERE ID = :P84000_ID;'))
,p_attribute_02=>'P84000_MONEDA,P84000_TIPO_CAMBIO,P84000_VALOR,P84000_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244970361112886615)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATO IS',
'        SELECT',
'            COUNT(*)',
'        FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'        WHERE ANIO = :P84000_ANIO',
'        AND MES_INICIO = 1',
'        AND MES_FIN = :P84000_MES',
'        AND TIPO_REPORTE = :P84000_TIPO_REPORTE',
'        AND ID_PLANTILLA_NOTA = :P84000_ID_REGISTRO',
'        AND CODIGO_EMPRESA = :P84000_SECCION',
'        AND CONCEPTO IS NULL;',
'    ',
'    V_COUNT NUMBER;',
'BEGIN',
'    OPEN C_DATO;',
'        FETCH C_DATO INTO V_COUNT;',
'    CLOSE C_DATO;',
'',
'    IF V_COUNT = 0 THEN',
'        INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO',
'        (',
'            ANIO,',
'            MES_INICIO,',
'            MES_FIN,',
'            MONEDA_ORIGEN,',
'            VALOR_CAMBIO,',
'            VALOR,',
'            TIPO_REPORTE,',
'            ID_PLANTILLA_NOTA,',
'            USUARIO_GRABACION,',
'            FECHA_GRABACION,',
'            CODIGO_EMPRESA',
'        )',
'        VALUES',
'        (',
'            :P84000_ANIO,',
'            1,',
'            :P84000_MES,',
'            :P84000_MONEDA,',
'            :P84000_TIPO_CAMBIO,',
'            :P84000_VALOR,',
'            :P84000_TIPO_REPORTE,',
'            :P84000_ID_REGISTRO,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE,',
'            :P84000_SECCION',
'        );',
'    ELSE',
'        UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO SET ',
'            MONEDA_ORIGEN = :P84000_MONEDA,',
'            VALOR_CAMBIO = :P84000_TIPO_CAMBIO,',
'            VALOR = :P84000_VALOR,',
'            USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'            FECHA_MODIFICACION = SYSDATE',
'        WHERE ANIO = :P84000_ANIO',
'        AND MES_INICIO = 1',
'        AND MES_FIN = :P84000_MES',
'        AND TIPO_REPORTE = :P84000_TIPO_REPORTE',
'        AND ID_PLANTILLA_NOTA = :P84000_ID_REGISTRO',
'        AND CODIGO_EMPRESA = :P84000_SECCION',
'        AND CONCEPTO IS NULL;',
'    END IF;',
'END;'))
,p_attribute_02=>'P84000_ID_REGISTRO,P84000_SECCION,P84000_ANIO,P84000_TIPO_REPORTE,P84000_MES,P84000_MONEDA,P84000_TIPO_CAMBIO,P84000_VALOR,P84000_ES_ELIMINACION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84000_ES_ELIMINACION'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244969299035886604)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR_CAMPOS'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ID,P84000_MES,P84000_MONEDA,P84000_TIPO_CAMBIO,P84000_VALOR,P84000_ID_LISTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244970419357886616)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_ELIMINACION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATO IS',
'        SELECT',
'            COUNT(*)',
'        FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'        WHERE ANIO = :P84000_ANIO',
'        AND MES_INICIO = 1',
'        AND MES_FIN = :P84000_MES',
'        AND TIPO_REPORTE = :P84000_TIPO_REPORTE',
'        AND ID_PLANTILLA_NOTA = :P84000_ID_REGISTRO',
'        AND CODIGO_EMPRESA = :P84000_SECCION',
'        AND CONCEPTO = ''ELIMINACION'';',
'    ',
'    V_COUNT NUMBER;',
'BEGIN',
'    OPEN C_DATO;',
'        FETCH C_DATO INTO V_COUNT;',
'    CLOSE C_DATO;',
'',
'    IF V_COUNT = 0 THEN',
'        INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO',
'        (',
'            ANIO,',
'            MES_INICIO,',
'            MES_FIN,',
'            MONEDA_ORIGEN,',
'            VALOR_CAMBIO,',
'            VALOR,',
'            TIPO_REPORTE,',
'            ID_PLANTILLA_NOTA,',
'            USUARIO_GRABACION,',
'            FECHA_GRABACION,',
'            CODIGO_EMPRESA,',
'            CONCEPTO',
'        )',
'        VALUES',
'        (',
'            :P84000_ANIO,',
'            1,',
'            :P84000_MES,',
'            :P84000_MONEDA,',
'            :P84000_TIPO_CAMBIO,',
'            :P84000_VALOR,',
'            :P84000_TIPO_REPORTE,',
'            :P84000_ID_REGISTRO,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE,',
'            :P84000_SECCION,',
'            ''ELIMINACION''',
'        );',
'    ELSE',
'        UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO SET ',
'            MONEDA_ORIGEN = :P84000_MONEDA,',
'            VALOR_CAMBIO = :P84000_TIPO_CAMBIO,',
'            VALOR = :P84000_VALOR,',
'            USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'            FECHA_MODIFICACION = SYSDATE',
'        WHERE ANIO = :P84000_ANIO',
'        AND MES_INICIO = 1',
'        AND MES_FIN = :P84000_MES',
'        AND TIPO_REPORTE = :P84000_TIPO_REPORTE',
'        AND ID_PLANTILLA_NOTA = :P84000_ID_REGISTRO',
'        AND CODIGO_EMPRESA = :P84000_SECCION',
'        AND CONCEPTO = ''ELIMINACION'';',
'    END IF;',
'END;'))
,p_attribute_02=>'P84000_ID_REGISTRO,P84000_SECCION,P84000_ANIO,P84000_TIPO_REPORTE,P84000_MES,P84000_MONEDA,P84000_TIPO_CAMBIO,P84000_VALOR,P84000_ES_ELIMINACION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84000_ES_ELIMINACION'
,p_client_condition_expression=>'S'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244969819731886610)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR_CAMPOS'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ID,P84000_MES,P84000_MONEDA,P84000_TIPO_CAMBIO,P84000_VALOR,P84000_ID_LISTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244969352006886605)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'ES_ELIMINACION'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ES_ELIMINACION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244969923825886611)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'ES_ELIMINACION'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ES_ELIMINACION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244969734648886609)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_R6'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(234950856942795723)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244969424733886606)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'ENABLE_ITEMS'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ES_ELIMINACION,P84000_MES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244969581155886607)
,p_event_id=>wwv_flow_imp.id(244968948516886601)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_R6'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(234950856942795723)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(244970080433886612)
,p_name=>'EDITAR_REGISTRO'
,p_event_sequence=>80
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'EDITAR_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244970215505886614)
,p_event_id=>wwv_flow_imp.id(244970080433886612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE_ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_MES,P84000_ES_ELIMINACION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244970189419886613)
,p_event_id=>wwv_flow_imp.id(244970080433886612)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_EDICION'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84000_ID,P84000_MES,P84000_MONEDA,P84000_TIPO_CAMBIO,P84000_VALOR,P84000_ES_ELIMINACION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ID,',
'    MES_FIN,',
'    MONEDA_ORIGEN,',
'    VALOR_CAMBIO,',
'    VALOR,',
'    (',
'        CASE WHEN CONCEPTO IS NOT NULL THEN',
'            ''S''',
'        ELSE',
'            ''N''',
'        END',
'    ) ELIMINACION',
'FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'WHERE ID = :P84000_ID_LISTA'))
,p_attribute_07=>'P84000_ID_LISTA'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
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
