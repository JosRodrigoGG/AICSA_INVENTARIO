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
--     PAGE: 163
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00163
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>163);
end;
/
prompt --application/pages/page_00163
begin
wwv_flow_imp_page.create_page(
 p_id=>163
,p_name=>'NOTAS_ESTADOS_FINANCIEROS_CORPORACION'
,p_alias=>'NOTAS-ESTADOS-FINANCIEROS-CORPORACION'
,p_page_mode=>'MODAL'
,p_step_title=>'Notas Estados Financieros'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#reportes/convertir_IR_to_treeview#MIN#.js',
'#WORKSPACE_FILES#jquery.treetable_last.js',
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#jquery.treetable.min.css',
'#APP_FILES#jquery.treetable.theme.default.css',
'#WORKSPACE_FILES#saf-cssnew.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#REPORTE th#SALDO_1, #REPORTE td[headers=SALDO_1],',
'#REPORTE th#SALDO_2, #REPORTE td[headers=SALDO_2]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'.t-Header-controls',
'{',
'    display: block !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230828095200'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(803089072756278352)
,p_plug_name=>'REPORTE_GERENCIAL'
,p_region_name=>'REPORTE'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    C001 AS NOTA,',
'    C002 AS ID,',
'    C003 AS ID_PADRE,',
'    C004 AS NUMERO,',
'    C005 AS NOMBRE,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		TO_NUMBER(C006),',
'		1,',
'		:P163_MONEDA,',
'		1,',
'		NULL',
'	) AS SALDO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		TO_NUMBER(C007),',
'		1,',
'		:P163_MONEDA,',
'		1,',
'		NULL',
'	) AS SALDO_2,',
'    TO_NUMBER(C008) AS ORDER_1,',
'    TO_NUMBER(C009) AS ORDER_2,',
'    TO_NUMBER(C010) AS ORDER_3,',
'    C011 AS TIPO,',
'    LEVEL NIVEL,',
'    (',
'        CASE',
'            WHEN C011 = ''ENCABEZADO_NOTA'' OR C011 = ''TOTAL_NOTA'' THEN',
'                ''font-weight: bold; text-decoration: underline;''',
'            WHEN C011 = ''TITULO_DETALLE'' OR C011 = ''TOTAL_TITULO'' THEN',
'                ''font-weight: bold;''',
'            ELSE',
'                ''font-weight: lighter;''',
'        END',
'    ) CLASE,',
'    (',
'        CASE',
'            WHEN C011 = ''DETALLE'' OR C011 = ''TOTAL_TITULO'' OR C011 = ''TOTAL_NOTA'' OR C011 = ''TOTAL_NOTA_223'' THEN',
'                :P163_SIMBOLO_MONEDA',
'            ELSE',
'                NULL',
'        END',
'    ) SIMBOLO_MONEDA',
'FROM APEX_COLLECTIONS',
'WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'AND C001 = (''NOTA '' || :P163_NOTA)',
'START WITH C003 IS NULL ',
'CONNECT BY PRIOR C002 = C003',
'ORDER SIBLINGS BY (C008), (C009);'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P163_NOTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'REPORTE_GERENCIAL'
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
 p_id=>wwv_flow_imp.id(803089110498278353)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>803089110498278353
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204465045676740248)
,p_db_column_name=>'NOTA'
,p_display_order=>10
,p_column_identifier=>'BO'
,p_column_label=>'Nota'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204465407718740249)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'BP'
,p_column_label=>'Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204465813749740250)
,p_db_column_name=>'ID_PADRE'
,p_display_order=>30
,p_column_identifier=>'BQ'
,p_column_label=>'Id Padre'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204466234510740250)
,p_db_column_name=>'NUMERO'
,p_display_order=>40
,p_column_identifier=>'BR'
,p_column_label=>'Numero'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204466652110740252)
,p_db_column_name=>'NOMBRE'
,p_display_order=>50
,p_column_identifier=>'BS'
,p_column_label=>'Descripcion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="info" data-tt-id="#ID#" data-tt-parent-id="#ID_PADRE#" >',
'    <span class="forSearch"',
'        style="padding:0px; display:inline-block; #CLASE#">  ',
'        #NOMBRE#',
'    </span>',
'</span>',
'',
'<input id="NIVEL" type="hidden" value="#NIVEL#">'))
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204467016098740252)
,p_db_column_name=>'SALDO_1'
,p_display_order=>60
,p_column_identifier=>'BT'
,p_column_label=>'&P163_ANIO.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#"></div> <div style="float:right; #CLASE#">#SALDO_1#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'SALDO_1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204467471932740253)
,p_db_column_name=>'SALDO_2'
,p_display_order=>70
,p_column_identifier=>'BU'
,p_column_label=>'&P163_ANIO_MENOS_1.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#"></div> <div style="float:right; #CLASE#">#SALDO_2#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'SALDO_2'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204467822449740253)
,p_db_column_name=>'ORDER_1'
,p_display_order=>80
,p_column_identifier=>'BV'
,p_column_label=>'Order 1'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204468257476740254)
,p_db_column_name=>'ORDER_2'
,p_display_order=>90
,p_column_identifier=>'BW'
,p_column_label=>'Order 2'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204468681860740254)
,p_db_column_name=>'ORDER_3'
,p_display_order=>100
,p_column_identifier=>'BX'
,p_column_label=>'Order 3'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204469072364740255)
,p_db_column_name=>'TIPO'
,p_display_order=>110
,p_column_identifier=>'BY'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204469482871740256)
,p_db_column_name=>'NIVEL'
,p_display_order=>120
,p_column_identifier=>'BZ'
,p_column_label=>'Nivel'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204469864317740256)
,p_db_column_name=>'CLASE'
,p_display_order=>130
,p_column_identifier=>'CA'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202309534133953441)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>140
,p_column_identifier=>'CB'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(803823836906544405)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1914309'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:SALDO_1:SALDO_2:ID:ID_PADRE:TIPO:'
,p_sort_column_1=>'ORDER_1'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'ORDER_2'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'0:0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202309394788953439)
,p_name=>'P163_MONEDA'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202309426822953440)
,p_name=>'P163_SIMBOLO_MONEDA'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204470540137740259)
,p_name=>'P163_EMPRESA'
,p_item_sequence=>10
,p_item_default=>':GLOBAL_EMPRESA'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204470982005740260)
,p_name=>'P163_FECHA_INICIO'
,p_item_sequence=>20
,p_item_default=>'1'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204471380040740261)
,p_name=>'P163_FECHA_FIN'
,p_item_sequence=>30
,p_item_default=>'TO_NUMBER(TO_CHAR(SYSDATE, ''MM''))'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204471718805740261)
,p_name=>'P163_ANIO'
,p_item_sequence=>40
,p_item_default=>'TO_NUMBER(TO_CHAR(SYSDATE, ''YYYY''))'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204472177297740262)
,p_name=>'P163_ANIO_MENOS_1'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204472579649740262)
,p_name=>'P163_NOTA'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204477342399740288)
,p_name=>'AFTER_REFRESH_REPORTE'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(803089072756278352)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204477807279740288)
,p_event_id=>wwv_flow_imp.id(204477342399740288)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'CARGAR_ARBOL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'global_formarVistaArbol(''REPORTE'',false,'''',{celda:0});'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204476527455740287)
,p_process_sequence=>120
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P163_ANIO_MENOS_1 := TO_NUMBER(:P163_ANIO) - 1;',
'',
'SELECT',
'	SIMBOLO_MONEDA',
'    INTO',
'    :P163_SIMBOLO_MONEDA',
'FROM SAF.GRAL_MONEDAS',
'WHERE CODIGO_MONEDA = :P163_MONEDA;'))
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
