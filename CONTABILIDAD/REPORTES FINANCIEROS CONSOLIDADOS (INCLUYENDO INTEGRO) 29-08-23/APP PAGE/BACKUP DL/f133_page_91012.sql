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
--     PAGE: 91012
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_91012
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>91012);
end;
/
prompt --application/pages/page_91012
begin
wwv_flow_imp_page.create_page(
 p_id=>91012
,p_name=>' INDICADOR_DETALLES_NIVEL_ENDEUDAMIENTO'
,p_alias=>'INDICADOR-DETALLES-NIVEL-ENDEUDAMIENTO'
,p_page_mode=>'MODAL'
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
'td[headers="C1106034626277591938"],',
'td[headers="C1106034777862591939"],',
'td[headers="C1106034880689591940"],',
'td[headers="C1106034929810591941"],',
'td[headers="C1106035075261591942"],',
'td[headers="C1106035119577591943"],',
'td[headers="C1106035236087591944"],',
'td[headers="C1106035315249591945"],',
'td[headers="C1106035449869591946"],',
'td[headers="C1106035541172591947"],',
'td[headers="C1106035657096591948"],',
'td[headers="C1106035753746591949"],',
'td[headers="C1106035867904591950"]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'}',
'',
'td[headers="C1106033563488591927"]',
'{',
'    width: 350px !important;',
'    min-width: 350px !important;',
'    max-width: 350px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'INDICADOR_DETALLES'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'DULCE.LOPEZ@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20231211163238'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1552627165210447223)
,p_plug_name=>'Balance General'
,p_region_name=>'BALANCE_GENERAL_TABLE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(99573852960243840)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH CUENTAS AS',
'(',
'	SELECT',
'		DISTINCT',
'		A.COD_CTA AS CODIGO,',
'		A.COD_CTAPADRE AS PADRE,',
'		A.NOMCTA AS NOMBRE,',
'		NIVEL',
'	FROM SAF.CON_CATCTAS A',
') SELECT * FROM CUENTAS',
'START WITH PADRE IS NULL ',
'CONNECT BY PRIOR CODIGO = PADRE;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_imp.id(1552629346471447245)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>1552629346471447245
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449536696752199723)
,p_db_column_name=>'CODIGO'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Codigo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449537015807199724)
,p_db_column_name=>'PADRE'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Padre'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449537413224199724)
,p_db_column_name=>'NOMBRE'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="info" data-tt-id="#CODIGO#" data-tt-parent-id="#PADRE#" >',
'    <span class="forSearch"',
'        style="padding-left:0; padding-top:5px; cursor: pointer; display:inline-block; overflow:hidden;white-space:nowrap; text-overflow: ellipsis; ">  ',
'        #NOMBRE#',
'    </span>',
'</span>'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449537845898199725)
,p_db_column_name=>'NIVEL'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Nivel'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1555394122005486485)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'11058582'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1552630203218447253)
,p_plug_name=>'Balance General'
,p_region_name=>'BALANCE_FILTRADO'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1025110645912851487)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH SUMA_EGRESOS AS',
'(',
'    SELECT',
'        C001 AS PADRE,',
'        C002 AS CODIGO,',
'        C003 AS NOMBRE,',
'        C004 AS TIPO,',
'        C005 AS ENERO,',
'        C006 AS FEBRERO,',
'        C007 AS MARZO,',
'        C008 AS ABRIL,',
'        C009 AS MAYO,',
'        C010 AS JUNIO,',
'        C011 AS JULIO,',
'        C012 AS AGOSTO,',
'        C013 AS SEPTIEMBRE,',
'        C014 AS OCTUBRE,',
'        C015 AS NOVIEMBRE,',
'        C016 AS DICIEMBRE,',
'        C017 AS TOTAL,',
'        C018 AS NIVEL',
'    FROM APEX_COLLECTIONS ',
'    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'    AND C004 = ''EGRESO''',
'    AND C018 = 1',
'),',
'SUMA_INGRESO AS',
'(',
'    SELECT',
'        C001 AS PADRE,',
'        C002 AS CODIGO,',
'        C003 AS NOMBRE,',
'        C004 AS TIPO,',
'        C005 AS ENERO,',
'        C006 AS FEBRERO,',
'        C007 AS MARZO,',
'        C008 AS ABRIL,',
'        C009 AS MAYO,',
'        C010 AS JUNIO,',
'        C011 AS JULIO,',
'        C012 AS AGOSTO,',
'        C013 AS SEPTIEMBRE,',
'        C014 AS OCTUBRE,',
'        C015 AS NOVIEMBRE,',
'        C016 AS DICIEMBRE,',
'        C017 AS TOTAL,',
'        C018 AS NIVEL',
'    FROM APEX_COLLECTIONS ',
'    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'    AND C004 = ''INGRESO''',
'    AND C018 = 1',
'), DATOS AS',
'(',
'    SELECT',
'        C001 AS PADRE,',
'        C002 AS CODIGO,',
'        C003 AS NOMBRE,',
'        C004 AS TIPO,',
'        TO_CHAR(C005, ''999G999G999G999G990D00'') AS ENERO,',
'        TO_CHAR(C006, ''999G999G999G999G990D00'') AS FEBRERO,',
'        TO_CHAR(C007, ''999G999G999G999G990D00'') AS MARZO,',
'        TO_CHAR(C008, ''999G999G999G999G990D00'') AS ABRIL,',
'        TO_CHAR(C009, ''999G999G999G999G990D00'') AS MAYO,',
'        TO_CHAR(C010, ''999G999G999G999G990D00'') AS JUNIO,',
'        TO_CHAR(C011, ''999G999G999G999G990D00'') AS JULIO,',
'        TO_CHAR(C012, ''999G999G999G999G990D00'') AS AGOSTO,',
'        TO_CHAR(C013, ''999G999G999G999G990D00'') AS SEPTIEMBRE,',
'        TO_CHAR(C014, ''999G999G999G999G990D00'') AS OCTUBRE,',
'        TO_CHAR(C015, ''999G999G999G999G990D00'') AS NOVIEMBRE,',
'        TO_CHAR(C016, ''999G999G999G999G990D00'') AS DICIEMBRE,',
'        TO_CHAR(C017, ''999G999G999G999G990D00'') AS TOTAL,',
'        C018 AS NIVEL',
'    FROM APEX_COLLECTIONS ',
'    WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
') SELECT',
'    PADRE,',
'    CODIGO,',
'    NOMBRE,',
'    TIPO,',
'    ENERO,',
'    FEBRERO,',
'    MARZO,',
'    ABRIL,',
'    MAYO,',
'    JUNIO,',
'    JULIO,',
'    AGOSTO,',
'    SEPTIEMBRE,',
'    OCTUBRE,',
'    NOVIEMBRE,',
'    DICIEMBRE,',
'    TOTAL,',
'    NIVEL',
'FROM DATOS A',
'WHERE TIPO = ''INGRESO''',
'START WITH A.PADRE IS NULL ',
'CONNECT BY PRIOR A.CODIGO = A.PADRE',
'UNION ALL',
'SELECT',
'    PADRE,',
'    CODIGO,',
'    NOMBRE,',
'    TIPO,',
'    ENERO,',
'    FEBRERO,',
'    MARZO,',
'    ABRIL,',
'    MAYO,',
'    JUNIO,',
'    JULIO,',
'    AGOSTO,',
'    SEPTIEMBRE,',
'    OCTUBRE,',
'    NOVIEMBRE,',
'    DICIEMBRE,',
'    TOTAL,',
'    NIVEL',
'FROM DATOS A',
'WHERE TIPO = ''EGRESO''',
'START WITH A.PADRE IS NULL ',
'CONNECT BY PRIOR A.CODIGO = A.PADRE',
'UNION ALL',
'SELECT',
'    NULL AS PADRE,',
'    ''RESULTADO'' AS CODIGO,',
'    ''Diferencia'' AS NOMBRE,',
'    ''RESULTADO'' AS TIPO,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(ENERO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(ENERO)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(ENERO)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(ENERO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(ENERO)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(ENERO)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(ENERO)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(ENERO)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(ENERO)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS ENERO,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(FEBRERO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(FEBRERO)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(FEBRERO)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(FEBRERO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(FEBRERO)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(FEBRERO)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(FEBRERO)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(FEBRERO)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(FEBRERO)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS FEBRERO,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(MARZO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(MARZO)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(MARZO)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(MARZO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(MARZO)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(MARZO)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(MARZO)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(MARZO)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(MARZO)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS MARZO,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(ABRIL)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(ABRIL)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(ABRIL)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(ABRIL)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(ABRIL)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(ABRIL)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(ABRIL)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(ABRIL)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(ABRIL)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS ABRIL,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(MAYO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(MAYO)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(MAYO)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(MAYO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(MAYO)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(MAYO)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(MAYO)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(MAYO)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(MAYO)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS MAYO,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(JUNIO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(JUNIO)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(JUNIO)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(JUNIO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(JUNIO)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(JUNIO)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(JUNIO)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(JUNIO)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(JUNIO)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS JUNIO,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(JULIO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(JULIO)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(JULIO)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(JULIO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(JULIO)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(JULIO)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(JULIO)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(JULIO)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(JULIO)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS JULIO,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(AGOSTO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(AGOSTO)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(AGOSTO)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(AGOSTO)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(AGOSTO)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(AGOSTO)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(AGOSTO)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(AGOSTO)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(AGOSTO)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS AGOSTO,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(SEPTIEMBRE)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(SEPTIEMBRE)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(SEPTIEMBRE)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(SEPTIEMBRE)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(SEPTIEMBRE)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(SEPTIEMBRE)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(SEPTIEMBRE)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(SEPTIEMBRE)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(SEPTIEMBRE)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS SEPTIEMBRE,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(OCTUBRE)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(OCTUBRE)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(OCTUBRE)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(OCTUBRE)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(OCTUBRE)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(OCTUBRE)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(OCTUBRE)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(OCTUBRE)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(OCTUBRE)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS OCTUBRE,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(NOVIEMBRE)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(NOVIEMBRE)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(NOVIEMBRE)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(NOVIEMBRE)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(NOVIEMBRE)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(NOVIEMBRE)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(NOVIEMBRE)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(NOVIEMBRE)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(NOVIEMBRE)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS NOVIEMBRE,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(DICIEMBRE)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(DICIEMBRE)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(DICIEMBRE)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(DICIEMBRE)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(DICIEMBRE)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(DICIEMBRE)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(DICIEMBRE)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(DICIEMBRE)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(DICIEMBRE)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS DICIEMBRE,',
'    (',
'        CASE WHEN :P91012_TIPO_INDICADOR IN (1,2,4,8) THEN',
'            TO_CHAR((SELECT NVL(ABS(SUM(TOTAL)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(TOTAL)),0) FROM SUMA_EGRESOS), ''999G999G999G999G990D00'')',
'        WHEN :P91012_TIPO_INDICADOR = 3 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(TOTAL)),0) FROM SUMA_INGRESO) = 0 THEN',
'                    0 ',
'                ELSE',
'                    100 * ((SELECT NVL(ABS(SUM(TOTAL)),0) FROM SUMA_INGRESO) - (SELECT NVL(ABS(SUM(TOTAL)),0) FROM SUMA_EGRESOS)) / (SELECT NVL(ABS(SUM(TOTAL)),0) FROM SUMA_INGRESO)',
'                END',
'            , ''999G999G999G999G990D00'') || '' %''',
'        WHEN :P91012_TIPO_INDICADOR = 20 THEN',
'            TO_CHAR(',
'                CASE WHEN (SELECT NVL(ABS(SUM(TOTAL)),0) FROM SUMA_EGRESOS) = 0 THEN',
'                    0',
'                ELSE',
'                    (SELECT NVL(ABS(SUM(TOTAL)),0) FROM SUMA_INGRESO) / (SELECT NVL(ABS(SUM(TOTAL)),0) FROM SUMA_EGRESOS)',
'                END',
'            , ''999G999G999G999G990D00'')',
'        ELSE',
'            NULL',
'        END',
'    ) AS TOTAL,',
'    ''1'' AS NIVEL',
'FROM DUAL;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P91012_TIPO_INDICADOR'
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
 p_id=>wwv_flow_imp.id(1552630273972447254)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>650
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>1552630273972447254
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449538812897199731)
,p_db_column_name=>'PADRE'
,p_display_order=>10
,p_column_identifier=>'BT'
,p_column_label=>'Padre'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449539242311199732)
,p_db_column_name=>'CODIGO'
,p_display_order=>20
,p_column_identifier=>'BU'
,p_column_label=>'Codigo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449539600693199733)
,p_db_column_name=>'NOMBRE'
,p_display_order=>30
,p_column_identifier=>'BV'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="info" data-tt-id="#CODIGO#" data-tt-parent-id="#PADRE#" >',
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
 p_id=>wwv_flow_imp.id(449540057787199734)
,p_db_column_name=>'TIPO'
,p_display_order=>40
,p_column_identifier=>'BW'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449540477273199735)
,p_db_column_name=>'ENERO'
,p_display_order=>50
,p_column_identifier=>'BX'
,p_column_label=>'Enero'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449540843421199736)
,p_db_column_name=>'FEBRERO'
,p_display_order=>60
,p_column_identifier=>'BY'
,p_column_label=>'Febrero'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449541263241199736)
,p_db_column_name=>'MARZO'
,p_display_order=>70
,p_column_identifier=>'BZ'
,p_column_label=>'Marzo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449541682677199737)
,p_db_column_name=>'ABRIL'
,p_display_order=>80
,p_column_identifier=>'CA'
,p_column_label=>'Abril'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449542022893199738)
,p_db_column_name=>'MAYO'
,p_display_order=>90
,p_column_identifier=>'CB'
,p_column_label=>'Mayo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449542465052199739)
,p_db_column_name=>'JUNIO'
,p_display_order=>100
,p_column_identifier=>'CC'
,p_column_label=>'Junio'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449542827465199739)
,p_db_column_name=>'JULIO'
,p_display_order=>110
,p_column_identifier=>'CD'
,p_column_label=>'Julio'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449543285807199740)
,p_db_column_name=>'AGOSTO'
,p_display_order=>120
,p_column_identifier=>'CE'
,p_column_label=>'Agosto'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449543656178199741)
,p_db_column_name=>'SEPTIEMBRE'
,p_display_order=>130
,p_column_identifier=>'CF'
,p_column_label=>'Septiembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449544005748199742)
,p_db_column_name=>'OCTUBRE'
,p_display_order=>140
,p_column_identifier=>'CG'
,p_column_label=>'Octubre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449544471985199742)
,p_db_column_name=>'NOVIEMBRE'
,p_display_order=>150
,p_column_identifier=>'CH'
,p_column_label=>'Noviembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449544866785199743)
,p_db_column_name=>'DICIEMBRE'
,p_display_order=>160
,p_column_identifier=>'CI'
,p_column_label=>'Diciembre'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449545248188199744)
,p_db_column_name=>'TOTAL'
,p_display_order=>170
,p_column_identifier=>'CJ'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449545629025199745)
,p_db_column_name=>'NIVEL'
,p_display_order=>180
,p_column_identifier=>'CL'
,p_column_label=>'Nivel'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1555593268391793956)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'11060573'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:TIPO:ENERO:FEBRERO:MARZO:ABRIL:MAYO:JUNIO:JULIO:AGOSTO:SEPTIEMBRE:OCTUBRE:NOVIEMBRE:DICIEMBRE:TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1556078901712889144)
,p_plug_name=>'FILTROS'
,p_parent_plug_id=>wwv_flow_imp.id(1552630203218447253)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449546681193199748)
,p_name=>'P91012_FILTROS_NIVEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1556078901712889144)
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
'        ''Nivel '' || C018 AS NOMBRE,',
'        C018 AS NIVEL',
'    FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'    ORDER BY C018 ASC',
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
 p_id=>wwv_flow_imp.id(449547061740199749)
,p_name=>'P91012_FECHA_INICIO'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449547465996199750)
,p_name=>'P91012_FECHA_FIN'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449547863187199750)
,p_name=>'P91012_EMPRESA'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449548278951199751)
,p_name=>'P91012_UNIDAD'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449548689721199751)
,p_name=>'P91012_TIPO_INDICADOR'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449549002793199752)
,p_name=>'P91012_NOMBRE_INDICADOR'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(449551048241199762)
,p_name=>'CARGAR_NOMBRE'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(449551560124199763)
,p_event_id=>wwv_flow_imp.id(449551048241199762)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P91012_NOMBRE_INDICADOR'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATO IS',
'        SELECT INDICADOR FROM SAF.CON_INDICADORES WHERE ID = :P91012_TIPO_INDICADOR;',
'    ',
'    V_DATO VARCHAR2(256) := NULL;',
'BEGIN',
'    OPEN C_DATO;',
'        FETCH C_DATO INTO V_DATO;',
'    CLOSE C_DATO;',
'',
'    RETURN NVL(V_DATO, ''Indicador no Identificado'');',
'END;'))
,p_attribute_07=>'P91012_TIPO_INDICADOR'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(449552056434199764)
,p_event_id=>wwv_flow_imp.id(449551048241199762)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".INDICADOR_DETALLES .ui-dialog-title").text(apex.item(''P91012_NOMBRE_INDICADOR'').getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(449552468543199765)
,p_name=>'AFTER_REFRESH_BALANCE_GENERAL_TABLE'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1552627165210447223)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(449552940528199765)
,p_event_id=>wwv_flow_imp.id(449552468543199765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'g_MostrarNumeroLineasIR(''BALANCE_GENERAL_TABLE'');',
'',
'global_formarVistaArbol(''BALANCE_GENERAL_TABLE'',false,'''',{celda:1});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(449553387089199766)
,p_name=>'AFTER_REFRESH_BALANCE_FILTRADO'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1552630203218447253)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(449553862763199766)
,p_event_id=>wwv_flow_imp.id(449553387089199766)
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
 p_id=>wwv_flow_imp.id(449554223993199767)
,p_name=>'FILTRO_NIVELES'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P91012_FILTROS_NIVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(449554777381199767)
,p_event_id=>wwv_flow_imp.id(449554223993199767)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''FILTRO_NIVELES_BALANCE'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(449555127958199768)
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
 p_id=>wwv_flow_imp.id(449555628451199769)
,p_event_id=>wwv_flow_imp.id(449555127958199768)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var dato = apex.item( "P91012_FILTROS_NIVEL" ).getValue();',
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
 p_id=>wwv_flow_imp.id(449556131673199769)
,p_event_id=>wwv_flow_imp.id(449555127958199768)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(`#BALANCE_FILTRADO  .t-fht-thead tr:first th .t-fht-cell`).each(function(i,o){$(o).css("width",$(`#BALANCE_FILTRADO  .t-fht-tbody .t-fht-cell`).eq(i).width());});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(449556569689199770)
,p_name=>'CARGAR_FILTRO'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(449557063370199770)
,p_event_id=>wwv_flow_imp.id(449556569689199770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P91012_FILTROS_NIVEL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'TODOS'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(449549435321199752)
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
 p_id=>wwv_flow_imp.id(449549848167199753)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_INGRESOS IS',
'        SELECT',
'    		DISTINCT A.COD_CTA AS PADRE,',
'    		NULL AS CODIGO,',
'    		NULL AS NOMBRE',
'    	FROM SAF.CON_INDICADORES_FORMULAS A',
'    	WHERE ID_INDICADOR = :P91012_TIPO_INDICADOR',
'    	AND A.FUNCION = ''+'';',
'    ',
'    CURSOR C_EGRESO IS',
'        SELECT',
'    		DISTINCT A.COD_CTA AS PADRE,',
'    		NULL AS CODIGO,',
'    		NULL AS NOMBRE',
'    	FROM SAF.CON_INDICADORES_FORMULAS A',
'    	WHERE ID_INDICADOR = :P91012_TIPO_INDICADOR',
'    	AND A.FUNCION = ''-'';',
'    ',
'    CURSOR C_VERSION IS',
'        SELECT MAX(VERSION) FROM SAF.CON_CATCTAS;',
'',
'    CURSOR C_GASTOS IS',
'        WITH TEMP_EMPRESAS AS (',
'            SELECT',
'                A.CODIGO_EMPRESA,',
'                (',
'                    CASE WHEN (',
'                        SELECT COUNT(*) FROM',
'                        (',
'                            SELECT ',
'                                REPLACE(REPLACE(REGEXP_SUBSTR(:P91012_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                            FROM ',
'                                dual CONNECT BY REGEXP_SUBSTR(:P91012_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                        )',
'        				WHERE CODIGO_EMPRESA = ''TODAS_LAS_EMPRESAS''',
'                    ) > 0 THEN',
'                        ''A''',
'                    ELSE',
'                        CASE WHEN (',
'                            SELECT COUNT(*) FROM',
'                            (',
'                                SELECT ',
'                                    REPLACE(REPLACE(REGEXP_SUBSTR(:P91012_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                                FROM ',
'                                    dual CONNECT BY REGEXP_SUBSTR(:P91012_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                            )',
'            				WHERE A.CODIGO_EMPRESA = TO_NUMBER(CODIGO_EMPRESA)',
'                        ) > 0 THEN',
'                            ''A''',
'                        ELSE',
'                            NULL',
'                        END',
'                    END',
'                ) AS ESTADO',
'            FROM SAF.GRAL_EMPRESAS A',
'            INNER JOIN SAF.GRAL_PERSONAS_TABLE B ON B.CODIGO_PERSONA = A.CODIGO_PERSONA',
'            WHERE A.CODIGO_EMPRESA > 99',
'            AND A.TIPO_EMPRESA = ''FIN''',
'        ),',
'        SALDO_INGRESOS AS (',
'            SELECT ',
'            --	DISTINCT A.ID,',
'            	''I-'' || B.COD_CTA AS CODIGO_PADRE,',
'            	FNC_GET_GASTO(A.CODIGO_GASTO) AS NOMBRE_GASTO,',
'            	(',
'                    CASE WHEN :P91012_TIPO_INDICADOR = 17 || :P91012_TIPO_INDICADOR = 20 THEN',
'                         GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020)',
'                      ',
'                    ELSE',
'                        (GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020) * -1)',
'                    --     (A.VALOR* -1)',
'                    END',
'                ) AS SALDO,',
'            	A.MES',
'            FROM SAF.CON_POLDETXHEAD A',
'            INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO',
'            WHERE B.ID_INDICADOR = :P91012_TIPO_INDICADOR ',
'            AND A.CODIGO_EMPRESA IN ',
'            (',
'                SELECT CODIGO_EMPRESA FROM TEMP_EMPRESAS WHERE ESTADO IS NOT NULL',
'            )AND TO_DATE(A.FPOL) BETWEEN TO_DATE(:P91012_FECHA_INICIO,''DD/mm/yyyy'') AND TO_DATE(:P91012_FECHA_FIN,''DD/mm/yyyy'')',
'           -- AND TRUNC(FECHA_POLIZA) BETWEEN :P91012_FECHA_INICIO AND :P91012_FECHA_FIN',
'            AND B.FUNCION = ''+''',
'      ',
'        ),',
'        SALDO_EGRESOS AS (',
'            SELECT ',
'            	--DISTINCT A.ID,',
'            	''E-'' || B.COD_CTA AS CODIGO_PADRE,',
'            	FNC_GET_GASTO(A.CODIGO_GASTO) AS NOMBRE_GASTO,',
'            	(',
'                    CASE WHEN :P91012_TIPO_INDICADOR = 17 THEN',
'                        GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020)',
'                    ELSE',
'                        GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020)*-1',
'                    --    (A.VALOR * -1)',
'                    END',
'                ) AS SALDO,',
'            	A.MES',
'            FROM SAF.CON_POLDETXHEAD A',
'            INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO',
'            WHERE B.ID_INDICADOR = :P91012_TIPO_INDICADOR ',
'            AND A.CODIGO_EMPRESA IN ',
'            (',
'                SELECT CODIGO_EMPRESA FROM TEMP_EMPRESAS WHERE ESTADO IS NOT NULL',
'            )AND TO_DATE(A.FPOL) BETWEEN TO_DATE(:P91012_FECHA_INICIO,''DD/mm/yyyy'') AND TO_DATE(:P91012_FECHA_FIN,''DD/mm/yyyy'')',
'          -- AND TRUNC(FECHA_POLIZA) BETWEEN :P91012_FECHA_INICIO AND :P91012_FECHA_FIN',
'            AND B.FUNCION = ''-''',
'        ),',
'        FILTRO_INGRESOS AS',
'        (',
'        	SELECT',
'        		CODIGO_PADRE, NOMBRE_GASTO, SALDO, MES',
'        	FROM SALDO_INGRESOS',
'        ),',
'        FILTRO_EGRESOS AS',
'        (',
'        	SELECT',
'        		CODIGO_PADRE, NOMBRE_GASTO, SALDO, MES',
'        	FROM SALDO_EGRESOS',
'        )',
'        SELECT',
'        	CODIGO_PADRE,',
'        	NOMBRE_GASTO,',
'        	NVL(ENERO, 0) ENERO,',
'        	NVL(FEBRERO, 0) FEBRERO,',
'        	NVL(MARZO, 0) MARZO,',
'        	NVL(ABRIL, 0) ABRIL,',
'        	NVL(MAYO, 0) MAYO,',
'        	NVL(JUNIO, 0) JUNIO,',
'        	NVL(JULIO, 0) JULIO,',
'        	NVL(AGOSTO, 0) AGOSTO,',
'        	NVL(SEPTIEMBRE, 0) SEPTIEMBRE,',
'        	NVL(OCTUBRE, 0) OCTUBRE,',
'        	NVL(NOVIEMBRE, 0) NOVIEMBRE,',
'        	NVL(DICIEMBRE, 0) DICIEMBRE,',
'        	(NVL(ENERO, 0)  + NVL(FEBRERO, 0) + NVL(MARZO, 0) + NVL(ABRIL, 0) + NVL(MAYO, 0) + NVL(JUNIO, 0) + NVL(JULIO, 0) + NVL(AGOSTO, 0) + NVL(SEPTIEMBRE, 0) + NVL(OCTUBRE, 0) + NVL(NOVIEMBRE, 0) + NVL(DICIEMBRE, 0)) AS TOTAL',
'        FROM FILTRO_INGRESOS',
'        PIVOT',
'        (',
'        	SUM(SALDO)',
'        	FOR MES IN',
'        	(',
'        		1 AS ENERO,',
'        		2 AS FEBRERO,',
'        		3 AS MARZO,',
'        		4 AS ABRIL,',
'        		5 AS MAYO,',
'        		6 AS JUNIO,',
'        		7 AS JULIO,',
'        		8 AS AGOSTO,',
'        		9 AS SEPTIEMBRE,',
'        		10 AS OCTUBRE,',
'        		11 AS NOVIEMBRE,',
'        		12 AS DICIEMBRE',
'        	)',
'        )',
'        UNION ALL',
'        SELECT',
'        	CODIGO_PADRE,',
'        	NOMBRE_GASTO,',
'        	NVL(ENERO, 0) ENERO,',
'        	NVL(FEBRERO, 0) FEBRERO,',
'        	NVL(MARZO, 0) MARZO,',
'        	NVL(ABRIL, 0) ABRIL,',
'        	NVL(MAYO, 0) MAYO,',
'        	NVL(JUNIO, 0) JUNIO,',
'        	NVL(JULIO, 0) JULIO,',
'        	NVL(AGOSTO, 0) AGOSTO,',
'        	NVL(SEPTIEMBRE, 0) SEPTIEMBRE,',
'        	NVL(OCTUBRE, 0) OCTUBRE,',
'        	NVL(NOVIEMBRE, 0) NOVIEMBRE,',
'        	NVL(DICIEMBRE, 0) DICIEMBRE,',
'        	(NVL(ENERO, 0)  + NVL(FEBRERO, 0) + NVL(MARZO, 0) + NVL(ABRIL, 0) + NVL(MAYO, 0) + NVL(JUNIO, 0) + NVL(JULIO, 0) + NVL(AGOSTO, 0) + NVL(SEPTIEMBRE, 0) + NVL(OCTUBRE, 0) + NVL(NOVIEMBRE, 0) + NVL(DICIEMBRE, 0)) AS TOTAL',
'        FROM FILTRO_EGRESOS',
'        PIVOT',
'        (',
'        	SUM(SALDO)',
'        	FOR MES IN',
'        	(',
'        		1 AS ENERO,',
'        		2 AS FEBRERO,',
'        		3 AS MARZO,',
'        		4 AS ABRIL,',
'        		5 AS MAYO,',
'        		6 AS JUNIO,',
'        		7 AS JULIO,',
'        		8 AS AGOSTO,',
'        		9 AS SEPTIEMBRE,',
'        		10 AS OCTUBRE,',
'        		11 AS NOVIEMBRE,',
'        		12 AS DICIEMBRE',
'        	)',
'        );',
'',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_VERSION NUMBER := 0;',
'BEGIN',
'    APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_DETALLE'');',
'',
'    OPEN C_VERSION;',
'        FETCH C_VERSION INTO V_VERSION;',
'    CLOSE C_VERSION;',
'',
'    FOR R_INGRESOS IN C_INGRESOS',
'    LOOP',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => R_INGRESOS.PADRE,',
'            p_c002 => R_INGRESOS.CODIGO,',
'            p_c003 => R_INGRESOS.NOMBRE,',
'            p_c004 => ''INGRESO''',
'        );',
'    END LOOP;',
'',
'    WHILE V_BANDERA',
'    LOOP',
'        V_BANDERA := FALSE;',
'',
'        DECLARE',
'            CURSOR C_PADRES IS',
'                SELECT C001,C002 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''INGRESO'';',
'        BEGIN',
'            FOR R_PADRES IN C_PADRES',
'            LOOP',
'                IF R_PADRES.C001 IS NOT NULL THEN',
'                    SELECT COUNT(*) INTO V_CONTADOR FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''INGRESO'' AND C002 = R_PADRES.C001;',
'',
'                    IF V_CONTADOR = 0 THEN',
'                        DECLARE',
'                            CURSOR C_PADRES_INGRESOS IS',
'                                SELECT ',
'                                    DISTINCT',
'                            		A.COD_CTA AS CODIGO,',
'                            		A.COD_CTAPADRE AS PADRE,',
'                            		A.NOMCTA AS NOMBRE',
'                                FROM SAF.CON_CATCTAS A',
'                                WHERE A.COD_CTA = R_PADRES.C001',
'                                AND A.VERSION = V_VERSION;',
'                        BEGIN',
'                            FOR R_PADRES_INGRESOS IN C_PADRES_INGRESOS',
'                            LOOP',
'                                apex_collection.add_member(',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_c001 => R_PADRES_INGRESOS.PADRE,',
'                                    p_c002 => R_PADRES_INGRESOS.CODIGO,',
'                                    p_c003 => R_PADRES_INGRESOS.NOMBRE,',
'                                    p_c004 => ''INGRESO''',
'                                );',
'',
'                                V_BANDERA := TRUE;',
'                            END LOOP;',
'                        END;',
'                    END IF;',
'                END IF;',
'            END LOOP;',
'        END;',
'    END LOOP;',
'',
'    FOR R_EGRESO IN C_EGRESO',
'    LOOP',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => R_EGRESO.PADRE,',
'            p_c002 => R_EGRESO.CODIGO,',
'            p_c003 => R_EGRESO.NOMBRE,',
'            p_c004 => ''EGRESO''',
'        );',
'    END LOOP;',
'',
'    V_BANDERA := TRUE;',
'',
'    WHILE V_BANDERA',
'    LOOP',
'        V_BANDERA := FALSE;',
'',
'        DECLARE',
'            CURSOR C_PADRES IS',
'                SELECT C001,C002 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''EGRESO'';',
'        BEGIN',
'            FOR R_PADRES IN C_PADRES',
'            LOOP',
'                IF R_PADRES.C001 IS NOT NULL THEN',
'                    SELECT COUNT(*) INTO V_CONTADOR FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''EGRESO'' AND C002 = R_PADRES.C001;',
'',
'                    IF V_CONTADOR = 0 THEN',
'                        DECLARE',
'                            CURSOR C_PADRES_EGRESO IS',
'                                SELECT ',
'                                    DISTINCT',
'                            		A.COD_CTA AS CODIGO,',
'                            		A.COD_CTAPADRE AS PADRE,',
'                            		A.NOMCTA AS NOMBRE',
'                                FROM SAF.CON_CATCTAS A',
'                                WHERE A.COD_CTA = R_PADRES.C001',
'                                AND A.VERSION = V_VERSION;',
'                        BEGIN',
'                            FOR R_PADRES_EGRESO IN C_PADRES_EGRESO',
'                            LOOP',
'                                apex_collection.add_member(',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_c001 => R_PADRES_EGRESO.PADRE,',
'                                    p_c002 => R_PADRES_EGRESO.CODIGO,',
'                                    p_c003 => R_PADRES_EGRESO.NOMBRE,',
'                                    p_c004 => ''EGRESO''',
'                                );',
'',
'                                V_BANDERA := TRUE;',
'                            END LOOP;',
'                        END;',
'                    END IF;',
'                END IF;',
'            END LOOP;',
'        END;',
'    END LOOP;',
'',
'    DECLARE',
'        CURSOR C_CAMPOS_NUEVOS IS',
'            SELECT SEQ_ID, C001, C002 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''EGRESO'';',
'    BEGIN',
'        FOR R_CAMPOS_NUEVOS IN C_CAMPOS_NUEVOS',
'        LOOP',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_CAMPOS_NUEVOS.SEQ_ID,',
'                p_attr_number => 1,',
'                p_attr_value  => (',
'                    CASE WHEN R_CAMPOS_NUEVOS.C001 IS NULL THEN',
'                        ''EGRESO''',
'                    ELSE',
'                        ''E-'' || R_CAMPOS_NUEVOS.C001',
'                    END',
'                )',
'            );',
'',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_CAMPOS_NUEVOS.SEQ_ID,',
'                p_attr_number => 2,',
'                p_attr_value  => ''E-'' || R_CAMPOS_NUEVOS.C002',
'            );',
'        END LOOP;',
'',
'        CASE :P91012_TIPO_INDICADOR',
'            WHEN 1 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''EGRESO'',',
'                    p_c003 => ''Egreso'',',
'                    p_c004 => ''EGRESO''',
'                );',
'            WHEN 2 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''EGRESO'',',
'                    p_c003 => ''Costos de ventas, Gastos Operativos y Administrativos'',',
'                    p_c004 => ''EGRESO''',
'                );',
'            WHEN 3 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''EGRESO'',',
'                    p_c003 => ''Costo de ventas'',',
'                    p_c004 => ''EGRESO''',
'                );',
'            WHEN 4 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''EGRESO'',',
'                    p_c003 => ''Costos de productos o servicios vendidos'',',
'                    p_c004 => ''EGRESO''',
'                );',
'            WHEN 8 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''EGRESO'',',
'                    p_c003 => ''Pasivo corriente'',',
'                    p_c004 => ''EGRESO''',
'                );',
'            ELSE',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''EGRESO'',',
'                    p_c003 => ''Egreso'',',
'                    p_c004 => ''EGRESO''',
'                );',
'        END CASE;',
'    END;',
'',
'    DECLARE',
'        CURSOR C_CAMPOS_NUEVOS IS',
'            SELECT SEQ_ID, C001, C002 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''INGRESO'';',
'    BEGIN',
'        FOR R_CAMPOS_NUEVOS IN C_CAMPOS_NUEVOS',
'        LOOP',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_CAMPOS_NUEVOS.SEQ_ID,',
'                p_attr_number => 1,',
'                p_attr_value  => (',
'                    CASE WHEN R_CAMPOS_NUEVOS.C001 IS NULL THEN',
'                        ''INGRESO''',
'                    ELSE',
'                        ''I-'' || R_CAMPOS_NUEVOS.C001',
'                    END',
'                )',
'            );',
'',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_CAMPOS_NUEVOS.SEQ_ID,',
'                p_attr_number => 2,',
'                p_attr_value  => ''I-'' || R_CAMPOS_NUEVOS.C002',
'            );',
'        END LOOP;',
'',
'        CASE :P91012_TIPO_INDICADOR',
'            WHEN 3 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''INGRESO'',',
'                    p_c003 => ''Ventas'',',
'                    p_c004 => ''INGRESO''',
'                );',
'            WHEN 4 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''INGRESO'',',
'                    p_c003 => ''Ventas'',',
'                    p_c004 => ''INGRESO''',
'                );',
'            WHEN 8 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''INGRESO'',',
'                    p_c003 => ''Activo corriente'',',
'                    p_c004 => ''INGRESO''',
'                );',
'            ELSE',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''INGRESO'',',
'                    p_c003 => ''Ingreso'',',
'                    p_c004 => ''INGRESO''',
'                );',
'        END CASE;',
'    END;',
'',
'    DECLARE',
'        CURSOR C_BORRAR_DATOS IS',
'            SELECT SEQ_ID FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C002 = ''E-'' OR C002 = ''I-'';',
'    BEGIN',
'        FOR R_BORRAR_DATOS IN C_BORRAR_DATOS',
'        LOOP',
'            APEX_COLLECTION.DELETE_MEMBER (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_BORRAR_DATOS.SEQ_ID',
'            );',
'        END LOOP;',
'    END;',
'    ',
'    FOR R_GASTOS IN C_GASTOS',
'    LOOP',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => R_GASTOS.CODIGO_PADRE,',
'            p_c002 => NULL,',
'            p_c003 => R_GASTOS.NOMBRE_GASTO,',
'            p_c004 => ''GASTO'',',
'            p_c005 => R_GASTOS.ENERO,',
'            p_c006 => R_GASTOS.FEBRERO,',
'            p_c007 => R_GASTOS.MARZO,',
'            p_c008 => R_GASTOS.ABRIL,',
'            p_c009 => R_GASTOS.MAYO,',
'            p_c010 => R_GASTOS.JUNIO,',
'            p_c011 => R_GASTOS.JULIO,',
'            p_c012 => R_GASTOS.AGOSTO,',
'            p_c013 => R_GASTOS.SEPTIEMBRE,',
'            p_c014 => R_GASTOS.OCTUBRE,',
'            p_c015 => R_GASTOS.NOVIEMBRE,',
'            p_c016 => R_GASTOS.DICIEMBRE,',
'            p_c017 => R_GASTOS.TOTAL',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>':P91012_TIPO_INDICADOR IN (1,2,3,4)'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(449550610724199759)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_V2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_INGRESOS IS',
'        SELECT ',
'            DISTINCT COD_CTA AS PADRE,',
'            NULL AS CODIGO,',
'    		NULL AS NOMBRE',
'        FROM SAF.CON_POLIZASD ',
'        WHERE COD_CTA LIKE ''2%'';',
'    ',
'    CURSOR C_EGRESO IS',
'        SELECT ',
'            DISTINCT COD_CTA AS PADRE,',
'    		NULL AS CODIGO,',
'    		NULL AS NOMBRE',
'        FROM SAF.CON_POLIZASD ',
'        WHERE COD_CTA LIKE ''3%'';',
'    ',
'    CURSOR C_VERSION IS',
'        SELECT MAX(VERSION) FROM SAF.CON_CATCTAS;',
'',
'    CURSOR C_GASTOS IS',
'        WITH TEMP_EMPRESAS AS (',
'            SELECT',
'                A.CODIGO_EMPRESA,',
'                (',
'                    CASE WHEN (',
'                        SELECT COUNT(*) FROM',
'                        (',
'                            SELECT ',
'                                REPLACE(REPLACE(REGEXP_SUBSTR(:P124_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                            FROM ',
'                                dual CONNECT BY REGEXP_SUBSTR(:P124_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                        )',
'        				WHERE CODIGO_EMPRESA = ''TODAS_LAS_EMPRESAS''',
'                    ) > 0 THEN',
'                        ''A''',
'                    ELSE',
'                        CASE WHEN (',
'                            SELECT COUNT(*) FROM',
'                            (',
'                                SELECT ',
'                                    REPLACE(REPLACE(REGEXP_SUBSTR(:P124_EMPRESA, ''[^\|]+'', 1, level), ''['',''''), '']'', '''') AS CODIGO_EMPRESA',
'                                FROM ',
'                                    dual CONNECT BY REGEXP_SUBSTR(:P124_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                            )',
'            				WHERE A.CODIGO_EMPRESA = TO_NUMBER(CODIGO_EMPRESA)',
'                        ) > 0 THEN',
'                            ''A''',
'                        ELSE',
'                            NULL',
'                        END',
'                    END',
'                ) AS ESTADO',
'            FROM SAF.GRAL_EMPRESAS A',
'            INNER JOIN SAF.GRAL_PERSONAS_TABLE B ON B.CODIGO_PERSONA = A.CODIGO_PERSONA',
'            WHERE A.CODIGO_EMPRESA > 99',
'            AND A.TIPO_EMPRESA = ''FIN''',
'        ),        ',
'        SALDO_INGRESOS AS (',
'            SELECT ',
'            	--DISTINCT A.ID,',
'            	''I-'' || A.COD_CTA AS CODIGO_PADRE,',
'            	FNC_GET_GASTO(A.CODIGO_GASTO) AS NOMBRE_GASTO,',
'            	(GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020)',
'                ) AS SALDO,',
'            	A.MES',
'            FROM SAF.CON_POLDETXHEAD A',
'            WHERE A.CODIGO_EMPRESA IN ',
'            (',
'                SELECT CODIGO_EMPRESA FROM TEMP_EMPRESAS WHERE ESTADO IS NOT NULL',
'            )AND TO_DATE(A.FPOL) BETWEEN TO_DATE(:P124_FECHA_INICIO,''DD/mm/yyyy'') AND TO_DATE(:P124_FECHA_FIN,''DD/mm/yyyy'')',
'            AND A.COD_CTA IN',
'            (',
'                SELECT DISTINCT COD_CTA FROM SAF.CON_POLIZASD WHERE COD_CTA LIKE ''2%'' ',
'            )',
'        ),',
'        SALDO_EGRESOS AS (',
'            SELECT ',
'            	--DISTINCT A.ID,',
'            	''E-'' || A.COD_CTA AS CODIGO_PADRE,',
'            	FNC_GET_GASTO(A.CODIGO_GASTO) AS NOMBRE_GASTO,',
'                (  GET_CARDINALIDAD_CUENTA_CONTABLE(A.COD_CTA,A.VALOR,A.DB_HB,2020)',
'                ) SALDO,',
'            	A.MES',
'            FROM SAF.CON_POLDETXHEAD A',
'            WHERE A.CODIGO_EMPRESA IN ',
'            (',
'                SELECT CODIGO_EMPRESA FROM TEMP_EMPRESAS WHERE ESTADO IS NOT NULL',
'            )',
'            AND TO_DATE(A.FPOL) BETWEEN TO_DATE(:P124_FECHA_INICIO,''DD/mm/yyyy'') AND TO_DATE(:P124_FECHA_FIN,''DD/mm/yyyy'')',
'           ',
'            AND A.COD_CTA IN',
'            (',
'                SELECT DISTINCT COD_CTA FROM SAF.CON_POLIZASD WHERE COD_CTA LIKE ''3%''',
'            )',
'        ),',
'        FILTRO_INGRESOS AS',
'        (',
'        	SELECT',
'        		CODIGO_PADRE, NOMBRE_GASTO, SALDO, MES',
'        	FROM SALDO_INGRESOS',
'        ),',
'        FILTRO_EGRESOS AS',
'        (',
'        	SELECT',
'        		CODIGO_PADRE, NOMBRE_GASTO, SALDO, MES',
'        	FROM SALDO_EGRESOS',
'        )',
'        SELECT',
'        	CODIGO_PADRE,',
'        	NOMBRE_GASTO,',
'        	NVL(ENERO, 0) ENERO,',
'        	NVL(FEBRERO, 0) FEBRERO,',
'        	NVL(MARZO, 0) MARZO,',
'        	NVL(ABRIL, 0) ABRIL,',
'        	NVL(MAYO, 0) MAYO,',
'        	NVL(JUNIO, 0) JUNIO,',
'        	NVL(JULIO, 0) JULIO,',
'        	NVL(AGOSTO, 0) AGOSTO,',
'        	NVL(SEPTIEMBRE, 0) SEPTIEMBRE,',
'        	NVL(OCTUBRE, 0) OCTUBRE,',
'        	NVL(NOVIEMBRE, 0) NOVIEMBRE,',
'        	NVL(DICIEMBRE, 0) DICIEMBRE,',
'        	(NVL(ENERO, 0)  + NVL(FEBRERO, 0) + NVL(MARZO, 0) + NVL(ABRIL, 0) + NVL(MAYO, 0) + NVL(JUNIO, 0) + NVL(JULIO, 0) + NVL(AGOSTO, 0) + NVL(SEPTIEMBRE, 0) + NVL(OCTUBRE, 0) + NVL(NOVIEMBRE, 0) + NVL(DICIEMBRE, 0)) AS TOTAL',
'        FROM FILTRO_INGRESOS',
'        PIVOT',
'        (',
'        	SUM(SALDO)',
'        	FOR MES IN',
'        	(',
'        		1 AS ENERO,',
'        		2 AS FEBRERO,',
'        		3 AS MARZO,',
'        		4 AS ABRIL,',
'        		5 AS MAYO,',
'        		6 AS JUNIO,',
'        		7 AS JULIO,',
'        		8 AS AGOSTO,',
'        		9 AS SEPTIEMBRE,',
'        		10 AS OCTUBRE,',
'        		11 AS NOVIEMBRE,',
'        		12 AS DICIEMBRE',
'        	)',
'        )',
'        UNION ALL',
'        SELECT',
'        	CODIGO_PADRE,',
'        	NOMBRE_GASTO,',
'        	NVL(ENERO, 0) ENERO,',
'        	NVL(FEBRERO, 0) FEBRERO,',
'        	NVL(MARZO, 0) MARZO,',
'        	NVL(ABRIL, 0) ABRIL,',
'        	NVL(MAYO, 0) MAYO,',
'        	NVL(JUNIO, 0) JUNIO,',
'        	NVL(JULIO, 0) JULIO,',
'        	NVL(AGOSTO, 0) AGOSTO,',
'        	NVL(SEPTIEMBRE, 0) SEPTIEMBRE,',
'        	NVL(OCTUBRE, 0) OCTUBRE,',
'        	NVL(NOVIEMBRE, 0) NOVIEMBRE,',
'        	NVL(DICIEMBRE, 0) DICIEMBRE,',
'        	(NVL(ENERO, 0)  + NVL(FEBRERO, 0) + NVL(MARZO, 0) + NVL(ABRIL, 0) + NVL(MAYO, 0) + NVL(JUNIO, 0) + NVL(JULIO, 0) + NVL(AGOSTO, 0) + NVL(SEPTIEMBRE, 0) + NVL(OCTUBRE, 0) + NVL(NOVIEMBRE, 0) + NVL(DICIEMBRE, 0)) AS TOTAL',
'        FROM FILTRO_EGRESOS',
'        PIVOT',
'        (',
'        	SUM(SALDO)',
'        	FOR MES IN',
'        	(',
'        		1 AS ENERO,',
'        		2 AS FEBRERO,',
'        		3 AS MARZO,',
'        		4 AS ABRIL,',
'        		5 AS MAYO,',
'        		6 AS JUNIO,',
'        		7 AS JULIO,',
'        		8 AS AGOSTO,',
'        		9 AS SEPTIEMBRE,',
'        		10 AS OCTUBRE,',
'        		11 AS NOVIEMBRE,',
'        		12 AS DICIEMBRE',
'        	)',
'        );',
'',
'    V_BANDERA BOOLEAN := TRUE;',
'    V_CONTADOR NUMBER := 0;',
'    V_VERSION NUMBER := 0;',
'BEGIN',
'    APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_DETALLE'');',
'',
'    OPEN C_VERSION;',
'        FETCH C_VERSION INTO V_VERSION;',
'    CLOSE C_VERSION;',
'',
'    FOR R_INGRESOS IN C_INGRESOS',
'    LOOP',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => R_INGRESOS.PADRE,',
'            p_c002 => R_INGRESOS.CODIGO,',
'            p_c003 => R_INGRESOS.NOMBRE,',
'            p_c004 => ''INGRESO''',
'        );',
'    END LOOP;',
'',
'    WHILE V_BANDERA',
'    LOOP',
'        V_BANDERA := FALSE;',
'',
'        DECLARE',
'            CURSOR C_PADRES IS',
'                SELECT C001,C002 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''INGRESO'';',
'        BEGIN',
'            FOR R_PADRES IN C_PADRES',
'            LOOP',
'                IF R_PADRES.C001 IS NOT NULL THEN',
'                    SELECT COUNT(*) INTO V_CONTADOR FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''INGRESO'' AND C002 = R_PADRES.C001;',
'',
'                    IF V_CONTADOR = 0 THEN',
'                        DECLARE',
'                            CURSOR C_PADRES_INGRESOS IS',
'                                SELECT ',
'                                    DISTINCT',
'                            		A.COD_CTA AS CODIGO,',
'                            		A.COD_CTAPADRE AS PADRE,',
'                            		A.NOMCTA AS NOMBRE',
'                                FROM SAF.CON_CATCTAS A',
'                                WHERE A.COD_CTA = R_PADRES.C001',
'                                AND A.VERSION = V_VERSION;',
'                        BEGIN',
'                            FOR R_PADRES_INGRESOS IN C_PADRES_INGRESOS',
'                            LOOP',
'                                apex_collection.add_member(',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_c001 => R_PADRES_INGRESOS.PADRE,',
'                                    p_c002 => R_PADRES_INGRESOS.CODIGO,',
'                                    p_c003 => R_PADRES_INGRESOS.NOMBRE,',
'                                    p_c004 => ''INGRESO''',
'                                );',
'',
'                                V_BANDERA := TRUE;',
'                            END LOOP;',
'                        END;',
'                    END IF;',
'                END IF;',
'            END LOOP;',
'        END;',
'    END LOOP;',
'',
'    FOR R_EGRESO IN C_EGRESO',
'    LOOP',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => R_EGRESO.PADRE,',
'            p_c002 => R_EGRESO.CODIGO,',
'            p_c003 => R_EGRESO.NOMBRE,',
'            p_c004 => ''EGRESO''',
'        );',
'    END LOOP;',
'',
'    V_BANDERA := TRUE;',
'',
'    WHILE V_BANDERA',
'    LOOP',
'        V_BANDERA := FALSE;',
'',
'        DECLARE',
'            CURSOR C_PADRES IS',
'                SELECT C001,C002 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''EGRESO'';',
'        BEGIN',
'            FOR R_PADRES IN C_PADRES',
'            LOOP',
'                IF R_PADRES.C001 IS NOT NULL THEN',
'                    SELECT COUNT(*) INTO V_CONTADOR FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''EGRESO'' AND C002 = R_PADRES.C001;',
'',
'                    IF V_CONTADOR = 0 THEN',
'                        DECLARE',
'                            CURSOR C_PADRES_EGRESO IS',
'                                SELECT ',
'                                    DISTINCT',
'                            		A.COD_CTA AS CODIGO,',
'                            		A.COD_CTAPADRE AS PADRE,',
'                            		A.NOMCTA AS NOMBRE',
'                                FROM SAF.CON_CATCTAS A',
'                                WHERE A.COD_CTA = R_PADRES.C001',
'                                AND A.VERSION = V_VERSION;',
'                        BEGIN',
'                            FOR R_PADRES_EGRESO IN C_PADRES_EGRESO',
'                            LOOP',
'                                apex_collection.add_member(',
'                                    p_collection_name => ''COLLECTION_DETALLE'',',
'                                    p_c001 => R_PADRES_EGRESO.PADRE,',
'                                    p_c002 => R_PADRES_EGRESO.CODIGO,',
'                                    p_c003 => R_PADRES_EGRESO.NOMBRE,',
'                                    p_c004 => ''EGRESO''',
'                                );',
'',
'                                V_BANDERA := TRUE;',
'                            END LOOP;',
'                        END;',
'                    END IF;',
'                END IF;',
'            END LOOP;',
'        END;',
'    END LOOP;',
'',
'    DECLARE',
'        CURSOR C_CAMPOS_NUEVOS IS',
'            SELECT SEQ_ID, C001, C002 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''EGRESO'';',
'    BEGIN',
'        FOR R_CAMPOS_NUEVOS IN C_CAMPOS_NUEVOS',
'        LOOP',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_CAMPOS_NUEVOS.SEQ_ID,',
'                p_attr_number => 1,',
'                p_attr_value  => (',
'                    CASE WHEN R_CAMPOS_NUEVOS.C001 IS NULL THEN',
'                        ''EGRESO''',
'                    ELSE',
'                        ''E-'' || R_CAMPOS_NUEVOS.C001',
'                    END',
'                )',
'            );',
'',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_CAMPOS_NUEVOS.SEQ_ID,',
'                p_attr_number => 2,',
'                p_attr_value  => ''E-'' || R_CAMPOS_NUEVOS.C002',
'            );',
'        END LOOP;',
'',
'        CASE :P124_TIPO_INDICADOR',
'            WHEN 17 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''EGRESO'',',
'                    p_c003 => ''Pasivo corriente'',',
'                    p_c004 => ''EGRESO''',
'                );',
'            ELSE',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''EGRESO'',',
'                    p_c003 => ''Egreso'',',
'                    p_c004 => ''EGRESO''',
'                );',
'        END CASE;',
'    END;',
'',
'    DECLARE',
'        CURSOR C_CAMPOS_NUEVOS IS',
'            SELECT SEQ_ID, C001, C002 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C004 = ''INGRESO'';',
'    BEGIN',
'        FOR R_CAMPOS_NUEVOS IN C_CAMPOS_NUEVOS',
'        LOOP',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_CAMPOS_NUEVOS.SEQ_ID,',
'                p_attr_number => 1,',
'                p_attr_value  => (',
'                    CASE WHEN R_CAMPOS_NUEVOS.C001 IS NULL THEN',
'                        ''INGRESO''',
'                    ELSE',
'                        ''I-'' || R_CAMPOS_NUEVOS.C001',
'                    END',
'                )',
'            );',
'',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_CAMPOS_NUEVOS.SEQ_ID,',
'                p_attr_number => 2,',
'                p_attr_value  => ''I-'' || R_CAMPOS_NUEVOS.C002',
'            );',
'        END LOOP;',
'',
'        CASE :P124_TIPO_INDICADOR',
'            WHEN 17 THEN',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''INGRESO'',',
'                    p_c003 => ''Activo corriente'',',
'                    p_c004 => ''INGRESO''',
'                );',
'            ELSE',
'                apex_collection.add_member(',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_c002 => ''INGRESO'',',
'                    p_c003 => ''Ingreso'',',
'                    p_c004 => ''INGRESO''',
'                );',
'        END CASE;',
'    END;',
'',
'    DECLARE',
'        CURSOR C_BORRAR_DATOS IS',
'            SELECT SEQ_ID FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_DETALLE'' AND C002 = ''E-'' OR C002 = ''I-'';',
'    BEGIN',
'        FOR R_BORRAR_DATOS IN C_BORRAR_DATOS',
'        LOOP',
'            APEX_COLLECTION.DELETE_MEMBER (',
'                p_collection_name => ''COLLECTION_DETALLE'',',
'                p_seq => R_BORRAR_DATOS.SEQ_ID',
'            );',
'        END LOOP;',
'    END;',
'    ',
'    FOR R_GASTOS IN C_GASTOS',
'    LOOP',
'        apex_collection.add_member(',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_c001 => R_GASTOS.CODIGO_PADRE,',
'            p_c002 => NULL,',
'            p_c003 => R_GASTOS.NOMBRE_GASTO,',
'            p_c004 => ''GASTO'',',
'            p_c005 => R_GASTOS.ENERO,',
'            p_c006 => R_GASTOS.FEBRERO,',
'            p_c007 => R_GASTOS.MARZO,',
'            p_c008 => R_GASTOS.ABRIL,',
'            p_c009 => R_GASTOS.MAYO,',
'            p_c010 => R_GASTOS.JUNIO,',
'            p_c011 => R_GASTOS.JULIO,',
'            p_c012 => R_GASTOS.AGOSTO,',
'            p_c013 => R_GASTOS.SEPTIEMBRE,',
'            p_c014 => R_GASTOS.OCTUBRE,',
'            p_c015 => R_GASTOS.NOVIEMBRE,',
'            p_c016 => R_GASTOS.DICIEMBRE,',
'            p_c017 => R_GASTOS.TOTAL',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>':P91012_TIPO_INDICADOR IN (8,17,20)'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(449550271667199757)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FORMATO_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            C001 AS PADRE,',
'            C002 AS CODIGO,',
'            SEQ_ID AS ID,',
'            LEVEL AS NIVEL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        START WITH C001 IS NULL ',
'        CONNECT BY PRIOR C002 = C001;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_seq =>R_DATOS.ID,',
'            p_attr_number => 18,',
'            p_attr_value  => R_DATOS.NIVEL',
'        );',
'    END LOOP;',
'END;',
'',
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            SEQ_ID AS ID,',
'            C001 AS PADRE,',
'            C002 AS CODIGO,',
'            C005 AS ENERO,',
'            C006 AS FEBRERO,',
'            C007 AS MARZO,',
'            C008 AS ABRIL,',
'            C009 AS MAYO,',
'            C010 AS JUNIO,',
'            C011 AS JULIO,',
'            C012 AS AGOSTO,',
'            C013 AS SEPTIEMBRE,',
'            C014 AS OCTUBRE,',
'            C015 AS NOVIEMBRE,',
'            C016 AS DICIEMBRE',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C002 IS NOT NULL',
'        ORDER BY C018 DESC;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_CUENTAS IS',
'                SELECT',
'                    NVL(SUM(C005), 0) AS ENERO,',
'                    NVL(SUM(C006), 0) AS FEBRERO,',
'                    NVL(SUM(C007), 0) AS MARZO,',
'                    NVL(SUM(C008), 0) AS ABRIL,',
'                    NVL(SUM(C009), 0) AS MAYO,',
'                    NVL(SUM(C010), 0) AS JUNIO,',
'                    NVL(SUM(C011), 0) AS JULIO,',
'                    NVL(SUM(C012), 0) AS AGOSTO,',
'                    NVL(SUM(C013), 0) AS SEPTIEMBRE,',
'                    NVL(SUM(C014), 0) AS OCTUBRE,',
'                    NVL(SUM(C015), 0) AS NOVIEMBRE,',
'                    NVL(SUM(C016), 0) AS DICIEMBRE',
'                FROM APEX_COLLECTIONS ',
'                WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'                AND C001 = R_DATOS.CODIGO;',
'        BEGIN',
'            FOR R_CUENTAS IN C_CUENTAS',
'            LOOP',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 5,',
'                    p_attr_value  => NVL(R_DATOS.ENERO, 0) + NVL(R_CUENTAS.ENERO, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 6,',
'                    p_attr_value  => NVL(R_DATOS.FEBRERO, 0) + NVL(R_CUENTAS.FEBRERO, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 7,',
'                    p_attr_value  => NVL(R_DATOS.MARZO, 0) + NVL(R_CUENTAS.MARZO, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 8,',
'                    p_attr_value  => NVL(R_DATOS.ABRIL, 0) + NVL(R_CUENTAS.ABRIL, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 9,',
'                    p_attr_value  => NVL(R_DATOS.MAYO, 0) + NVL(R_CUENTAS.MAYO, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 10,',
'                    p_attr_value  => NVL(R_DATOS.JUNIO, 0) + NVL(R_CUENTAS.JUNIO, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 11,',
'                    p_attr_value  => NVL(R_DATOS.JULIO, 0) + NVL(R_CUENTAS.JULIO, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 12,',
'                    p_attr_value  => NVL(R_DATOS.AGOSTO, 0) + NVL(R_CUENTAS.AGOSTO, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 13,',
'                    p_attr_value  => NVL(R_DATOS.SEPTIEMBRE, 0) + NVL(R_CUENTAS.SEPTIEMBRE, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 14,',
'                    p_attr_value  => NVL(R_DATOS.OCTUBRE, 0) + NVL(R_CUENTAS.OCTUBRE, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 15,',
'                    p_attr_value  => NVL(R_DATOS.NOVIEMBRE, 0) + NVL(R_CUENTAS.NOVIEMBRE, 0)',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE'',',
'                    p_seq => R_DATOS.ID,',
'                    p_attr_number => 16,',
'                    p_attr_value  => NVL(R_DATOS.DICIEMBRE, 0) + NVL(R_CUENTAS.DICIEMBRE, 0)',
'                );',
'            END LOOP;',
'        END;',
'    END LOOP;',
'END;',
'',
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            SEQ_ID AS ID,',
'            (C005 + C006 + C007 + C008 + C009 + C010 + C011 + C012 + C013 + C014 + C015 + C016) AS TOTAL',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_DETALLE''',
'        AND C002 IS NOT NULL',
'        ORDER BY C018 DESC;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'            p_collection_name => ''COLLECTION_DETALLE'',',
'            p_seq => R_DATOS.ID,',
'            p_attr_number => 17,',
'            p_attr_value  => R_DATOS.TOTAL',
'        );',
'    END LOOP;',
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
