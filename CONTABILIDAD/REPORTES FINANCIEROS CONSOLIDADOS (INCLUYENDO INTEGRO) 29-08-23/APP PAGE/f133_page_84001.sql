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
--     PAGE: 84001
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84001
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84001);
end;
/
prompt --application/pages/page_84001
begin
wwv_flow_imp_page.create_page(
 p_id=>84001
,p_name=>'ASOCIAR_PRESUPUESTO_RENGLON_EERR'
,p_alias=>'ASOCIAR-PRESUPUESTO-RENGLON-EERR'
,p_page_mode=>'MODAL'
,p_step_title=>'Asociar Presupuesto'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js',
'#WORKSPACE_FILES#reportes/convertir_IR_to_treeview#MIN#.js',
'#WORKSPACE_FILES#jquery.treetable_last.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function eliminarRegistro() {',
'    $.event.trigger(''ELIMINAR_REGISTRO'');',
'}'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#saf-cssnew.css',
'#WORKSPACE_FILES#jquery.treetable.min.css',
'#WORKSPACE_FILES#jquery.treetable.theme.default.min.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#LISTA_ASIGNACION#NOMBRE, #LISTA_ASIGNACION[headers=NOMBRE]',
'{',
'    width: 200px !important;',
'    min-width: 200px !important;',
'    max-width: 200px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'MODAL_CRUD_EERR'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230823110126'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(246233098003454104)
,p_plug_name=>'Asignar Presupuesto'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(246233272105454106)
,p_plug_name=>'LISTA_ASIGNACION'
,p_region_name=>'LISTA_ASIGNACION'
,p_parent_plug_id=>wwv_flow_imp.id(246233098003454104)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH RENGLONES AS',
'(',
'	SELECT',
'		A.ID,',
'		NULL ID_PADRE,',
'		A.NOMBRE,',
'		''font-weight: bold;'' CLASE,',
'		1 TIPO',
'	FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'	WHERE A.TIPO_REPORTE = 6',
'	UNION ALL',
'	SELECT',
'		A.ID,',
'		A.ID_RENGLON_REPORTE ID_PADRE,',
'		B.DESCRIPCION,',
'		'''' CLASE,',
'		2 TIPO',
'	FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A',
'	INNER JOIN SAF.PREA_DETALLE_PLANTILLA B ON B.ID = A.ID_ASOCIACION',
'	WHERE A.TIPO_REPORTE = 7',
'    AND A.EJERCICIO = :P84001_ANIO_PRESUPUESTO',
')',
'SELECT',
'	ID,',
'	ID_PADRE,',
'	NOMBRE,',
'	CLASE,',
'	TIPO',
'FROM RENGLONES',
'START WITH ID_PADRE IS NULL ',
'CONNECT BY PRIOR ID = ID_PADRE',
'ORDER SIBLINGS BY ID_PADRE, ID ASC;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84001_ANIO_PRESUPUESTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LISTA_ASIGNACION'
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
 p_id=>wwv_flow_imp.id(246233374053454107)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>246233374053454107
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(246233417819454108)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(246233511609454109)
,p_db_column_name=>'NOMBRE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre Renglon'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="info"  data-tt-id="#ID#" data-tt-parent-id="#ID_PADRE#"> ',
'    <span style="padding-left:0; padding-right:2px;"  >      ',
'    </span>',
'    <div class="forSearch"',
'            style=''padding-left:0; cursor: pointer; display:inline-block; white-space:nowrap; overflow: hidden; white-space: normal; #CLASE#''>  ',
'            #NOMBRE# ',
'        </div>',
'</span>',
'',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="TIPO" type="hidden" value="#TIPO#">'))
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(246233640615454110)
,p_db_column_name=>'CLASE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(246233809537454112)
,p_db_column_name=>'ID_PADRE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Padre'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(246233962172454113)
,p_db_column_name=>'TIPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(246266160640611192)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2462662'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'ID:NOMBRE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(248438560838635115)
,p_plug_name=>'RENGLONES_PRESUPUESTO'
,p_parent_plug_id=>wwv_flow_imp.id(246233098003454104)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(248440024202635130)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(248438560838635115)
,p_button_name=>'Guardar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Guardar'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(248440167142635131)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(248438560838635115)
,p_button_name=>'Cancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(246105885258154337)
,p_name=>'P84001_ID_REGISTRO'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(246106227377154338)
,p_name=>'P84001_TIPO_REPORTE'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(246106684706154338)
,p_name=>'P84001_NOMBRE_MODAL'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(246233171452454105)
,p_name=>'P84001_ANIO_PRESUPUESTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(246233098003454104)
,p_prompt=>unistr('A\00F1o Presupuesto')
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
 p_id=>wwv_flow_imp.id(248437963635635109)
,p_name=>'P84001_PRESUPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(246233098003454104)
,p_prompt=>'Nombre Presupuesto'
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
 p_id=>wwv_flow_imp.id(248438256837635112)
,p_name=>'P84001_ID_PRESUPUESTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(246233098003454104)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(248438623405635116)
,p_name=>'P84001_RENGLONES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(248438560838635115)
,p_prompt=>'Renglones'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	DESCRIPCION,',
'    ID',
'FROM SAF.PREA_DETALLE_PLANTILLA',
'WHERE ID_PLANTILLA = :P84001_ID_PRESUPUESTO',
'AND ID NOT IN',
'(',
'    SELECT',
'    	ID_ASOCIACION',
'    FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'    WHERE TIPO_REPORTE = 7',
'    AND EJERCICIO = :P84001_ANIO_PRESUPUESTO',
')',
'AND ID_PADRE IS NULL',
'AND ES_OPERADOR = ''N''',
'ORDER BY ORDEN ASC;'))
,p_lov_cascade_parent_items=>'P84001_ID_PRESUPUESTO'
,p_ajax_items_to_submit=>'P84001_ID_PRESUPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(248439347831635123)
,p_name=>'P84001_ID_RENGLON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(246233272105454106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(248439406128635124)
,p_name=>'P84001_TIPO_RENGLON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(246233272105454106)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(246118574120154351)
,p_name=>'CARGAR_NOMBRE'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246119575244154352)
,p_event_id=>wwv_flow_imp.id(246118574120154351)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_NOMBRE_MODAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	''Renglon: '' || NOMBRE',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS',
'WHERE TIPO_REPORTE = :P84001_TIPO_REPORTE',
'AND ID = :P84001_ID_REGISTRO'))
,p_attribute_07=>'P84001_ID_REGISTRO,P84001_TIPO_REPORTE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246119095287154351)
,p_event_id=>wwv_flow_imp.id(246118574120154351)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'CAMBIO_NOMBRE'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".MODAL_CRUD_EERR .ui-dialog-title").text(apex.item(''P84001_NOMBRE_MODAL'').getValue());'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(244971425657886626)
,p_event_id=>wwv_flow_imp.id(246118574120154351)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'DISABLE_ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_PRESUPUESTO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248438800864635118)
,p_event_id=>wwv_flow_imp.id(246118574120154351)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'HIDE_RENGLONES'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248438560838635115)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248439759248635127)
,p_event_id=>wwv_flow_imp.id(246118574120154351)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_name=>'HIDE_LISTA'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(246233272105454106)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(246234097566454114)
,p_name=>'ASIGNAR_PRESUPUESTO'
,p_event_sequence=>61
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84001_ANIO_PRESUPUESTO'
,p_condition_element=>'P84001_ANIO_PRESUPUESTO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246234193286454115)
,p_event_id=>wwv_flow_imp.id(246234097566454114)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DATOS_PRESUPUESTO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_PRESUPUESTO,P84001_ID_PRESUPUESTO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	B.NOMBRE,',
'    A.ID_PLANTILLA',
'FROM SAF.PREA_CONFIGURACION A',
'INNER JOIN SAF.PREA_PLANTILLA B ON B.ID = A.ID_PLANTILLA',
'WHERE A.ANO = :P84001_ANIO_PRESUPUESTO;'))
,p_attribute_07=>'P84001_ANIO_PRESUPUESTO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248439829075635128)
,p_event_id=>wwv_flow_imp.id(246234097566454114)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'SHOW_LISTA'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(246233272105454106)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84001_ID_PRESUPUESTO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248440647876635136)
,p_event_id=>wwv_flow_imp.id(246234097566454114)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(246233272105454106)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84001_ID_PRESUPUESTO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248439950180635129)
,p_event_id=>wwv_flow_imp.id(246234097566454114)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'HIDE_LISTA'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(246233272105454106)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P84001_ID_PRESUPUESTO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248440475831635134)
,p_event_id=>wwv_flow_imp.id(246234097566454114)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'HIDE_RENGLONES'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248438560838635115)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(246234276484454116)
,p_name=>'LISTA_ASIGNACION'
,p_event_sequence=>71
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(246233272105454106)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(246234417584454118)
,p_event_id=>wwv_flow_imp.id(246234276484454116)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'g_MostrarNumeroRegistrosIR(''LISTA_ASIGNACION'');',
'global_formarVistaArbol(''LISTA_ASIGNACION'',false,'''',{celda:0, colors:false});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248439111263635121)
,p_name=>'LISTA_ASIGNACION_T'
,p_event_sequence=>81
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA_ASIGNACION td'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248439513609635125)
,p_event_id=>wwv_flow_imp.id(248439111263635121)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_ID_RENGLON'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].defaultValue'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248439697266635126)
,p_event_id=>wwv_flow_imp.id(248439111263635121)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_TIPO_RENGLON'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].defaultValue'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248438764682635117)
,p_event_id=>wwv_flow_imp.id(248439111263635121)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'RENGLONES'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_RENGLONES'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84001_TIPO_RENGLON'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248438941271635119)
,p_event_id=>wwv_flow_imp.id(248439111263635121)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'SHOW_RENGLONES'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248438560838635115)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84001_TIPO_RENGLON'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248439018953635120)
,p_event_id=>wwv_flow_imp.id(248439111263635121)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'HIDE_RENGLONES'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248438560838635115)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P84001_TIPO_RENGLON'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248439217428635122)
,p_event_id=>wwv_flow_imp.id(248439111263635121)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'SELECCIONAR_FILA'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#LISTA_ASIGNACION'').find(''tr'').removeClass("selected");',
'$(this.triggeringElement).closest(''tr'')[0].classList.toggle("selected");'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248440228328635132)
,p_name=>'GUARDAR'
,p_event_sequence=>91
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(248440024202635130)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248440365256635133)
,p_event_id=>wwv_flow_imp.id(248440228328635132)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_DATOS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT ',
'            COLUMN_VALUE ',
'        FROM TABLE (APEX_STRING.SPLIT_NUMBERS(:P84001_RENGLONES, '':''));',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'        (',
'            TIPO_REPORTE,',
'            ID_ASOCIACION,',
'            ID_RENGLON_REPORTE,',
'            CONCEPTO,',
'            EJERCICIO,',
'            USUARIO_GRABACION,',
'            FECHA_GRABACION',
'        )',
'        VALUES',
'        (',
'            7,',
'            R_DATOS.COLUMN_VALUE,',
'            :P84001_ID_RENGLON,',
'            ''ASOCIACION DE PRESUPUESTO A RENGLONES EERR'',',
'            :P84001_ANIO_PRESUPUESTO,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        );',
'    END LOOP;',
'END;'))
,p_attribute_02=>'P84001_ID_RENGLON,P84001_ANIO_PRESUPUESTO,P84001_RENGLONES'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248440764433635137)
,p_event_id=>wwv_flow_imp.id(248440228328635132)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_ID_RENGLON,P84001_TIPO_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248440968464635139)
,p_event_id=>wwv_flow_imp.id(248440228328635132)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'HIDE_RENGLONES'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248438560838635115)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248440897423635138)
,p_event_id=>wwv_flow_imp.id(248440228328635132)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(246233272105454106)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248441027336635140)
,p_name=>'CANCELAR'
,p_event_sequence=>101
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(248440167142635131)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248441231640635142)
,p_event_id=>wwv_flow_imp.id(248441027336635140)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_ID_RENGLON,P84001_TIPO_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248441338782635143)
,p_event_id=>wwv_flow_imp.id(248441027336635140)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'HIDE_RENGLONES'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248438560838635115)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248441599632635145)
,p_name=>'LISTA_ASIGNACION_CRUD'
,p_event_sequence=>111
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA_ASIGNACION td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248441794146635147)
,p_event_id=>wwv_flow_imp.id(248441599632635145)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_ID_RENGLON'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].defaultValue'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248441804349635148)
,p_event_id=>wwv_flow_imp.id(248441599632635145)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_TIPO_RENGLON'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].defaultValue'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248441691545635146)
,p_event_id=>wwv_flow_imp.id(248441599632635145)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MENU'
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
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84001_TIPO_RENGLON'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248441946884635149)
,p_name=>'ELIMINAR_REGISTRO'
,p_event_sequence=>121
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ELIMINAR_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(250262686002485601)
,p_event_id=>wwv_flow_imp.id(248441946884635149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_DATOS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'DELETE FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION WHERE ID = :P84001_ID_RENGLON;'
,p_attribute_02=>'P84001_ID_RENGLON'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(250262789673485602)
,p_event_id=>wwv_flow_imp.id(248441946884635149)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84001_ID_RENGLON,P84001_TIPO_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(250262810560485603)
,p_event_id=>wwv_flow_imp.id(248441946884635149)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'HIDE_RENGLONES'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(248438560838635115)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(250262906053485604)
,p_event_id=>wwv_flow_imp.id(248441946884635149)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(246233272105454106)
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
