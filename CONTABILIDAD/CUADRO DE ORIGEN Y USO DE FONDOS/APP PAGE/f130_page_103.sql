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
,p_default_application_id=>130
,p_default_id_offset=>145450338849049290
,p_default_owner=>'SAF'
);
end;
/
 
prompt APPLICATION 130 - Generación Contraseñas
--
-- Application Export:
--   Application:     130
--   Name:            Generación Contraseñas
--   Date and Time:   10:36 Thursday September 28, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 103
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00103
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>103);
end;
/
prompt --application/pages/page_00103
begin
wwv_flow_imp_page.create_page(
 p_id=>103
,p_name=>'Proceso - Cargar Flujo Efectivo'
,p_alias=>'PROCESO-CARGAR-FLUJO-EFECTIVO'
,p_page_mode=>'MODAL'
,p_step_title=>'Proceso - Cargar Flujo Efectivo'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(252829571427961454)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230928101053'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(703806988643369576)
,p_plug_name=>'<b>Empresas Consolidadoras</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(252875915259961514)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       ID,',
'       CODIGO_EMPRESA,',
'       CODIGO_EMPRESA_CONSOLIDADORA,',
'       CODIGO_USUARIO_DIRECTOR',
'  from FLUJO_EMPRESAS_CONSOLIDADORAS'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Empresas Consolidadoras</b>'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(703807269423369578)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(703807320981369579)
,p_name=>'CODIGO_EMPRESA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CODIGO_EMPRESA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Empresa'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(28536904339645787)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(703807461041369580)
,p_name=>'CODIGO_EMPRESA_CONSOLIDADORA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CODIGO_EMPRESA_CONSOLIDADORA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Empresa Consolidadora'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(28536904339645787)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(703807531214369581)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(703807679961369582)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(703807865599369584)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'ID (Se autogenera)'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1250462848566087510)
,p_name=>'CODIGO_USUARIO_DIRECTOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CODIGO_USUARIO_DIRECTOR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Director'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(79484631321299855)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(703807165256369577)
,p_internal_uid=>703807165256369577
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(713331492550255221)
,p_interactive_grid_id=>wwv_flow_imp.id(703807165256369577)
,p_static_id=>'537190'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(713331706688255222)
,p_report_id=>wwv_flow_imp.id(713331492550255221)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(713332277872255231)
,p_view_id=>wwv_flow_imp.id(713331706688255222)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(703807269423369578)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163.05900000000003
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(713333151103255247)
,p_view_id=>wwv_flow_imp.id(713331706688255222)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(703807320981369579)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(713334009036255255)
,p_view_id=>wwv_flow_imp.id(713331706688255222)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(703807461041369580)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(713343984074301898)
,p_view_id=>wwv_flow_imp.id(713331706688255222)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(703807531214369581)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>117
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(713350527999319217)
,p_view_id=>wwv_flow_imp.id(713331706688255222)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(703807865599369584)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1263406321305114115)
,p_view_id=>wwv_flow_imp.id(713331706688255222)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(1250462848566087510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(937037909338970267)
,p_plug_name=>'<b>Parametros</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(252875915259961514)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(185441843012601080)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(937037909338970267)
,p_button_name=>'Cargar_Datos_Flujo'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(252932081557961584)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cargar Datos Flujo'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185442288886601084)
,p_name=>'P103_EMPRESA_CONSOLIDADORA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(937037909338970267)
,p_prompt=>'Empresa Consolidadora'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(c.RAZON_SOCIAL, c.NOMBRE_PERSONA) d,',
'	   a.CODIGO_EMPRESA_CONSOLIDADORA r',
'  from FLUJO_EMPRESAS_CONSOLIDADORAS a, Gral_Empresas b, Gral_Personas_Table c',
' where a.CODIGO_EMPRESA_CONSOLIDADORA = b.CODIGO_EMPRESA',
'   and b.CODIGO_PERSONA = c.CODIGO_PERSONA',
' group by a.CODIGO_EMPRESA_CONSOLIDADORA, nvl(c.RAZON_SOCIAL, c.NOMBRE_PERSONA) ',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Todas las Empresas -'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(252930933880961582)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185442657360601095)
,p_name=>'P103_FECHAI'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(937037909338970267)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_date(''01-''||to_char(sysdate, ''mm-yyyy''), ''dd-mm-yyyy'')',
'from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'F. Inicia Egresos'
,p_display_as=>'NATIVE_DATE_PICKER_JET'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(252930933880961582)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185443032699601097)
,p_name=>'P103_FECHAF'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(937037909338970267)
,p_item_default=>'select trunc(sysdate) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'F. Fin Egresos'
,p_display_as=>'NATIVE_DATE_PICKER_JET'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(252930933880961582)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'ITEM'
,p_attribute_05=>'P103_FECHAI'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185443468446601098)
,p_name=>'P103_FECHAI_INGRESOS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(937037909338970267)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_date(''01-''||to_char(sysdate+7, ''mm-yyyy''), ''dd-mm-yyyy'')',
'from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'F. Inicia Ingresos'
,p_display_as=>'NATIVE_DATE_PICKER_JET'
,p_cSize=>30
,p_colspan=>2
,p_grid_column=>9
,p_field_template=>wwv_flow_imp.id(252930933880961582)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185443869206601098)
,p_name=>'P103_FECHAF_INGRESOS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(937037909338970267)
,p_item_default=>'select trunc(sysdate+7) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'F. Fin Ingresos'
,p_display_as=>'NATIVE_DATE_PICKER_JET'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(252930933880961582)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'ITEM'
,p_attribute_05=>'P103_FECHAI_INGRESOS'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(185444981710601112)
,p_name=>'SetFechaIngresos'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P103_FECHAI'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(185445499239601115)
,p_event_id=>wwv_flow_imp.id(185444981710601112)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P103_FECHAI_INGRESOS,P103_FECHAF'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy'') + 7, ''dd-mm-yyyy'') FechaI1,',
'       to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy'') + 7, ''dd-mm-yyyy'') FechaI2',
'from dual'))
,p_attribute_07=>'P103_FECHAI'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(185445834228601116)
,p_name=>'SetFechaFIngresos'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P103_FECHAI_INGRESOS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(185446353221601117)
,p_event_id=>wwv_flow_imp.id(185445834228601116)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P103_FECHAF_INGRESOS'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select to_char(to_date(:P103_FECHAI_INGRESOS, ''dd-mm-yyyy'') + 7, ''dd-mm-yyyy'') from dual'
,p_attribute_07=>'P103_FECHAI_INGRESOS'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(185444239616601105)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidaDatosProcesados'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'   cursor c_Registros_Aplicados is',
'      /*Select sum(Conteo)',
'        from (',
'      Select count(*) Conteo',
'      From Flujo_Efectivo_Historico',
'       where to_char(fechaI,''dd-mm-yyyy'') between to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy'') ',
'                                              and to_char(to_date(:P103_FECHAf, ''dd-mm-yyyy''), ''dd-mm-yyyy'');',
'       and procesado = ''S''',
'      union ',
'      Select count(*)',
'      From Flujo_Efectivo_Historico',
'       where to_char(fechaF,''dd-mm-yyyy'') between to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy'') ',
'                                              and to_char(to_date(:P103_FECHAf, ''dd-mm-yyyy''), ''dd-mm-yyyy'');',
'       and procesado = ''S'');*/',
'      Select sum(Conteo)',
'        from (',
'         Select count(*) Conteo',
'           From saf.Flujo_Efectivo_Historico',
'          where EMPRESA_CONSOLIDADORA = nvl(:P103_EMPRESA_CONSOLIDADORA, empresa_consolidadora) ',
'            and fechaI between :P103_FECHAI and :P103_FECHAf',
'            and procesado = ''S''',
'            and TIPO != ''Ingresos''',
'         union ',
'         Select count(*)',
'           From saf.Flujo_Efectivo_Historico',
'          where EMPRESA_CONSOLIDADORA = nvl(:P103_EMPRESA_CONSOLIDADORA, empresa_consolidadora)',
'            and fechaF between :P103_FECHAI and :P103_FECHAf',
'            and procesado = ''S''',
'            and TIPO != ''Ingresos'');',
'   l_registros_aplicados   number(10):=0;',
'',
'begin',
'   open c_Registros_Aplicados;',
'   fetch c_Registros_Aplicados into l_registros_aplicados;',
'   close c_Registros_Aplicados;',
'',
'   if nvl(l_registros_aplicados,0) > 0 then',
'      Raise_Application_Error(-20333,''Ya existen Registros Aplicados en el periodo que desea cargar'');',
'   end if;',
'',
'   if :P103_FECHAI is null or :P103_FECHAF is null or :P103_FECHAF_INGRESOS is null or :P103_FECHAI_INGRESOS is null then',
'      Raise_Application_Error(-20333,''Debe ingresar las fechas para poder procesar el flujo'');',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(185441843012601080)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(185444574146601105)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ProcesarDatosFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'   cursor c_flujo(v_id_flujo number, pfechai date, pfechaf date) is',
'   select 1 Orden,',
'   	   ''Ingresos'' Descripcion,',
'   	   0 MontoUSD$,',
'   	   sum(nvl(monto_x_cobrar,0)) MontoQTZ,',
'         nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'         Codigo_Empresa',
'     from flujo_efectivo_ingresos',
'    where codigo_empresa in (',
'               select CODIGO_EMPRESA ',
'                 From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'                where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'      and ID_FLUJO = v_id_flujo',
'  group by codigo_empresa',
'Union  ',
'Select 2 Orden,',
'	   ''CXP Materiales'' Descripcion,',
'	   sum(nvl(Monto_Origen,0))*-1 MontoUSD$,',
'	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,',
'      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'      Codigo_Empresa',
'  from flujo_efectivo_antiguedad_cxp',
' where codigo_empresa in (',
'    select CODIGO_EMPRESA ',
'      From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'   and Nvl(ES_SERVICIO, ''N'') = ''N''',
'   and nvl(Proveedor_Mayor,''N'')  = ''N''',
'   and nvl(sub_contratista,''N'') = ''N''',
'   and nvl(empleado,''N'') = ''N''',
'   and intercompany = ''N''',
'   and ID_FLUJO = v_id_flujo',
'   group by codigo_empresa',
'Union',
'Select 3 Orden,',
'	   ''CXP Servicios'' Descripcion,',
'	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,',
'	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,',
'      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'      Codigo_Empresa',
'  from flujo_efectivo_antiguedad_cxp',
' where codigo_empresa in (',
'    select CODIGO_EMPRESA ',
'      From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'   and Nvl(ES_SERVICIO, ''N'') = ''S''',
'   and nvl(Proveedor_Mayor,''N'')  = ''N''',
'   and nvl(sub_contratista,''N'') = ''N''',
'   and nvl(empleado,''N'') = ''N''',
'   and intercompany = ''N''',
'   and ID_FLUJO = v_id_flujo',
'   group by codigo_empresa',
'Union',
'Select 4 Orden,',
'	   ''CXP Proveedores Mayores'' Descripcion,',
'	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,',
'	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,',
'      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'      Codigo_Empresa',
'  from flujo_efectivo_antiguedad_cxp',
' where codigo_empresa in (',
'    select CODIGO_EMPRESA ',
'      From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'   and nvl(Proveedor_Mayor,''N'')  = ''S''',
'   and nvl(sub_contratista,''N'') = ''N''',
'   and nvl(empleado,''N'') = ''N''',
'   and intercompany = ''N''',
'   and ID_FLUJO = v_id_flujo',
' group by codigo_empresa',
'union',
' select 5 orden,',
'        ''Pagos Recurrentes'',',
'        sum(nvl(monto_pagar_origen,0))*-1 MontoUSD$,',
'        sum(nvl(monto_pagar_local,0))*-1 MontoQTZ,',
'        nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'        Codigo_Empresa',
'   from FLUJO_EFECTIVO_PAGOS_RECURRENTES',
'  where codigo_empresa = nvl(:P103_EMPRESA_CONSOLIDADORA, codigo_empresa)',
'    and ID_FLUJO = v_id_flujo',
' group by codigo_empresa',
'Union',
'Select 6 Orden,',
'	   ''Planillas'' Descripcion,',
'	   0 MontoUSD$,',
'	   sum(nvl(Liquido,0))*-1  MontoQTZ,',
'      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'      Codigo_Empresa',
'  from flujo_efectivo_planillas x',
' where codigo_empresa in (',
'    select CODIGO_EMPRESA ',
'      From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'  and es_Prestacion = ''N''',
'  and id_flujo = v_id_flujo /*in (select max(ID_FLUJO)',
'				    from  flujo_efectivo_planillas',
'				   where codigo_empresa = x.codigo_empresa)*/',
' group by codigo_empresa',
'Union',
'Select 7 Orden,',
'	   ''Prestaciones'' Descripcion,',
'	   0 MontoUSD$,',
'	   nvl(sum(nvl(Liquido,0)),0)*-1  MontoQTZ,',
'      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'      Codigo_Empresa',
'  from flujo_efectivo_planillas x',
' where codigo_empresa in (',
'    select CODIGO_EMPRESA ',
'      From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'  and es_Prestacion = ''S''',
'  and id_flujo = v_id_flujo /*in (select max(ID_FLUJO)',
'				    from  flujo_efectivo_planillas',
'				   where codigo_empresa = x.codigo_empresa)*/',
' group by codigo_empresa',
'union ',
'select 8 Orden,',
'	   ''Igss'' Descripcion,',
'	   0 MontoUSD$,',
'	   nvl(Sum(Igss),0) * - 1 MontoQtz,',
'      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'      Codigo_Empresa',
'	  from flujo_efectivo_planillas_igss x',
'   where codigo_empresa in (',
'          select CODIGO_EMPRESA ',
'            From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'            where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'     and id_flujo = v_id_flujo /*in (select max(ID_FLUJO)',
'				    from  flujo_efectivo_planillas',
'				   where codigo_empresa = x.codigo_empresa)*/',
'  group by codigo_empresa',
'Union ',
'select 9 Orden,',
'	   ''Anticipos x Liquidar'' Descripcion,',
'	   nvl(sum(Monto_AXLUSD$),0) Monto_AXLUSD$,',
' 	   nvl(sum(Monto_AXLQTZ),0) Monto_AXLQTZ,',
'       nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'       Codigo_Empresa',
'  from (',
'        Select case ',
'                 when codigo_moneda = 2 then',
'                   nvl(sum(MONTO_$),0) * -1',
'               end Monto_AXLUSD$,',
' 		       case ',
' 		         when codigo_moneda = 1 then',
' 			       nvl(sum(MONTO_QTZ),0) * -1',
'		       end Monto_AXLQTZ,',
'               codigo_empresa',
'          From FLUJO_EFECTIVO_ANTICIPOS axl',
'         where codigo_empresa in (',
'               select CODIGO_EMPRESA ',
'                 From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'                where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'           and id_flujo = v_id_flujo',
'        Group by Codigo_Moneda, codigo_empresa)',
'group by codigo_empresa',
'union ',
' Select 10 Orden,',
'	    ''Cajas Chicas'' Descripcion,',
'	    decode(codigo_moneda,2,sum(monto_pago),0) * -1 Monto_USD$,',
'	    decode(codigo_moneda,1,sum(monto_pago),0) * -1 MontoQtz,',
'       nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'       Codigo_Empresa',
' from FLUJO_EFECTIVO_CAJAS_CHICAS',
' where idflujo = v_id_flujo',
' group by codigo_empresa,codigo_moneda',
'union ',
'select orden, descripcion, sum(monto_usd$) monto_usd$, sum(monto_qtz) monto_qtz, empresa_consolidadora,',
'       Codigo_Empresa',
'  from (',
'		select 11 Orden, ''Impuestos'' Descripcion, 0 Monto_USD$,',
'			  sum(IMPUESTOS) Monto_Qtz,',
'		      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'            codigo_empresa',
'		From flujo_impuestos',
'		where ID_FLUJO = v_id_flujo',
'		group by codigo_empresa',
'  )',
'  group by orden, descripcion, empresa_consolidadora, codigo_empresa',
'union',
'Select 12 Orden,',
'	   ''Subcontratistas'' Descripcion,',
'	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,',
'	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,',
'      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'      Codigo_Empresa',
'  from flujo_efectivo_antiguedad_cxp',
' where codigo_empresa in (',
'    select CODIGO_EMPRESA ',
'      From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'   and nvl(Proveedor_Mayor,''N'')  = ''N''',
'   and nvl(sub_contratista,''N'') = ''S''',
'   and nvl(empleado,''N'') = ''N''',
'   and intercompany = ''N''',
'   and ID_FLUJO = v_id_flujo',
' group by codigo_empresa',
' union',
'---------------- Nuevo Union para Flujo de Pago de Tarjeta credito ---------------',
'select 13 Orden,',
'    ''Tarjeta Credito'' DESCRIPCION,',
'    sum(',
'        (',
'            case when CODIGO_MONEDA = 2 THEN',
'                nvl(VALOR * TASA_CAMBIO,0)',
'            ELSE',
'                0.00',
'            END',
'        )',
'        ',
'        ',
'        )*-1  MontoUSD,',
'',
'    sum(',
'        (',
'            case when CODIGO_MONEDA = 1 THEN',
'                nvl(VALOR,0)',
'            ELSE',
'                0.00',
'            END',
'        )',
'        ',
'        ',
'        )*-1  MontoQTZ,',
'',
'    nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'     Codigo_Empresa',
'from FLUJO_EFECTIVO_TCC_SOLICITUD_COMPRA',
'where CODIGO_EMPRESA in( ',
'    (',
'        select CODIGO_EMPRESA ',
'        From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'        where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'    )',
'    and ID_FLUJO = v_id_flujo',
'    group by codigo_empresa',
'union',
'',
'Select 14 Orden,',
unistr('	   ''Viaticos, Depreciaci\00F3n y Combustible'' Descripcion,'),
'	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,',
'	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,',
'      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'      Codigo_Empresa',
'  from flujo_efectivo_antiguedad_cxp',
' where codigo_empresa in (',
'    select CODIGO_EMPRESA ',
'      From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'   and nvl(Proveedor_Mayor,''N'')  = ''N''',
'   and nvl(sub_contratista,''N'') = ''N''',
'   and nvl(empleado,''N'') = ''S''',
'   and ID_FLUJO = v_id_flujo',
' group by codigo_empresa',
'--Order by 1',
'---------------- Nuevo Union para Flujo de prestamos y solitud de Pago ---------------',
'UNION',
'    select 15 orden,',
unistr('    ''Pr\00E9stamos'' Descripcion,'),
'    sum((case when CODIGO_MONEDA = 2 THEN',
'            nvl(TOTAL_ORIGEN,0)',
'         ELSE',
'            0.00',
'         END))*-1  MontoUSD,',
'    sum((case when CODIGO_MONEDA = 1 THEN',
'            nvl(TOTAL_LOCAL,0)',
'        ELSE',
'            0.00',
'        END))*-1  MontoQTZ,',
'    nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'    CODIGO_EMPRESA',
'    from FLUJO_PRESTAMOS_SOLICITUD_PAGO',
'    where CODIGO_EMPRESA in((',
'            select CODIGO_EMPRESA ',
'            From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'            where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora)))',
'        and ID_FLUJO = v_id_flujo',
'    group by CODIGO_EMPRESA',
'-------------------------------- FIN DEL NUEVO UNION -----------------------',
'UNION',
'    select 17 orden,',
'    ''Solicitud de Viaticos'' Descripcion,',
'    ',
'    sum((case when MONEDA = 2 THEN',
'                nvl(TOTAL_ORIGEN,0)',
'            ELSE',
'                0.00',
'            END))*-1  MontoUSD,',
'    sum((case when MONEDA = 1 THEN',
'                nvl(TOTAL_LOCAL,0)',
'            ELSE',
'                0.00',
'            END))*-1  MontoQTZ,',
'    nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'    CODIGO_EMPRESA',
'    from FLUJO_VTC_SOLICITUD_VIATICOS',
'    where CODIGO_EMPRESA in( ',
'        (',
'            select CODIGO_EMPRESA ',
'            From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'            where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'        )',
'        and ID_FLUJO = v_id_flujo',
'    group by CODIGO_EMPRESA',
'-- ############################### INTERCOMPANY #########################################',
'    UNION',
'    Select 18 Orden,',
'	   ''Empresas relacionadas'' Descripcion,',
'	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,',
'	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,',
'      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,',
'      Codigo_Empresa',
'  from flujo_efectivo_antiguedad_cxp',
' where codigo_empresa in (',
'    select CODIGO_EMPRESA ',
'      From FLUJO_EMPRESAS_CONSOLIDADORAS  ',
'      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))',
'   and intercompany = ''S''',
'   and ID_FLUJO = v_id_flujo',
' group by codigo_empresa',
'-- ############################### FIN DEL INTERCOMPANY #####################################',
'-- INICIO FDU_TRANSACCIONES_FINANCIERAS',
'    UNION',
'    SELECT',
'        19 ORDEN,',
unistr('        ''Inversi\00F3n/Prestamos'' DESCRIPCION,'),
'        SUM(NVL(SAF.APX_FNC_CONVERSION_MONEDAS',
'            (',
'                MONTO_ORIGEN,',
'                CODIGO_MONEDA,',
'                2,',
'                TASA_CAMBIO,',
'                NULL',
'            ), 0)) * -1 MONTOUSD,',
'        SUM(NVL(MONTO_LOCAL, 0)) * -1 MONTOQTZ,',
'        NVL(SAF.FNC_GET_FLUJO_EMPRESA_CONSOLIDADORA(CODIGO_EMPRESA), CODIGO_EMPRESA) EMPRESA_CONSOLIDADORA,',
'        CODIGO_EMPRESA',
'    FROM SAF.FLUJO_EFECTIVO_FDU_TRANSACCIONES_FINANCIERAS',
'    WHERE ID_FLUJO = v_id_flujo',
'    AND CODIGO_EMPRESA IN',
'    (',
'        SELECT ',
'            CODIGO_EMPRESA',
'        FROM SAF.FLUJO_EMPRESAS_CONSOLIDADORAS',
'        WHERE CODIGO_EMPRESA_CONSOLIDADORA = NVL(:P103_EMPRESA_CONSOLIDADORA, CODIGO_EMPRESA_CONSOLIDADORA)',
'    )',
'    GROUP BY CODIGO_EMPRESA',
'-- FIN FDU_TRANSACCIONES_FINANCIERAS',
'Order by 1;',
'',
'    cursor c_id is',
'        Select max(id) id',
'        From Flujo_Efectivo_Proceso',
'        where to_char(fechai, ''dd-mm-yyyy'') = to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy'')',
'          and to_char(fechaf, ''dd-mm-yyyy'') = to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy'');',
' ',
' 	cursor c_fechas is',
'	   select trunc(add_months(last_day(to_Date(:P103_FECHAI, ''dd-mm-yyyy'')),-2) + 1) First_Date,',
'	   		  trunc(last_day(add_months(last_day(to_date(:P103_FECHAI,''dd-mm-yyyy'')),-2) + 1)) Last_date',
'	   from dual;',
'',
'    l_id    Flujo_Efectivo_Proceso.id%Type:=0;',
'    l_fecha_i	date;',
'	 l_fecha_f	date;',
'    l_fechai   date;',
'    l_fechaf   date;',
'',
'    cont_ingresos number;',
'    cont_cxp_materiales number;',
'    cont_cxp_servicios number;',
'    cont_cxp_proveedores_mayores number;',
'    cont_pagos_recurrentes number;',
'    cont_planillas number;',
'    cont_prestaciones number;',
'    cont_igss number;',
'    cont_anticipos_x_liquidar number;',
'    cont_cajas_chicas number;',
'    cont_impuestos number;',
'    cont_subcontratistas number;',
'    cont_otros_presupuestos number;',
'    cont_viaticos_dep_com number;',
'    cont_prestamos number;',
'    cont_pagos_solicitados number;',
'    cont_viaticos_solicitados number;',
'    cont_empresas_relacionadas number;',
'    -- INICIO FDU_TRANSACCIONES_FINANCIERAS',
'    CONST_FDU_TRANSACCIONES_FINANCIERAS NUMBER;',
'    -- FIN FDU_TRANSACCIONES_FINANCIERAS',
'',
'Begin',
'',
'    cont_ingresos := 0;',
'    cont_cxp_materiales := 0;',
'    cont_cxp_servicios := 0;',
'    cont_cxp_proveedores_mayores := 0;',
'    cont_pagos_recurrentes := 0;',
'    cont_planillas := 0;',
'    cont_prestaciones := 0;',
'    cont_igss := 0;',
'    cont_anticipos_x_liquidar := 0;',
'    cont_cajas_chicas := 0;',
'    cont_impuestos := 0;',
'    cont_subcontratistas:= 0;',
'    cont_otros_presupuestos:= 0;',
'    cont_viaticos_dep_com:= 0;',
'    cont_prestamos:= 0;',
'    cont_pagos_solicitados:= 0;',
'    cont_viaticos_solicitados := 0;',
'    cont_empresas_relacionadas := 0;',
'    -- INICIO FDU_TRANSACCIONES_FINANCIERAS',
'    CONST_FDU_TRANSACCIONES_FINANCIERAS := 0;',
'    -- FIN FDU_TRANSACCIONES_FINANCIERAS',
'',
'',
'	-- Con este cambio siempre traemos los impuestos del mes Anterior',
'	-- A solicitud de Gerson ',
'	open c_fechas;',
'	fetch c_fechas into l_fecha_i, l_fecha_f;',
'	close c_fechas;',
' ',
'    Insert Into Flujo_Efectivo_Proceso(FechaI, FechaF,codigo_empresa,fechaiingreso,fechafingreso)',
'    Values(:P103_FECHAI, :P103_FECHAF,:P103_EMPRESA_CONSOLIDADORA,:P103_FECHAI_INGRESOS,:P103_FECHAF_INGRESOS);',
'    Commit;',
'',
'    open c_id;',
'    fetch c_id into l_id;',
'    close c_id;',
'',
'',
'    ',
'    SAF.PR_FLUJO_EFECTIVO_INGRESOS(:P103_FECHAI_INGRESOS, :P103_FECHAF_INGRESOS, l_id, :P103_EMPRESA_CONSOLIDADORA) ;',
'    SAF.PR_FLUJO_EFECTIVO_ANTIGUEDADCXP(:P103_FECHAF, l_id, :P103_EMPRESA_CONSOLIDADORA) ;',
'    SAF.PR_FLUJO_EFECTIVO_Planillas(:P103_FECHAI_INGRESOS, :P103_FECHAF_INGRESOS, l_id, :P103_EMPRESA_CONSOLIDADORA) ;',
'    SAF.PR_FLUJO_EFECTIVO_PLANILLAS_IGSS(:P103_FECHAI, :P103_FECHAF, l_id, :P103_EMPRESA_CONSOLIDADORA) ;',
'    saf.PR_FLUJO_EFECTIVO_pagos_recurrentes(l_id, :P103_EMPRESA_CONSOLIDADORA) ;',
'    SAF.PR_FLUJO_EFECTIVO_ANTICIPOS(l_id, :P103_EMPRESA_CONSOLIDADORA,:P103_FECHAI, :P103_FECHAF);',
'    saf.PR_FLUJO_EFECTIVO_CAJAS_CHICAS(l_id, :P103_EMPRESA_CONSOLIDADORA,:P103_FECHAI, :P103_FECHAF) ;',
'    saf.PR_FLUJO_IMPUESTOS(l_id, :P103_EMPRESA_CONSOLIDADORA, l_fecha_i, l_fecha_f) ;',
'    -- procedimiento de flujo de prestamos',
'    --Raise_Application_Error(-20366,''Valor : ''||l_id || ''-'' || :P103_EMPRESA_CONSOLIDADORA || ''-'' ||  l_fecha_i || ''-'' || l_fecha_f);',
'    saf.PR_FLUJO_PRESTAMO(l_id, :P103_EMPRESA_CONSOLIDADORA,  :P103_FECHAI, :P103_FECHAF);',
'    --Funcion para el pago de tarjeta',
'    saf.PR_FLUJO_PAGO_TARJETA_CREDITO(l_id,:P103_EMPRESA_CONSOLIDADORA,sysdate, :GLOBAL_CODIGO_USUARIO);',
'    saf.PR_FLUJO_VIATICOS(l_id, :P103_EMPRESA_CONSOLIDADORA,:P103_FECHAI, :P103_FECHAF);',
'    -- INICIO FDU_TRANSACCIONES_FINANCIERAS',
'    SAF.PR_FLUJO_TRANSACCIONES_FINANCIERAS(l_id, :P103_EMPRESA_CONSOLIDADORA);',
'    -- FIN FDU_TRANSACCIONES_FINANCIERAS',
'    Commit;',
'',
'    for cf in c_flujo(l_id, l_fecha_i, l_fecha_f) Loop',
'      if cf.descripcion = ''Ingresos'' then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI_INGRESOS, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF_INGRESOS, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               cf.descripcion, cf.montoUsd$, cf.montoQtz, cf.orden, cf.empresa_consolidadora, cf.codigo_empresa );',
'      else',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               cf.descripcion, cf.montoUsd$, cf.montoQtz, cf.orden, cf.empresa_consolidadora, cf.codigo_empresa );',
'      end if;',
'',
'      case',
'        when cf.orden = 1 then',
'        cont_ingresos := cont_ingresos +1;',
'',
'        when cf.orden = 2 then',
'        cont_cxp_materiales := cont_cxp_materiales +1;',
'',
'        when cf.orden = 3 then',
'        cont_cxp_servicios := cont_cxp_servicios +1;',
'',
'        when cf.orden = 4 then',
'        cont_cxp_proveedores_mayores := cont_cxp_proveedores_mayores +1;',
'',
'        when cf.orden = 5 then',
'        cont_pagos_recurrentes := cont_pagos_recurrentes +1;',
'',
'        when cf.orden = 6 then',
'        cont_planillas := cont_planillas +1;',
'',
'        when cf.orden = 7 then',
'        cont_prestaciones := cont_prestaciones +1;',
'',
'        when cf.orden = 8 then',
'        cont_igss := cont_igss +1;',
'',
'        when cf.orden = 9 then',
'        cont_anticipos_x_liquidar := cont_anticipos_x_liquidar +1;',
'',
'        when cf.orden = 10 then',
'        cont_cajas_chicas := cont_cajas_chicas +1;',
'',
'        when cf.orden = 11 then',
'        cont_impuestos := cont_impuestos +1;',
'        ',
'        when cf.orden = 12 then',
'        cont_subcontratistas := cont_subcontratistas +1;',
'        ',
'        when cf.orden = 13 then',
'        cont_otros_presupuestos := cont_otros_presupuestos +1;',
'        ',
'        when cf.orden = 14 then',
'        cont_viaticos_dep_com := cont_viaticos_dep_com +1;',
'        ',
'        when cf.orden = 15 then',
'        cont_prestamos := cont_prestamos +1;',
'        ',
'        when cf.orden = 16 then',
'        cont_pagos_solicitados := cont_pagos_solicitados +1;',
'',
'        when cf.orden = 17 then',
'        cont_viaticos_solicitados := cont_viaticos_solicitados +1;',
'',
'        when cf.orden = 18 then',
'        cont_empresas_relacionadas := cont_empresas_relacionadas +1; -- INTERCOMPANY',
'        ',
'        -- INICIO FDU_TRANSACCIONES_FINANCIERAS',
'        WHEN cf.orden = 19 then',
'        CONST_FDU_TRANSACCIONES_FINANCIERAS := CONST_FDU_TRANSACCIONES_FINANCIERAS + 1;',
'        -- FIN FDU_TRANSACCIONES_FINANCIERAS',
'      end case;',
'',
'    end loop;',
'    ',
'',
'',
'    if cont_ingresos=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI_INGRESOS, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF_INGRESOS, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Ingresos'', 0, 0, 1, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );    ',
'    end if;',
'    if cont_cxp_materiales=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''CXP Materiales'', 0, 0, 2, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_cxp_servicios=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''CXP Servicios'', 0, 0, 3, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_cxp_proveedores_mayores=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''CXP Proveedores Mayores'', 0, 0, 4, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_pagos_recurrentes=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Pagos Recurrentes'', 0, 0, 5, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_planillas=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Planillas'', 0, 0, 6, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_prestaciones=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Prestaciones'', 0, 0, 7, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_igss=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Igss'', 0, 0, 8, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_anticipos_x_liquidar=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Anticipos x Liquidar'', 0, 0, 9, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_cajas_chicas=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Cajas Chicas'', 0, 0, 10, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_impuestos=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Impuestos'', 0, 0, 11, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_subcontratistas=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Subcontratistas'', 0, 0, 12, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_otros_presupuestos=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Tarjeta Credito'', 0, 0, 13, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'    if cont_viaticos_dep_com=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
unistr('               ''Viaticos, Depreciaci\00F3n y Combustible'', 0, 0, 14, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );'),
'    end if;',
'    if cont_prestamos=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
unistr('               ''Pr\00E9stamos'', 0, 0, 15, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );'),
'    end if;',
'    if cont_pagos_solicitados=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
unistr('               ''Pagos Solicitados por Direcci\00F3n'', 0, 0, 16, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );'),
'    end if;',
'    if cont_viaticos_solicitados=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Solicitud de Viaticos'', 0, 0, 16, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'',
'    if cont_empresas_relacionadas=0 then',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Empresas relacionadas'', 0, 0, 18, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    end if;',
'',
'    -- INICIO FDU_TRANSACCIONES_FINANCIERAS',
'    IF CONST_FDU_TRANSACCIONES_FINANCIERAS = 0 THEN',
'        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)',
'        values(l_id, to_char(to_date(:P103_FECHAI, ''dd-mm-yyyy''), ''dd-mm-yyyy''), ',
'                to_char(to_date(:P103_FECHAF, ''dd-mm-yyyy''), ''dd-mm-yyyy''),',
'               ''Transacciones Financieras'', 0, 0, 19, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );',
'    END IF;',
'    -- FIN FDU_TRANSACCIONES_FINANCIERAS',
'    commit;',
'',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(185441843012601080)
,p_process_success_message=>'Proceso Generado con Exito ;)'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(185441103630601078)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(703806988643369576)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'<b>Empresas Consolidadoras</b> - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
