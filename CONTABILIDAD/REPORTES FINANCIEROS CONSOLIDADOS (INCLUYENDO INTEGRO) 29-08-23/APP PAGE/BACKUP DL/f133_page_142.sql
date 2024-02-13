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
--   Date and Time:   15:17 Tuesday February 13, 2024
--   Exported By:     DULCE.LOPEZ@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 142
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00142
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>142);
end;
/
prompt --application/pages/page_00142
begin
wwv_flow_imp_page.create_page(
 p_id=>142
,p_name=>'DETALLE_INDICADOR_PLAZO_PROMEDIO_COBRANZA'
,p_alias=>'INDICADOR-PLAZO-PROMEDIO-COBRANZA'
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
'td[headers="C1167114438585134949"],',
'td[headers="C1167119652483134957"],',
'td[headers="C1167114898729134949"],',
'td[headers="C1167115263735134950"],',
'td[headers="C1167115647805134950"],',
'td[headers="C1167116026937134951"],',
'td[headers="C1167116442983134952"],',
'td[headers="C1167116831472134952"],',
'td[headers="C1167117218758134953"],',
'td[headers="C1167117614049134954"],',
'td[headers="C1167118030001134954"],',
'td[headers="C1167118435533134955"],',
'td[headers="C1167118842336134956"]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'}',
'',
'td[headers="C1167121277553134959"]',
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
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20240212145409'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7984799298029436545)
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
'           CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C008',
'            ELSE ',
'                NVL(C008,0) || ''  Dias'' ',
'            END ',
'        ELSE',
'            TO_CHAR(C008, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS ENERO,',
'    (',
'        CASE WHEN C009 IS NULL THEN',
'           CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C009',
'            ELSE ',
'                NVL(C009,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C009, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS FEBRERO,',
'    (',
'        CASE WHEN C010 IS NULL THEN',
'            CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C010',
'            ELSE ',
'                NVL(C010,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C010, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS MARZO,',
'    (',
'        CASE WHEN C011 IS NULL THEN',
'            CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C011',
'            ELSE ',
'                NVL(C011,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C011, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS ABRIL,',
'    (',
'        CASE WHEN C012 IS NULL THEN',
'           CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C012',
'            ELSE ',
'                NVL(C012,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C012, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS MAYO,',
'    (',
'        CASE WHEN C013 IS NULL THEN',
'            CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C013',
'            ELSE ',
'                NVL(C013,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C013, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS JUNIO,',
'    (',
'        CASE WHEN C014 IS NULL THEN',
'            CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C014',
'            ELSE ',
'                NVL(C014,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C014, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS JULIO,',
'    (',
'        CASE WHEN C015 IS NULL THEN',
'            CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C015',
'            ELSE ',
'                NVL(C015,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C015, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS AGOSTO,',
'    (',
'        CASE WHEN C016 IS NULL THEN',
'            CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C016',
'            ELSE ',
'                NVL(C016,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C016, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS SEPTIEMBRE,',
'    (',
'        CASE WHEN C017 IS NULL THEN',
'            CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C017',
'            ELSE ',
'                NVL(C017,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C017, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS OCTUBRE,',
'    (',
'        CASE WHEN C018 IS NULL THEN',
'            CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C018',
'            ELSE ',
'                NVL(C018,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C018, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS NOVIEMBRE,',
'    (',
'        CASE WHEN C019 IS NULL THEN',
'            CASE WHEN C004 = ''ESTIMACION'' OR C004 = ''RESULTADO'' THEN ',
'                C019',
'            ELSE ',
'                NVL(C019,0) || ''  Dias''',
'            END ',
'        ELSE',
'            TO_CHAR(C019, ''999G999G999G999G990D00'') || ''  Dias''',
'        END',
'    ) AS DICIEMBRE,',
'    (',
'        CASE WHEN C020 IS NULL THEN',
'            C020',
'        ELSE',
'            TO_CHAR(C020, ''999G999G999G999G990D00'') || ''  Dias''',
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
,p_ajax_items_to_submit=>'P142_TIPO_INDICADOR'
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
 p_id=>wwv_flow_imp.id(7984799368783436546)
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
,p_internal_uid=>7984799368783436546
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167120441794134958)
,p_db_column_name=>'PADRE'
,p_display_order=>10
,p_column_identifier=>'BT'
,p_column_label=>'Padre'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167120896675134959)
,p_db_column_name=>'CODIGO'
,p_display_order=>20
,p_column_identifier=>'BU'
,p_column_label=>'Codigo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167121277553134959)
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
 p_id=>wwv_flow_imp.id(1167121687272134960)
,p_db_column_name=>'TIPO'
,p_display_order=>40
,p_column_identifier=>'BW'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167113285193134947)
,p_db_column_name=>'PADRE_PERIODO'
,p_display_order=>50
,p_column_identifier=>'CM'
,p_column_label=>'Padre Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167113617276134947)
,p_db_column_name=>'CODIGO_PERIODO'
,p_display_order=>60
,p_column_identifier=>'CN'
,p_column_label=>'Codigo Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167114027480134948)
,p_db_column_name=>'PERIODO'
,p_display_order=>70
,p_column_identifier=>'CO'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167114438585134949)
,p_db_column_name=>'ENERO'
,p_display_order=>80
,p_column_identifier=>'CP'
,p_column_label=>'Enero'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167114898729134949)
,p_db_column_name=>'MARZO'
,p_display_order=>100
,p_column_identifier=>'CR'
,p_column_label=>'Marzo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167115263735134950)
,p_db_column_name=>'ABRIL'
,p_display_order=>110
,p_column_identifier=>'CS'
,p_column_label=>'Abril'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167115647805134950)
,p_db_column_name=>'MAYO'
,p_display_order=>120
,p_column_identifier=>'CT'
,p_column_label=>'Mayo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167116026937134951)
,p_db_column_name=>'JUNIO'
,p_display_order=>130
,p_column_identifier=>'CU'
,p_column_label=>'Junio'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167116442983134952)
,p_db_column_name=>'JULIO'
,p_display_order=>140
,p_column_identifier=>'CV'
,p_column_label=>'Julio'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167116831472134952)
,p_db_column_name=>'AGOSTO'
,p_display_order=>150
,p_column_identifier=>'CW'
,p_column_label=>'Agosto'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167117218758134953)
,p_db_column_name=>'SEPTIEMBRE'
,p_display_order=>160
,p_column_identifier=>'CX'
,p_column_label=>'Septiembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167117614049134954)
,p_db_column_name=>'OCTUBRE'
,p_display_order=>170
,p_column_identifier=>'CY'
,p_column_label=>'Octubre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167118030001134954)
,p_db_column_name=>'NOVIEMBRE'
,p_display_order=>180
,p_column_identifier=>'CZ'
,p_column_label=>'Noviembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167118435533134955)
,p_db_column_name=>'DICIEMBRE'
,p_display_order=>190
,p_column_identifier=>'DA'
,p_column_label=>'Diciembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167118842336134956)
,p_db_column_name=>'TOTAL'
,p_display_order=>200
,p_column_identifier=>'DB'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167119262751134956)
,p_db_column_name=>'ORDEN'
,p_display_order=>210
,p_column_identifier=>'DC'
,p_column_label=>'Orden'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167119652483134957)
,p_db_column_name=>'FEBRERO'
,p_display_order=>220
,p_column_identifier=>'DE'
,p_column_label=>'Febrero'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1167120079821134957)
,p_db_column_name=>'NIVEL'
,p_display_order=>230
,p_column_identifier=>'DF'
,p_column_label=>'Nivel'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7987762363202783248)
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
 p_id=>wwv_flow_imp.id(7988247996523878436)
,p_plug_name=>'FILTROS'
,p_parent_plug_id=>wwv_flow_imp.id(7984799298029436545)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167122687595134962)
,p_name=>'P142_FILTROS_NIVEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7988247996523878436)
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
 p_id=>wwv_flow_imp.id(1167123060174134964)
,p_name=>'P142_FECHA_INICIO'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167123424496134964)
,p_name=>'P142_FECHA_FIN'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167123847696134965)
,p_name=>'P142_EMPRESA'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167124232927134965)
,p_name=>'P142_UNIDAD'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167124639913134966)
,p_name=>'P142_TIPO_INDICADOR'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167125076285134966)
,p_name=>'P142_NOMBRE_INDICADOR'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1167125465614134966)
,p_name=>'P142_INTERCOMPANY'
,p_item_sequence=>70
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1167132356104134982)
,p_name=>'CARGAR_NOMBRE'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167132851379134983)
,p_event_id=>wwv_flow_imp.id(1167132356104134982)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P142_NOMBRE_INDICADOR'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATO IS',
'        SELECT INDICADOR FROM SAF.CON_INDICADORES WHERE ID = :P142_TIPO_INDICADOR;',
'    ',
'    V_DATO VARCHAR2(256) := NULL;',
'BEGIN',
'    OPEN C_DATO;',
'        FETCH C_DATO INTO V_DATO;',
'    CLOSE C_DATO;',
'',
'    RETURN NVL(V_DATO, ''Indicador no Identificado'');',
'END;'))
,p_attribute_07=>'P142_TIPO_INDICADOR'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167133376007134984)
,p_event_id=>wwv_flow_imp.id(1167132356104134982)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".INDICADOR_DETALLES .ui-dialog-title").text(apex.item(''P142_NOMBRE_INDICADOR'').getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1167128202910134977)
,p_name=>'AFTER_REFRESH_BALANCE_FILTRADO'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7984799298029436545)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167128750234134978)
,p_event_id=>wwv_flow_imp.id(1167128202910134977)
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
 p_id=>wwv_flow_imp.id(1167130049634134980)
,p_name=>'FILTRO_NIVELES'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P142_FILTROS_NIVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167130512259134980)
,p_event_id=>wwv_flow_imp.id(1167130049634134980)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''FILTRO_NIVELES_BALANCE'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1167130986216134981)
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
 p_id=>wwv_flow_imp.id(1167131468821134981)
,p_event_id=>wwv_flow_imp.id(1167130986216134981)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var dato = apex.item( "P142_FILTROS_NIVEL" ).getValue();',
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
 p_id=>wwv_flow_imp.id(1167131918815134982)
,p_event_id=>wwv_flow_imp.id(1167130986216134981)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(`#BALANCE_FILTRADO  .t-fht-thead tr:first th .t-fht-cell`).each(function(i,o){$(o).css("width",$(`#BALANCE_FILTRADO  .t-fht-tbody .t-fht-cell`).eq(i).width());});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1167129194625134979)
,p_name=>'CARGAR_FILTRO'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1167129652049134980)
,p_event_id=>wwv_flow_imp.id(1167129194625134979)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P142_FILTROS_NIVEL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'99999999'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1167127071635134973)
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
 p_id=>wwv_flow_imp.id(1167127493954134974)
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
'                            REPLACE(REPLACE(REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                        FROM ',
'                            dual CONNECT BY REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                    )',
'    				WHERE CODIGO_EMPRESA = ''TODAS_LAS_EMPRESAS''',
'                ) > 0 THEN',
'                    ''A''',
'                ELSE',
'                    CASE WHEN (',
'                        SELECT COUNT(*) FROM',
'                        (',
'                            SELECT ',
'                                REPLACE(REPLACE(REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                            FROM ',
'                                dual CONNECT BY REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
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
'    :P142_EMPRESA := V_VECTOR;',
'',
'     APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_DETALLE'');',
'',
'    OPEN C_VERSION;',
'        FETCH C_VERSION INTO V_VERSION;',
'    CLOSE C_VERSION;',
'',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P142_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0',
'    LOOP',
'        V_CONTADOR := 0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
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
 p_id=>wwv_flow_imp.id(1167126680892134970)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_EMPRESA_CLIENTE'
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
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P142_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0',
'    LOOP',
'        V_CONTADOR := 0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
'',
'      FOR R_VENTAS IN C_VENTAS',
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
'-- ======================== EMPRESAS ============================================================',
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
'                        TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
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
'-- ================================ CLIENTES =============================',
'       ',
'       DECLARE',
'            CURSOR C_CLIENTES IS',
'                /*SELECT',
'                	DISTINCT t.NUMERO_CUENTA || '' - '' ||Fnc_Get_Nombre_Cliente(EEE.codigo_empresa,T.numero_cuenta) Cuenta_Cliente,',
'                    ''P-'' || V_CODIGO || ''-'' || EEE.codigo_empresa AS CODIGO_PADRE_PERIODO,',
'                    --''P-'' || V_CODIGO || ''-'' || R_EMPRESA.CODIGO_EMPRESA,',
'                    ''11201001'' AS CODIGO_PADRE, T.NUMERO_CUENTA CUENTA, Fnc_Get_Nombre_Cliente(EEE.codigo_empresa,T.numero_cuenta) Cliente',
'                FROM EST_ENC_ESTIMACIONES EEE, CXC_TRANSACCIONES_ESTIMACION T,CXC_DESGLOSE CD, GRAL_FORMAS_PAGO fp',
'                WHERE EEE.codigo_empresa = t.codigo_empresa',
'                and EEE.codigo_proyecto = t.codigo_proyecto',
'                and EEE.numero_estimacion = t.numero_estimacion',
'                and t.id_transaccion = cd.id_transaccion',
'                and cd.codigo_forma_pago = fp.codigo_forma_pago',
'                AND T.CODIGO_PROYECTO IS NOT NULL',
'                AND EEE.CODIGO_EMPRESA IN',
'                (',
'                	SELECT ',
'                        TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                )',
'                AND TO_NUMBER(TO_CHAR(EEE.FECHA_GRABACION, ''YYYY'')) = V_CODIGO',
'                AND TRUNC(EEE.FECHA_GRABACION) BETWEEN TO_DATE(:P142_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY'');*/',
'',
'                SELECT',
'                    DISTINCT ct.NUMERO_CUENTA || '' - '' ||Fnc_Get_Nombre_Cliente(ct.codigo_empresa,ct.numero_cuenta) Cuenta_Cliente,',
'                            ''P-'' || V_CODIGO || ''-'' || ct.codigo_empresa AS CODIGO_PADRE_PERIODO,',
'                          --''P-'' || V_CODIGO || ''-'' || R_EMPRESA.CODIGO_EMPRESA,',
'                            ''11201001'' AS CODIGO_PADRE, cT.NUMERO_CUENTA CUENTA, Fnc_Get_Nombre_Cliente(ct.codigo_empresa,cT.numero_cuenta) Cliente',
'                    FROM CXC_TRANSACCIONES CT, CXC_TRANSACCIONES_ESTIMACION T, CXC_DESGLOSE CD, GRAL_FORMAS_PAGO FP ',
'                    WHERE    CT.CODIGO_EMPRESA = T.CODIGO_EMPRESA (+)',
'                    AND CT.NUMERO_CUENTA = T.NUMERO_CUENTA (+)',
'                    AND CT.SERIE_DOCUMENTO = T.SERIE_DOCUMENTO (+)',
'                    AND CT.NUMERO_DOCUMENTO = T.NUMERO_DOCUMENTO(+)',
'                    AND CT.CODIGO_EMPRESA = CD.CODIGO_EMPRESA --(+) --118',
'                    AND CT.TIPO_TRANSACCION = CD.TIPO_TRANSACCION',
'                    AND CT.ID_TRANSACCION = CD.ID_TRANSACCION',
'                    AND CD.CODIGO_FORMA_PAGO = FP.CODIGO_FORMA_PAGO',
'                    AND CT.CODIGO_ESTATUS = 1',
'                    AND CD.CODIGO_FORMA_PAGO != 5 ',
'                    AND CD.CODIGO_BANCO IS NOT NULL',
'                    AND CT.CODIGO_EMPRESA IN',
'                    (',
'                        SELECT ',
'                                            TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'                                        FROM ',
'                                            dual CONNECT BY REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                    )',
'                     AND TO_NUMBER(TO_CHAR(CT.FECHA_TRANSACCION, ''YYYY'')) = V_CODIGO',
'                    AND TRUNC(CT.FECHA_TRANSACCION) BETWEEN TO_DATE(:P142_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY'');',
'        BEGIN',
'            FOR R_CLIENTE IN C_CLIENTES',
'            LOOP',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c001 => R_CLIENTE.CODIGO_PADRE_PERIODO,',
'                    p_c002 => ''P-'' || V_CODIGO || ''-'' || R_CLIENTE.CUENTA,',
'                    p_c003 => R_CLIENTE.CLIENTE,',
'                    p_c004 => ''Cliente'',',
'                    p_c005 => V_CODIGO,',
'                    p_c006 => R_CLIENTE.cuenta,',
'                    p_c007 => R_CLIENTE.CODIGO_PADRE,',
'                    p_c025 => 9',
'                );',
'            END LOOP;',
'        END;',
'    END LOOP;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1131867540860875841)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_ESTIMACIONES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_CONJUNTOS NUMBER := 0;',
'    V_CODIGO VARCHAR2(128) := NULL;',
'BEGIN',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P142_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0  LOOP',
'        V_CONTADOR :=0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
'',
'        DECLARE',
'            CURSOR C_ESTIMACIONES IS',
'                WITH ESTIMACION AS',
'                (',
'                   /* SELECT ',
'                    	''P-'' || V_CODIGO || ''-'' || T.NUMERO_CUENTA AS CODIGO_PADRE,',
'                        ',
'                    	(',
unistr('                            ''Recibo con Serie : '' || T.SERIE_DOCUMENTO  ||'', No: ''|| T.NUMERO_DOCUMENTO || ''; N\00FAmero de Estimaci\00F3n : '' || T.NUMERO_ESTIMACION || '),
'                                 ''; Perteneciente a Proyecto '' || FNC_NCC (T.CODIGO_PROYECTO)|| ''; Entregado el: '' || TO_CHAR(EEE.FECHA_ENTREGA,''DD/MM/YYYY'') || '' y abonado el: ''|| TO_CHAR(CD.FECHA_COBRO,''DD/MM/YYYY'')',
'                                 || '' Por medio de '' ||  fp.descripcion_forma_pago || '' con No. de Documento: '' || cd.numero_documento || '' en el banco '' || FNC_GET_NOMBREBCO(cd.codigo_banco)',
'                                 || '' al No. Cuenta: '' || cd.nocuentabanco',
'                        ) AS NOMBRE,',
'                    	TO_NUMBER(to_char(CD.FECHA_COBRO,''MM'')) AS MES,',
'                        ( CD.FECHA_COBRO - CT.FECHA_TRANSACCION) AS DIAS',
'                   FROM EST_ENC_ESTIMACIONES EEE, CXC_TRANSACCIONES_ESTIMACION T,CXC_DESGLOSE CD, GRAL_FORMAS_PAGO fp,CXC_TRANSACCIONES CT',
'                    where  EEE.codigo_empresa = t.codigo_empresa',
'                    and EEE.codigo_proyecto = t.codigo_proyecto',
'                    and EEE.numero_estimacion = t.numero_estimacion',
'                    and t.id_transaccion = cd.id_transaccion',
'                    and cd.codigo_forma_pago = fp.codigo_forma_pago',
'                    AND T.CODIGO_PROYECTO IS NOT NULL',
'                    AND EEE.CODIGO_EMPRESA IN',
'                    (',
'                    	SELECT ',
'                            TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'                        FROM ',
'                            dual CONNECT BY REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                    )',
'                    AND TO_NUMBER(TO_CHAR(EEE.FECHA_GRABACION, ''YYYY'')) = V_CODIGO',
'                   AND TRUNC(EEE.FECHA_GRABACION) BETWEEN TO_DATE(:P142_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY'')*/',
'                  ',
'',
'                    SELECT ',
'                        ''P-'' || V_CODIGO || ''-'' || CT.NUMERO_CUENTA AS CODIGO_PADRE,',
'                        (',
unistr('                            ''Recibo con Serie : '' || CT.SERIE_DOCUMENTO  ||'', No: ''|| CT.NUMERO_DOCUMENTO || ''; N\00FAmero de Estimaci\00F3n : '' || NVL(fnc_get_trae_Estimaciones_transacciones(CT.CODIGO_EMPRESA, CT.NUMERO_CUENTA, CT.SERIE_DOCUMENTO, CT.NUMERO')
||'_DOCUMENTO, CT.CODIGO_PROYECTO),'' - '') || ',
'                            ''; Perteneciente a Proyecto '' || FNC_NCC (CT.CODIGO_PROYECTO)|| ''; Entregado el: ''|| NVL(TO_CHAR(FNC_GET_FECHA_ENTREGA_EST_PROYECTO(CT.CODIGO_EMPRESA,CT.CODIGO_PROYECTO,CT.NUMERO_ESTIMACION),''DD/MM/YYYY''),'' - '')||',
'                            '' y abonado el: ''|| TO_CHAR(CD.FECHA_COBRO,''DD/MM/YYYY'')||',
'                            '' Por medio de '' ||  fp.descripcion_forma_pago || '' con No. de Documento: '' || cd.numero_documento || '' en el banco '' || FNC_GET_NOMBREBCO(cd.codigo_banco)||',
'                            '' al No. Cuenta: '' || cd.nocuentabanco',
'                        ) NOMBRE,',
'                        TO_NUMBER(TO_CHAR(CT.FECHA_TRANSACCION,''MM'')) MES,',
'                        (CD.FECHA_COBRO - CT.FECHA_TRANSACCION) DIAS',
'                    FROM CXC_TRANSACCIONES CT, CXC_TRANSACCIONES_ESTIMACION T, CXC_DESGLOSE CD, GRAL_FORMAS_PAGO FP ',
'                        WHERE    CT.CODIGO_EMPRESA = T.CODIGO_EMPRESA (+)',
'                        AND CT.NUMERO_CUENTA = T.NUMERO_CUENTA (+)',
'                        AND CT.SERIE_DOCUMENTO = T.SERIE_DOCUMENTO (+)',
'                        AND CT.NUMERO_DOCUMENTO = T.NUMERO_DOCUMENTO(+)',
'                        AND CT.CODIGO_EMPRESA = CD.CODIGO_EMPRESA --(+) --118',
'                        AND CT.TIPO_TRANSACCION = CD.TIPO_TRANSACCION',
'                        AND CT.ID_TRANSACCION = CD.ID_TRANSACCION',
'                        AND CD.CODIGO_FORMA_PAGO = FP.CODIGO_FORMA_PAGO',
'                        AND CT.CODIGO_ESTATUS = 1',
'                        AND CD.CODIGO_FORMA_PAGO != 5 ',
'                        AND CD.CODIGO_BANCO IS NOT NULL',
'                        AND CT.CODIGO_EMPRESA IN',
'                                (',
'                                	SELECT ',
'                                        TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'                                    FROM ',
'                                        dual CONNECT BY REGEXP_SUBSTR(:P142_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                                )',
'                        AND TO_NUMBER(TO_CHAR(CT.FECHA_TRANSACCION, ''YYYY'')) = V_CODIGO',
'                        AND TRUNC(CT.FECHA_TRANSACCION) BETWEEN TO_DATE(:P142_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY'')',
'                  ',
'                )',
'                SELECT * FROM ESTIMACION',
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
'            FOR R_ESTIMACION IN C_ESTIMACIONES',
'            LOOP',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c001 => R_ESTIMACION.CODIGO_PADRE,',
'                    p_c002 => NULL,',
'                    p_c003 => R_ESTIMACION.NOMBRE,',
'                    p_c004 => ''ESTIMACION'', -- sumar los que no son tipo estimacion',
'                    p_c005 => V_CODIGO,',
'                    p_c006 => NULL,',
'                    p_c007 => R_ESTIMACION.CODIGO_PADRE,',
'                    p_c008 => R_ESTIMACION.ENERO,',
'                    p_c009 => R_ESTIMACION.FEBRERO,',
'                    p_c010 => R_ESTIMACION.MARZO,',
'                    p_c011 => R_ESTIMACION.ABRIL,',
'                    p_c012 => R_ESTIMACION.MAYO,',
'                    p_c013 => R_ESTIMACION.JUNIO,',
'                    p_c014 => R_ESTIMACION.JULIO,',
'                    p_c015 => R_ESTIMACION.AGOSTO,',
'                    p_c016 => R_ESTIMACION.SEPTIEMBRE,',
'                    p_c017 => R_ESTIMACION.OCTUBRE,',
'                    p_c018 => R_ESTIMACION.NOVIEMBRE,',
'                    p_c019 => R_ESTIMACION.DICIEMBRE,',
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
 p_id=>wwv_flow_imp.id(1167127882764134975)
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
'                    AND C004 != ''ESTIMACION''',
'                    ORDER BY C021 DESC;',
'            BEGIN',
'                FOR R_PADRES IN C_PADRES',
'                LOOP',
'                    DECLARE',
'                        CURSOR C_SUMAS IS',
'                            SELECT',
'                                -- NVL(SUM(C008), 0) AS ENERO,',
'                                -- NVL(SUM(C009), 0) AS FEBRERO,',
'                                -- NVL(SUM(C010), 0) AS MARZO,',
'                                -- NVL(SUM(C011), 0) AS ABRIL,',
'                                -- NVL(SUM(C012), 0) AS MAYO,',
'                                -- NVL(SUM(C013), 0) AS JUNIO,',
'                                -- NVL(SUM(C014), 0) AS JULIO,',
'                                -- NVL(SUM(C015), 0) AS AGOSTO,',
'                                -- NVL(SUM(C016), 0) AS SEPTIEMBRE,',
'                                -- NVL(SUM(C017), 0) AS OCTUBRE,',
'                                -- NVL(SUM(C018), 0) AS NOVIEMBRE,',
'                                -- NVL(SUM(C019), 0) AS DICIEMBRE ',
'                                AVG(C008) AS ENERO,',
'                                AVG(C009) AS FEBRERO,',
'                                AVG(C010) AS MARZO,',
'                                AVG(C011) AS ABRIL,',
'                                AVG(C012) AS MAYO,',
'                                AVG(C013) AS JUNIO,',
'                                AVG(C014) AS JULIO,',
'                                AVG(C015) AS AGOSTO,',
'                                AVG(C016) AS SEPTIEMBRE,',
'                                AVG(C017) AS OCTUBRE,',
'                                AVG(C018) AS NOVIEMBRE,',
'                                AVG(C019) AS DICIEMBRE --MOD PARA GERSON MARROQUIN POR DMLOPEZ',
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
 p_id=>wwv_flow_imp.id(1167125807322134967)
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
'        AND C004 != ''ESTIMACION'';',
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
 p_id=>wwv_flow_imp.id(1167126202626134969)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESULTADO_VENTAS_PROMEDIO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            SUM(C020) AS TOTAL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''CONJUNTO'';',
'    ',
'    V_TOTAL NUMBER;',
'BEGIN',
'    SELECT',
'        SUM(NVL((C008), 0) +',
'        NVL((C009), 0) +',
'        NVL((C010), 0) +',
'        NVL((C011), 0) +',
'        NVL((C012), 0) +',
'        NVL((C013), 0) +',
'        NVL((C014), 0) +',
'        NVL((C015), 0) +',
'        NVL((C016), 0) +',
'        NVL((C017), 0) +',
'        NVL((C018), 0) +',
'        NVL((C019), 0)) /',
'        (TRUNC',
'        (',
'            MONTHS_BETWEEN',
'            (',
'                    TO_DATE(:P142_FECHA_FIN, ''DD/MM/YYYY''),',
'                    TO_DATE(:P142_FECHA_INICIO, ''DD/MM/YYYY'')',
'            )',
'        ) + 1)',
'    INTO',
'        V_TOTAL',
'    FROM APEX_COLLECTIONS ',
'    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'    AND C004 = ''CONJUNTO'';',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c002 => ''R-RESULTADO'',',
unistr('            p_c003 => ''Plazo de Estimaci\00F3n'','),
'            p_c004 => ''RESULTADO'',',
'            --p_c020 => R_DATOS.TOTAL,',
'            p_c020 => NVL(V_TOTAL, 0),',
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
