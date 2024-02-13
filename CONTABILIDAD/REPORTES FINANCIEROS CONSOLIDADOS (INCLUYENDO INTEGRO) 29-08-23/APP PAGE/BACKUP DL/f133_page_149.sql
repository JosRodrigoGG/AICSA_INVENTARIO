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
--   Date and Time:   15:18 Tuesday February 13, 2024
--   Exported By:     DULCE.LOPEZ@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 149
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00149
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>149);
end;
/
prompt --application/pages/page_00149
begin
wwv_flow_imp_page.create_page(
 p_id=>149
,p_name=>'MODAL_DETALLE_CIERRE_PERIODO'
,p_alias=>'MODAL-DETALLE-CIERRE-PERIODO'
,p_page_mode=>'MODAL'
,p_step_title=>' '
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
'td[headers="C68733734784451731"],',
'td[headers="C62852301620870439"],',
'td[headers="C62852226110870438"]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'    max-width: 100px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'INDICADOR_DETALLES'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'DULCE.LOPEZ@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20231121150345'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4562039297362986293)
,p_plug_name=>'Balance General'
,p_region_name=>'BALANCE_FILTRADO'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1025110645912851487)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    C001 AS PADRE_PERIODO,',
'    C002 AS CODIGO_PERIODO,',
'    C003 AS NOMBRE,',
'    C004 AS TIPO,',
'    C005 AS PERIODO,',
'    C006 AS CODIGO,',
'    C007 AS PADRE,',
'    C008 AS FECHA_INICIO,',
'    C009 AS FECHA_FIN,',
'    TO_NUMBER(C010) AS DIAS,',
'    TO_NUMBER(C020) AS TOTAL,',
'    C021 AS NIVEL,',
'    C025 AS ORDEN',
'FROM APEX_COLLECTIONS ',
'WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'START WITH C001 IS NULL ',
'CONNECT BY PRIOR C002 = C001',
'ORDER SIBLINGS BY C001,C025,C005 ASC;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P149_TIPO_INDICADOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Balance General'
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
 p_id=>wwv_flow_imp.id(4562039368116986294)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>650
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>4562039368116986294
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64471397202317492)
,p_db_column_name=>'PADRE'
,p_display_order=>10
,p_column_identifier=>'BT'
,p_column_label=>'Padre'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64471783364317493)
,p_db_column_name=>'CODIGO'
,p_display_order=>20
,p_column_identifier=>'BU'
,p_column_label=>'Codigo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64472157163317494)
,p_db_column_name=>'NOMBRE'
,p_display_order=>30
,p_column_identifier=>'BV'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="info" data-tt-id="#CODIGO_PERIODO#" data-tt-parent-id="#PADRE_PERIODO#" >',
'    <span class="forSearch"',
'        style="padding:0px; cursor: pointer; display:inline-block; width: calc(65%); white-space: pre-line; overflow: hidden; text-overflow: ellipsis;"> ',
'        #NOMBRE#',
'    </span>',
'</span>',
'',
'<input id="NIVEL" type="hidden" value="#NIVEL#">'))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64472589391317495)
,p_db_column_name=>'TIPO'
,p_display_order=>40
,p_column_identifier=>'BW'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64464139399317478)
,p_db_column_name=>'PADRE_PERIODO'
,p_display_order=>50
,p_column_identifier=>'CM'
,p_column_label=>'Padre Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64464504178317479)
,p_db_column_name=>'CODIGO_PERIODO'
,p_display_order=>60
,p_column_identifier=>'CN'
,p_column_label=>'Codigo Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64464953208317480)
,p_db_column_name=>'PERIODO'
,p_display_order=>70
,p_column_identifier=>'CO'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64470110570317489)
,p_db_column_name=>'ORDEN'
,p_display_order=>210
,p_column_identifier=>'DC'
,p_column_label=>'Orden'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64470947008317491)
,p_db_column_name=>'NIVEL'
,p_display_order=>230
,p_column_identifier=>'DF'
,p_column_label=>'Nivel'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62852226110870438)
,p_db_column_name=>'FECHA_INICIO'
,p_display_order=>240
,p_column_identifier=>'DG'
,p_column_label=>'Fecha Inicio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(62852301620870439)
,p_db_column_name=>'FECHA_FIN'
,p_display_order=>250
,p_column_identifier=>'DH'
,p_column_label=>'Fecha Fin'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68733734784451731)
,p_db_column_name=>'DIAS'
,p_display_order=>260
,p_column_identifier=>'DJ'
,p_column_label=>'Dias'
,p_column_html_expression=>'#DIAS# Dias'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(68733870927451732)
,p_db_column_name=>'TOTAL'
,p_display_order=>270
,p_column_identifier=>'DK'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(4565002362536332996)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'11060573'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:FECHA_INICIO:FECHA_FIN:DIAS:TOTAL:TIPO:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4565487995857428184)
,p_plug_name=>'FILTROS'
,p_parent_plug_id=>wwv_flow_imp.id(4562039297362986293)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64473587678317519)
,p_name=>'P149_FILTROS_NIVEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(4565487995857428184)
,p_prompt=>'Filtros Nivel'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NOMBRE,',
'    NIVEL',
'FROM',
'(',
'    SELECT',
'        DISTINCT',
'        ''Nivel '' || C021 AS NOMBRE,',
'        C021 AS NIVEL',
'    FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'    ORDER BY C021 ASC',
')',
'UNION ALL',
'SELECT',
'    ''Todos'' AS NOMBRE,',
'    ''TODOS'' AS NIVEL',
'FROM DUAL'))
,p_cHeight=>1
,p_tag_attributes=>'style="width: 120%;"'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64473924378317527)
,p_name=>'P149_FECHA_INICIO'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64474328708317528)
,p_name=>'P149_FECHA_FIN'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64474767737317528)
,p_name=>'P149_EMPRESA'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64475171785317528)
,p_name=>'P149_UNIDAD'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64475588802317529)
,p_name=>'P149_TIPO_INDICADOR'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64475926385317529)
,p_name=>'P149_NOMBRE_INDICADOR'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(64476310977317530)
,p_name=>'P149_INTERCOMPANY'
,p_item_sequence=>70
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64479136769317542)
,p_name=>'CARGAR_NOMBRE'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64479659434317544)
,p_event_id=>wwv_flow_imp.id(64479136769317542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P149_NOMBRE_INDICADOR'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATO IS',
'        SELECT INDICADOR FROM SAF.CON_INDICADORES WHERE ID = :P149_TIPO_INDICADOR;',
'    ',
'    V_DATO VARCHAR2(256) := NULL;',
'BEGIN',
'    OPEN C_DATO;',
'        FETCH C_DATO INTO V_DATO;',
'    CLOSE C_DATO;',
'',
'    RETURN NVL(V_DATO, ''Indicador no Identificado'');',
'END;'))
,p_attribute_07=>'P149_TIPO_INDICADOR'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64480175956317545)
,p_event_id=>wwv_flow_imp.id(64479136769317542)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".INDICADOR_DETALLES .ui-dialog-title").text(apex.item(''P149_NOMBRE_INDICADOR'').getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64480547952317545)
,p_name=>'AFTER_REFRESH_BALANCE_FILTRADO'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(4562039297362986293)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64481079888317546)
,p_event_id=>wwv_flow_imp.id(64480547952317545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'g_MostrarNumeroLineasIR(''BALANCE_FILTRADO'');',
'',
'global_formarVistaArbol(''BALANCE_FILTRADO'',false,'''',{celda:0});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64481466599317546)
,p_name=>'FILTRO_NIVELES'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P149_FILTROS_NIVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64481951994317547)
,p_event_id=>wwv_flow_imp.id(64481466599317546)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''FILTRO_NIVELES_BALANCE'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64482383192317547)
,p_name=>'FILTRO_NIVELES_BALANCE'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'FILTRO_NIVELES_BALANCE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64482868819317548)
,p_event_id=>wwv_flow_imp.id(64482383192317547)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var dato = apex.item( "P149_FILTROS_NIVEL" ).getValue();',
'$(''#BALANCE_FILTRADO tr'').each(',
'    function(){',
'        if (dato == ''TODOS'') {',
'            $(this).show();',
'        } else {',
'            if ($(this).find(''input[id=NIVEL]'')[0] != undefined) {',
'                $(this).show();',
'                if (($($(this).find(''input[id=NIVEL]'')[0]).val() > dato)) {',
'                    $(this).hide();',
'                }',
'            }',
'        }',
'    }',
');'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64483308205317548)
,p_event_id=>wwv_flow_imp.id(64482383192317547)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(`#BALANCE_FILTRADO  .t-fht-thead tr:first th .t-fht-cell`).each(function(i,o){$(o).css("width",$(`#BALANCE_FILTRADO  .t-fht-tbody .t-fht-cell`).eq(i).width());});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64483728969317549)
,p_name=>'CARGAR_FILTRO'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64484274913317549)
,p_event_id=>wwv_flow_imp.id(64483728969317549)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P149_FILTROS_NIVEL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'TODOS'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(64477922200317539)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'COLLECTIONS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''COLLECTION_DETALLE'') THEN',
'	APEX_COLLECTION.CREATE_COLLECTION(''COLLECTION_DETALLE'');',
'ELSE',
'	APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_DETALLE'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(64478326977317539)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_EMPRESAS IS',
'        SELECT',
'            DISTINCT',
'            A.CODIGO_EMPRESA,',
'            (',
'                CASE WHEN (',
'                    SELECT COUNT(*) FROM',
'                    (',
'                        SELECT ',
'                            REPLACE(REPLACE(REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                        FROM ',
'                            dual CONNECT BY REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                    )',
'    				WHERE CODIGO_EMPRESA = ''TODAS_LAS_EMPRESAS''',
'                ) > 0 THEN',
'                    ''A''',
'                ELSE',
'                    CASE WHEN (',
'                        SELECT COUNT(*) FROM',
'                        (',
'                            SELECT ',
'                                REPLACE(REPLACE(REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                            FROM ',
'                                dual CONNECT BY REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                        )',
'        				WHERE A.CODIGO_EMPRESA = TO_NUMBER(CODIGO_EMPRESA)',
'                    ) > 0 THEN',
'                        ''A''',
'                    ELSE',
'                        NULL',
'                    END',
'                END',
'            ) AS ESTADO',
'        FROM SAF.GRAL_EMPRESAS A',
'        INNER JOIN SAF.GRAL_PERSONAS_TABLE B ON B.CODIGO_PERSONA = A.CODIGO_PERSONA',
'        WHERE A.CODIGO_EMPRESA > 99',
'        AND A.TIPO_EMPRESA = ''FIN'';',
'',
'    V_VECTOR VARCHAR2(32767) := NULL;',
'BEGIN',
'    V_VECTOR := ''['';',
'    FOR R_EMPRESAS IN C_EMPRESAS',
'    LOOP',
'        IF R_EMPRESAS.ESTADO IS NOT NULL THEN',
'            V_VECTOR := V_VECTOR || R_EMPRESAS.CODIGO_EMPRESA || ''|'';',
'        END IF;',
'    END LOOP;',
'    V_VECTOR := V_VECTOR || '']'';',
'    V_VECTOR := REPLACE(V_VECTOR,''|]'','']'');',
'    :P149_EMPRESA := V_VECTOR;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(64487604260338706)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_EMPRESA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_EMPRESA IS',
'        SELECT',
'        	A.CODIGO_EMPRESA,',
'        	B.NOMBRE_PERSONA',
'        FROM SAF.GRAL_EMPRESAS A',
'        INNER JOIN SAF.GRAL_PERSONAS_TABLE B ON A.CODIGO_PERSONA = B.CODIGO_PERSONA',
'        WHERE A.CODIGO_EMPRESA IN',
'        (',
'            SELECT ',
'                TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'            FROM ',
'                dual CONNECT BY REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'        );',
'BEGIN',
'',
'   APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_DETALLE'');',
'',
'    FOR R_EMPRESA IN C_EMPRESA',
'    LOOP',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => NULL,',
'            p_c002 => ''E-'' || R_EMPRESA.CODIGO_EMPRESA,',
'            p_c003 => R_EMPRESA.NOMBRE_PERSONA,',
'            p_c004 => ''EMPRESA'',',
'            p_c005 => NULL,',
'            p_c006 => ''E-'' || R_EMPRESA.CODIGO_EMPRESA,',
'            p_c007 => NULL,',
'            p_c025 => 1',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(64487754760338707)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_CENTRO_COSTOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_CENTRO_COSTOS IS',
'        SELECT',
'            DISTINCT',
'        	A.CODIGO_EMPRESA,',
'            B.CODIGO_CC_PADRE,',
'            B.CODIGO_CC',
'        FROM SAF.EST_PROYECTOS A',
'        INNER JOIN SAF.GRAL_CENTROS_COSTOS B ON B.CODIGO_CC = A.CODIGO_CC',
'        WHERE A.CODIGO_EMPRESA IN',
'        (',
'        	SELECT ',
'                TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'            FROM ',
'                dual CONNECT BY REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'        )',
'        AND A.CODIGO_PROYECTO IS NOT NULL',
'        AND A.ESTADO != ''BORRADOR''',
'        GROUP BY A.CODIGO_EMPRESA, B.CODIGO_CC_PADRE, B.CODIGO_CC;',
'',
'    V_CODIGO_CC VARCHAR2(20);',
'    V_CODIGO_CC_PADRE VARCHAR2(20);',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_DESCRIPCION VARCHAR2(150);',
'    V_CONTADOR NUMBER := 0;',
'BEGIN',
'    FOR R_CENTRO_COSTOS IN C_CENTRO_COSTOS',
'    LOOP',
'        V_BANDERA := TRUE;',
'        V_CODIGO_CC := R_CENTRO_COSTOS.CODIGO_CC_PADRE;',
'',
'        IF V_CODIGO_CC IS NOT NULL THEN',
'            WHILE V_BANDERA',
'            LOOP',
'                V_BANDERA := FALSE;',
'                DECLARE',
'                    CURSOR C_PADRE IS',
'                        SELECT',
'                            CODIGO_CC,',
'                            CODIGO_CC_PADRE,',
'                            DESCRIPCION_CC',
'                        FROM SAF.GRAL_CENTROS_COSTOS_TABLE',
'                        WHERE CODIGO_CC = V_CODIGO_CC;',
'                BEGIN',
'                    FOR R_PADRE IN C_PADRE',
'                    LOOP',
'                        IF R_PADRE.CODIGO_CC_PADRE IS NULL THEN',
'                            DECLARE',
'                                CURSOR C_COUNT IS',
'                                    SELECT COUNT(*) FROM APEX_COLLECTIONS',
'                                    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'                                    AND C002 = ''C-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA || ''-'' || R_PADRE.CODIGO_CC;',
'                            BEGIN',
'                                OPEN C_COUNT;',
'                                    FETCH C_COUNT INTO V_CONTADOR;',
'                                CLOSE C_COUNT;',
'                            END;',
'',
'                            IF V_CONTADOR = 0 THEN',
'                                apex_collection.add_member(',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_c001 => ''E-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA,',
'                                    p_c002 => ''C-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA || ''-'' || R_PADRE.CODIGO_CC,',
'                                    p_c003 => NVL(R_PADRE.DESCRIPCION_CC, ''CENTRO COSTO NO ENCONTRADO''),',
'                                    p_c004 => ''CENTRO_COSTO'',',
'                                    p_c005 => NULL,',
'                                    p_c006 => ''C-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA || ''-'' || R_PADRE.CODIGO_CC,',
'                                    p_c007 => ''E-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA,',
'                                    p_c025 => 2',
'                                );',
'                            END IF;',
'                        ELSE',
'                            V_BANDERA := TRUE;',
'                            V_CODIGO_CC := R_PADRE.CODIGO_CC_PADRE;',
'                        END IF;',
'                    END LOOP;',
'                END;',
'            END LOOP;',
'        ELSE',
'            DECLARE',
'                CURSOR C_DESCRIPCION IS',
'                    SELECT DESCRIPCION_CC FROM SAF.GRAL_CENTROS_COSTOS_TABLE',
'                    WHERE CODIGO_CC = R_CENTRO_COSTOS.CODIGO_CC;',
'                ',
'                CURSOR C_COUNT IS',
'                    SELECT COUNT(*) FROM APEX_COLLECTIONS',
'                    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'                    AND C002 = ''C-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA || ''-'' || R_CENTRO_COSTOS.CODIGO_CC;',
'            BEGIN',
'                OPEN C_DESCRIPCION;',
'                    FETCH C_DESCRIPCION INTO V_DESCRIPCION;',
'                CLOSE C_DESCRIPCION;',
'',
'                OPEN C_COUNT;',
'                    FETCH C_COUNT INTO V_CONTADOR;',
'                CLOSE C_COUNT;',
'            END;',
'',
'            IF V_CONTADOR = 0 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c001 => ''E-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA,',
'                    p_c002 => ''C-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA || ''-'' || R_CENTRO_COSTOS.CODIGO_CC,',
'                    p_c003 => NVL(V_DESCRIPCION, ''CENTRO COSTO NO ENCONTRADO''),',
'                    p_c004 => ''CENTRO_COSTO'',',
'                    p_c005 => NULL,',
'                    p_c006 => ''C-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA || ''-'' || R_CENTRO_COSTOS.CODIGO_CC,',
'                    p_c007 => ''E-'' || R_CENTRO_COSTOS.CODIGO_EMPRESA,',
'                    p_c025 => 2',
'                );',
'            END IF;',
'        END IF;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(62852050798870436)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_PROYECTOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR C_PROYECTOS IS',
'        SELECT',
'        	A.CODIGO_EMPRESA,',
'            B.CODIGO_CC_PADRE,',
'            A.CODIGO_PROYECTO,',
'            A.DESCRIPCION',
'        FROM SAF.EST_PROYECTOS A',
'        INNER JOIN SAF.GRAL_CENTROS_COSTOS B ON B.CODIGO_CC = A.CODIGO_CC',
'        WHERE A.CODIGO_EMPRESA IN',
'        (',
'        	SELECT ',
'                TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'            FROM ',
'                dual CONNECT BY REGEXP_SUBSTR(:P149_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'        )',
'        AND A.CODIGO_PROYECTO IS NOT NULL',
'        AND A.ESTADO != ''BORRADOR''',
'        GROUP BY A.CODIGO_EMPRESA, B.CODIGO_CC_PADRE, A.CODIGO_PROYECTO, A.DESCRIPCION;',
'',
'    V_CODIGO_CC VARCHAR2(20);',
'    V_CODIGO_CC_PADRE VARCHAR2(20);',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_DESCRIPCION VARCHAR2(150);',
'    V_CONTADOR NUMBER := 0;',
'BEGIN',
'    FOR R_PROYECTOS IN C_PROYECTOS',
'    LOOP',
'        V_BANDERA := TRUE;',
'        V_CODIGO_CC := R_PROYECTOS.CODIGO_CC_PADRE;',
'',
'        IF V_CODIGO_CC IS NOT NULL THEN',
'            WHILE V_BANDERA',
'            LOOP',
'                V_BANDERA := FALSE;',
'                DECLARE',
'                    CURSOR C_PADRE IS',
'                        SELECT',
'                            CODIGO_CC,',
'                            CODIGO_CC_PADRE,',
'                            DESCRIPCION_CC',
'                        FROM SAF.GRAL_CENTROS_COSTOS_TABLE',
'                        WHERE CODIGO_CC = V_CODIGO_CC;',
'                BEGIN',
'                    FOR R_PADRE IN C_PADRE',
'                    LOOP',
'                        IF R_PADRE.CODIGO_CC_PADRE IS NULL THEN',
'                            DECLARE',
'                                CURSOR C_COUNT IS',
'                                    SELECT COUNT(*) FROM APEX_COLLECTIONS',
'                                    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'                                    AND C002 = ''C-'' || R_PROYECTOS.CODIGO_EMPRESA || ''-'' || R_PADRE.CODIGO_CC;',
'                            BEGIN',
'                                OPEN C_COUNT;',
'                                    FETCH C_COUNT INTO V_CONTADOR;',
'                                CLOSE C_COUNT;',
'                            END;',
'',
'                            IF V_CONTADOR = 1 THEN',
'                                apex_collection.add_member(',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_c001 => ''C-'' || R_PROYECTOS.CODIGO_EMPRESA || ''-'' || R_PADRE.CODIGO_CC,',
'                                    p_c002 => ''P-'' || R_PROYECTOS.CODIGO_EMPRESA || ''-'' || R_PROYECTOS.CODIGO_PROYECTO,',
'                                    p_c003 => R_PROYECTOS.DESCRIPCION,',
'                                    p_c004 => ''PROYECTO'',',
'                                    p_c005 => NULL,',
'                                    p_c006 => ''P-'' || R_PROYECTOS.CODIGO_EMPRESA || ''-'' || R_PROYECTOS.CODIGO_PROYECTO,',
'                                    p_c007 => ''C-'' || R_PROYECTOS.CODIGO_EMPRESA || ''-'' || R_PADRE.CODIGO_CC,',
'                                    p_c025 => 3,',
'                                    p_c026 => R_PROYECTOS.CODIGO_EMPRESA',
'                                );',
'                            END IF;',
'                        ELSE',
'                            V_BANDERA := TRUE;',
'                            V_CODIGO_CC := R_PADRE.CODIGO_CC_PADRE;',
'                        END IF;',
'                    END LOOP;',
'                END;',
'            END LOOP;',
'        END IF;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(62852696565870442)
,p_process_sequence=>100
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_FECHAS_INICIO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_PROYECTOS IS',
'        SELECT',
'            SEQ_ID,',
'            C002 AS CODIGO,',
'            C026 AS EMPRESA',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''PROYECTO'';',
'',
'    V_FECHA DATE;',
'BEGIN',
'    FOR R_PROYECTOS IN C_PROYECTOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_FECHA IS',
'                SELECT',
'                	MIN(FECHA) AS FECHA',
'                FROM SAF.VW_CON_INICIO_EFECTIVO_PROYECTO_EMPRESA',
'                WHERE CODIGO_EMPRESA = TO_NUMBER(R_PROYECTOS.EMPRESA)',
'                AND CODIGO_PROYECTO = REPLACE(R_PROYECTOS.CODIGO, ''P-''||R_PROYECTOS.EMPRESA||''-'', '''');',
'        BEGIN',
'            FOR R_FECHA IN C_FECHA',
'            LOOP',
'                IF R_FECHA.FECHA IS NOT NULL THEN',
'                    APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                        p_collection_name => ''COLLECTION_DETALLE'',',
'                        p_seq => R_PROYECTOS.SEQ_ID,',
'                        p_attr_number => 8,',
'                        p_attr_value  => ',
'                        (',
'                            TO_CHAR(R_FECHA.FECHA, ''DD'') || ''/'' || TO_CHAR(R_FECHA.FECHA, ''MM'') || ''/20'' || TO_CHAR(R_FECHA.FECHA, ''YY'')',
'                        )',
'                    );',
'                END IF;',
'            END LOOP;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(62852539956870441)
,p_process_sequence=>110
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_FECHAS_FIN'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_PROYECTOS IS',
'        SELECT',
'            SEQ_ID,',
'            C002 AS CODIGO,',
'            C026 AS EMPRESA',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''PROYECTO''',
'        AND C008 IS NOT NULL;',
'',
'    V_FECHA DATE;',
'BEGIN',
'    FOR R_PROYECTOS IN C_PROYECTOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_FECHA IS',
'                SELECT',
'                	MAX(A.FECHA_GRABACION) AS FECHA',
'                FROM SAF.CXC_DESGLOSE A',
'                INNER JOIN SAF.CXC_TRANSACCIONES B ON B.ID_TRANSACCION = A.ID_TRANSACCION AND B.CODIGO_PROYECTO IS NOT NULL',
'                WHERE B.CODIGO_PROYECTO = REPLACE(R_PROYECTOS.CODIGO, ''P-''||R_PROYECTOS.EMPRESA||''-'', '''');',
'        BEGIN',
'            FOR R_FECHA IN C_FECHA',
'            LOOP',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_PROYECTOS.SEQ_ID,',
'                    p_attr_number => 9,',
'                    p_attr_value  => NVL(R_FECHA.FECHA, SYSDATE)',
'                );',
'            END LOOP;',
'        END;',
'    END LOOP;',
'END;',
'',
'DECLARE',
'    CURSOR C_PROYECTOS IS',
'        SELECT',
'            SEQ_ID',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''PROYECTO''',
'        AND C008 IS NOT NULL',
'        AND C009 IS NULL;',
'',
'    V_FECHA DATE;',
'BEGIN',
'    FOR R_PROYECTOS IN C_PROYECTOS',
'    LOOP',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_seq => R_PROYECTOS.SEQ_ID,',
'            p_attr_number => 9,',
'            p_attr_value  => SYSDATE',
'        );',
'    END LOOP;',
'END;',
'',
'DECLARE',
'    CURSOR C_PROYECTOS IS',
'        SELECT',
'            SEQ_ID,',
'            C008 AS INICIO,',
'            C009 AS FIN',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''PROYECTO''',
'        AND C008 IS NOT NULL',
'        AND C009 IS NOT NULL;',
'BEGIN',
'    FOR R_PROYECTOS IN C_PROYECTOS',
'    LOOP',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_seq => R_PROYECTOS.SEQ_ID,',
'            p_attr_number => 10,',
'            p_attr_value  => TO_DATE(R_PROYECTOS.FIN, ''DD/MM/YYYY'') - TO_DATE(R_PROYECTOS.INICIO, ''DD/MM/YYYY'')',
'        );',
'    END LOOP;',
'END;',
'',
'DECLARE',
'    CURSOR C_PROYECTOS IS',
'        SELECT',
'            SEQ_ID',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''PROYECTO''',
'        AND C008 IS NULL',
'        AND C009 IS NULL;',
'BEGIN',
'    FOR R_PROYECTOS IN C_PROYECTOS',
'    LOOP',
'        APEX_COLLECTION.DELETE_MEMBER (',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_seq => R_PROYECTOS.SEQ_ID',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(64478776103317541)
,p_process_sequence=>120
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FORMATO_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            SEQ_ID AS ID,',
'            LEVEL AS NIVEL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        START WITH C001 IS NULL',
'        CONNECT BY PRIOR C002 = C001;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_seq =>R_DATOS.ID,',
'            p_attr_number => 21,',
'            p_attr_value  => R_DATOS.NIVEL',
'        );',
'    END LOOP;',
'',
'    DECLARE',
'        CURSOR C_PADRES IS',
'            SELECT',
'                SEQ_ID,',
'                C002 AS CODIGO',
'            FROM APEX_COLLECTIONS ',
'            WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'            AND C004 = ''CENTRO_COSTO''',
'            ORDER BY C021 DESC;',
'    BEGIN',
'        FOR R_PADRES IN C_PADRES',
'        LOOP',
'            DECLARE',
'                CURSOR C_SUMAS IS',
'                    SELECT',
'                        NVL(AVG(C010), 0) AS DIAS',
'                    FROM APEX_COLLECTIONS ',
'                    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'                    AND C001 = R_PADRES.CODIGO;',
'            BEGIN',
'                FOR R_SUMAS IN C_SUMAS',
'                LOOP',
'                    APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                        p_collection_name => ''COLLECTION_DETALLE'',',
'                        p_seq => R_PADRES.SEQ_ID,',
'                        p_attr_number => 10,',
'                        p_attr_value => R_SUMAS.DIAS',
'                    );',
'                END LOOP;',
'            END;',
'        END LOOP; ',
'    END;',
'',
'    DECLARE',
'        CURSOR C_PADRES IS',
'            SELECT',
'                SEQ_ID,',
'                C002 AS CODIGO',
'            FROM APEX_COLLECTIONS ',
'            WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'            AND C004 = ''EMPRESA'';',
'    BEGIN',
'        FOR R_PADRES IN C_PADRES',
'        LOOP',
'            DECLARE',
'                CURSOR C_SUMAS IS',
'                    SELECT',
'                        NVL(AVG(C010), 0) AS DIAS',
'                    FROM APEX_COLLECTIONS ',
'                    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'                    AND C001 = R_PADRES.CODIGO;',
'            BEGIN',
'                FOR R_SUMAS IN C_SUMAS',
'                LOOP',
'                    APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                        p_collection_name => ''COLLECTION_DETALLE'',',
'                        p_seq => R_PADRES.SEQ_ID,',
'                        p_attr_number => 10,',
'                        p_attr_value => R_SUMAS.DIAS',
'                    );',
'                END LOOP;',
'            END;',
'        END LOOP; ',
'    END;',
'END;'))
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
