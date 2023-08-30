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
--     PAGE: 176
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00176
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>176);
end;
/
prompt --application/pages/page_00176
begin
wwv_flow_imp_page.create_page(
 p_id=>176
,p_name=>'NOTAS_PRESTAMOS_BANCARIOS'
,p_alias=>'NOTAS-PRESTAMOS-BANCARIOS'
,p_page_mode=>'MODAL'
,p_step_title=>'Notas Prestamos Bancarios'
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
'#REPORTE_GERENCIAL th#ANIO_1, #REPORTE_GERENCIAL td[headers=ANIO_1],',
'#REPORTE_GERENCIAL th#ANIO_2, #REPORTE_GERENCIAL td[headers=ANIO_2],',
'#REPORTE_GERENCIAL_1311 th#ANIO_1, #REPORTE_GERENCIAL_1311 td[headers=ANIO_1],',
'#REPORTE_GERENCIAL_1311 th#ANIO_2, #REPORTE_GERENCIAL_1311 td[headers=ANIO_2]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#REPORTE_GERENCIAL th#MES, #REPORTE_GERENCIAL td[headers=MES],',
'#REPORTE_GERENCIAL_1311 th#MES, #REPORTE_GERENCIAL_1311 td[headers=MES]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'    max-width: 100px !important;',
'}',
'',
'#REPORTE_GERENCIAL th#CONCEPTO, #REPORTE_GERENCIAL td[headers=CONCEPTO],',
'#REPORTE_GERENCIAL_1311 th#CONCEPTO, #REPORTE_GERENCIAL_1311 td[headers=CONCEPTO]',
'{',
'    width: 700px !important;',
'    min-width: 700px !important;',
'    max-width: 700px !important;',
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
,p_last_upd_yyyymmddhh24miss=>'20230804114947'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(213166964792476103)
,p_plug_name=>'REPORTE_GERENCIAL_1311'
,p_region_name=>'REPORTE_GERENCIAL_1311'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    MES,',
'    CONCEPTO,',
'    EJERCICIO,',
'    ANIO_1,',
'    ANIO_2,',
'    CLASE,',
'    SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'    	AA.MES,',
'    	AA.CONCEPTO,',
'    	AA.EJERCICIO,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'        		CASE WHEN AA.EJERCICIO = TO_NUMBER(:P176_ANIO) THEN',
'        			NVL(SUM(AA.VALOR), 0)',
'        		ELSE',
'        			0',
'        		END',
'        	),',
'    		1,',
'    		:P176_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'        		CASE WHEN AA.EJERCICIO = (TO_NUMBER(:P176_ANIO) - 1) THEN',
'        			NVL(SUM(AA.VALOR), 0)',
'        		ELSE',
'        			0',
'        		END',
'        	),',
'    		1,',
'    		:P176_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        NULL CLASE,',
'        :P176_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'    WHERE AA.COD_CTA = :P176_COD_CTA',
'    AND AA.MES <= :P176_FECHA_FIN',
'    AND (AA.EJERCICIO = :P176_ANIO OR AA.EJERCICIO = (TO_NUMBER(:P176_ANIO) - 1))',
'    AND AA.CODIGO_EMPRESA IN',
'    (',
'        SELECT ',
'            REGEXP_SUBSTR(:P176_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P176_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'    )',
'    GROUP BY AA.MES, AA.CONCEPTO, AA.EJERCICIO',
'    ORDER BY AA.MES ASC',
')',
'UNION ALL',
'SELECT',
'	NULL MES,',
'	''Total'' CONCEPTO,',
'	NULL EJERCICIO,',
'	SUM(ANIO_1) ANIO_1,',
'    SUM(ANIO_2) ANIO_2,',
'    ''font-weight: bold;'' CLASE,',
'    :P176_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'    	AA.MES,',
'    	AA.CONCEPTO,',
'    	AA.EJERCICIO,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'        		CASE WHEN AA.EJERCICIO = TO_NUMBER(:P176_ANIO) THEN',
'        			NVL(SUM(AA.VALOR), 0)',
'        		ELSE',
'        			0',
'        		END',
'        	),',
'    		1,',
'    		:P176_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'        		CASE WHEN AA.EJERCICIO = (TO_NUMBER(:P176_ANIO) - 1) THEN',
'        			NVL(SUM(AA.VALOR), 0)',
'        		ELSE',
'        			0',
'        		END',
'        	),',
'    		1,',
'    		:P176_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        :P176_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'    WHERE AA.COD_CTA = :P176_COD_CTA',
'    AND AA.MES <= :P176_FECHA_FIN',
'    AND (AA.EJERCICIO = :P176_ANIO OR AA.EJERCICIO = (TO_NUMBER(:P176_ANIO) - 1))',
'    AND AA.CODIGO_EMPRESA IN',
'    (',
'        SELECT ',
'            REGEXP_SUBSTR(:P176_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P176_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'    )',
'    GROUP BY AA.MES, AA.CONCEPTO, AA.EJERCICIO',
'    ORDER BY AA.MES ASC',
')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P176_ANIO,P176_COD_CTA,P176_FECHA_FIN,P176_MONEDA,P176_SIMBOLO_MONEDA,P176_EMPRESA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P176_VERSION'
,p_plug_display_when_cond2=>'1311'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(213167068180476104)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>213167068180476104
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213167193561476105)
,p_db_column_name=>'MES'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Mes'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_static_id=>'MES'
,p_rpt_named_lov=>wwv_flow_imp.id(105398202110893169)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213167277481476106)
,p_db_column_name=>'CONCEPTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Concepto'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="padding-left:0; display:inline-block; white-space:nowrap; width:calc(100%); overflow: hidden; white-space: normal; #CLASE#">',
'    #CONCEPTO#',
'</div>'))
,p_column_type=>'STRING'
,p_static_id=>'CONCEPTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213167355462476107)
,p_db_column_name=>'EJERCICIO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Ejercicio'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213167494201476108)
,p_db_column_name=>'ANIO_1'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'&P176_ANIO.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA#</div> <div style="float:right; #CLASE#">#ANIO_1#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'ANIO_1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213167514301476109)
,p_db_column_name=>'ANIO_2'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'&P176_ANIO_MENOS_1.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA#</div> <div style="float:right; #CLASE#">#ANIO_2#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'ANIO_2'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213167666246476110)
,p_db_column_name=>'CLASE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213167738684476111)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(213215660151563766)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2132157'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'CONCEPTO:MES:ANIO_1:ANIO_2:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1016153104336406665)
,p_plug_name=>'REPORTE_GERENCIAL'
,p_region_name=>'REPORTE_GERENCIAL'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    MES,',
'    CONCEPTO,',
'    EJERCICIO,',
'    ANIO_1,',
'    ANIO_2,',
'    CLASE,',
'    SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'    	AA.MES,',
'    	AA.CONCEPTO,',
'    	AA.EJERCICIO,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'        		CASE WHEN AA.EJERCICIO = TO_NUMBER(:P176_ANIO) THEN',
'        			NVL(SUM(AA.VALOR), 0)',
'        		ELSE',
'        			0',
'        		END',
'        	),',
'    		1,',
'    		:P176_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'        		CASE WHEN AA.EJERCICIO = (TO_NUMBER(:P176_ANIO) - 1) THEN',
'        			NVL(SUM(AA.VALOR), 0)',
'        		ELSE',
'        			0',
'        		END',
'        	),',
'    		1,',
'    		:P176_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        NULL CLASE,',
'        :P176_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'    WHERE AA.COD_CTA = :P176_COD_CTA',
'    AND AA.MES <= :P176_FECHA_FIN',
'    AND (AA.EJERCICIO = :P176_ANIO OR AA.EJERCICIO = (TO_NUMBER(:P176_ANIO) - 1))',
'    AND AA.CODIGO_EMPRESA IN',
'    (',
'        SELECT ',
'            REGEXP_SUBSTR(:P176_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P176_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'    )',
'    GROUP BY AA.MES, AA.CONCEPTO, AA.EJERCICIO',
'    ORDER BY AA.MES ASC',
')',
'UNION ALL',
'SELECT',
'	NULL MES,',
'	''Total'' CONCEPTO,',
'	NULL EJERCICIO,',
'	SUM(ANIO_1) ANIO_1,',
'    SUM(ANIO_2) ANIO_2,',
'    ''font-weight: bold;'' CLASE,',
'    :P176_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'    	AA.MES,',
'    	AA.CONCEPTO,',
'    	AA.EJERCICIO,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'        		CASE WHEN AA.EJERCICIO = TO_NUMBER(:P176_ANIO) THEN',
'        			NVL(SUM(AA.VALOR), 0)',
'        		ELSE',
'        			0',
'        		END',
'        	),',
'    		1,',
'    		:P176_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_1,',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'        		CASE WHEN AA.EJERCICIO = (TO_NUMBER(:P176_ANIO) - 1) THEN',
'        			NVL(SUM(AA.VALOR), 0)',
'        		ELSE',
'        			0',
'        		END',
'        	),',
'    		1,',
'    		:P176_MONEDA,',
'    		1,',
'    		NULL',
'    	) ANIO_2,',
'        :P176_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'    FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'    WHERE AA.COD_CTA = :P176_COD_CTA',
'    AND AA.MES <= :P176_FECHA_FIN',
'    AND (AA.EJERCICIO = :P176_ANIO OR AA.EJERCICIO = (TO_NUMBER(:P176_ANIO) - 1))',
'    AND AA.CODIGO_EMPRESA IN',
'    (',
'        SELECT ',
'            REGEXP_SUBSTR(:P176_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P176_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'    )',
'    GROUP BY AA.MES, AA.CONCEPTO, AA.EJERCICIO',
'    ORDER BY AA.MES ASC',
')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P176_ANIO,P176_COD_CTA,P176_FECHA_FIN,P176_MONEDA,P176_SIMBOLO_MONEDA,P176_EMPRESA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P176_VERSION'
,p_plug_display_when_cond2=>'1311'
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
 p_id=>wwv_flow_imp.id(1016153142078406666)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>1016153142078406666
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206942121398982146)
,p_db_column_name=>'MES'
,p_display_order=>10
,p_column_identifier=>'CC'
,p_column_label=>'Mes'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_static_id=>'MES'
,p_rpt_named_lov=>wwv_flow_imp.id(105398202110893169)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206942279046982147)
,p_db_column_name=>'CONCEPTO'
,p_display_order=>20
,p_column_identifier=>'CD'
,p_column_label=>'Concepto'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="padding-left:0; display:inline-block; white-space:nowrap; width:calc(100%); overflow: hidden; white-space: normal; #CLASE#">',
'    #CONCEPTO#',
'</div>'))
,p_column_type=>'STRING'
,p_static_id=>'CONCEPTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206942367868982148)
,p_db_column_name=>'EJERCICIO'
,p_display_order=>30
,p_column_identifier=>'CE'
,p_column_label=>'Ejercicio'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206942493792982149)
,p_db_column_name=>'ANIO_1'
,p_display_order=>40
,p_column_identifier=>'CF'
,p_column_label=>'&P176_ANIO.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA#</div> <div style="float:right; #CLASE#">#ANIO_1#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'ANIO_1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206942501226982150)
,p_db_column_name=>'ANIO_2'
,p_display_order=>50
,p_column_identifier=>'CG'
,p_column_label=>'&P176_ANIO_MENOS_1.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="white-space: nowrap;">',
'    <div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA#</div> <div style="float:right; #CLASE#">#ANIO_2#</div>',
'</div>'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'ANIO_2'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213166778174476101)
,p_db_column_name=>'CLASE'
,p_display_order=>60
,p_column_identifier=>'CH'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(213166862310476102)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>70
,p_column_identifier=>'CI'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1016887868486672718)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1914309'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'CONCEPTO:MES:ANIO_1:ANIO_2:'
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
 p_id=>wwv_flow_imp.id(206940310753982128)
,p_name=>'P176_VERSION'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206940406241982129)
,p_name=>'P176_COD_CTA'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213070560155128365)
,p_name=>'P176_EMPRESA'
,p_item_sequence=>10
,p_item_default=>':GLOBAL_EMPRESA'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213070952982128367)
,p_name=>'P176_FECHA_INICIO'
,p_item_sequence=>20
,p_item_default=>'1'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213071302862128367)
,p_name=>'P176_FECHA_FIN'
,p_item_sequence=>30
,p_item_default=>'TO_NUMBER(TO_CHAR(SYSDATE, ''MM''))'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213071784670128368)
,p_name=>'P176_ANIO'
,p_item_sequence=>40
,p_item_default=>'TO_NUMBER(TO_CHAR(SYSDATE, ''YYYY''))'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213072169073128369)
,p_name=>'P176_ANIO_MENOS_1'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213072501808128369)
,p_name=>'P176_MONEDA'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213072933185128369)
,p_name=>'P176_SIMBOLO_MONEDA'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213073306536128370)
,p_name=>'P176_NOTA'
,p_item_sequence=>120
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(213073773666128370)
,p_process_sequence=>120
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P176_ANIO_MENOS_1 := TO_NUMBER(:P176_ANIO) - 1;',
'',
'SELECT',
'	SIMBOLO_MONEDA',
'    INTO',
'    :P176_SIMBOLO_MONEDA',
'FROM SAF.GRAL_MONEDAS',
'WHERE CODIGO_MONEDA = :P176_MONEDA;'))
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
