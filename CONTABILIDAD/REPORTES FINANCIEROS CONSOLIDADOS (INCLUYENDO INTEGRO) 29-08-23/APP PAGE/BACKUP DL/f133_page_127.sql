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
--   Date and Time:   15:08 Tuesday February 13, 2024
--   Exported By:     DULCE.LOPEZ@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 127
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00127
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>127);
end;
/
prompt --application/pages/page_00127
begin
wwv_flow_imp_page.create_page(
 p_id=>127
,p_name=>'INDICADOR_DETALLES_PERIODO_COBRO_5'
,p_alias=>'INDICADOR-DETALLES-PERIODO-COBRO-5'
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
'td[headers="C1123187364018012616"],',
'td[headers="C1123189159195012634"],',
'td[headers="C1123187504162012618"],',
'td[headers="C1123187617328012619"],',
'td[headers="C1123187772984012620"],',
'td[headers="C1123187894752012621"],',
'td[headers="C1123187926531012622"],',
'td[headers="C1123188090769012623"],',
'td[headers="C1123188163234012624"],',
'td[headers="C1123188285187012625"],',
'td[headers="C1123188317980012626"],',
'td[headers="C1123188412388012627"]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'}',
'',
'td[headers="C1124221222616723991"]',
'{',
'    width: 350px !important;',
'    min-width: 350px !important;',
'    max-width: 350px !important;',
'}',
'',
'td[headers="C1123188564152012628"]',
'{',
'    width: 50px !important;',
'    min-width: 50px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'INDICADOR_DETALLES'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20240212112224'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3345547127232089244)
,p_plug_name=>'Balance General'
,p_region_name=>'BALANCE_FILTRADO'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1025110645912851487)
,p_plug_display_sequence=>70
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
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C008',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C008, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C008, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS ENERO,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C009',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C009, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C009, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS FEBRERO,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C010',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C010, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C010, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS MARZO,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C011',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C011, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C011, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS ABRIL,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C012',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C012, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C012, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS MAYO,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C013',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C013, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C013, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS JUNIO,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C014',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C014, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C014, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS JULIO,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C015',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C015, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C015, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS AGOSTO,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C016',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C016, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C016, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS SEPTIEMBRE,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C017',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C017, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C017, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS OCTUBRE,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C018',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C018, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C018, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS NOVIEMBRE,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C019',
'        WHEN C004 = ''RESULTADO'' THEN',
'            TO_CHAR(C019, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C019, ''999G999G999G999G990D00'') ',
'        END',
'    ) AS DICIEMBRE,',
'    (',
'        CASE WHEN C004 = ''FECHA INICIAL'' OR C004 = ''FECHA FINAL'' THEN',
'            C020',
'        WHEN (C004 = ''RESULTADO'' OR C004 = ''RESULTADO_GENERAL'') AND C020 IS NOT NULL THEN',
'            TO_CHAR(C020, ''999G999G999G999G990D00'') || '' Dias''',
'        ELSE',
'            TO_CHAR(C020, ''999G999G999G999G990D00'') ',
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
,p_ajax_items_to_submit=>'P127_TIPO_INDICADOR'
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
 p_id=>wwv_flow_imp.id(3345547197986089245)
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
,p_internal_uid=>3345547197986089245
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1124220472939723990)
,p_db_column_name=>'PADRE'
,p_display_order=>10
,p_column_identifier=>'BT'
,p_column_label=>'Padre'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1124220845497723991)
,p_db_column_name=>'CODIGO'
,p_display_order=>20
,p_column_identifier=>'BU'
,p_column_label=>'Codigo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1124221222616723991)
,p_db_column_name=>'NOMBRE'
,p_display_order=>30
,p_column_identifier=>'BV'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="info" data-tt-id="#CODIGO_PERIODO#" data-tt-parent-id="#PADRE_PERIODO#" >',
'    <span class="forSearch"',
'        style="padding:0px; cursor: pointer; display:inline-block; width: calc(65%); white-space: pre-line; overflow: hidden; text-overflow: ellipsis;">',
'        #NOMBRE#',
'    </span>',
'</span>',
'',
'<input id="NIVEL" type="hidden" value="#NIVEL#">'))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1124221620296723992)
,p_db_column_name=>'TIPO'
,p_display_order=>40
,p_column_identifier=>'BW'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123187001616012613)
,p_db_column_name=>'PADRE_PERIODO'
,p_display_order=>50
,p_column_identifier=>'CM'
,p_column_label=>'Padre Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123187156765012614)
,p_db_column_name=>'CODIGO_PERIODO'
,p_display_order=>60
,p_column_identifier=>'CN'
,p_column_label=>'Codigo Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123187252581012615)
,p_db_column_name=>'PERIODO'
,p_display_order=>70
,p_column_identifier=>'CO'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123187364018012616)
,p_db_column_name=>'ENERO'
,p_display_order=>80
,p_column_identifier=>'CP'
,p_column_label=>'Enero'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123187504162012618)
,p_db_column_name=>'MARZO'
,p_display_order=>100
,p_column_identifier=>'CR'
,p_column_label=>'Marzo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123187617328012619)
,p_db_column_name=>'ABRIL'
,p_display_order=>110
,p_column_identifier=>'CS'
,p_column_label=>'Abril'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123187772984012620)
,p_db_column_name=>'MAYO'
,p_display_order=>120
,p_column_identifier=>'CT'
,p_column_label=>'Mayo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123187894752012621)
,p_db_column_name=>'JUNIO'
,p_display_order=>130
,p_column_identifier=>'CU'
,p_column_label=>'Junio'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123187926531012622)
,p_db_column_name=>'JULIO'
,p_display_order=>140
,p_column_identifier=>'CV'
,p_column_label=>'Julio'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123188090769012623)
,p_db_column_name=>'AGOSTO'
,p_display_order=>150
,p_column_identifier=>'CW'
,p_column_label=>'Agosto'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123188163234012624)
,p_db_column_name=>'SEPTIEMBRE'
,p_display_order=>160
,p_column_identifier=>'CX'
,p_column_label=>'Septiembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123188285187012625)
,p_db_column_name=>'OCTUBRE'
,p_display_order=>170
,p_column_identifier=>'CY'
,p_column_label=>'Octubre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123188317980012626)
,p_db_column_name=>'NOVIEMBRE'
,p_display_order=>180
,p_column_identifier=>'CZ'
,p_column_label=>'Noviembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123188412388012627)
,p_db_column_name=>'DICIEMBRE'
,p_display_order=>190
,p_column_identifier=>'DA'
,p_column_label=>'Diciembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123188564152012628)
,p_db_column_name=>'TOTAL'
,p_display_order=>200
,p_column_identifier=>'DB'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123188643917012629)
,p_db_column_name=>'ORDEN'
,p_display_order=>210
,p_column_identifier=>'DC'
,p_column_label=>'Orden'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123189159195012634)
,p_db_column_name=>'FEBRERO'
,p_display_order=>220
,p_column_identifier=>'DE'
,p_column_label=>'Febrero'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1123189553159012638)
,p_db_column_name=>'NIVEL'
,p_display_order=>230
,p_column_identifier=>'DF'
,p_column_label=>'Nivel'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(3348510192405435947)
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
 p_id=>wwv_flow_imp.id(3348995825726531135)
,p_plug_name=>'FILTROS'
,p_parent_plug_id=>wwv_flow_imp.id(3345547127232089244)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1124228198914724003)
,p_name=>'P127_FILTROS_NIVEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3348995825726531135)
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
 p_id=>wwv_flow_imp.id(1124228596953724004)
,p_name=>'P127_FECHA_INICIO'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1124228932927724004)
,p_name=>'P127_FECHA_FIN'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1124229379603724005)
,p_name=>'P127_EMPRESA'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1124229797969724005)
,p_name=>'P127_UNIDAD'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1124230113385724006)
,p_name=>'P127_TIPO_INDICADOR'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1145625737402797206)
,p_name=>'P127_NOMBRE_INDICADOR'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1124232603288724013)
,p_name=>'CARGAR_NOMBRE'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1145625869310797207)
,p_event_id=>wwv_flow_imp.id(1124232603288724013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P127_NOMBRE_INDICADOR'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATO IS',
'        SELECT INDICADOR FROM SAF.CON_INDICADORES WHERE ID = :P127_TIPO_INDICADOR;',
'    ',
'    V_DATO VARCHAR2(256) := NULL;',
'BEGIN',
'    OPEN C_DATO;',
'        FETCH C_DATO INTO V_DATO;',
'    CLOSE C_DATO;',
'',
'    RETURN NVL(V_DATO, ''Indicador no Identificado'');',
'END;'))
,p_attribute_07=>'P127_TIPO_INDICADOR'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1124233169744724014)
,p_event_id=>wwv_flow_imp.id(1124232603288724013)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".INDICADOR_DETALLES .ui-dialog-title").text(apex.item(''P127_NOMBRE_INDICADOR'').getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1124233544298724014)
,p_name=>'AFTER_REFRESH_BALANCE_FILTRADO'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(3345547127232089244)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1124234062154724014)
,p_event_id=>wwv_flow_imp.id(1124233544298724014)
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
 p_id=>wwv_flow_imp.id(1124235352315724016)
,p_name=>'FILTRO_NIVELES'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P127_FILTROS_NIVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1124235875684724016)
,p_event_id=>wwv_flow_imp.id(1124235352315724016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''FILTRO_NIVELES_BALANCE'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1124236298320724016)
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
 p_id=>wwv_flow_imp.id(1124236711147724017)
,p_event_id=>wwv_flow_imp.id(1124236298320724016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var dato = apex.item( "P127_FILTROS_NIVEL" ).getValue();',
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
 p_id=>wwv_flow_imp.id(1124237254848724017)
,p_event_id=>wwv_flow_imp.id(1124236298320724016)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(`#BALANCE_FILTRADO  .t-fht-thead tr:first th .t-fht-cell`).each(function(i,o){$(o).css("width",$(`#BALANCE_FILTRADO  .t-fht-tbody .t-fht-cell`).eq(i).width());});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1124234492405724015)
,p_name=>'CARGAR_FILTRO'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1124234962660724015)
,p_event_id=>wwv_flow_imp.id(1124234492405724015)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P127_FILTROS_NIVEL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'TODOS'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1124230528258724006)
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
 p_id=>wwv_flow_imp.id(1124230944092724007)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_SALDOS_1'
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
'                            REPLACE(REPLACE(REGEXP_SUBSTR(:P127_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                        FROM ',
'                            dual CONNECT BY REGEXP_SUBSTR(:P127_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                    )',
'    				WHERE CODIGO_EMPRESA = ''TODAS_LAS_EMPRESAS''',
'                ) > 0 THEN',
'                    ''A''',
'                ELSE',
'                    CASE WHEN (',
'                        SELECT COUNT(*) FROM',
'                        (',
'                            SELECT ',
'                                REPLACE(REPLACE(REGEXP_SUBSTR(:P127_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                            FROM ',
'                                dual CONNECT BY REGEXP_SUBSTR(:P127_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
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
'   ',
'    CURSOR C_VERSION IS',
'        SELECT MAX(VERSION) FROM SAF.CON_CATCTAS;',
'',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_VERSION NUMBER := 0;',
'    V_CONJUNTOS NUMBER := 0;',
'    V_CODIGO VARCHAR2(128) := NULL;',
'    V_SEQ_ID_INICIO NUMBER := 0;',
'    V_SEQ_ID_FINAL NUMBER := 0;',
'    V_SEQ_ID_PROMEDIO NUMBER := 0;',
'    V_SEQ_ID_FECHA_INICIAL NUMBER := 0;',
'    V_SEQ_ID_FECHA_FINAL NUMBER := 0;',
'    V_UPDATE NUMBER := 0;',
'    V_MES NUMBER := 0;',
'    V_VECTOR VARCHAR2(32767) := NULL;',
'    V_TOTAL NUMBER := 0;',
'    V_DATE_INICIO DATE := TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'');',
'    V_DATE_FINAL DATE := TRUNC(LAST_DAY(TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'')));',
'    ',
'',
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
'    :P127_EMPRESA := V_VECTOR;',
'',
'    APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_DETALLE'');',
'',
'    OPEN C_VERSION;',
'        FETCH C_VERSION INTO V_VERSION;',
'    CLOSE C_VERSION;',
'',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0',
'    LOOP',
'        V_CONTADOR := 0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
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
'',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => ''C-'' || V_CODIGO,',
'            p_c002 => NULL,',
'            p_c003 => ''SALDO INICIAL'',',
'            p_c004 => ''SALDO INICIAL'',',
'            p_c005 => V_CODIGO,',
'            p_c007 => ''11201001'',',
'            p_c025 => 6',
'        );',
'',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => ''C-'' || V_CODIGO,',
'            p_c002 => NULL,',
'            p_c003 => ''FECHA INICIAL'',',
'            p_c004 => ''FECHA INICIAL'',',
'            p_c005 => V_CODIGO,',
'            p_c007 => ''11201001'',',
'            p_c025 => 4',
'        );',
'',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => ''C-'' || V_CODIGO,',
'            p_c002 => NULL,',
'            p_c003 => ''SALDO FINAL'',',
'            p_c004 => ''SALDO FINAL'',',
'            p_c005 => V_CODIGO,',
'            p_c007 => ''11201001'',',
'            p_c025 => 7',
'        );',
'',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => ''C-'' || V_CODIGO,',
'            p_c002 => NULL,',
'            p_c003 => ''FECHA FINAL'',',
'            p_c004 => ''FECHA FINAL'',',
'            p_c005 => V_CODIGO,',
'            p_c007 => ''11201001'',',
'            p_c025 => 5',
'        );',
'',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => ''C-'' || V_CODIGO,',
'            p_c002 => NULL,',
'            p_c003 => ''SALDO PROMEDIO'',',
'            p_c004 => ''SALDO PROMEDIO'',',
'            p_c005 => V_CODIGO,',
'            p_c007 => ''11201001'',',
'            p_c025 => 8',
'        );',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_INICIO ',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''SALDO INICIAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_FECHA_INICIAL ',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''FECHA INICIAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_FINAL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''SALDO FINAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_FECHA_FINAL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''FECHA FINAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_PROMEDIO',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''SALDO PROMEDIO'' ',
'        AND C005 = V_CODIGO;',
'',
'        V_UPDATE := 8;',
'        V_MES := 1;',
'        WHILE V_UPDATE <= 19',
'        LOOP',
'            CASE ',
'                 WHEN TO_CHAR(TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY''), ''YYYY'') = V_CODIGO ',
'                    AND V_DATE_INICIO <= LAST_DAY(TO_DATE(:P127_FECHA_FIN,''DD/MM/YYYY'')) THEN',
'                    CASE',
'                        WHEN TO_NUMBER(TO_CHAR(TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY''), ''MM'')) <= V_MES THEN',
'                            SELECT APX_FNC_POLIZAS_SUMA_SALDO_INICIAL(:P127_EMPRESA, :P127_UNIDAD, TO_CHAR(V_DATE_INICIO,''DD/MM/YYYY''),9) INTO V_TOTAL FROM DUAL;',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_INICIO,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => NVL(V_TOTAL, 0)',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FECHA_INICIAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => V_DATE_INICIO',
'                            );',
'',
'                            V_DATE_INICIO := TRUNC(LAST_DAY(V_DATE_INICIO)) + 1;',
'                        ELSE',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_INICIO,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => 0',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FECHA_INICIAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => NULL',
'                            );',
'                    END CASE;',
'                WHEN TO_CHAR(TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''), ''YYYY'') = V_CODIGO ',
'                    AND V_DATE_INICIO <= LAST_DAY(TO_DATE(:P127_FECHA_FIN,''DD/MM/YYYY'')) THEN',
'                    CASE',
'                        WHEN TO_NUMBER(TO_CHAR(TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''), ''MM'')) >= V_MES THEN',
'                            SELECT APX_FNC_POLIZAS_SUMA_SALDO_INICIAL(:P127_EMPRESA, :P127_UNIDAD, TO_CHAR(V_DATE_INICIO,''DD/MM/YYYY''),9) INTO V_TOTAL FROM DUAL;',
'                            ',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_INICIO,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => NVL(V_TOTAL, 0)',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FECHA_INICIAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => V_DATE_INICIO',
'                            );',
'',
'                            V_DATE_INICIO := TRUNC(LAST_DAY(V_DATE_INICIO)) + 1;',
'                        ELSE',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_INICIO,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => 0',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FECHA_INICIAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => NULL',
'                            );',
'                    END CASE;',
'                ELSE',
'                    IF V_DATE_INICIO <= LAST_DAY(TO_DATE(:P127_FECHA_FIN,''DD/MM/YYYY'')) THEN',
'                        SELECT APX_FNC_POLIZAS_SUMA_SALDO_INICIAL(:P127_EMPRESA, :P127_UNIDAD, TO_CHAR(V_DATE_INICIO,''DD/MM/YYYY''),9) INTO V_TOTAL FROM DUAL;',
'',
'',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_DETALLE'',',
'                            p_seq => V_SEQ_ID_INICIO,',
'                            p_attr_number => V_UPDATE,',
'                            p_attr_value  => NVL(V_TOTAL, 0)',
'                        );  ',
'',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_DETALLE'',',
'                            p_seq => V_SEQ_ID_FECHA_INICIAL,',
'                            p_attr_number => V_UPDATE,',
'                            p_attr_value  => V_DATE_INICIO',
'                        );',
'                        ',
'                        V_DATE_INICIO := TRUNC(LAST_DAY(V_DATE_INICIO)) + 1;',
'                    ELSE',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_DETALLE'',',
'                            p_seq => V_SEQ_ID_INICIO,',
'                            p_attr_number => V_UPDATE,',
'                            p_attr_value  => 0',
'                        );  ',
'                    END IF;',
'            END CASE;',
'            V_UPDATE := V_UPDATE + 1;',
'            V_MES := V_MES + 1;',
'        END LOOP;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1123189729709012640)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_SALDOS_2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VERSION IS',
'        SELECT MAX(VERSION) FROM SAF.CON_CATCTAS;',
'',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_VERSION NUMBER := 0;',
'    V_CONJUNTOS NUMBER := 0;',
'    V_CODIGO VARCHAR2(128) := NULL;',
'    V_SEQ_ID_INICIO NUMBER := 0;',
'    V_SEQ_ID_FINAL NUMBER := 0;',
'    V_SEQ_ID_PROMEDIO NUMBER := 0;',
'    V_SEQ_ID_FECHA_INICIAL NUMBER := 0;',
'    V_SEQ_ID_FECHA_FINAL NUMBER := 0;',
'    V_UPDATE NUMBER := 0;',
'    V_MES NUMBER := 0;',
'    V_VECTOR VARCHAR2(32767) := NULL;',
'    V_TOTAL NUMBER := 0;',
'    V_DATE_INICIO DATE := TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'');',
'    V_DATE_FINAL DATE := TRUNC(LAST_DAY(TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'')));',
'BEGIN',
'    OPEN C_VERSION;',
'        FETCH C_VERSION INTO V_VERSION;',
'    CLOSE C_VERSION;',
'',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0',
'    LOOP',
'        V_CONTADOR := 0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_INICIO ',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        --AND C001 = ''C-'' || V_CODIGO || ''-11201001'' ',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''SALDO INICIAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_FECHA_INICIAL ',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''FECHA INICIAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_FINAL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''SALDO FINAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_FECHA_FINAL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''FECHA FINAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_PROMEDIO',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''SALDO PROMEDIO'' ',
'        AND C005 = V_CODIGO;',
'',
'        V_UPDATE := 8;',
'        V_MES := 1;',
'        WHILE V_UPDATE <= 19',
'        LOOP',
'            CASE ',
'                WHEN TO_CHAR(TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY''), ''YYYY'') = V_CODIGO ',
'                    AND V_DATE_FINAL <= LAST_DAY(TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'')) THEN',
'                    CASE',
'                        WHEN TO_NUMBER(TO_CHAR(TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY''), ''MM'')) <= V_MES THEN',
'                            SELECT SAF.APX_FNC_POLIZAS_SUMA_SALDO_FINAL(:P127_EMPRESA, :P127_UNIDAD, TO_CHAR(V_DATE_FINAL, ''DD/MM/YYYY''),9) INTO V_TOTAL FROM DUAL;',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FINAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => NVL(V_TOTAL, 0)',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FECHA_FINAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => V_DATE_FINAL',
'                            );',
'',
'                            DECLARE',
'                                V_SUB_PROMEDIO VARCHAR2(100) := 0;',
'                                V_SUB_CONSULTA VARCHAR2(1028);',
'                            BEGIN',
'                                IF V_UPDATE >= 10 THEN',
'                                    V_SUB_CONSULTA :=',
'                                    ''SELECT ',
'                                        C0''|| TO_CHAR(V_UPDATE) || ''',
'                                    FROM APEX_COLLECTIONS ',
'                                    WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                                    AND C001 = ''''C-'' || V_CODIGO || '''''' ',
'                                    AND C002 IS NULL ',
'                                    AND C004 = ''''SALDO INICIAL'''' ',
'                                    AND C005 = '' || V_CODIGO;',
'                                ELSE',
'                                    V_SUB_CONSULTA :=',
'                                    ''SELECT ',
'                                        C00''|| TO_CHAR(V_UPDATE) || ''',
'                                    FROM APEX_COLLECTIONS ',
'                                    WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                                    AND C001 = ''''C-'' || V_CODIGO || '''''' ',
'                                    AND C002 IS NULL ',
'                                    AND C004 = ''''SALDO INICIAL'''' ',
'                                    AND C005 = '' || V_CODIGO;',
'                                END IF;',
'',
'                                EXECUTE IMMEDIATE V_SUB_CONSULTA INTO V_SUB_PROMEDIO;',
'',
'                                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_seq => V_SEQ_ID_PROMEDIO,',
'                                    p_attr_number => V_UPDATE,',
'                                    p_attr_value  => (TO_NUMBER(NVL(V_SUB_PROMEDIO, 0)) + NVL(V_TOTAL, 0)) / 2',
'                                );',
'                            END;',
'',
'                            V_DATE_FINAL := LAST_DAY(TRUNC(LAST_DAY(V_DATE_FINAL)) + 1);',
'                        ELSE',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FINAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => 0',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FECHA_FINAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => NULL',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_PROMEDIO,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => 0',
'                            );',
'                    END CASE;',
'                WHEN TO_CHAR(TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''), ''YYYY'') = V_CODIGO',
'                    /*AND V_DATE_FINAL <= TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY'')*/ THEN',
'                    CASE',
'                        WHEN TO_NUMBER(TO_CHAR(TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''), ''MM'')) >= V_MES THEN',
'                            IF TO_NUMBER(TO_CHAR(TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''), ''MM'')) = TO_NUMBER(TO_CHAR(TO_DATE(V_DATE_FINAL, ''DD/MM/YYYY''), ''MM'')) THEN',
'                                SELECT SAF.APX_FNC_POLIZAS_SUMA_SALDO_FINAL(:P127_EMPRESA, :P127_UNIDAD, LAST_DAY(TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY'')),9) INTO V_TOTAL FROM DUAL;',
'                            ELSE',
'                                SELECT SAF.APX_FNC_POLIZAS_SUMA_SALDO_FINAL(:P127_EMPRESA, :P127_UNIDAD, TO_CHAR(V_DATE_FINAL, ''DD/MM/YYYY''),9) INTO V_TOTAL FROM DUAL;',
'                            END IF;',
'                            ',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FINAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => NVL(V_TOTAL, 0)',
'                            );',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_FECHA_FINAL,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  =>',
'                                (',
'                                    CASE WHEN TO_NUMBER(TO_CHAR(TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''), ''MM'')) = TO_NUMBER(TO_CHAR(TO_DATE(V_DATE_FINAL, ''DD/MM/YYYY''), ''MM'')) THEN',
'                                        LAST_DAY(TO_DATE(:P127_FECHA_FIN,''DD/MM/YYYY''))',
'                                    ELSE',
'                                        V_DATE_FINAL',
'                                    END',
'                                )',
'                            );',
'',
'                            DECLARE',
'                                V_SUB_PROMEDIO VARCHAR2(100) := 0;',
'                                V_SUB_CONSULTA VARCHAR2(1028);',
'                            BEGIN',
'                                IF V_UPDATE >= 10 THEN',
'                                    V_SUB_CONSULTA :=',
'                                    ''SELECT ',
'                                        C0''|| TO_CHAR(V_UPDATE) || ''',
'                                    FROM APEX_COLLECTIONS ',
'                                    WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                                    AND C001 = ''''C-'' || V_CODIGO || '''''' ',
'                                    AND C002 IS NULL ',
'                                    AND C004 = ''''SALDO INICIAL'''' ',
'                                    AND C005 = '' || V_CODIGO;',
'                                ELSE',
'                                    V_SUB_CONSULTA :=',
'                                    ''SELECT ',
'                                        C00''|| TO_CHAR(V_UPDATE) || ''',
'                                    FROM APEX_COLLECTIONS ',
'                                    WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                                    AND C001 = ''''C-'' || V_CODIGO || '''''' ',
'                                    AND C002 IS NULL ',
'                                    AND C004 = ''''SALDO INICIAL'''' ',
'                                    AND C005 = '' || V_CODIGO;',
'                                END IF;',
'',
'                                EXECUTE IMMEDIATE V_SUB_CONSULTA INTO V_SUB_PROMEDIO;',
'',
'                                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_seq => V_SEQ_ID_PROMEDIO,',
'                                    p_attr_number => V_UPDATE,',
'                                    p_attr_value  => (TO_NUMBER(NVL(V_SUB_PROMEDIO, 0)) + NVL(V_TOTAL, 0)) / 2',
'                                );',
'                            END;',
'',
'                            V_DATE_FINAL := LAST_DAY(TRUNC(LAST_DAY(V_DATE_FINAL)) + 1);',
'                        ELSE',
'                            IF V_DATE_FINAL <= LAST_DAY(TO_DATE(:P127_FECHA_FIN,''DD/MM/YYYY'')) THEN',
'                                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_seq => V_SEQ_ID_FINAL,',
'                                    p_attr_number => V_UPDATE,',
'                                    p_attr_value  => 0',
'                                );',
'',
'                                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_seq => V_SEQ_ID_FECHA_FINAL,',
'                                    p_attr_number => V_UPDATE,',
'                                    p_attr_value  => V_DATE_FINAL',
'                                );',
'',
'                                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_seq => V_SEQ_ID_PROMEDIO,',
'                                    p_attr_number => V_UPDATE,',
'                                    p_attr_value  => 0',
'                                );',
'                            ELSE',
'                                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_seq => V_SEQ_ID_FINAL,',
'                                    p_attr_number => V_UPDATE,',
'                                    p_attr_value  => 0',
'                                );',
'',
'                                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_seq => V_SEQ_ID_FECHA_FINAL,',
'                                    p_attr_number => V_UPDATE,',
'                                    p_attr_value  => NULL',
'                                );',
'',
'                                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_seq => V_SEQ_ID_PROMEDIO,',
'                                    p_attr_number => V_UPDATE,',
'                                    p_attr_value  => 0',
'                                );',
'                            END IF;',
'                    END CASE;',
'                ELSE',
'                    IF V_DATE_FINAL <= LAST_DAY(TO_DATE(:P127_FECHA_FIN,''DD/MM/YYYY''))',
'                        OR (TO_CHAR(TO_DATE(V_DATE_FINAL, ''DD/MM/YYYY''), ''YYYY'') = V_CODIGO AND TO_CHAR(TO_DATE(V_DATE_FINAL, ''DD/MM/YYYY''), ''MM'') = TO_CHAR(TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''), ''MM'')) THEN',
'                        SELECT SAF.APX_FNC_POLIZAS_SUMA_SALDO_FINAL(:P127_EMPRESA, :P127_UNIDAD, TO_CHAR(V_DATE_FINAL, ''DD/MM/YYYY''),9) INTO V_TOTAL FROM DUAL;',
'',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_DETALLE'',',
'                            p_seq => V_SEQ_ID_FINAL,',
'                            p_attr_number => V_UPDATE,',
'                            p_attr_value  => NVL(V_TOTAL, 0) ',
'                        );   ',
'',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_DETALLE'',',
'                            p_seq => V_SEQ_ID_FECHA_FINAL,',
'                            p_attr_number => V_UPDATE,',
'                            p_attr_value  => V_DATE_FINAL',
'                        );',
'',
'                        DECLARE',
'                            V_SUB_PROMEDIO VARCHAR2(100) := 0;',
'                            V_SUB_CONSULTA VARCHAR2(1028);',
'                        BEGIN',
'                            IF V_UPDATE >= 10 THEN',
'                                V_SUB_CONSULTA :=',
'                                ''SELECT ',
'                                    C0''|| TO_CHAR(V_UPDATE) || ''',
'                                FROM APEX_COLLECTIONS ',
'                                WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                                AND C001 = ''''C-'' || V_CODIGO || '''''' ',
'                                AND C002 IS NULL ',
'                                AND C004 = ''''SALDO INICIAL'''' ',
'                                AND C005 = '' || V_CODIGO;',
'                            ELSE',
'                                V_SUB_CONSULTA :=',
'                                ''SELECT ',
'                                    C00''|| TO_CHAR(V_UPDATE) || ''',
'                                FROM APEX_COLLECTIONS ',
'                                WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                                AND C001 = ''''C-'' || V_CODIGO || '''''' ',
'                                AND C002 IS NULL ',
'                                AND C004 = ''''SALDO INICIAL'''' ',
'                                AND C005 = '' || V_CODIGO;',
'                            END IF;',
'',
'                            EXECUTE IMMEDIATE V_SUB_CONSULTA INTO V_SUB_PROMEDIO;',
'',
'                            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                                p_collection_name => ''COLLECTION_DETALLE'',',
'                                p_seq => V_SEQ_ID_PROMEDIO,',
'                                p_attr_number => V_UPDATE,',
'                                p_attr_value  => (TO_NUMBER(NVL(V_SUB_PROMEDIO, 0)) + NVL(V_TOTAL, 0)) / 2',
'                            );',
'                        END;',
'',
'                        V_DATE_FINAL := LAST_DAY(TRUNC(LAST_DAY(V_DATE_FINAL)) + 1);',
'                    ELSE',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_DETALLE'',',
'                            p_seq => V_SEQ_ID_FINAL,',
'                            p_attr_number => V_UPDATE,',
'                            p_attr_value  => 0 ',
'                        );',
'',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_DETALLE'',',
'                            p_seq => V_SEQ_ID_FECHA_FINAL,',
'                            p_attr_number => V_UPDATE,',
'                            p_attr_value  => NULL',
'                        );',
'',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_DETALLE'',',
'                            p_seq => V_SEQ_ID_PROMEDIO,',
'                            p_attr_number => V_UPDATE,',
'                            p_attr_value  => 0',
'                        );   ',
'                    END IF;    ',
'            END CASE;',
'            V_UPDATE := V_UPDATE + 1;',
'            V_MES := V_MES + 1;',
'        END LOOP;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1123189462458012637)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_VENTAS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VENTAS IS',
'        SELECT',
'        	DISTINCT COD_CTA AS PADRE,',
'    		NULL AS CODIGO,',
'    		NULL AS NOMBRE',
'        FROM SAF.CON_INDICADORES_FORMULAS ',
'        WHERE ID_INDICADOR = 9',
'        AND FUNCION = ''/'';',
'    ',
'    CURSOR C_VERSION IS',
'        SELECT MAX(VERSION) FROM SAF.CON_CATCTAS;',
'',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_VERSION NUMBER := 0;',
'    V_CONJUNTOS NUMBER := 0;',
'    V_CODIGO VARCHAR2(128) := NULL;',
'    V_SEQ_ID_FECHA_INICIAL NUMBER := 0;',
'    V_SEQ_ID_FECHA_FINAL NUMBER := 0;',
'    V_SEQ_ID_VENTA NUMBER := 0;',
'    V_SEQ_ID_RESULTADO NUMBER := 0;',
'    V_UPDATE NUMBER := 0;',
'    V_MES NUMBER := 0;',
'    V_VECTOR VARCHAR2(32767) := NULL;',
'    V_TOTAL NUMBER := 0;',
'    V_DATE_INICIO VARCHAR2(16);',
'    V_DATE_FINAL VARCHAR2(16);',
'    V_SUB_CONSULTA_INICIO VARCHAR2(1028);',
'    V_SUB_CONSULTA_FINAL VARCHAR2(1028);',
'BEGIN',
'    OPEN C_VERSION;',
'        FETCH C_VERSION INTO V_VERSION;',
'    CLOSE C_VERSION;',
'',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0',
'    LOOP',
'        V_CONTADOR := 0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
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
'                p_c003 => ''Ventas'',',
'                p_c004 => ''VENTAS'',',
'                p_c005 => V_CODIGO,',
'                p_c006 => ''V-'' || V_CODIGO || ''-'' || ''VENTAS'',',
'                p_c007 => ''V-'' || V_CODIGO ,',
'                p_c025 => 9',
'            );',
'        END;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_FECHA_INICIAL ',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''FECHA INICIAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_FECHA_FINAL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C001 = ''C-'' || V_CODIGO',
'        AND C002 IS NULL ',
'        AND C004 = ''FECHA FINAL'' ',
'        AND C005 = V_CODIGO;',
'',
'        DECLARE',
'            CURSOR C_GASTOS IS',
'                WITH GASTOS AS',
'                (',
'                    SELECT ',
'                    	--DISTINCT A.ID,',
'                    	''V-'' || V_CODIGO || ''-'' || B.COD_CTA AS CODIGO_PADRE_PERIODO,',
'                        B.COD_CTA AS CODIGO_PADRE,',
'                    	A.CODIGO_GASTO AS CODIGO_GASTO,',
'                    	GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020) SALDO,',
'                    	A.MES',
'                    FROM SAF.CON_POLDETXHEAD A',
'                    INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO',
'                    WHERE B.ID_INDICADOR = 9 ',
'                    AND A.CODIGO_EMPRESA IN ',
'                    (',
'                        SELECT ',
'                            TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P127_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'                        FROM ',
'                            dual CONNECT BY REGEXP_SUBSTR(:P127_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                    )',
'                   ',
'                    AND A.EJERCICIO = V_CODIGO',
'                    --AND TO_NUMBER(A.EJERCICIO) BETWEEN 2020 AND V_CODIGO',
'                    AND TRUNC(TO_DATE(A.FPOL,''DD/MM/YYYY'')) BETWEEN TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY'')',
'                    AND B.FUNCION = ''/''',
'                  ',
'                ),',
'                GASTOS_RESUMIDOS AS',
'                (',
'                    SELECT',
'                        CODIGO_PADRE_PERIODO,',
'                        CODIGO_PADRE,',
'                        CODIGO_GASTO,',
'                        (SALDO * -1) AS SALDO,',
'                        MES',
'                    FROM GASTOS',
'                )',
'                SELECT * FROM GASTOS_RESUMIDOS',
'                PIVOT',
'                (',
'                	SUM(SALDO)',
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
'           FOR R_GASTOS IN C_GASTOS',
'           LOOP',
'               SELECT DESCRIPCION INTO V_NOMBRE_GASTO FROM SAF.GRAL_GASTOS WHERE CODIGO_GASTO = R_GASTOS.CODIGO_GASTO;',
'',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c001 => R_GASTOS.CODIGO_PADRE_PERIODO,',
'                    p_c002 => NULL,',
'                    p_c003 => V_NOMBRE_GASTO,',
'                    p_c004 => ''GASTO'',',
'                    p_c005 => V_CODIGO,',
'                    p_c006 => R_GASTOS.CODIGO_GASTO,',
'                    p_c007 => R_GASTOS.CODIGO_PADRE,',
'                    p_c008 => NVL(R_GASTOS.ENERO, 0),',
'                    p_c009 => NVL(R_GASTOS.FEBRERO, 0),',
'                    p_c010 => NVL(R_GASTOS.MARZO, 0),',
'                    p_c011 => NVL(R_GASTOS.ABRIL, 0),',
'                    p_c012 => NVL(R_GASTOS.MAYO, 0),',
'                    p_c013 => NVL(R_GASTOS.JUNIO, 0),',
'                    p_c014 => NVL(R_GASTOS.JULIO, 0),',
'                    p_c015 => NVL(R_GASTOS.AGOSTO, 0),',
'                    p_c016 => NVL(R_GASTOS.SEPTIEMBRE, 0),',
'                    p_c017 => NVL(R_GASTOS.OCTUBRE, 0),',
'                    p_c018 => NVL(R_GASTOS.NOVIEMBRE, 0),',
'                    p_c019 => NVL(R_GASTOS.DICIEMBRE, 0),',
'                    p_c020 => NULL,',
'                    p_c025 => 9',
'                );',
'           END LOOP;',
'',
'            apex_collection.add_member(',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_c001 => ''C-'' || V_CODIGO,',
'                p_c002 => ''C-'' || V_CODIGO || ''-RESULTADO'',',
'                p_c003 => ''Resultado'',',
'                p_c004 => ''RESULTADO'',',
'                p_c005 => V_CODIGO,',
'                p_c006 => ''C-'' || V_CODIGO || ''-RESULTADO'',',
'                p_c007 => NULL,',
'                p_c025 => 91',
'            );',
'        END;',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_RESULTADO',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''RESULTADO'' ',
'        AND C005 = V_CODIGO',
'        AND C007 IS NULL',
'        AND C006 = ''C-'' || V_CODIGO || ''-RESULTADO'';',
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
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1124231323565724010)
,p_process_sequence=>50
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
'                    AND C004 = ''VENTAS''',
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
'                                NVL(SUM(C019), 0) AS DICIEMBRE',
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
 p_id=>wwv_flow_imp.id(1123189646123012639)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESULTADO_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_VERSION NUMBER := 0;',
'    V_CONJUNTOS NUMBER := 0;',
'    V_CODIGO VARCHAR2(128) := NULL;',
'    V_SEQ_ID_FECHA_INICIAL NUMBER := 0;',
'    V_SEQ_ID_FECHA_FINAL NUMBER := 0;',
'    V_SEQ_ID_VENTA NUMBER := 0;',
'    V_SEQ_ID_RESULTADO NUMBER := 0;',
'    V_UPDATE NUMBER := 0;',
'    V_MES NUMBER := 0;',
'    V_VECTOR VARCHAR2(32767) := NULL;',
'    V_TOTAL NUMBER := 0;',
'    V_DATE_INICIO VARCHAR2(16);',
'    V_DATE_FINAL VARCHAR2(16);',
'    V_SUB_CONSULTA_INICIO VARCHAR2(1028);',
'    V_SUB_CONSULTA_FINAL VARCHAR2(1028);',
'BEGIN',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'    ',
'    SELECT EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY'')) - EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'')) + 1 INTO V_CONJUNTOS FROM DUAL;',
'',
'    WHILE V_CONJUNTOS != 0',
'    LOOP',
'        V_CONTADOR := 0;',
'        V_BANDERA := TRUE;',
'        V_CONJUNTOS := V_CONJUNTOS - 1;',
'        V_CODIGO := ( TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''))) - V_CONJUNTOS );',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_RESULTADO',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''RESULTADO'' ',
'        AND C005 = V_CODIGO',
'        AND C007 IS NULL',
'        AND C006 = ''C-'' || V_CODIGO || ''-RESULTADO'';',
'',
'        SELECT ',
'            SEQ_ID INTO V_SEQ_ID_VENTA',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C004 = ''VENTAS'' ',
'        AND C005 = V_CODIGO',
'        AND C007 = ''V-'' || V_CODIGO',
'        AND C006 = ''V-'' || V_CODIGO || ''-VENTAS'';',
'',
'        V_UPDATE := 8;',
'        WHILE V_UPDATE <= 19',
'        LOOP',
'            DECLARE',
'                V_SUB_SALDO VARCHAR2(100);',
'                V_SUB_VENTAS VARCHAR2(100);',
'                V_SUB_CONSULTA_SALDO VARCHAR2(1028);',
'                V_SUB_CONSULTA_VENTAS VARCHAR2(1028);',
'            BEGIN',
'                IF V_UPDATE >= 10 THEN',
'                    V_SUB_CONSULTA_SALDO :=',
'                    ''SELECT ',
'                        C0''|| TO_CHAR(V_UPDATE) || ''',
'                    FROM APEX_COLLECTIONS ',
'                    WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                    AND C004 = ''''SALDO PROMEDIO''''',
'                    AND C005 = '' || V_CODIGO;',
'',
'                    V_SUB_CONSULTA_VENTAS :=',
'                    ''SELECT ',
'                        C0''|| TO_CHAR(V_UPDATE) || ''',
'                    FROM APEX_COLLECTIONS ',
'                    WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                    AND C007 = ''''V-''|| V_CODIGO ||'''''''';',
'                ELSE',
'                    V_SUB_CONSULTA_SALDO :=',
'                    ''SELECT ',
'                        C00''|| TO_CHAR(V_UPDATE) || ''',
'                    FROM APEX_COLLECTIONS ',
'                    WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                    AND C004 = ''''SALDO PROMEDIO''''',
'                    AND C005 = '' || V_CODIGO;',
'',
'                    V_SUB_CONSULTA_VENTAS :=',
'                    ''SELECT ',
'                        C00''|| TO_CHAR(V_UPDATE) || ''',
'                    FROM APEX_COLLECTIONS ',
'                    WHERE COLLECTION_NAME = ''''COLLECTION_DETALLE''''',
'                    AND C007 = ''''V-''|| V_CODIGO ||'''''''';',
'                END IF;',
'',
'                EXECUTE IMMEDIATE V_SUB_CONSULTA_SALDO INTO V_SUB_SALDO;',
'                EXECUTE IMMEDIATE V_SUB_CONSULTA_VENTAS INTO V_SUB_VENTAS;',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => V_SEQ_ID_RESULTADO,',
'                    p_attr_number => V_UPDATE,',
'                    p_attr_value  =>',
'                    (',
'                        CASE WHEN TO_NUMBER(V_SUB_VENTAS) != 0 THEN',
'                            CASE',
'                                WHEN :P127_TIPO_INDICADOR = 9 THEN',
'                                    TO_NUMBER(V_SUB_SALDO) / (TO_NUMBER(V_SUB_VENTAS) * 1.12)',
'                                WHEN :P127_TIPO_INDICADOR = 16 THEN',
'                                    /*365 **/ (TO_NUMBER(V_SUB_SALDO) / (TO_NUMBER(V_SUB_VENTAS) * 1.12))',
'                                ELSE',
'                                    0',
'                            END',
'                        ELSE',
'                            0',
'                        END',
'                    )',
'                );',
'',
'            END;',
'            ',
'            V_UPDATE := V_UPDATE + 1;',
'        END LOOP;',
'    END LOOP;',
'END;',
'',
'DECLARE',
'    V_INICIO NUMBER := 0;',
'    V_FINAL NUMBER := 0;',
'    V_VENTAS NUMBER := 0;',
'    V_TOTAL NUMBER := 0;',
'BEGIN',
'    SELECT APX_FNC_POLIZAS_SUMA_SALDO_INICIAL(:P127_EMPRESA, :P127_UNIDAD, :P127_FECHA_INICIO,9) INTO V_INICIO FROM DUAL;',
'',
'    SELECT SAF.APX_FNC_POLIZAS_SUMA_SALDO_FINAL(:P127_EMPRESA, :P127_UNIDAD, TO_CHAR(LAST_DAY(TO_DATE(:P127_FECHA_FIN,''DD/MM/YYYY'')),''DD/MM/YYYY''),9) INTO V_FINAL FROM DUAL;',
'',
'    SELECT',
'        (NVL((C008), 0) +',
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
'                    TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY''),',
'                    TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'')',
'            )',
'        ) + 1)',
'    INTO',
'        V_TOTAL',
'    FROM APEX_COLLECTIONS ',
'    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'    AND C004 = ''RESULTADO'';',
'',
'    SELECT',
'        NVL(SUM(SALDOS), 0) INTO V_VENTAS',
'    FROM',
'    (',
'        SELECT ',
'        --	DISTINCT ',
'           -- A.ID,',
'        	B.COD_CTA AS CODIGO_PADRE,',
'        	A.CODIGO_GASTO AS CODIGO_GASTO,',
'        	(GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020)) AS SALDOS,',
'        	A.MES',
'        FROM SAF.CON_POLDETXHEAD A',
'        INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO',
'        WHERE B.ID_INDICADOR = 9 ',
'        AND A.CODIGO_EMPRESA IN ',
'        (',
'            SELECT ',
'                TO_NUMBER(REPLACE(REPLACE(REGEXP_SUBSTR(:P127_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''')) AS CODIGO_EMPRESA',
'            FROM ',
'                dual CONNECT BY REGEXP_SUBSTR(:P127_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'        )',
'        AND TO_DATE(A.FPOL,''DD/mm/yyyy'')  BETWEEN TO_DATE(:P127_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P127_FECHA_FIN, ''DD/MM/YYYY'')',
'        AND B.FUNCION = ''/''',
'      ',
'    );',
'',
'    apex_collection.add_member(',
'        p_collection_name => ''COLLECTION_DETALLE'',',
'        p_c001 => NULL,',
'        p_c002 => ''RESULTADO_GENERAL'',',
'        p_c003 => ''Periodo de Cobro'',',
'        p_c004 => ''RESULTADO_GENERAL'',',
'        p_c005 => NULL,',
'        p_c006 => ''RESULTADO_GENERAL'',',
'        p_c007 => NULL,',
'        /*p_c020 =>',
'        (',
'            CASE WHEN V_VENTAS != 0 THEN',
'                CASE',
'                    WHEN :P127_TIPO_INDICADOR = 9 THEN',
'                        ((V_INICIO + V_FINAL) / 2) / (V_VENTAS * 1.12)',
'                    WHEN :P127_TIPO_INDICADOR = 16 THEN',
'                        365 (((V_INICIO + V_FINAL) / 2) / (V_VENTAS * 1.12))',
'                    ELSE',
'                        0',
'                END',
'            ELSE',
'                0',
'            END',
'        ),*/',
'        p_c020 => V_TOTAL,',
'        p_c025 => 2',
'    );',
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
