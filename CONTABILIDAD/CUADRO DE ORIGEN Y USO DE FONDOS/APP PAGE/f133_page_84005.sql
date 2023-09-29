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
--   Date and Time:   08:41 Thursday September 28, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 84005
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84005
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84005);
end;
/
prompt --application/pages/page_84005
begin
wwv_flow_imp_page.create_page(
 p_id=>84005
,p_name=>'TRANSFERENCIAS_FINANCIERAS'
,p_alias=>'TRANSFERENCIAS-FINANCIERAS'
,p_step_title=>'TRANSFERENCIAS_FINANCIERAS'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#crear-btns-modal.js',
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function editarRegistro() {',
'    $.event.trigger("EDITAR_REGISTRO");',
'}',
'',
'function verRegistro() {',
'    $.event.trigger("VER_REGISTRO");',
'}',
'',
'function ingresarRegistro() {',
'    $.event.trigger("INGRESAR_REGISTRO");',
'}',
'',
'function functionResetLISTA_BTN()',
'{',
'    apex.jQuery(''#LISTA_ir'').interactiveReport("reset");',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (typeof $.apex.interactiveReport === "function") {',
'    // only extend when the IR code is present',
'    $.apex.interactiveReport.prototype.reset = function() {this._reset();};',
'}'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#saf-cssnew.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-pagination-label',
'{',
'    font-weight: bold !important;',
'}',
'',
'#LISTA th#ID, #LISTA td[headers=ID]',
'{',
'    width: 50px !important;',
'    min-width: 50px !important;',
'    max-width: 50px !important;',
'}',
'',
'#LISTA th#TIPO_DESTINATARIO, #LISTA td[headers=TIPO_DESTINATARIO],',
'#LISTA th#ESTADO, #LISTA td[headers=ESTADO]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#LISTA th#MONTO_ORIGEN, #LISTA td[headers=MONTO_ORIGEN]',
'{',
'    width: 200px !important;',
'    min-width: 200px !important;',
'    max-width: 200px !important;',
'}',
'',
'#LISTA th#NOMBRE_EMPRESA, #LISTA td[headers=NOMBRE_EMPRESA],',
'#LISTA th#NOMBRE_ASOCIACION, #LISTA td[headers=NOMBRE_ASOCIACION]',
'{',
'    width: 300px !important;',
'    min-width: 300px !important;',
'    max-width: 300px !important;',
'}',
'',
'#LISTA th#NOMBRE_SOLICITANTE, #LISTA td[headers=NOMBRE_SOLICITANTE]',
'{',
'    width: 275px !important;',
'    min-width: 275px !important;',
'    max-width: 275px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230928083739'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(374469596670184784)
,p_plug_name=>'name_app'
,p_region_css_classes=>'name_app'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>'Inversiones y Prestamos'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(374469662329184785)
,p_plug_name=>'LISTA'
,p_region_name=>'LISTA'
,p_region_css_classes=>'tablepadding listaButtons gridModalEnc LISTA_BTN'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:margin-top-sm'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	A.ID,',
'	A.CODIGO_EMPRESA,',
'    (A.CODIGO_EMPRESA || '' - '' || SAF.FN_NOMBRE_EMPRESA(A.CODIGO_EMPRESA)) NOMBRE_EMPRESA,',
'	A.TIPO_DESTINATARIO,',
'	A.ID_ASOCIACION,',
'	A.ESTADO,',
'	A.CODIGO_MONEDA,',
'	A.MONTO_ORIGEN,',
'	A.MONTO_LOCAL,',
'	(',
'        CASE',
'            WHEN A.ES_PRESTAMO = ''S'' THEN',
'                ''Prestamo''',
'            ELSE',
'                ''Inversion''',
'        END',
'    ) ES_PRESTAMO,',
'    A.USUARIO_GRABACION,',
'    SAF.FNC_GET_USUARIONOMBRE(A.USUARIO_GRABACION) NOMBRE_SOLICITANTE,',
'    B.SIMBOLO_MONEDA,',
'    (',
'       SAF.GET_FDU_PERMISO_REGISTRO(A.ID, :GLOBAL_CODIGO_USUARIO)',
'    ) PERMISO_REGISTRO,',
'    (',
'        SAF.GET_FDU_NOMBRE_DESTINATARIO(A.ID_ASOCIACION, A.CODIGO_EMPRESA, A.TIPO_DESTINATARIO)',
'    ) NOMBRE_ASOCIACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A',
'INNER JOIN SAF.GRAL_MONEDAS B ON B.CODIGO_MONEDA = A.CODIGO_MONEDA',
'ORDER BY ID ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LISTA'
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
 p_id=>wwv_flow_imp.id(374469812741184786)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_finder_drop_down=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>374469812741184786
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214471779434623773)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'ID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214472154974623778)
,p_db_column_name=>'CODIGO_EMPRESA'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Codigo Empresa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214472528748623779)
,p_db_column_name=>'TIPO_DESTINATARIO'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Tipo Deudor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'TIPO_DESTINATARIO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214472996758623779)
,p_db_column_name=>'ID_ASOCIACION'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Id Asociacion'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214473348167623780)
,p_db_column_name=>'ESTADO'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'ESTADO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214473799992623781)
,p_db_column_name=>'CODIGO_MONEDA'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Codigo Moneda'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214474189395623781)
,p_db_column_name=>'MONTO_ORIGEN'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Monto Origen'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA#</div> <div style="float:right;">#MONTO_ORIGEN#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_ORIGEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214474520058623782)
,p_db_column_name=>'MONTO_LOCAL'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Monto Local'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214474980036623782)
,p_db_column_name=>'ES_PRESTAMO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Transaccion Financiera'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214475385649623783)
,p_db_column_name=>'NOMBRE_EMPRESA'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Empresa'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOMBRE_EMPRESA#',
'',
'<input id="ID" type="hidden" value="#ID#"> ',
'<input id="PERMISO_REGISTRO" type="hidden" value="#PERMISO_REGISTRO#"> '))
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE_EMPRESA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214475739417623784)
,p_db_column_name=>'USUARIO_GRABACION'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Usuario Grabacion'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214476186850623784)
,p_db_column_name=>'NOMBRE_SOLICITANTE'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Solicitante'
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE_SOLICITANTE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214476522006623788)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214476924345623789)
,p_db_column_name=>'PERMISO_REGISTRO'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Permiso Registro'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214477364009623790)
,p_db_column_name=>'NOMBRE_ASOCIACION'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>'Deudor'
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE_ASOCIACION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(404161921748343892)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1896908'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'ID:NOMBRE_EMPRESA:TIPO_DESTINATARIO:NOMBRE_ASOCIACION:MONTO_ORIGEN:ES_PRESTAMO:ESTADO:NOMBRE_SOLICITANTE:'
,p_break_on=>'ES_PRESTAMO:0:0:0:0:0'
,p_break_enabled_on=>'ES_PRESTAMO:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214478008842623791)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(374469662329184785)
,p_button_name=>'CREAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'alineacionbutton buttonSize2'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214478417584623797)
,p_name=>'P84005_ID_TABLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(374469662329184785)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214478746576623805)
,p_name=>'P84005_PERMISO_TABLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(374469662329184785)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214479417886623807)
,p_name=>'P84005_URL'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214480295937623812)
,p_name=>'LISTA'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(374469662329184785)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214480726396623813)
,p_event_id=>wwv_flow_imp.id(214480295937623812)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'CARGA_VISTA'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    g_MostrarNumeroRegistrosIR(''LISTA'');',
'    $(''#LISTA_saved_reports'').hide();',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214481207413623814)
,p_event_id=>wwv_flow_imp.id(214480295937623812)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'RESET'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    $(''.LISTA_BTN .a-IRR-savedReports'').append(''<button class="a-Button a-IRR-button t-Button--noLabel t-Button--icon positionButtonReset  t-Button--small" type="button" id="buttonReset" title="Reset" onclick="functionResetLISTA_BTN()" aria-label="Re'
||'set"><span class="t-Icon fa fa-rotate-left" aria-hidden="true"></span></button>'');',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214481683827623814)
,p_name=>'CREAR_SOLICITUD'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214478008842623791)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214482178800623815)
,p_event_id=>wwv_flow_imp.id(214481683827623814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var url = `f?p=&APP_ID.:84006:&APP_SESSION.::NO:84006:P84006_ACCION_MODAL:CREAR`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("ERROR");',
'    }',
'},',
'    error: function(request, status, error) {',
'        console.log("status---" + status + " error----" + error);',
'    }',
'});'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214483170080623819)
,p_event_id=>wwv_flow_imp.id(214481683827623814)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=133:84006:&SESSION.:::84006:P84006_ACCION_MODAL:CREAR'',',
'    p_triggering_element => ''apex.jQuery(''''#LISTA'''')'' ) url ',
'into :P84005_URL',
'FROM DUAL;'))
,p_attribute_03=>'P84005_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214482604240623816)
,p_event_id=>wwv_flow_imp.id(214481683827623814)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P84005_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214483574328623819)
,p_name=>'REFRESH_LISTA'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(374469662329184785)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != ''load'' && this.data.dialogPageId == ''84006'' && this.data.estado == ''1'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214484056924623820)
,p_event_id=>wwv_flow_imp.id(214483574328623819)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(374469662329184785)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214484530867623821)
,p_event_id=>wwv_flow_imp.id(214483574328623819)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84005_URL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214486377652623823)
,p_name=>'OPCIONES_REGISTRO'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA TD'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214487813952623830)
,p_event_id=>wwv_flow_imp.id(214486377652623823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84005_ID_TABLA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214486895480623824)
,p_event_id=>wwv_flow_imp.id(214486377652623823)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'PERMISO_REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84005_PERMISO_TABLA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=PERMISO_REGISTRO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214487338753623824)
,p_event_id=>wwv_flow_imp.id(214486377652623823)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MENU'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'OPCIONES_INVERSIO_PRESTAMO'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "EDITAR_REGISTRO": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P84005_PERMISO_TABLA'').getValue() == ''1'') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "VER_REGISTRO": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P84005_PERMISO_TABLA'').getValue() == ''0'') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "INGRESAR_REGISTROS": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P84005_PERMISO_TABLA'').getValue() == ''2'') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    }',
'};'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214484953282623821)
,p_name=>'EDITAR_REGISTRO'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'EDITAR_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214485487117623822)
,p_event_id=>wwv_flow_imp.id(214484953282623821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=133:84006:&SESSION.:::84006:P84006_ACCION_MODAL,P84006_ID:MODIFICAR_SOLICITUD,'' || :P84005_ID_TABLA,',
'    p_triggering_element => ''apex.jQuery(''''#LISTA'''')'' ) url ',
'into :P84005_URL',
'FROM DUAL;'))
,p_attribute_02=>'P84005_ID_TABLA'
,p_attribute_03=>'P84005_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214485993978623822)
,p_event_id=>wwv_flow_imp.id(214484953282623821)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P84005_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214488276082623831)
,p_name=>'VER_REGISTRO'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'VER_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214489204335623836)
,p_event_id=>wwv_flow_imp.id(214488276082623831)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=133:84006:&SESSION.:::84006:P84006_ACCION_MODAL,P84006_ID:VER_REGISTRO,'' || :P84005_ID_TABLA,',
'    p_triggering_element => ''apex.jQuery(''''#LISTA'''')'' ) url ',
'into :P84005_URL',
'FROM DUAL;'))
,p_attribute_02=>'P84005_ID_TABLA'
,p_attribute_03=>'P84005_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214488705977623836)
,p_event_id=>wwv_flow_imp.id(214488276082623831)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P84005_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214489621330623837)
,p_name=>'INGRESAR_REGISTRO'
,p_event_sequence=>70
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'INGRESAR_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214490130547623837)
,p_event_id=>wwv_flow_imp.id(214489621330623837)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=133:84006:&SESSION.:::84006:P84006_ACCION_MODAL,P84006_ID:INGRESAR_REGISTRO,'' || :P84005_ID_TABLA,',
'    p_triggering_element => ''apex.jQuery(''''#LISTA'''')'' ) url ',
'into :P84005_URL',
'FROM DUAL;'))
,p_attribute_02=>'P84005_ID_TABLA'
,p_attribute_03=>'P84005_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214490636420623840)
,p_event_id=>wwv_flow_imp.id(214489621330623837)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P84005_URL").getValue());'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214479857362623808)
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
