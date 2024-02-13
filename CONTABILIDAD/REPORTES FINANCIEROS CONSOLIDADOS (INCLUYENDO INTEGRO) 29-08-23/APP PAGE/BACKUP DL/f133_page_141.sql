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
--   Date and Time:   15:16 Tuesday February 13, 2024
--   Exported By:     DULCE.LOPEZ@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 141
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00141
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>141);
end;
/
prompt --application/pages/page_00141
begin
wwv_flow_imp_page.create_page(
 p_id=>141
,p_name=>'MODAL_ANTIGUEDAD_PROMEDIO_PERIODO_PAGO'
,p_alias=>'MODAL-ANTIGUEDAD-PROMEDIO-PERIODO-PAGO'
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
'td[headers="C1167087218936122818"],',
'td[headers="C1167092436255122825"],',
'td[headers="C1167087657051122819"],',
'td[headers="C1167088017257122819"],',
'td[headers="C1167088481634122820"],',
'td[headers="C1167088825163122820"],',
'td[headers="C1167089209398122821"],',
'td[headers="C1167089608726122822"],',
'td[headers="C1167090035154122822"],',
'td[headers="C1167090442548122823"],',
'td[headers="C1167090884150122823"],',
'td[headers="C1167091225324122824"],',
'td[headers="C1167091609970122824"]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'}',
'',
'td[headers="C1167094055234122828"]',
'{',
'    width: 400px !important;',
'    min-width: 400px !important;',
'    max-width: 400px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'INDICADOR_DETALLES'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'DULCE.LOPEZ@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20231121124428'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7984772186767424393)
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
'    (',
'        CASE WHEN C008 IS NULL THEN',
'            C008',
'        ELSE',
unistr('            TO_CHAR(C008, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS ENERO,',
'    (',
'        CASE WHEN C009 IS NULL THEN',
'            C009',
'        ELSE',
unistr('            TO_CHAR(C009, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS FEBRERO,',
'    (',
'        CASE WHEN C010 IS NULL THEN',
'            C010',
'        ELSE',
unistr('            TO_CHAR(C010, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS MARZO,',
'    (',
'        CASE WHEN C011 IS NULL THEN',
'            C011',
'        ELSE',
unistr('            TO_CHAR(C011, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS ABRIL,',
'    (',
'        CASE WHEN C012 IS NULL THEN',
'            C012',
'        ELSE',
unistr('            TO_CHAR(C012, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS MAYO,',
'    (',
'        CASE WHEN C013 IS NULL THEN',
'            C013',
'        ELSE',
unistr('            TO_CHAR(C013, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS JUNIO,',
'    (',
'        CASE WHEN C014 IS NULL THEN',
'            C014',
'        ELSE',
unistr('            TO_CHAR(C014, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS JULIO,',
'    (',
'        CASE WHEN C015 IS NULL THEN',
'            C015',
'        ELSE',
unistr('            TO_CHAR(C015, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS AGOSTO,',
'    (',
'        CASE WHEN C016 IS NULL THEN',
'            C016',
'        ELSE',
unistr('            TO_CHAR(C016, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS SEPTIEMBRE,',
'    (',
'        CASE WHEN C017 IS NULL THEN',
'            C017',
'        ELSE',
unistr('            TO_CHAR(C017, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS OCTUBRE,',
'    (',
'        CASE WHEN C018 IS NULL THEN',
'            C018',
'        ELSE',
unistr('            TO_CHAR(C018, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS NOVIEMBRE,',
'    (',
'        CASE WHEN C019 IS NULL THEN',
'            C019',
'        ELSE',
unistr('            TO_CHAR(C019, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS DICIEMBRE,',
'    (',
'        CASE WHEN C020 IS NULL THEN',
'            C020',
'        ELSE',
unistr('            TO_CHAR(C020, ''999G999G999G999G990D00'') || ''  D\00EDas'''),
'        END',
'    ) AS TOTAL,',
'    C021 AS NIVEL,',
'    C025 AS ORDEN',
'FROM APEX_COLLECTIONS ',
'WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'START WITH C001 IS NULL ',
'CONNECT BY PRIOR C002 = C001',
'ORDER SIBLINGS BY C001,C025,C005 ASC;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P141_TIPO_INDICADOR'
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
 p_id=>wwv_flow_imp.id(7984772257521424394)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>645
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>7984772257521424394
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167093277698122826)
,p_db_column_name=>'PADRE'
,p_display_order=>10
,p_column_identifier=>'BT'
,p_column_label=>'Padre'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167093601143122827)
,p_db_column_name=>'CODIGO'
,p_display_order=>20
,p_column_identifier=>'BU'
,p_column_label=>'Codigo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167094055234122828)
,p_db_column_name=>'NOMBRE'
,p_display_order=>30
,p_column_identifier=>'BV'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="info" data-tt-id="#CODIGO_PERIODO#" data-tt-parent-id="#PADRE_PERIODO#" >',
'    <span class="forSearch"',
'        style="padding:0px; cursor: pointer; display:inline-block; width: calc(65%); white-space: pre-line; overflow: hidden; text-overflow: ellipsis;">  ',
'        #NOMBRE#',
'    </span>',
'</span>',
'',
'<input id="NIVEL" type="hidden" value="#NIVEL#">'))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167094454377122829)
,p_db_column_name=>'TIPO'
,p_display_order=>40
,p_column_identifier=>'BW'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167086140684122816)
,p_db_column_name=>'PADRE_PERIODO'
,p_display_order=>50
,p_column_identifier=>'CM'
,p_column_label=>'Padre Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167086440758122817)
,p_db_column_name=>'CODIGO_PERIODO'
,p_display_order=>60
,p_column_identifier=>'CN'
,p_column_label=>'Codigo Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167086830047122818)
,p_db_column_name=>'PERIODO'
,p_display_order=>70
,p_column_identifier=>'CO'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167087218936122818)
,p_db_column_name=>'ENERO'
,p_display_order=>80
,p_column_identifier=>'CP'
,p_column_label=>'Enero'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167087657051122819)
,p_db_column_name=>'MARZO'
,p_display_order=>100
,p_column_identifier=>'CR'
,p_column_label=>'Marzo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167088017257122819)
,p_db_column_name=>'ABRIL'
,p_display_order=>110
,p_column_identifier=>'CS'
,p_column_label=>'Abril'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167088481634122820)
,p_db_column_name=>'MAYO'
,p_display_order=>120
,p_column_identifier=>'CT'
,p_column_label=>'Mayo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167088825163122820)
,p_db_column_name=>'JUNIO'
,p_display_order=>130
,p_column_identifier=>'CU'
,p_column_label=>'Junio'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167089209398122821)
,p_db_column_name=>'JULIO'
,p_display_order=>140
,p_column_identifier=>'CV'
,p_column_label=>'Julio'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167089608726122822)
,p_db_column_name=>'AGOSTO'
,p_display_order=>150
,p_column_identifier=>'CW'
,p_column_label=>'Agosto'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167090035154122822)
,p_db_column_name=>'SEPTIEMBRE'
,p_display_order=>160
,p_column_identifier=>'CX'
,p_column_label=>'Septiembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167090442548122823)
,p_db_column_name=>'OCTUBRE'
,p_display_order=>170
,p_column_identifier=>'CY'
,p_column_label=>'Octubre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167090884150122823)
,p_db_column_name=>'NOVIEMBRE'
,p_display_order=>180
,p_column_identifier=>'CZ'
,p_column_label=>'Noviembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167091225324122824)
,p_db_column_name=>'DICIEMBRE'
,p_display_order=>190
,p_column_identifier=>'DA'
,p_column_label=>'Diciembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167091609970122824)
,p_db_column_name=>'TOTAL'
,p_display_order=>200
,p_column_identifier=>'DB'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167092079812122825)
,p_db_column_name=>'ORDEN'
,p_display_order=>210
,p_column_identifier=>'DC'
,p_column_label=>'Orden'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167092436255122825)
,p_db_column_name=>'FEBRERO'
,p_display_order=>220
,p_column_identifier=>'DE'
,p_column_label=>'Febrero'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167092821238122826)
,p_db_column_name=>'NIVEL'
,p_display_order=>230
,p_column_identifier=>'DF'
,p_column_label=>'Nivel'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7987735251940771096)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'11060573'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:TIPO:PADRE:CODIGO:PADRE_PERIODO:CODIGO_PERIODO:ORDEN:ENERO:FEBRERO:MARZO:ABRIL:MAYO:JUNIO:JULIO:AGOSTO:SEPTIEMBRE:OCTUBRE:NOVIEMBRE:DICIEMBRE:TOTAL:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7988220885261866284)
,p_plug_name=>'FILTROS'
,p_parent_plug_id=>wwv_flow_imp.id(7984772186767424393)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167095418004122843)
,p_name=>'P141_FILTROS_NIVEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7988220885261866284)
,p_prompt=>'Filtros Nivel'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NOMBRE,',
'    NIVEL',
'FROM ',
'(',
'    SELECT',
'        NOMBRE,',
'        NIVEL',
'    FROM',
'    (',
'        SELECT',
'            DISTINCT',
'            ''Nivel '' || C021 AS NOMBRE,',
'            TO_NUMBER(C021) AS NIVEL',
'        FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        ORDER BY C021 ASC',
'    )',
'    UNION ALL',
'    SELECT',
'        ''Todos'' AS NOMBRE,',
'        99999999 AS NIVEL',
'    FROM DUAL',
') ORDER BY NIVEL ASC'))
,p_cHeight=>1
,p_tag_attributes=>'style="width: 120%;"'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167095826182122857)
,p_name=>'P141_FECHA_INICIO'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167096205787122857)
,p_name=>'P141_FECHA_FIN'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167096610250122857)
,p_name=>'P141_EMPRESA'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167097061282122858)
,p_name=>'P141_UNIDAD'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167097423734122858)
,p_name=>'P141_TIPO_INDICADOR'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167097842764122858)
,p_name=>'P141_NOMBRE_INDICADOR'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167098206405122858)
,p_name=>'P141_INTERCOMPANY'
,p_item_sequence=>70
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1167105102391122874)
,p_name=>'CARGAR_NOMBRE'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167105657491122875)
,p_event_id=>wwv_flow_imp.id(1167105102391122874)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P141_NOMBRE_INDICADOR'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATO IS',
'        SELECT INDICADOR FROM SAF.CON_INDICADORES WHERE ID = :P141_TIPO_INDICADOR;',
'    ',
'    V_DATO VARCHAR2(256) := NULL;',
'BEGIN',
'    OPEN C_DATO;',
'        FETCH C_DATO INTO V_DATO;',
'    CLOSE C_DATO;',
'',
'    RETURN NVL(V_DATO, ''Indicador no Identificado'');',
'END;'))
,p_attribute_07=>'P141_TIPO_INDICADOR'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167106102393122876)
,p_event_id=>wwv_flow_imp.id(1167105102391122874)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".INDICADOR_DETALLES .ui-dialog-title").text(apex.item(''P141_NOMBRE_INDICADOR'').getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1167101040396122867)
,p_name=>'AFTER_REFRESH_BALANCE_FILTRADO'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7984772186767424393)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167101580665122869)
,p_event_id=>wwv_flow_imp.id(1167101040396122867)
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
 p_id=>wwv_flow_imp.id(1167102828853122871)
,p_name=>'FILTRO_NIVELES'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P141_FILTROS_NIVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167103302534122871)
,p_event_id=>wwv_flow_imp.id(1167102828853122871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''FILTRO_NIVELES_BALANCE'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1167103775141122872)
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
 p_id=>wwv_flow_imp.id(1167104284316122873)
,p_event_id=>wwv_flow_imp.id(1167103775141122872)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var dato = apex.item( "P141_FILTROS_NIVEL" ).getValue();',
'$(''#BALANCE_FILTRADO tr'').each(',
'    function(){',
'        if (dato == ''TODOS'') {',
'            $(this).show();',
'        } else {',
'            if ($(this).find(''input[id=NIVEL]'')[0] != undefined) {',
'                $(this).show();',
'                if ((Number($($(this).find(''input[id=NIVEL]'')[0]).val()) > Number(dato))) {',
'                    $(this).hide();',
'                }',
'            }',
'        }',
'    }',
');'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167104789397122874)
,p_event_id=>wwv_flow_imp.id(1167103775141122872)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(`#BALANCE_FILTRADO  .t-fht-thead tr:first th .t-fht-cell`).each(function(i,o){$(o).css("width",$(`#BALANCE_FILTRADO  .t-fht-tbody .t-fht-cell`).eq(i).width());});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1167101988517122870)
,p_name=>'CARGAR_FILTRO'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167102416834122870)
,p_event_id=>wwv_flow_imp.id(1167101988517122870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P141_FILTROS_NIVEL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'99999999'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1167099813104122864)
,p_process_sequence=>10
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
 p_id=>wwv_flow_imp.id(1167100232048122864)
,p_process_sequence=>20
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
'                            REPLACE(REPLACE(REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                        FROM ',
'                            dual CONNECT BY REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                    )',
'    				WHERE CODIGO_EMPRESA = ''TODAS_LAS_EMPRESAS''',
'                ) > 0 THEN',
'                    ''A''',
'                ELSE',
'                    CASE WHEN (',
'                        SELECT COUNT(*) FROM',
'                        (',
'                            SELECT ',
'                                REPLACE(REPLACE(REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                            FROM ',
'                                dual CONNECT BY REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
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
'    ',
'    ',
'    CURSOR C_VERSION IS',
'        SELECT MAX(VERSION) FROM SAF.CON_CATCTAS;',
'',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_VERSION NUMBER := 0;',
'    V_CONJUNTOS NUMBER := 0;',
'    V_CODIGO VARCHAR2(128) := NULL;',
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
'    :P141_EMPRESA := V_VECTOR;',
'',
'    APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_DETALLE'');',
'',
'    OPEN C_VERSION;',
'        FETCH C_VERSION INTO V_VERSION;',
'    CLOSE C_VERSION;',
'',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P141_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P141_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0',
'    LOOP',
'        V_CONTADOR := 0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P141_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
'',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => NULL,',
'            p_c002 => ''C-'' || V_CODIGO,',
'            p_c003 => ''Periodo '' || V_CODIGO,',
'            p_c004 => ''CONJUNTO'',',
'            p_c005 => V_CODIGO,',
'            p_c006 => V_CODIGO,',
'            p_c007 => NULL,',
'            p_c025 => 1',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1167099496491122862)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_CLIENTES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VENTAS IS',
'        SELECT',
'        	''11201001'' AS PADRE,',
'    		NULL AS CODIGO,',
'    		NULL AS NOMBRE',
'        FROM DUAL;',
'    ',
'    CURSOR C_VERSION IS',
'        SELECT MAX(VERSION) FROM SAF.CON_CATCTAS;',
'',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_VERSION NUMBER := 0;',
'    V_CONJUNTOS NUMBER := 0;',
'    V_CODIGO VARCHAR2(128) := NULL;',
'BEGIN',
'    OPEN C_VERSION;',
'        FETCH C_VERSION INTO V_VERSION;',
'    CLOSE C_VERSION;',
'',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P141_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P141_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0',
'    LOOP',
'        V_CONTADOR := 0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P141_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
'',
'',
'        FOR R_VENTAS IN C_VENTAS',
'        LOOP',
'            apex_collection.add_member(',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_c001 => ',
'                (',
'                    CASE WHEN R_VENTAS.PADRE IS NULL THEN',
'                        NULL',
'                    ELSE',
'                        ''V-'' || V_CODIGO || ''-'' || R_VENTAS.PADRE',
'                    END',
'                ),',
'                p_c002 =>',
'                (',
'                    CASE WHEN R_VENTAS.CODIGO IS NULL THEN',
'                        NULL',
'                    ELSE',
'                        ''V-'' || V_CODIGO || ''-'' || R_VENTAS.CODIGO',
'                    END',
'                ),',
'                p_c003 => R_VENTAS.NOMBRE,',
'                p_c004 => ''VENTAS'',',
'                p_c005 => V_CODIGO,',
'                p_c006 => R_VENTAS.CODIGO,',
'                p_c007 => R_VENTAS.PADRE,',
'                p_c025 => 9',
'            );',
'        END LOOP;',
'',
'        WHILE V_BANDERA',
'        LOOP',
'            V_BANDERA := FALSE;',
'',
'            DECLARE',
'                CURSOR C_PADRES IS',
'                    SELECT C006,C007 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''VENTAS'' AND C005 = V_CODIGO;',
'            BEGIN',
'                FOR R_PADRES IN C_PADRES',
'                LOOP',
'                    IF R_PADRES.C007 IS NOT NULL THEN',
'                        SELECT COUNT(*) INTO V_CONTADOR FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''VENTAS'' AND C005 = V_CODIGO AND C006 = R_PADRES.C007;',
'',
'                        IF V_CONTADOR = 0 THEN',
'                            DECLARE',
'                                CURSOR C_PADRES IS',
'                                    SELECT ',
'                                        DISTINCT',
'                                		A.COD_CTA AS CODIGO,',
'                                		A.COD_CTAPADRE AS PADRE,',
'                                		A.NOMCTA AS NOMBRE',
'                                    FROM SAF.CON_CATCTAS A',
'                                    WHERE A.COD_CTA = R_PADRES.C007',
'                                    AND A.VERSION = V_VERSION;',
'                            BEGIN',
'                                FOR R_PADRES IN C_PADRES',
'                                LOOP',
'                                    apex_collection.add_member(',
'                                        p_collection_name => ''COLLECTION_DETALLE'',',
'                                        p_c001 =>',
'                                        (',
'                                            CASE WHEN R_PADRES.PADRE IS NULL THEN',
'                                                NULL',
'                                            ELSE',
'                                                ''V-'' || V_CODIGO || ''-'' || R_PADRES.PADRE',
'                                            END',
'                                        ),',
'                                        p_c002 =>',
'                                        (',
'                                            CASE WHEN R_PADRES.CODIGO IS NULL THEN',
'                                                NULL',
'                                            ELSE',
'                                                ''V-'' || V_CODIGO || ''-'' || R_PADRES.CODIGO',
'                                            END',
'                                        ),',
'                                        p_c003 => R_PADRES.NOMBRE,',
'                                        p_c004 => ''VENTAS'',',
'                                        p_c005 => V_CODIGO,',
'                                        p_c006 => R_PADRES.CODIGO,',
'                                        p_c007 => R_PADRES.PADRE,',
'                                        p_c025 => 9',
'                                    );',
'',
'                                    V_BANDERA := TRUE;',
'                                END LOOP;',
'                            END;',
'                        END IF;',
'                    END IF;',
'                END LOOP;',
'            END;',
'        END LOOP;',
'',
'        DECLARE',
'            CURSOR C_CAMPOS_NUEVOS IS',
'                SELECT SEQ_ID, C001, C002 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''VENTAS'' AND C005 = V_CODIGO AND C007 IS NULL;',
'        BEGIN',
'            FOR R_CAMPOS_NUEVOS IN C_CAMPOS_NUEVOS',
'            LOOP',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_CAMPOS_NUEVOS.SEQ_ID,',
'                    p_attr_number => 1,',
'                    p_attr_value  => ''V-'' || V_CODIGO || ''-'' || ''VENTAS''',
'                );',
'            END LOOP;',
'',
'            apex_collection.add_member(',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_c001 => ''C-'' || V_CODIGO,',
'                p_c002 => ''V-'' || V_CODIGO || ''-'' || ''VENTAS'',',
'                p_c003 => ''Proveedores'',',
'                p_c004 => ''VENTAS'',',
'                p_c005 => V_CODIGO,',
'                p_c006 => ''V-'' || V_CODIGO || ''-'' || ''VENTAS'',',
'                p_c007 => ''V-'' || V_CODIGO ,',
'                p_c025 => 9',
'            );',
'        END;',
'',
'        -- ======================= AQUI SE CREAN LAS EMPRESAS ===================================================',
'        DECLARE',
'            CURSOR C_EMPRESA IS',
'                SELECT',
'                	DISTINCT A.CODIGO_EMPRESA,',
'                    ''V-'' || V_CODIGO || ''-'' || ''11201001'' AS CODIGO_PADRE_PERIODO,',
'                    ''11201001'' AS CODIGO_PADRE',
'                FROM SAF.GRAL_EMPRESAS A',
'                WHERE A.CODIGO_EMPRESA IN',
'                (',
'                	SELECT ',
'                        TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                );',
'        BEGIN',
'            FOR R_EMPRESA IN C_EMPRESA',
'            LOOP',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c001 => R_EMPRESA.CODIGO_PADRE_PERIODO,',
'                    p_c002 => ''P-'' || V_CODIGO || ''-'' || R_EMPRESA.CODIGO_EMPRESA,',
'                    p_c003 => FNC_GET_EMPRESAS(R_EMPRESA.CODIGO_EMPRESA),',
'                    p_c004 => ''Empresa'',',
'                    p_c005 => V_CODIGO,',
'                    p_c006 => R_EMPRESA.CODIGO_EMPRESA,',
'                    p_c007 => R_EMPRESA.CODIGO_PADRE,',
'                    p_c025 => 9',
'                );',
'            END LOOP;',
'        END;',
'        -- AQUI EMPIEZA LOS CLIENTES',
'        DECLARE',
'            CURSOR C_CLIENTES IS',
'                SELECT',
'                	DISTINCT A.NUMERO_CUENTA || '' - '' || Fnc_Get_Nombre_Cliente(A.codigo_empresa,A.numero_cuenta) Cuenta_Cliente,',
'                    ''P-'' || V_CODIGO || ''-'' || A.CODIGO_EMPRESA AS CODIGO_PADRE_PERIODO,',
'                    ''11201001'' AS CODIGO_PADRE,',
'                    A.NUMERO_CUENTA AS CUENTA,',
'                    Fnc_Get_Nombre_Cliente(A.codigo_empresa,A.numero_cuenta) Cliente',
'                FROM SAF.CXC_TRANSACCIONES A, SAF.CXC_DESGLOSE B/*, CXC_TRANSACCIONES_ESTIMACION T*/',
'                WHERE A.CODIGO_EMPRESA = B.CODIGO_EMPRESA',
'                AND A.TIPO_TRANSACCION = B.TIPO_TRANSACCION',
'                AND A.CODIGO_PROYECTO IS NOT NULL',
'                AND A.ID_TRANSACCION = B.ID_TRANSACCION',
'                AND A.CODIGO_ESTATUS = 1',
'                --AND A.NUMERO_CUENTA = T.NUMERO_CUENTA',
'                AND A.CODIGO_EMPRESA IN',
'                (',
'                	SELECT ',
'                        TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                )',
'                AND TO_NUMBER(TO_CHAR(A.FECHA_TRANSACCION, ''YYYY'')) = V_CODIGO',
'                AND TRUNC(A.FECHA_TRANSACCION) BETWEEN TO_DATE(:P141_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P141_FECHA_FIN, ''DD/MM/YYYY'');',
'        BEGIN',
'            FOR R_CLIENTES IN C_CLIENTES',
'            LOOP',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c001 => R_CLIENTES.CODIGO_PADRE_PERIODO,',
'                    p_c002 => ''P-'' || V_CODIGO || ''-'' || R_CLIENTES.CUENTA,',
'                    p_c003 => R_CLIENTES.CLIENTE,',
'                    p_c004 => ''Cliente'',',
'                    p_c005 => V_CODIGO,',
'                    p_c006 => R_CLIENTES.CUENTA,',
'                    p_c007 => R_CLIENTES.CODIGO_PADRE,',
'                    p_c025 => 9',
'                );',
'            END LOOP;',
'        END;',
'        ',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1141794229589308030)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_RECIBOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_CONJUNTOS NUMBER := 0;',
'    V_CODIGO VARCHAR2(128) := NULL;',
'BEGIN',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P141_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P141_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0',
'    LOOP',
'        V_CONTADOR := 0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P141_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
'',
'        DECLARE',
'            CURSOR C_RECIBOS IS',
'                WITH RECIBOS AS',
'                (',
'                    SELECT ',
'                    	''P-'' || V_CODIGO || ''-'' || A.NUMERO_CUENTA AS CODIGO_PADRE,',
'                    	(',
'                            ''Recibo : '' || A.OBSERVACIONES || ''; Fecha Emision : '' || TO_CHAR(A.FECHA_TRANSACCION, ''DD/MM/YYYY'') ',
'                            || '' - Fecha de cobro : '' || TO_CHAR(B.FECHA_COBRO, ''DD/MM/YYYY'') || '' Banco :'' || C.NOMBRE_BANCO',
'                        ) AS NOMBRE,',
'                    	TO_NUMBER(TO_CHAR(A.FECHA_TRANSACCION, ''MM''))  AS MES,',
'                    	(B.FECHA_COBRO - A.FECHA_TRANSACCION) AS DIAS',
'                    FROM SAF.CXC_TRANSACCIONES A, SAF.CXC_DESGLOSE B, BCOBANCOS C/*, CXC_TRANSACCIONES_ESTIMACION T*/',
'                    WHERE A.CODIGO_EMPRESA = B.CODIGO_EMPRESA',
'                    AND A.TIPO_TRANSACCION = B.TIPO_TRANSACCION',
'                    AND A.CODIGO_PROYECTO IS NOT NULL',
'                    AND A.ID_TRANSACCION = B.ID_TRANSACCION',
'                    AND B.CODIGO_BANCO = C.CODBCO',
'                    --AND A.NUMERO_CUENTA = T.NUMERO_CUENTA',
'                    AND A.CODIGO_ESTATUS = 1',
'                    AND A.CODIGO_EMPRESA IN',
'                    (',
'                    	SELECT ',
'                            TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'                        FROM ',
'                            dual CONNECT BY REGEXP_SUBSTR(:P141_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                    )',
'                    AND TO_NUMBER(TO_CHAR(A.FECHA_TRANSACCION, ''YYYY'')) = V_CODIGO',
'                    AND TRUNC(A.FECHA_TRANSACCION) BETWEEN TO_DATE(:P141_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P141_FECHA_FIN, ''DD/MM/YYYY'')',
'                )',
'                SELECT * FROM RECIBOS',
'                PIVOT',
'                (',
'                	SUM(DIAS)',
'                	FOR MES IN',
'                	(',
'                		1 AS ENERO,',
'                		2 AS FEBRERO,',
'                		3 AS MARZO,',
'                		4 AS ABRIL,',
'                		5 AS MAYO,',
'                		6 AS JUNIO,',
'                		7 AS JULIO,',
'                		8 AS AGOSTO,',
'                		9 AS SEPTIEMBRE,',
'                		10 AS OCTUBRE,',
'                		11 AS NOVIEMBRE,',
'                		12 AS DICIEMBRE',
'                	)',
'                );',
'            ',
'            V_NOMBRE_GASTO VARCHAR2(200);',
'        BEGIN',
'            FOR R_RECIBOS IN C_RECIBOS',
'            LOOP',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c001 => R_RECIBOS.CODIGO_PADRE,',
'                    p_c002 => NULL,',
'                    p_c003 => R_RECIBOS.NOMBRE,',
'                    p_c004 => ''Recibo'',',
'                    p_c005 => V_CODIGO,',
'                    p_c006 => NULL,',
'                    p_c007 => R_RECIBOS.CODIGO_PADRE,',
'                    p_c008 => R_RECIBOS.ENERO,',
'                    p_c009 => R_RECIBOS.FEBRERO,',
'                    p_c010 => R_RECIBOS.MARZO,',
'                    p_c011 => R_RECIBOS.ABRIL,',
'                    p_c012 => R_RECIBOS.MAYO,',
'                    p_c013 => R_RECIBOS.JUNIO,',
'                    p_c014 => R_RECIBOS.JULIO,',
'                    p_c015 => R_RECIBOS.AGOSTO,',
'                    p_c016 => R_RECIBOS.SEPTIEMBRE,',
'                    p_c017 => R_RECIBOS.OCTUBRE,',
'                    p_c018 => R_RECIBOS.NOVIEMBRE,',
'                    p_c019 => R_RECIBOS.DICIEMBRE,',
'                    p_c020 => NULL,',
'                    p_c025 => 91',
'                );',
'            END LOOP;',
'        END;',
'    END LOOP;',
'END;',
'',
'DECLARE',
'    CURSOR C_DATOS_NULL IS',
'        SELECT',
'            SEQ_ID',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C006 IS NULL',
'        AND C003 IS NULL;',
'BEGIN',
'    FOR R_DATOS_NULL IN C_DATOS_NULL',
'    LOOP',
'        APEX_COLLECTION.DELETE_MEMBER (',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_seq => R_DATOS_NULL.SEQ_ID',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1167100608144122865)
,p_process_sequence=>60
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
'        CURSOR C_PERIODO IS',
'            SELECT',
'                DISTINCT C005 AS PERIODO',
'            FROM APEX_COLLECTIONS ',
'            WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'';',
'    BEGIN',
'        FOR R_PERIODO IN C_PERIODO',
'        LOOP',
'            DECLARE',
'                CURSOR C_PADRES IS',
'                    SELECT',
'                        SEQ_ID,',
'                        C002 AS CODIGO',
'                    FROM APEX_COLLECTIONS ',
'                    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'                    AND C005 = R_PERIODO.PERIODO',
'                    AND C004 != ''Recibo''',
'                    ORDER BY C021 DESC;',
'            BEGIN',
'                FOR R_PADRES IN C_PADRES',
'                LOOP',
'                    DECLARE',
'                        CURSOR C_SUMAS IS',
'                            SELECT',
'                                NVL(SUM(C008), 0) AS ENERO,',
'                                NVL(SUM(C009), 0) AS FEBRERO,',
'                                NVL(SUM(C010), 0) AS MARZO,',
'                                NVL(SUM(C011), 0) AS ABRIL,',
'                                NVL(SUM(C012), 0) AS MAYO,',
'                                NVL(SUM(C013), 0) AS JUNIO,',
'                                NVL(SUM(C014), 0) AS JULIO,',
'                                NVL(SUM(C015), 0) AS AGOSTO,',
'                                NVL(SUM(C016), 0) AS SEPTIEMBRE,',
'                                NVL(SUM(C017), 0) AS OCTUBRE,',
'                                NVL(SUM(C018), 0) AS NOVIEMBRE,',
'                                NVL(SUM(C019), 0) AS DICIEMBRE,',
'                                NVL(SUM(C032), 0) AS ENERO_1,',
'                                NVL(SUM(C033), 0) AS FEBRERO_1,',
'                                NVL(SUM(C034), 0) AS MARZO_1,',
'                                NVL(SUM(C035), 0) AS ABRIL_1,',
'                                NVL(SUM(C036), 0) AS MAYO_1,',
'                                NVL(SUM(C037), 0) AS JUNIO_1,',
'                                NVL(SUM(C038), 0) AS JULIO_1,',
'                                NVL(SUM(C039), 0) AS AGOSTO_1,',
'                                NVL(SUM(C040), 0) AS SEPTIEMBRE_1,',
'                                NVL(SUM(C041), 0) AS OCTUBRE_1,',
'                                NVL(SUM(C042), 0) AS NOVIEMBRE_1,',
'                                NVL(SUM(C043), 0) AS DICIEMBRE_1',
'                            FROM APEX_COLLECTIONS ',
'                            WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'                            AND C001 = R_PADRES.CODIGO;',
'                    BEGIN',
'                        FOR R_SUMAS IN C_SUMAS',
'                        LOOP',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 8,',
'                                p_attr_value => R_SUMAS.ENERO',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 9,',
'                                p_attr_value => R_SUMAS.FEBRERO',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 10,',
'                                p_attr_value => R_SUMAS.MARZO',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 11,',
'                                p_attr_value => R_SUMAS.ABRIL',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 12,',
'                                p_attr_value => R_SUMAS.MAYO',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 13,',
'                                p_attr_value => R_SUMAS.JUNIO',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 14,',
'                                p_attr_value => R_SUMAS.JULIO',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 15,',
'                                p_attr_value => R_SUMAS.AGOSTO',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 16,',
'                                p_attr_value => R_SUMAS.SEPTIEMBRE',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 17,',
'                                p_attr_value => R_SUMAS.OCTUBRE',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 18,',
'                                p_attr_value => R_SUMAS.NOVIEMBRE',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 19,',
'                                p_attr_value => R_SUMAS.DICIEMBRE',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 32,',
'                                p_attr_value => R_SUMAS.ENERO_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 33,',
'                                p_attr_value => R_SUMAS.FEBRERO_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 34,',
'                                p_attr_value => R_SUMAS.MARZO_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 35,',
'                                p_attr_value => R_SUMAS.ABRIL_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 36,',
'                                p_attr_value => R_SUMAS.MAYO_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 37,',
'                                p_attr_value => R_SUMAS.JUNIO_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 38,',
'                                p_attr_value => R_SUMAS.JULIO_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 39,',
'                                p_attr_value => R_SUMAS.AGOSTO_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 40,',
'                                p_attr_value => R_SUMAS.SEPTIEMBRE_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 41,',
'                                p_attr_value => R_SUMAS.OCTUBRE_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 42,',
'                                p_attr_value => R_SUMAS.NOVIEMBRE_1',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => R_PADRES.SEQ_ID,',
'                                p_attr_number => 43,',
'                                p_attr_value => R_SUMAS.DICIEMBRE_1',
'                            );',
'                        END LOOP;',
'                    END;',
'                END LOOP;',
'            END;',
'        END LOOP;',
'    END;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1167098625061122860)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESULTADO_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            SEQ_ID AS ID,',
'            (',
'                NVL(C008, 0) +',
'                NVL(C009, 0) +',
'                NVL(C010, 0) +',
'                NVL(C011, 0) +',
'                NVL(C012, 0) +',
'                NVL(C013, 0) +',
'                NVL(C014, 0) +',
'                NVL(C015, 0) +',
'                NVL(C016, 0) +',
'                NVL(C017, 0) +',
'                NVL(C018, 0) +',
'                NVL(C019, 0)',
'            ) AS TOTAL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 != ''Recibo'';',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_seq => R_DATOS.ID,',
'            p_attr_number => 20,',
'            p_attr_value => R_DATOS.TOTAL',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1141794361083308031)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESULTADO_ANTIGUEDAD_DE_DEUDA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            SUM(C020) AS TOTAL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''CONJUNTO'';',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c002 => ''R-RESULTADO'',',
'            p_c003 => ''Antiguedad de deuda'',',
'            p_c004 => ''RESULTADO'',',
'            p_c020 => R_DATOS.TOTAL,',
'            p_c021 => 1,',
'            p_c025 => 2',
'        );',
'    END LOOP;',
'END;'))
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
