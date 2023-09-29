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
,p_default_application_id=>180
,p_default_id_offset=>0
,p_default_owner=>'SAF'
);
end;
/
 
prompt APPLICATION 180 - Dashboard Dirección
--
-- Application Export:
--   Application:     180
--   Name:            Dashboard Dirección
--   Date and Time:   10:54 Thursday September 28, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 84009
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84009
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84009);
end;
/
prompt --application/pages/page_84009
begin
wwv_flow_imp_page.create_page(
 p_id=>84009
,p_name=>'APLICAR_PAGO_INVERSION_PRESTAMO'
,p_alias=>'APLICAR-PAGO-INVERSION-PRESTAMO'
,p_page_mode=>'MODAL'
,p_step_title=>'.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#crear-btns-modal.js',
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const $btns = [',
'    {',
'        textBtn: ''Cancelar'',',
'        icon: ''fa-remove'',',
'        idbtn: ''CANCELAR'',',
'    }',
'];',
'',
'customButtonsModal(''MODAL_INVERSION_PRESTAMO'', $btns);',
'',
'$(''.is-readonly'').prop(''disabled'', true);',
'$(''#LISTA_ig_toolbar_actions_button'').hide();'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#LISTA_ig_toolbar_actions_button,',
'#LISTA_ig_toolbar_column_filter_button,',
'#LISTA_ig_toolbar_search_field',
'{',
'    display: none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'1200'
,p_dialog_css_classes=>'MODAL_INVERSION_PRESTAMO'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230928105218'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(209363990050316724)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(163964762233980830)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(209365112251316736)
,p_plug_name=>'LISTA'
,p_region_name=>'LISTA'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:margin-top-sm'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(163962841018980827)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	A.ID,',
'	A.TIPO_DESTINATARIO,',
'	A.OBSERVACIONES DESCRIPCION,',
'	(',
'		CASE',
'			WHEN A.ES_PRESTAMO = ''S'' THEN',
unistr('				''Pr\00E9stamo'''),
'			ELSE',
unistr('				''Inversi\00F3n'''),
'		END',
'	) TIPO_TRANSACCION,',
'	(',
'		SAF.APX_FNC_CONVERSION_MONEDAS',
'		(',
'			A.MONTO_ORIGEN,',
'			A.CODIGO_MONEDA,',
'			2,',
'			A.TASA_CAMBIO,',
'			NULL',
'		)',
'	) MONTO_DOLAR,',
'	A.MONTO_LOCAL MONTO_LOCAL,',
'	SAF.GET_FDU_NOMBRE_DESTINATARIO(A.ID_ASOCIACION, A.CODIGO_EMPRESA, A.TIPO_DESTINATARIO) NOMBRE_DESTINATARIO,',
'    A.APLICA_PAGO',
'FROM SAF.FLUJO_EFECTIVO_FDU_TRANSACCIONES_FINANCIERAS A',
'WHERE A.ID_FLUJO = :P84009_ID_FLUJO',
'--AND A.CODIGO_EMPRESA = :P84009_ID_EMPRESA'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P84009_ID_FLUJO,P84009_ID_EMPRESA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209365350376316738)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'ID'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_link_target=>'f?p=133:84006:&SESSION.::&DEBUG.:84006:P84006_ID,P84006_ACCION_MODAL:&ID.,VER_REGISTRO'
,p_link_text=>'&ID.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209365498368316739)
,p_name=>'TIPO_DESTINATARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_DESTINATARIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Destinatario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_value_css_classes=>'is-readonly'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>40
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209365621788316741)
,p_name=>'DESCRIPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPCION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Descripcion'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'is-readonly'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209365763854316742)
,p_name=>'TIPO_TRANSACCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_TRANSACCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Transaccion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_value_css_classes=>'is-readonly'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209365837955316743)
,p_name=>'MONTO_DOLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONTO_DOLAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Monto Dolar'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209365986249316744)
,p_name=>'MONTO_LOCAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MONTO_LOCAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Monto Local'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209366062680316745)
,p_name=>'NOMBRE_DESTINATARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_DESTINATARIO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Destinatario'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'is-readonly'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209366237239316747)
,p_name=>'APLICA_PAGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APLICA_PAGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Aplica Pago'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'N'
,p_attribute_02=>'S'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(209366371911316748)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>10
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(209365217253316737)
,p_internal_uid=>209365217253316737
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_imp.id(213130561951984721)
,p_interactive_grid_id=>wwv_flow_imp.id(209365217253316737)
,p_static_id=>'2131306'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(213130794406984721)
,p_report_id=>wwv_flow_imp.id(213130561951984721)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1643121026247)
,p_view_id=>wwv_flow_imp.id(213130794406984721)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(209366237239316747)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(213131268856984724)
,p_view_id=>wwv_flow_imp.id(213130794406984721)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(209365350376316738)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(213132132609984730)
,p_view_id=>wwv_flow_imp.id(213130794406984721)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(209365498368316739)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(213133940282984742)
,p_view_id=>wwv_flow_imp.id(213130794406984721)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(209365621788316741)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>239
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(213134827294984745)
,p_view_id=>wwv_flow_imp.id(213130794406984721)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(209365763854316742)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(213135728987984748)
,p_view_id=>wwv_flow_imp.id(213130794406984721)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(209365837955316743)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(213136689652984752)
,p_view_id=>wwv_flow_imp.id(213130794406984721)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(209365986249316744)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(213137599152984755)
,p_view_id=>wwv_flow_imp.id(213130794406984721)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(209366062680316745)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(213938034768930714)
,p_view_id=>wwv_flow_imp.id(213130794406984721)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(209366371911316748)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(209364682669316731)
,p_button_sequence=>60
,p_button_name=>'CANCELAR'
,p_button_static_id=>'CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(164036469561980945)
,p_button_image_alt=>'Cancelar'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209364095201316725)
,p_name=>'P84009_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(209363990050316724)
,p_prompt=>'Empresa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(164033953080980933)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209364194210316726)
,p_name=>'P84009_ID_FLUJO'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209364231511316727)
,p_name=>'P84009_ID_EMPRESA'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(209364496550316729)
,p_name=>'P84009_ACCION_MODAL'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209364988354316734)
,p_name=>'CARGAR_NOMBRE'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209365026097316735)
,p_event_id=>wwv_flow_imp.id(209364988354316734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".MODAL_INVERSION_PRESTAMO .ui-dialog-title").text(''Aplicar Pago'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209364769111316732)
,p_name=>'CANCELAR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(209364682669316731)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209364889352316733)
,p_event_id=>wwv_flow_imp.id(209364769111316732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84009,estado:0});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209366528962316750)
,p_name=>'BOTONES_IG'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213939613873943401)
,p_event_id=>wwv_flow_imp.id(209366528962316750)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_HR.BILOG.EXTENDIGTOOLBAR'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(209365112251316736)
,p_attribute_01=>'actions2'
,p_attribute_02=>'L'
,p_attribute_03=>'Guardar'
,p_attribute_04=>'N'
,p_attribute_05=>'fa-save'
,p_attribute_06=>'N'
,p_attribute_07=>'B'
,p_attribute_08=>'Guardar'
,p_attribute_09=>'guardarCambios'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213939715388943402)
,p_event_id=>wwv_flow_imp.id(209366528962316750)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_HR.BILOG.EXTENDIGTOOLBAR'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(209365112251316736)
,p_attribute_01=>'actions2'
,p_attribute_02=>'L'
,p_attribute_03=>'Aplicar a Todo'
,p_attribute_04=>'N'
,p_attribute_05=>'fa-check'
,p_attribute_06=>'N'
,p_attribute_07=>'B'
,p_attribute_08=>'Aplicar a Todo'
,p_attribute_09=>'aplicarTodo'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213939835632943403)
,p_event_id=>wwv_flow_imp.id(209366528962316750)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_HR.BILOG.EXTENDIGTOOLBAR'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(209365112251316736)
,p_attribute_01=>'actions2'
,p_attribute_02=>'L'
,p_attribute_03=>'Desaplicar a Todo'
,p_attribute_04=>'N'
,p_attribute_05=>'fa-remove'
,p_attribute_06=>'N'
,p_attribute_07=>'B'
,p_attribute_08=>'Desaplicar a Todo'
,p_attribute_09=>'desaplicarTodo'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213939929496943404)
,p_name=>'OCULTAR_BOTONES_IG'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213940333842943408)
,p_event_id=>wwv_flow_imp.id(213939929496943404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'HIDE'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''[data-action="edit"]'').remove();',
'$(''[data-action="save"]'').remove();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213940456028943409)
,p_name=>'guardarCambios'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'guardarCambios'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213940532940943410)
,p_event_id=>wwv_flow_imp.id(213940456028943409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.region("LISTA").widget().interactiveGrid("getActions").invoke("save");',
'apex.region("LISTA").widget().interactiveGrid("getActions").invoke("refresh");'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213940629498943411)
,p_name=>'aplicarTodo'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'aplicarTodo'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213940758620943412)
,p_event_id=>wwv_flow_imp.id(213940629498943411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'APLICAR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var igrid  = apex.region(''LISTA'').widget().interactiveGrid(''getViews'',''grid'');',
'var model  = igrid.model; ',
'',
'model.forEach(function(record) {',
'    try {',
'        model.setValue(record,''APLICA_PAGO'', ''S'');',
'    } catch(error) { }',
'',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213940893977943413)
,p_name=>'desaplicarTodo'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'desaplicarTodo'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213940956809943414)
,p_event_id=>wwv_flow_imp.id(213940893977943413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DESAPLICAR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var igrid  = apex.region(''LISTA'').widget().interactiveGrid(''getViews'',''grid'');',
'var model  = igrid.model; ',
'',
'model.forEach(function(record) {',
'    try {',
'        model.setValue(record,''APLICA_PAGO'', '''');',
'    } catch(error) { }',
'',
'});',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209364348015316728)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P84009_EMPRESA := SAF.FNC_EMPRESAS(:P84009_ID_EMPRESA);',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(209366424103316749)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(209365112251316736)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'LISTA - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'CASE :APEX$ROW_STATUS',
'	WHEN ''U'' THEN',
'    ',
'		IF :APLICA_PAGO = ''S'' THEN',
'            UPDATE SAF.FLUJO_EFECTIVO_FDU_TRANSACCIONES_FINANCIERAS',
'                SET APLICA_PAGO = ''S''',
'            WHERE ID = :ID;',
'		ELSE',
'			UPDATE SAF.FLUJO_EFECTIVO_FDU_TRANSACCIONES_FINANCIERAS',
'                SET APLICA_PAGO = NULL',
'            WHERE ID = :ID;',
'		END IF;',
'  END CASE;',
'END;'))
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_process_error_message=>unistr('Error en la aplicaci\00F3n de pagos')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Pagos Aplicados'
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
