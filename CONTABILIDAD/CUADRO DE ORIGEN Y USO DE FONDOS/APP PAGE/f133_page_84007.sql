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
--   Date and Time:   08:42 Thursday September 28, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 84007
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84007
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84007);
end;
/
prompt --application/pages/page_84007
begin
wwv_flow_imp_page.create_page(
 p_id=>84007
,p_name=>'PERMISOS_FLUJO'
,p_alias=>'PERMISOS-FLUJO'
,p_step_title=>'PERMISOS_FLUJO'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#crear-btns-modal.js',
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let errores = {',
'    "1" : "No se han ingresado todos los campos para la creacion del permiso."',
'}',
'',
'const $validar_datos = [',
'    ''P84007_USUARIO'',',
'    ''P84007_FLUJO''',
'];',
'',
'function validarCamposRequeridos(elementos) {',
'  for (let i = 0; i < elementos.length; i++) {',
'    if (apex.item(elementos[i]).getValue() == '''') {',
'      return false;',
'    }',
'  }',
'  return true;',
'}',
'',
'function accionFos(acccion) {',
'    $("#GUARDAR").hide();',
'    $("#EDITAR").hide();',
'    $("#ELIMINAR").hide();',
'    $("#CANCELAR").hide();',
'',
'    switch (acccion) {',
'    case ''CREAR'':',
'        $("#GUARDAR").show();',
'        $("#CANCELAR").show();',
'        break;',
'    case ''EDITAR'':',
'        $("#EDITAR").show();',
'        $("#ELIMINAR").show();',
'        $("#CANCELAR").show();',
'        break;',
'    default:',
'        $("#GUARDAR").hide();',
'        $("#EDITAR").hide();',
'        $("#ELIMINAR").hide();',
'        $("#CANCELAR").hide();',
'    }',
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
'.a-IRR-headerLabel',
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
'#LISTA th#ESTADOS, #LISTA td[headers=ESTADOS]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#LISTA th#NOMBRE_ENCARGADO, #LISTA td[headers=NOMBRE_ENCARGADO]',
'{',
'    width: 250px !important;',
'    min-width: 250px !important;',
'    max-width: 250px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230927175433'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407552959056930797)
,p_plug_name=>'FOS'
,p_region_name=>'splitter-action'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'PLUGIN_COM.FOS.SPLITTER'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'horizontal'
,p_attribute_02=>'end'
,p_attribute_03=>'0'
,p_attribute_05=>'0'
,p_attribute_06=>'document.body.getBoundingClientRect().height'
,p_attribute_10=>'can-collapse:continuous-resize:lazy-render'
,p_attribute_15=>'Y'
,p_attribute_18=>'10'
,p_attribute_23=>'0'
,p_attribute_24=>'0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407553036186930798)
,p_plug_name=>'PERMISOS'
,p_parent_plug_id=>wwv_flow_imp.id(407552959056930797)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407553607719930803)
,p_plug_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(407553036186930798)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>20
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407554020487930807)
,p_plug_name=>'&nbsp;'
,p_parent_plug_id=>wwv_flow_imp.id(407553036186930798)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>30
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407553210894930799)
,p_plug_name=>'REGION'
,p_parent_plug_id=>wwv_flow_imp.id(407552959056930797)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(567597892016775301)
,p_plug_name=>'name_app'
,p_parent_plug_id=>wwv_flow_imp.id(407553210894930799)
,p_region_css_classes=>'name_app'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'Permisos Flujo de Inversiones y Prestamos'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(567597957675775302)
,p_plug_name=>'LISTA'
,p_region_name=>'LISTA'
,p_parent_plug_id=>wwv_flow_imp.id(407553210894930799)
,p_region_css_classes=>'tablepadding listaButtons gridModalEnc LISTA_BTN'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	A.ID,',
'	A.ESTADOS,',
'    SAF.FNC_GET_USUARIONOMBRE(A.USUARIO_ENCARGADO) NOMBRE_ENCARGADO',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PERMISOS_ESTADOS A',
'INNER JOIN ',
'(',
'    SELECT',
'    	3 ID,',
'    	''REVISION'' NOMBRE',
'    FROM DUAL',
'    UNION ALL',
'    SELECT',
'    	5 ID,',
'    	''APROBACION'' NOMBRE',
'    FROM DUAL',
') B ON B.NOMBRE = A.ESTADOS',
'ORDER BY B.ID ASC'))
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
 p_id=>wwv_flow_imp.id(567598108087775303)
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
,p_internal_uid=>567598108087775303
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(215090924312637483)
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
 p_id=>wwv_flow_imp.id(215090173680637482)
,p_db_column_name=>'ESTADOS'
,p_display_order=>20
,p_column_identifier=>'O'
,p_column_label=>'Estados'
,p_column_type=>'STRING'
,p_static_id=>'ESTADOS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(215090574214637483)
,p_db_column_name=>'NOMBRE_ENCARGADO'
,p_display_order=>30
,p_column_identifier=>'P'
,p_column_label=>'Usuario Encargado'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOMBRE_ENCARGADO#',
'',
'<input id="ID" type="hidden" value="#ID#">'))
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE_ENCARGADO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(597290217094934409)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'1896908'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'ID:ESTADOS:NOMBRE_ENCARGADO:'
,p_sort_column_1=>'0'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'ESTADOS:0:0:0:0:0'
,p_break_enabled_on=>'ESTADOS:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(215093096238637489)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(407553036186930798)
,p_button_name=>'GUARDAR'
,p_button_static_id=>'GUARDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(215093704938637492)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(407553036186930798)
,p_button_name=>'EDITAR'
,p_button_static_id=>'EDITAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(215092656059637489)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(407553036186930798)
,p_button_name=>'ELIMINAR'
,p_button_static_id=>'ELIMINAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(215093466699637492)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(407553036186930798)
,p_button_name=>'CANCELAR'
,p_button_static_id=>'CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(215091614059637485)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(567597957675775302)
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
 p_id=>wwv_flow_imp.id(215094403173637494)
,p_name=>'P84007_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(407553607719930803)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(215094805171637497)
,p_name=>'P84007_USUARIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(407553607719930803)
,p_prompt=>'Usuario'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	SAF.FNC_GET_USUARIONOMBRE(CODIGO_USUARIO) NOMBRE,',
'	CODIGO_USUARIO',
'FROM SAF.GRAL_USUARIOS ',
'WHERE CODIGO_ESTADO = 1',
'ORDER BY CODIGO_USUARIO DESC;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(215095249236637497)
,p_name=>'P84007_FLUJO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(407553607719930803)
,p_prompt=>'Paso a Administrar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:REVISION;REVISION,APROBACION;APROBACION'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(215095918969637499)
,p_name=>'P84007_USUARIO_GRABACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(407554020487930807)
,p_prompt=>'Usuario Grabacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(215096307502637499)
,p_name=>'P84007_USUARIO_MODIFICACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(407554020487930807)
,p_prompt=>'Usuario Modificacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(215096724741637500)
,p_name=>'P84007_FECHA_GRABACION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(407554020487930807)
,p_prompt=>'Fecha Grabacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(215097148112637501)
,p_name=>'P84007_FECHA_MODIFICACION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(407554020487930807)
,p_prompt=>'Fecha Modificacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(215097585011637502)
,p_name=>'P84007_ERROR'
,p_item_sequence=>30
,p_item_default=>'-1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215109803199637543)
,p_name=>'LISTA'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(567597957675775302)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215110879735637544)
,p_event_id=>wwv_flow_imp.id(215109803199637543)
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
 p_id=>wwv_flow_imp.id(215110358971637543)
,p_event_id=>wwv_flow_imp.id(215109803199637543)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'REFRESH'
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
 p_id=>wwv_flow_imp.id(215105574840637537)
,p_name=>'INGRESAR_PERMISO'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(215091614059637485)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215106576903637538)
,p_event_id=>wwv_flow_imp.id(215105574840637537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_ID,P84007_USUARIO_GRABACION,P84007_USUARIO,P84007_USUARIO_MODIFICACION,P84007_FLUJO,P84007_FECHA_GRABACION,P84007_FECHA_MODIFICACION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215106002520637538)
,p_event_id=>wwv_flow_imp.id(215105574840637537)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'OCULTAR_REGION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(407554020487930807)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215107043912637539)
,p_event_id=>wwv_flow_imp.id(215105574840637537)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'accionFos(''CREAR'');',
'$(''#splitter-action_splitter'').splitter({collapsed:false,position:500});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215107451794637540)
,p_name=>'BLOQUEAR'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215107989976637540)
,p_event_id=>wwv_flow_imp.id(215107451794637540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_USUARIO_GRABACION,P84007_USUARIO_MODIFICACION,P84007_FECHA_GRABACION,P84007_FECHA_MODIFICACION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215108445088637541)
,p_event_id=>wwv_flow_imp.id(215107451794637540)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'BTN'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(215093096238637489)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215108909582637542)
,p_event_id=>wwv_flow_imp.id(215107451794637540)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'BTN'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(215093704938637492)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215109408062637542)
,p_event_id=>wwv_flow_imp.id(215107451794637540)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'BTN'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(215092656059637489)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215114666652637551)
,p_name=>'CANCELAR'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(215093466699637492)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215115673727637552)
,p_event_id=>wwv_flow_imp.id(215114666652637551)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'accionFos(''CERRAR'');',
'$(''#splitter-action_splitter'').splitter({collapsed:false,position:0});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215115116641637552)
,p_event_id=>wwv_flow_imp.id(215114666652637551)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_ID,P84007_USUARIO_GRABACION,P84007_USUARIO,P84007_USUARIO_MODIFICACION,P84007_FLUJO,P84007_FECHA_GRABACION,P84007_FECHA_MODIFICACION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215111268481637545)
,p_name=>'GUARDAR'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(215093096238637489)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'validarCamposRequeridos($validar_datos)'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215112267943637546)
,p_event_id=>wwv_flow_imp.id(215111268481637545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'accionFos(''CERRAR'');',
'$(''#splitter-action_splitter'').splitter({collapsed:false,position:0});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215113261480637549)
,p_event_id=>wwv_flow_imp.id(215111268481637545)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'1'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215112768891637549)
,p_event_id=>wwv_flow_imp.id(215111268481637545)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215111742865637545)
,p_event_id=>wwv_flow_imp.id(215111268481637545)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_PERMISOS_ESTADOS',
'(',
'    ESTADOS,',
'    USUARIO_ENCARGADO,',
'    USUARIO_GRABACION,',
'    FECHA_GRABACION',
')',
'VALUES',
'(',
'    :P84007_FLUJO,',
'    :P84007_USUARIO,',
'    :GLOBAL_CODIGO_USUARIO,',
'    SYSDATE',
');'))
,p_attribute_02=>'P84007_USUARIO,P84007_FLUJO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215114291943637550)
,p_event_id=>wwv_flow_imp.id(215111268481637545)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(567597957675775302)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215113733449637550)
,p_event_id=>wwv_flow_imp.id(215111268481637545)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_ID,P84007_USUARIO_GRABACION,P84007_USUARIO,P84007_USUARIO_MODIFICACION,P84007_FLUJO,P84007_FECHA_GRABACION,P84007_FECHA_MODIFICACION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215116033633637553)
,p_name=>'MENSAJE_ERROR'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MENSAJE_ERROR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215116588845637553)
,p_event_id=>wwv_flow_imp.id(215116033633637553)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P84007_ERROR'').value != ''-1''){',
'    apex.message.clearErrors();',
'    apex.message.showErrors([{',
'        type: "error",',
'        location: ["page"],',
'        message: errores[apex.item(''P84007_ERROR'').value],',
'        unsafe: false',
'    }]);',
'',
'    new Promise((r) => setTimeout(r, 4000)).then(() => apex.message.clearErrors());',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215117084209637554)
,p_event_id=>wwv_flow_imp.id(215116033633637553)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR_MENSAJE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'-1'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215098392584637503)
,p_name=>'EDITAR_PERMISO'
,p_event_sequence=>70
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA TD'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215099868623637524)
,p_event_id=>wwv_flow_imp.id(215098392584637503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215100352658637525)
,p_event_id=>wwv_flow_imp.id(215098392584637503)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_FLUJO,P84007_USUARIO,P84007_USUARIO_GRABACION,P84007_USUARIO_MODIFICACION,P84007_FECHA_GRABACION,P84007_FECHA_MODIFICACION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	ESTADOS,',
'	USUARIO_ENCARGADO,',
'	SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'	SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'	FECHA_GRABACION ,',
'	FECHA_MODIFICACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PERMISOS_ESTADOS',
'WHERE ID = :P84007_ID;'))
,p_attribute_07=>'P84007_ID'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215099389773637505)
,p_event_id=>wwv_flow_imp.id(215098392584637503)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(407554020487930807)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215098841206637504)
,p_event_id=>wwv_flow_imp.id(215098392584637503)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'accionFos(''EDITAR'');',
'$(''#splitter-action_splitter'').splitter({collapsed:false,position:500});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215100742597637526)
,p_name=>'EDITAR'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(215093704938637492)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215101741489637527)
,p_event_id=>wwv_flow_imp.id(215100742597637526)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'accionFos(''CERRAR'');',
'$(''#splitter-action_splitter'').splitter({collapsed:false,position:0});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215102799023637528)
,p_event_id=>wwv_flow_imp.id(215100742597637526)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'EDITAR_PERMISO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PERMISOS_ESTADOS SET',
'    ESTADOS = :P84007_FLUJO,',
'	USUARIO_ENCARGADO = :P84007_USUARIO,',
'	USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'	FECHA_MODIFICACION = SYSDATE',
'WHERE ID = :P84007_ID;'))
,p_attribute_02=>'P84007_ID,P84007_FLUJO,P84007_USUARIO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215101253785637526)
,p_event_id=>wwv_flow_imp.id(215100742597637526)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(567597957675775302)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215102225851637528)
,p_event_id=>wwv_flow_imp.id(215100742597637526)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_ID,P84007_USUARIO_GRABACION,P84007_USUARIO,P84007_USUARIO_MODIFICACION,P84007_FLUJO,P84007_FECHA_GRABACION,P84007_FECHA_MODIFICACION'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215103149683637534)
,p_name=>'ELIMINAR'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(215092656059637489)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215103680712637535)
,p_event_id=>wwv_flow_imp.id(215103149683637534)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'accionFos(''CERRAR'');',
'$(''#splitter-action_splitter'').splitter({collapsed:false,position:0});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215104135094637535)
,p_event_id=>wwv_flow_imp.id(215103149683637534)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'EDITAR_PERMISO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PERMISOS_ESTADOS',
'WHERE ID = :P84007_ID;'))
,p_attribute_02=>'P84007_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215104668650637536)
,p_event_id=>wwv_flow_imp.id(215103149683637534)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(567597957675775302)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215105114687637537)
,p_event_id=>wwv_flow_imp.id(215103149683637534)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84007_ID,P84007_USUARIO_GRABACION,P84007_USUARIO,P84007_USUARIO_MODIFICACION,P84007_FLUJO,P84007_FECHA_GRABACION,P84007_FECHA_MODIFICACION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(215097957846637502)
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
