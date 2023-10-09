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
--   Date and Time:   15:12 Monday October 9, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 119
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00119
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>119);
end;
/
prompt --application/pages/page_00119
begin
wwv_flow_imp_page.create_page(
 p_id=>119
,p_name=>'INDICADORES_GERENCIALES'
,p_alias=>'INDICADORES-GERENCIALES'
,p_step_title=>'Indicadores'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function detalleIndicador(indicador) ',
'{',
'    apex.item(''P119_TIPO_INDICADOR'').value = indicador;',
'    ',
'    switch (indicador) {',
'        case 1:',
'        case 2:',
'        case 3:',
'        case 4:',
'        case 8:',
'        case 17:',
'            $.event.trigger(''MODAL_DETALLE_INDICADOR'');',
'            break;',
'        case 5:',
'            $.event.trigger(''MODAL_DETALLE_INDICADOR_5'');',
'            break;',
'        case 9:',
'        case 16:',
'            $.event.trigger(''MODAL_DETALLE_INDICADOR_9'');',
'            break;',
'        case 12:',
'        case 10:',
'            $.event.trigger(''MODAL_DETALLE_ROTACION_CUENTA_PAGAR'');',
'            break;',
'        case 13:',
'            $.event.trigger(''MODAL_DETALLES_TIEMPOS_AP_PAGOS'');',
'            break;',
'        case 18:',
'            $.event.trigger(''MODAL_DETALLES_CUMPLIMIENTO_PAGO'');',
'            break;',
'        case 6:',
'            $.event.trigger(''MODAL_DETALLES_CIERRE_MENSUAL'');',
'            break;',
'        case 14:',
'            $.event.trigger(''MODAL_ANTIGUEDAD_PROMEDIO_PERIODO_PAGO'');',
'            break;',
'        case 15:',
'            $.event.trigger(''MODAL_DETALLE_INDICADOR_PLAZO_PROMEDIO_COBRANZA'');',
'            break;',
'        case 7:',
'            $.event.trigger(''MODAL_DETALLE_CONCILIACIONES_BANCARIAS'');',
'            break;',
'        case 11:',
'            $.event.trigger(''MODAL_DETALLE_CICLO'');',
'            break;',
'        default:',
'            console.error(''INDICADOR NO VALIDO'');',
'    }',
'}',
'',
'var $wP;'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#CONCILACION_BANCARARIA .t-Card .t-Card-wrap .t-Card-titleWrap{',
'    height: 164px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20231009134448'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1101487114631567925)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1102790704449595418)
,p_plug_name=>'Indicadores'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1149143457812916102)
,p_plug_name=>'Actividad'
,p_parent_plug_id=>wwv_flow_imp.id(1102790704449595418)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99558760127243721)
,p_plug_display_sequence=>150
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1120138633650998645)
,p_name=>'Rotacion de Cuentas Por Cobrar'
,p_parent_plug_id=>wwv_flow_imp.id(1149143457812916102)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>80
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS_SALDO_INICIAL AS ',
'(',
'    SELECT',
'        APX_FNC_POLIZAS_SUMA_SALDO_INICIAL(:P119_VECTOR_EMPRESAS, :P119_VECTOR_UNIDADES, :P119_FECHA_INICIO) AS SALDO',
'    FROM DUAL',
'),',
'DATOS_SALDO_FIN AS ',
'(',
'    SELECT',
'        APX_FNC_POLIZAS_SUMA_SALDO_FINAL(:P119_VECTOR_EMPRESAS, :P119_VECTOR_UNIDADES, :P119_FECHA_FIN) AS SALDO',
'    FROM DUAL',
'),',
'DATOS_VENTAS AS (',
'    SELECT ',
'    	A.ID,',
'    	(A.SALDO * -1) AS SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 9 AND FUNCION = ''/''',
'    )',
'    AND A.CODIGO_GASTO IN',
'    (',
'        SELECT DISTINCT CODIGO_GASTO FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 9 AND FUNCION = ''/''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND A.USUARIO_GRABACION = 1',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        CASE WHEN (SELECT NVL(SUM(SALDO), 0) FROM DATOS_VENTAS) = 0 THEN',
'            0',
'        ELSE',
'            ( ((SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_INICIAL) + (SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_FIN)) / 2) / ((SELECT NVL(SUM(SALDO), 0) FROM DATOS_VENTAS) * 1.12)',
'        END',
'    , ''999G999G999G999G990D00'') || '' Dias'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(9);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 9;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_VECTOR_EMPRESAS,P119_VECTOR_UNIDADES'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1120138713263998646)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1120138804638998647)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1120138948556998648)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1120139071483998649)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1120139114669998650)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1123185878816012601)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1123185994861012602)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1149144290637916110)
,p_name=>'Periodo de pago'
,p_parent_plug_id=>wwv_flow_imp.id(1149143457812916102)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>100
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS_SALDO_INICIAL AS ',
'(',
'    SELECT',
'        FNC_CXP_TRANSACCIONES_SUMA_SALDO_INICIAL(:P119_VECTOR_EMPRESAS, :P119_VECTOR_UNIDADES, :P119_FECHA_INICIO, :P119_INTERCOMPANY) AS SALDO',
'    FROM DUAL',
'),',
'DATOS_SALDO_FIN AS ',
'(',
'    SELECT',
'        FNC_CXP_TRANSACCIONES_SUMA_SALDO_FINAL(:P119_VECTOR_EMPRESAS, :P119_VECTOR_UNIDADES, :P119_FECHA_FIN, :P119_INTERCOMPANY) AS SALDO',
'    FROM DUAL',
'),',
'DATOS_TOTAL_PROVEEDORES AS (',
'    SELECT',
'        TREINTA,',
'        SESENTA,',
'        MAXSESENTA',
'    FROM VW_CXP_PERIODO_PAGO_PROVEEDORES A',
'    WHERE A.CODIGO_EMPRESA IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.CODIGO_PROVEEDOR IN',
'    (',
'        SELECT ',
'            DISTINCT CODIGO_PROVEEDOR ',
'        FROM ',
'        (',
'            SELECT',
'        		CODIGO_PROVEEDOR,',
'        		(',
'        			CASE',
'        				WHEN :P119_INTERCOMPANY = ''N'' THEN',
'        					CASE',
'        						WHEN NVL(INTERCOMPANY, ''N'') = ''N'' THEN',
'        							''N''',
'        						ELSE',
'        							NULL',
'        					END',
'        				ELSE',
'        					''N''',
'        			END',
'        		) ESTADO',
'        	FROM SAF.CXP_PROVEEDORES',
'        ) ',
'        WHERE ESTADO IS NOT NULL',
'    )',
'    AND A.FECHA_TRANSACCION BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        CASE WHEN ((SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_INICIAL) + (SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_FIN)) != 0 THEN',
'            365 * (SELECT NVL(SUM(TREINTA + SESENTA + MAXSESENTA), 0) FROM DATOS_TOTAL_PROVEEDORES) / ( ((SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_INICIAL) + (SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_FIN)) / 2 )',
'        ELSE',
'            0',
'        END',
'    , ''999G999G999G999G990D00'') || '' Dias'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(10);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 10;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_INTERCOMPANY,P119_VECTOR_EMPRESAS,P119_VECTOR_UNIDADES,P119_ESTADO'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149144356491916111)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149144413265916112)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149144598213916113)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149144690123916114)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149144731806916115)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149144874000916116)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149144989885916117)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1168426430983347909)
,p_name=>'Ciclo del periodo'
,p_parent_plug_id=>wwv_flow_imp.id(1149143457812916102)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>110
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS AS',
'(',
'    SELECT',
'        TO_NUMBER(NVL(TO_DATE(C003), SYSDATE) - TO_DATE(C002)) AS TOTAL',
'    FROM APEX_COLLECTIONS',
'    WHERE COLLECTION_NAME = ''COLLECTION_CICLO_PERIODO''',
'    AND C002 IS NOT NULL',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        NVL((SELECT AVG(TOTAL) FROM DATOS), 0)',
'    , ''999G999G999G999G990D00'') || '' Dias'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(11);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 11;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168426539714347910)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168426691794347911)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168426719317347912)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168426877174347913)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168426946169347914)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168427015592347915)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168427136662347916)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1149143594671916103)
,p_plug_name=>'Estrategico'
,p_parent_plug_id=>wwv_flow_imp.id(1102790704449595418)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99558760127243721)
,p_plug_display_sequence=>160
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1102790857928595419)
,p_name=>'Balances mensuales por departamento'
,p_parent_plug_id=>wwv_flow_imp.id(1149143594671916103)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS_INGRESOS AS (',
'    SELECT ',
'    	A.ID,',
'    	A.SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 1 AND FUNCION = ''+''',
'    )',
'    AND A.CODIGO_GASTO IN ',
'    (',
'        SELECT DISTINCT CODIGO_GASTO FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 1 AND FUNCION = ''+''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND A.USUARIO_GRABACION = 1',
'),',
'DATOS_EGRESO AS (',
'    SELECT ',
'    	A.ID,',
'    	A.SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 1 AND FUNCION = ''-''',
'    )',
'    AND A.CODIGO_GASTO IN ',
'    (',
'        SELECT DISTINCT CODIGO_GASTO FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 1 AND FUNCION = ''+''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN :P119_FECHA_INICIO AND :P119_FECHA_FIN',
'    AND A.USUARIO_GRABACION = 1',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    ''Q. '' || TO_CHAR',
'    (',
'        (',
'            SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_INGRESOS',
'        ) -',
'        (',
'            SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_EGRESO',
'        )',
'    , ''999G999G999G999G990D00'') AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(1);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 1;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1102790909904595420)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1102791056042595421)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1102791173714595422)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1102791262904595423)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1102791394849595424)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1102791406433595425)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107107606174142605)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1107107794441142606)
,p_name=>'EBITDA'
,p_parent_plug_id=>wwv_flow_imp.id(1149143594671916103)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*WITH DATOS_INGRESOS AS (',
'    SELECT ',
'    	A.ID,',
'    	A.SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 2 AND FUNCION = ''+''',
'    )',
'    AND A.CODIGO_GASTO IN',
'    (',
'        SELECT DISTINCT CODIGO_GASTO FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 2 AND FUNCION = ''+''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN :P119_FECHA_INICIO AND :P119_FECHA_FIN',
'),',
'DATOS_EGRESO AS (',
'    SELECT ',
'    	A.ID,',
'    	A.SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 2 AND FUNCION = ''-''',
'    )',
'    AND A.CODIGO_GASTO IN',
'    (',
'        SELECT DISTINCT CODIGO_GASTO FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 2 AND FUNCION = ''+''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
')*/',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        /*(',
'            SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_INGRESOS',
'        ) -',
'        (',
'            SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_EGRESO',
'        )*/',
'        SAF.GET_INDICADOR_GERENCIAL_OPERACION_RESTA',
'        (',
'            SUBSTR(:P119_VECTOR_EMPRESAS,2,LENGTH(:P119_VECTOR_EMPRESAS)-2),',
'            SUBSTR(:P119_VECTOR_UNIDADES,2,LENGTH(:P119_VECTOR_UNIDADES)-2),',
'            TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY''),',
'            TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY''),',
'            ID',
'        )',
'    , ''999G999G999G999G990D00'') AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(2);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 2;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_VECTOR_EMPRESAS,P119_VECTOR_UNIDADES'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107107895586142607)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107107922947142608)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107108047145142609)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107108111139142610)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107108232934142611)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107108305651142612)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107108415544142613)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1117600271262033413)
,p_name=>unistr('Rotaci\00F3n de activos')
,p_parent_plug_id=>wwv_flow_imp.id(1149143594671916103)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS_VENTAS_TOTALES AS (',
'    SELECT ',
'    	A.ID,',
'    	A.SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 5 AND FUNCION = ''+''',
'    )',
'    AND A.CODIGO_GASTO IN',
'    (',
'        SELECT DISTINCT CODIGO_GASTO FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 5 AND FUNCION = ''+''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN :P119_FECHA_INICIO AND :P119_FECHA_FIN',
'    AND A.USUARIO_GRABACION = 1',
'),',
'DATOS_ACTIVOS_MEDIOS_TOTALES AS (',
'    SELECT ',
'    	A.ID,',
'    	A.SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 5 AND FUNCION = ''/''',
'    )',
'    AND A.CODIGO_GASTO IN',
'    (',
'        SELECT DISTINCT CODIGO_GASTO FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 5 AND FUNCION = ''+''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND A.USUARIO_GRABACION = 1',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (   ',
'        CASE WHEN (SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_ACTIVOS_MEDIOS_TOTALES) = 0 THEN',
'            0',
'        ELSE',
'            (SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_VENTAS_TOTALES) / (SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_ACTIVOS_MEDIOS_TOTALES)',
'        END',
'    , ''999G999G999G999G990D00'') AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(5);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 5;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117600313846033414)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117600495090033415)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117600590860033416)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117600638480033417)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117600765637033418)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117600852602033419)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117600935552033420)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1123189831376012641)
,p_name=>'Liquidez financiera'
,p_parent_plug_id=>wwv_flow_imp.id(1149143594671916103)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>70
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS_INGRESOS AS (',
'    SELECT ',
'    	A.ID,',
'    	(',
'            CASE WHEN A.DEBE != 0 THEN',
'                SAF.GET_CARDINALIDAD_CUENTA_CONTABLE',
'                (',
'                    A.COD_CTA,',
'                    A.SALDO,',
'                    ''D'',',
'                    2020',
'                )',
'            ELSE',
'                SAF.GET_CARDINALIDAD_CUENTA_CONTABLE',
'                (',
'                    A.COD_CTA,',
'                    A.SALDO,',
'                    ''H'',',
'                    2020',
'                )',
'            END',
'        ) SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INTEGRACION_GERENCIAL WHERE COD_CTA LIKE ''11%''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN :P119_FECHA_INICIO AND :P119_FECHA_FIN',
'    AND A.USUARIO_GRABACION = 1',
'),',
'DATOS_EGRESO AS (',
'    SELECT ',
'    	A.ID,',
'    	(',
'            CASE WHEN A.DEBE != 0 THEN',
'                SAF.GET_CARDINALIDAD_CUENTA_CONTABLE',
'                (',
'                    A.COD_CTA,',
'                    A.SALDO,',
'                    ''D'',',
'                    2020',
'                )',
'            ELSE',
'                SAF.GET_CARDINALIDAD_CUENTA_CONTABLE',
'                (',
'                    A.COD_CTA,',
'                    A.SALDO,',
'                    ''H'',',
'                    2020',
'                )',
'            END',
'        ) SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INTEGRACION_GERENCIAL WHERE COD_CTA LIKE ''21%''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND A.USUARIO_GRABACION = 1',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        CASE WHEN (SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_EGRESO) = 0 THEN',
'            0',
'        ELSE',
'            (',
'                SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_INGRESOS',
'            ) /',
'            (',
'                SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_EGRESO',
'            )',
'        END',
'    , ''999G999G999G999G990D00'') AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(17);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 17;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1123189983564012642)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1123190068774012643)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1123190137768012644)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1123190228290012645)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1123190394341012646)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1123190446462012647)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1123190517330012648)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1145627361330797222)
,p_name=>'Rotacion de Cuentas por Pagar'
,p_region_name=>'PERIODO_DE_PAGO'
,p_parent_plug_id=>wwv_flow_imp.id(1149143594671916103)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>90
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS_SALDO_INICIAL AS ',
'(',
'    SELECT',
'        FNC_CXP_TRANSACCIONES_SUMA_SALDO_INICIAL(:P119_VECTOR_EMPRESAS, :P119_VECTOR_UNIDADES, :P119_FECHA_INICIO, :P119_INTERCOMPANY) AS SALDO',
'    FROM DUAL',
'),',
'DATOS_SALDO_FIN AS ',
'(',
'    SELECT',
'        FNC_CXP_TRANSACCIONES_SUMA_SALDO_FINAL(:P119_VECTOR_EMPRESAS, :P119_VECTOR_UNIDADES, :P119_FECHA_FIN, :P119_INTERCOMPANY) AS SALDO',
'    FROM DUAL',
'),',
'DATOS_TOTAL_PROVEEDORES AS (',
'    SELECT',
'        TREINTA,',
'        SESENTA,',
'        MAXSESENTA',
'    FROM VW_CXP_PERIODO_PAGO_PROVEEDORES A',
'    WHERE A.CODIGO_EMPRESA IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.CODIGO_PROVEEDOR IN',
'    (',
'        SELECT ',
'            DISTINCT CODIGO_PROVEEDOR ',
'        FROM ',
'        (',
'            SELECT',
'        		CODIGO_PROVEEDOR,',
'        		(',
'        			CASE',
'        				WHEN :P119_INTERCOMPANY = ''N'' THEN',
'        					CASE',
'        						WHEN NVL(INTERCOMPANY, ''N'') = ''N'' THEN',
'        							''N''',
'        						ELSE',
'        							NULL',
'        					END',
'        				ELSE',
'        					''N''',
'        			END',
'        		) ESTADO',
'        	FROM SAF.CXP_PROVEEDORES',
'        ) ',
'        WHERE ESTADO IS NOT NULL',
'    )',
'    AND A.FECHA_TRANSACCION BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        CASE WHEN ((SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_INICIAL) + (SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_FIN)) != 0 THEN',
'            (SELECT NVL(SUM(TREINTA + SESENTA + MAXSESENTA), 0) FROM DATOS_TOTAL_PROVEEDORES) / ( ((SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_INICIAL) + (SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_FIN)) / 2 )',
'        ELSE',
'            0',
'        END',
'    , ''999G999G999G999G990D00'') || '' Dias'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(12);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 12;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_INTERCOMPANY,P119_VECTOR_EMPRESAS,P119_VECTOR_UNIDADES,P119_ESTADO'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145627495890797223)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145627519969797224)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145627662634797225)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145627750211797226)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145627824812797227)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145627947155797228)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145628085889797229)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1164556309010161408)
,p_name=>'Cierre mensual'
,p_parent_plug_id=>wwv_flow_imp.id(1149143594671916103)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>100
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS AS',
'(',
'    SELECT',
'    	NVL(SUM(ABS(B.FECHA_CIERRE - A.FECHA_MAXIMA_CIERRE)), 0) AS DIAS',
'    FROM SAF.CON_PARAMETRIZA_CIERRE_MENSUAL A',
'    INNER JOIN SAF.CON_CIERRES_MENSUAL_REAL B ON A.ID = B.ID_CIERRE_MENSUAL',
'    AND B.FECHA_GRABACION = ',
'    (',
'    	SELECT',
'    		MAX(D.FECHA_GRABACION)',
'    	FROM SAF.CON_PARAMETRIZA_CIERRE_MENSUAL C',
'    	INNER JOIN SAF.CON_CIERRES_MENSUAL_REAL D ON C.ID = D.ID_CIERRE_MENSUAL',
'    	WHERE C.ANO = A.ANO',
'    	AND C.MES = A.MES',
'    	AND D.CODIGO_EMPRESA = B.CODIGO_EMPRESA',
'    )',
'    AND B.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.ANO BETWEEN TO_NUMBER(TO_CHAR(TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY''), ''YYYY'')) AND TO_NUMBER(TO_CHAR(TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY''), ''YYYY''))',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        (SELECT SUM(DIAS) FROM DATOS)',
'    , ''999G999G999G999G990D00'') || '' Dias'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(6);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 6;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_INTERCOMPANY,P119_VECTOR_EMPRESAS,P119_VECTOR_UNIDADES,P119_ESTADO'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1164556413933161409)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1164556571300161410)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1164556675652161411)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1164556744796161412)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1164556893732161413)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1164556935060161414)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1164557090062161415)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1149143649890916104)
,p_plug_name=>'Liquidez'
,p_parent_plug_id=>wwv_flow_imp.id(1102790704449595418)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99558760127243721)
,p_plug_display_sequence=>170
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1117601359207033424)
,p_name=>'Capital de trabajo'
,p_parent_plug_id=>wwv_flow_imp.id(1149143649890916104)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>140
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS_INGRESOS AS (',
'    SELECT ',
'    	A.ID,',
'    	(',
'            CASE WHEN A.DEBE != 0 THEN',
'                SAF.GET_CARDINALIDAD_CUENTA_CONTABLE',
'                (',
'                    A.COD_CTA,',
'                    A.SALDO,',
'                    ''D'',',
'                    2020',
'                )',
'            ELSE',
'                SAF.GET_CARDINALIDAD_CUENTA_CONTABLE',
'                (',
'                    A.COD_CTA,',
'                    A.SALDO,',
'                    ''H'',',
'                    2020',
'                )',
'            END',
'        ) AS SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INTEGRACION_GERENCIAL WHERE COD_CTA LIKE ''11%'' AND USUARIO_GRABACION = 1',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND A.USUARIO_GRABACION = 1',
'),',
'DATOS_EGRESO AS (',
'    SELECT ',
'    	A.ID,',
'    	(',
'            CASE WHEN A.DEBE != 0 THEN',
'                SAF.GET_CARDINALIDAD_CUENTA_CONTABLE',
'                (',
'                    A.COD_CTA,',
'                    A.SALDO,',
'                    ''D'',',
'                    2020',
'                )',
'            ELSE',
'                SAF.GET_CARDINALIDAD_CUENTA_CONTABLE',
'                (',
'                    A.COD_CTA,',
'                    A.SALDO,',
'                    ''H'',',
'                    2020',
'                )',
'            END',
'        ) AS SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INTEGRACION_GERENCIAL WHERE COD_CTA LIKE ''21%'' AND USUARIO_GRABACION = 1',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND A.USUARIO_GRABACION = 1',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    ''Q. '' || TO_CHAR',
'    (',
'        (',
'            SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_INGRESOS',
'        ) -',
'        (',
'            SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_EGRESO',
'        )',
'    , ''999G999G999G999G990D00'') AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(8);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 8;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117601460495033425)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117601517420033426)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117601600946033427)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117601789688033428)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117601887488033429)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117601959783033430)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1117602066370033431)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1149143791121916105)
,p_plug_name=>'Operativo'
,p_parent_plug_id=>wwv_flow_imp.id(1102790704449595418)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99558760127243721)
,p_plug_display_sequence=>180
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1141793199471308019)
,p_name=>'Antiguedad promedio de la deuda/ periodo de pago pactado'
,p_parent_plug_id=>wwv_flow_imp.id(1149143791121916105)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>180
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        (',
'            select  NVL(sum(b.fecha_cobro - a.fecha_transaccion), 0)',
'            from cxc_transacciones a, cxc_desglose b',
'            where a.codigo_empresa = b.codigo_empresa',
'            and a.tipo_transaccion = b.tipo_transaccion',
'            and a.id_transaccion = b.id_transaccion',
'            AND A.CODIGO_PROYECTO IS NOT NULL',
'            and codigo_estatus = 1',
'            AND A.CODIGO_EMPRESA IN',
'            (',
'                SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'            )',
'            AND A.FECHA_TRANSACCION BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'        )',
'    , ''999G999G999G999G990D00'') || '' Dias'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(14);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 14;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_FECHA_INICIO,P119_FECHA_FIN'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1141793233712308020)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1141793305912308021)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1141793421224308022)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1141793509043308023)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1141793662642308024)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1141793786952308025)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1141793840720308026)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1147173495881879017)
,p_name=>'Plazo Promedio de Cobranza'
,p_parent_plug_id=>wwv_flow_imp.id(1149143791121916105)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>170
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DIAS AS ',
'(',
'',
'    SELECT sum( CD.FECHA_COBRO - EEE.FECHA_ENTREGA) DIAS',
'FROM EST_ENC_ESTIMACIONES EEE, CXC_TRANSACCIONES_ESTIMACION T,CXC_DESGLOSE CD, GRAL_FORMAS_PAGO fp',
'where  EEE.codigo_empresa = t.codigo_empresa',
'and EEE.codigo_proyecto = t.codigo_proyecto',
'and EEE.numero_estimacion = t.numero_estimacion',
'and t.id_transaccion = cd.id_transaccion',
'AND T.CODIGO_PROYECTO IS NOT NULL',
'and cd.codigo_forma_pago = fp.codigo_forma_pago',
'   ',
'    AND EEE.CODIGO_EMPRESA IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND EEE.FECHA_ENTREGA BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        NVL((SELECT SUM(DIAS) FROM DIAS), 0)',
'    , ''999G999G999G999G990D00'') || '' Dias'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(15);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 15;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_INTERCOMPANY'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1147173507372879018)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1147173608272879019)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1147173761294879020)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1147173891497879021)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1147173935783879022)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1147174096597879023)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1147174138756879024)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1149145214485916120)
,p_name=>'Tiempos de aprobacion de pagos'
,p_parent_plug_id=>wwv_flow_imp.id(1149143791121916105)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>150
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DIAS AS ',
'(',
'    SELECT ',
'    	AVG(C.FECHA_RELACION - A.FECHA_TRANSACCION) AS DIAS',
'    FROM SAF.CXP_TRANSACCIONES A',
'    INNER JOIN SAF.CXP_ENC_OC B',
'    	ON A.CODIGO_EMPRESA = B.CODIGO_EMPRESA ',
'    	AND A.CODIGO_PROVEEDOR = B.CODIGO_PROVEEDOR',
'    	AND A.NUMERO_OC = B.NUMERO_OC',
'    INNER JOIN SAF.CXP_RELACION_DOCUMENTOS C',
'    	ON A.CODIGO_EMPRESA = C.CODIGO_EMPRESA',
'    	AND A.CODIGO_PROVEEDOR = C.CODIGO_PROVEEDOR',
'    	AND A.TIPO_TRANSACCION = C.TIPO_TRANSACCION_CARGO',
'    	AND A.SERIE_DOCUMENTO = C.SERIE_DOCUMENTO_CARGO ',
'    	AND A.NUMERO_DOCUMENTO = C.NUMERO_DOCUMENTO_CARGO',
'    WHERE A.NO_CONTRASENA IS NOT NULL ',
'    AND A.NO_CONTRASENA > 0',
'    AND C.TIPO_TRANSACCION_ABONO = 44',
'    AND A.CODIGO_EMPRESA IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.CODIGO_PROVEEDOR IN',
'    (',
'        SELECT ',
'            DISTINCT CODIGO_PROVEEDOR ',
'        FROM ',
'        (',
'            SELECT',
'        		CODIGO_PROVEEDOR,',
'        		(',
'        			CASE',
'        				WHEN :P119_INTERCOMPANY = ''N'' THEN',
'        					CASE',
'        						WHEN NVL(INTERCOMPANY, ''N'') = ''N'' THEN',
'        							''N''',
'        						ELSE',
'        							NULL',
'        					END',
'        				ELSE',
'        					''N''',
'        			END',
'        		) ESTADO',
'        	FROM SAF.CXP_PROVEEDORES',
'        ) ',
'        WHERE ESTADO IS NOT NULL',
'    )',
'    AND A.FECHA_TRANSACCION BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        NVL((SELECT SUM(DIAS) FROM DIAS), 0)',
'    , ''999G999G999G999G990D00'') || '' Dias'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(13);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 13;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_INTERCOMPANY'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149145326628916121)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149145453154916122)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149145523135916123)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149145663744916124)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149145764856916125)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149145803182916126)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149145967304916127)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1149147730954916145)
,p_name=>'Cumplimiento al Plan de Pagos'
,p_parent_plug_id=>wwv_flow_imp.id(1149143791121916105)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>160
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH PAGOS AS ',
'(',
'    SELECT',
'    	(',
'    		CASE',
'    			WHEN A.CODIGO_MONEDA = 1 THEN',
'    				A.TREINTA + A.SESENTA + A.MAXSESENTA',
'    			ELSE',
'    				(A.TREINTA + A.SESENTA + A.MAXSESENTA) / A.TIPO_CAMBIO_TRS',
'    		END',
'    	) AS MONTO_PAGOS_PLANEADOS,',
'    	(',
'    		CASE',
'    			WHEN A.CODIGO_MONEDA = 1 THEN',
'    				NVL(A.MONTO_APLICADO_QTZ, 0)',
'    			ELSE',
'    				NVL(A.MONTO_APLICADO_USD, 0) / A.TIPO_CAMBIO_TRS',
'    		END',
'    	) AS MONTO_REAL_PAGADO',
'    FROM SAF.FLUJO_CXP_ANTIGUEDAD A',
'    WHERE (NVL(A.TREINTA, 0) + NVL(A.SESENTA, 0) + NVL(A.MAXSESENTA, 0)) >= 1',
'    AND A.CODIGO_EMPRESA IN',
'    (',
'    	SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'    	SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.CODIGO_PROVEEDOR IN',
'    (',
'    	SELECT ',
'            DISTINCT CODIGO_PROVEEDOR ',
'        FROM ',
'        (',
'            SELECT',
'        		CODIGO_PROVEEDOR,',
'        		(',
'        			CASE',
'        				WHEN :P119_INTERCOMPANY = ''N'' THEN',
'        					CASE',
'        						WHEN NVL(INTERCOMPANY, ''N'') = ''N'' THEN',
'        							''N''',
'        						ELSE',
'        							NULL',
'        					END',
'        				ELSE',
'        					''N''',
'        			END',
'        		) ESTADO',
'        	FROM SAF.CXP_PROVEEDORES',
'        ) ',
'        WHERE ESTADO IS NOT NULL',
'    )',
'    AND A.FECHA_TRANSACCION BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        CASE WHEN (SELECT NVL(SUM(MONTO_PAGOS_PLANEADOS), 0) FROM PAGOS) != 0 THEN',
'            100 * (SELECT NVL(SUM(MONTO_REAL_PAGADO), 0) FROM PAGOS) / (SELECT NVL(SUM(MONTO_PAGOS_PLANEADOS), 0) FROM PAGOS)',
'        ELSE',
'            0',
'        END',
'    , ''999G999G999G999G990D00'') || '' %'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(18);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 18;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_INTERCOMPANY'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149147881973916146)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149147974533916147)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149148032015916148)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149148111175916149)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1149148288366916150)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1164555637667161401)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1164555785631161402)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1167078498469101748)
,p_name=>'Conciliaciones bancarias'
,p_region_name=>'CONCILACION_BANCARARIA'
,p_parent_plug_id=>wwv_flow_imp.id(1149143791121916105)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>190
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        (',
'            SELECT ',
'            	COUNT(*)',
'            FROM SAF.BCOMOVIG',
'            WHERE FPAGADO IS NOT NULL',
'            AND CODIGO_EMPRESA IN',
'            (',
'            	SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'            )',
'            AND FPAGADO BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'        )',
'    , ''999G999G999G999G990'') AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(7);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 7;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_FECHA_INICIO,P119_FECHA_FIN'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1167078552660101749)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1167078688363101750)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168425633565347901)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168425769506347902)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168425868992347903)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168425936347347904)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1168426018175347905)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1149143814796916106)
,p_plug_name=>'Tactico'
,p_parent_plug_id=>wwv_flow_imp.id(1102790704449595418)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99558760127243721)
,p_plug_display_sequence=>190
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1107109330423142622)
,p_name=>'Margen Bruto'
,p_parent_plug_id=>wwv_flow_imp.id(1149143814796916106)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>120
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*WITH DATOS_INGRESOS AS (',
'    SELECT ',
'    	DISTINCT A.ID,',
'    	''I-'' || B.COD_CTA AS CODIGO_PADRE,',
'    	A.NOMBRE_GASTO AS NOMBRE_GASTO,',
'    	(',
'            CASE',
'                WHEN :P124_TIPO_INDICADOR = 8 THEN',
'                    A.SALDO',
'                ELSE',
'                    A.SALDO * -1',
'            END',
'        ) AS SALDO,',
'    	A.MES',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO',
'    WHERE B.ID_INDICADOR = 4',
'    AND A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND TRUNC(A.FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND B.FUNCION = ''+''',
'),',
'DATOS_EGRESO AS (',
'    SELECT ',
'    	DISTINCT A.ID,',
'    	''E-'' || B.COD_CTA AS CODIGO_PADRE,',
'    	A.NOMBRE_GASTO AS NOMBRE_GASTO,',
'    	A.SALDO,',
'    	A.MES',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO',
'    WHERE B.ID_INDICADOR = 4 ',
'    AND A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND TRUNC(A.FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND B.FUNCION = ''-''',
')*/',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    ''Q. '' || TO_CHAR',
'    (',
'        /*(',
'            SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_INGRESOS',
'        ) -',
'        (',
'            SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_EGRESO',
'        )*/',
'        SAF.GET_INDICADOR_GERENCIAL_OPERACION_RESTA',
'        (',
'            SUBSTR(:P119_VECTOR_EMPRESAS,2,LENGTH(:P119_VECTOR_EMPRESAS)-2),',
'            SUBSTR(:P119_VECTOR_UNIDADES,2,LENGTH(:P119_VECTOR_UNIDADES)-2),',
'            TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY''),',
'            TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY''),',
'            ID',
'        )',
'    , ''999G999G999G999G990D00'') AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(4);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 4;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_VECTOR_EMPRESAS,P119_VECTOR_UNIDADES'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107109407487142623)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107109594745142624)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107109677010142625)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107109727066142626)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107109872360142627)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107109977788142628)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107110044700142629)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1107110824714142637)
,p_name=>'Margen Bruto %'
,p_parent_plug_id=>wwv_flow_imp.id(1149143814796916106)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>130
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS_INGRESOS AS (',
'    SELECT ',
'    	A.ID,',
'    	A.SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND A.USUARIO_GRABACION = 1',
'    AND B.ID_INDICADOR = 3',
'    AND B.FUNCION = ''+''',
'),',
'DATOS_EGRESO AS (',
'    SELECT ',
'    	A.ID,',
'    	A.SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    INNER JOIN SAF.CON_INDICADORES_FORMULAS B ON A.COD_CTA = B.COD_CTA AND A.CODIGO_GASTO = B.CODIGO_GASTO',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
'    AND A.USUARIO_GRABACION = 1',
'    AND B.ID_INDICADOR = 3',
'    AND B.FUNCION = ''-''',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        (',
'            CASE WHEN (SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_INGRESOS) = 0 THEN',
'                0',
'            ELSE',
'                ((SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_INGRESOS) - (SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_EGRESO)) / (SELECT NVL(ABS(SUM(SALDO)), 0) FROM DATOS_INGRESOS)',
'            END',
'        ) * 100',
'    , ''999G999G999G999G990D00'') || '' %'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(3);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 3;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107110918967142638)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107111050373142639)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107111119203142640)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107111262308142641)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107111355126142642)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107111472358142643)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1107111577727142644)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1145625963662797208)
,p_name=>'Periodos de cobro'
,p_parent_plug_id=>wwv_flow_imp.id(1149143814796916106)
,p_template=>wwv_flow_imp.id(99575797075243864)
,p_display_sequence=>110
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS_SALDO_INICIAL AS ',
'(',
'    SELECT',
'        APX_FNC_POLIZAS_SUMA_SALDO_INICIAL(:P119_VECTOR_EMPRESAS, :P119_VECTOR_UNIDADES, :P119_FECHA_INICIO) AS SALDO',
'    FROM DUAL',
'),',
'DATOS_SALDO_FIN AS ',
'(',
'    SELECT',
'        APX_FNC_POLIZAS_SUMA_SALDO_FINAL(:P119_VECTOR_EMPRESAS, :P119_VECTOR_UNIDADES, :P119_FECHA_FIN) AS SALDO',
'    FROM DUAL',
'),',
'DATOS_VENTAS AS (',
'    SELECT ',
'    	A.ID,',
'    	(A.SALDO * -1) AS SALDO',
'    FROM SAF.CON_INTEGRACION_GERENCIAL A',
'    WHERE A.CODIGO_EMPRESA IN ',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'    )',
'    AND A.CODIGO_DIVISION IN',
'    (',
'        SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD''',
'    )',
'    AND A.COD_CTA IN',
'    (',
'    	SELECT DISTINCT COD_CTA FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 9 AND FUNCION = ''/''',
'    )',
'    AND A.CODIGO_GASTO IN',
'    (',
'        SELECT DISTINCT CODIGO_GASTO FROM SAF.CON_INDICADORES_FORMULAS WHERE ID_INDICADOR = 9 AND FUNCION = ''/''',
'    )',
'    AND TRUNC(FECHA_POLIZA) BETWEEN TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'') AND TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')',
')',
'SELECT',
'    INDICADOR AS CARD_TITLE,',
'    TO_CHAR',
'    (',
'        CASE WHEN (SELECT NVL(SUM(SALDO), 0) FROM DATOS_VENTAS) = 0 THEN',
'            0',
'        ELSE',
'            365 * (((SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_INICIAL) + (SELECT NVL(SUM(SALDO), 0) FROM DATOS_SALDO_FIN)) / 2) / ((SELECT NVL(SUM(SALDO), 0) FROM DATOS_VENTAS) * 1.12)',
'        END',
'    , ''999G999G999G999G990D00'') || '' Dias'' AS CARD_SUBTITLE,',
'    NULL AS CARD_INITIALS,',
'    TIPO AS CARD_TEXT,',
'    ''U-COLOR-1'' CARD_COLOR,',
'    NULL AS CARD_SUBTEXT,',
'    APEX_UTIL.PREPARE_URL(p_url => ''javascript:detalleIndicador(16);'') AS CARD_LINK',
'FROM DUAL, SAF.CON_INDICADORES',
'WHERE ID = 16;'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P119_CODIGO_EMPRESA,P119_CODIGO_UNIDAD,P119_FECHA_INICIO,P119_FECHA_FIN,P119_VECTOR_EMPRESAS,P119_VECTOR_UNIDADES'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(99606046125243943)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145626078615797209)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h2 style="text-align:center"> #CARD_TITLE#  </h2>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145626112177797210)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<h1 style="text-align:center"> #CARD_SUBTITLE#  </h1>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145626265527797211)
,p_query_column_id=>3
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145626344563797212)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145626453350797213)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145626524922797214)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1145626691188797215)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1101489052174567944)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_button_name=>'BUSCAR_DATOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Actualizar'
,p_button_position=>'TOP'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-retweet'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1101488387357567937)
,p_name=>'P119_CODIGO_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_prompt=>'Empresa'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	A.CODIGO_EMPRESA || '' '' || B.NOMBRE_PERSONA,',
'    A.CODIGO_EMPRESA',
'FROM SAF.GRAL_EMPRESAS A',
'INNER JOIN SAF.GRAL_PERSONAS_TABLE B ON B.CODIGO_PERSONA = A.CODIGO_PERSONA',
'WHERE A.CODIGO_EMPRESA > 99',
'AND A.TIPO_EMPRESA = ''FIN''',
'ORDER BY CODIGO_EMPRESA ASC;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Todas las empresas'
,p_lov_null_value=>'TODAS_LAS_EMPRESAS'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'null'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_attribute_11=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1101488433858567938)
,p_name=>'P119_CODIGO_UNIDAD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_prompt=>'Unidad de Negocio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    DISTINCT',
'    CODIGO_DIVISION || '' '' || DESCRIPCION,',
'    CODIGO_DIVISION',
'FROM',
'(',
'SELECT',
'    DISTINCT',
'	A.CODIGO_EMPRESA,',
'	A.CODIGO_DIVISION,',
'	B.DESCRIPCION,',
'	(',
'		CASE WHEN',
'			(',
'				SELECT COUNT(*) FROM',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) AS CODIGO_EMPRESA',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) IS NOT NULL',
'                )',
'				WHERE CODIGO_EMPRESA = ''TODAS_LAS_EMPRESAS''',
'			) > 0 THEN',
'			''A''',
'        ELSE',
'            CASE WHEN',
'                (',
'    				SELECT COUNT(*) FROM',
'                    (',
'                        SELECT ',
'                            REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) AS CODIGO_EMPRESA',
'                        FROM ',
'                            dual CONNECT BY REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) IS NOT NULL',
'                    )',
'    				WHERE A.CODIGO_EMPRESA = TO_NUMBER(CODIGO_EMPRESA)',
'    			) > 0 THEN',
'                ''A''',
'            ELSE',
'                NULL',
'            END',
'		END',
'	) AS ESTADO_DATO',
'FROM SAF.GRAL_EMPRESAS_DIVISION A',
'INNER JOIN SAF.GRAL_DIVISIONES B ON B.CODIGO_DIVISION = A.CODIGO_DIVISION',
') WHERE ESTADO_DATO IS NOT NULL'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Todas las unidades'
,p_lov_null_value=>'TODAS_LAS_UNIDADES'
,p_lov_cascade_parent_items=>'P119_CODIGO_EMPRESA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_attribute_11=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1101488804611567942)
,p_name=>'P119_FECHA_INICIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_DATE_PICKER_JET'
,p_cSize=>200
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'STATIC'
,p_attribute_04=>'2020-01-02'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1101488964674567943)
,p_name=>'P119_FECHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_DATE_PICKER_JET'
,p_cSize=>200
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'ITEM'
,p_attribute_05=>'P119_FECHA_INICIO'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1107110540496142634)
,p_name=>'P119_TIPO_INDICADOR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1145628232040797231)
,p_name=>'P119_VECTOR_EMPRESAS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1145628331686797232)
,p_name=>'P119_VECTOR_UNIDADES'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1145628985591797238)
,p_name=>'P119_INTERCOMPANY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_item_default=>'N'
,p_prompt=>'Intercompany'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Si;Y,No;N'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1145629857220797247)
,p_name=>'P119_ESTADO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1101487114631567925)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1103093012273247525)
,p_name=>'LIMPIAR_DATOS'
,p_event_sequence=>5
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1107107245589142601)
,p_event_id=>wwv_flow_imp.id(1103093012273247525)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_CODIGO_EMPRESA,P119_TIPO_INDICADOR,P119_VECTOR_UNIDADES,P119_VECTOR_EMPRESAS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1103093186524247526)
,p_event_id=>wwv_flow_imp.id(1103093012273247525)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_FECHA_INICIO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'TRUNC(SYSDATE, ''YEAR'')'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1106545000755689449)
,p_event_id=>wwv_flow_imp.id(1103093012273247525)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_FECHA_FIN'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'SYSDATE'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1106545118627689450)
,p_event_id=>wwv_flow_imp.id(1103093012273247525)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_CODIGO_EMPRESA'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'TODAS_LAS_EMPRESAS'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1107107323624142602)
,p_event_id=>wwv_flow_imp.id(1103093012273247525)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_CODIGO_UNIDAD'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'TODAS_LAS_UNIDADES'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1145629105831797240)
,p_event_id=>wwv_flow_imp.id(1103093012273247525)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_INTERCOMPANY,P119_ESTADO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1101489686720567950)
,p_name=>'CARGAR_DATOS'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1102789085588595401)
,p_event_id=>wwv_flow_imp.id(1101489686720567950)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1102790704449595418)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1102790592118595416)
,p_name=>'LIMPIAR_UNIDADES'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P119_CODIGO_EMPRESA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1102790625212595417)
,p_event_id=>wwv_flow_imp.id(1102790592118595416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_CODIGO_UNIDAD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1102791520288595426)
,p_name=>'BUSCAR_DATOS'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1101489052174567944)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').getValue() != '''' &&',
'apex.item(''P119_CODIGO_UNIDAD'').getValue() != '''' &&',
'apex.item(''P119_FECHA_INICIO'').getValue() != '''' &&',
'apex.item(''P119_FECHA_FIN'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(264848209597554529)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'SPLITTER'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    $wP = apex.widget.waitPopup();',
'}, 10);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1102791753550595428)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1106543882079689437)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_EMPRESA NUMBER := 0;',
'BEGIN',
'    APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_EMPRESA'');',
'',
'    SELECT COUNT(*) INTO V_EMPRESA FROM ',
'    (',
'        SELECT ',
'            REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) AS CODIGO_EMPRESA',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) IS NOT NULL',
'    ) WHERE CODIGO_EMPRESA = ''TODAS_LAS_EMPRESAS'';',
'',
'    IF V_EMPRESA > 0 THEN',
'        DECLARE',
'            CURSOR C_EMPRESA IS',
'                SELECT',
'                    A.CODIGO_EMPRESA',
'                FROM SAF.GRAL_EMPRESAS A',
'                WHERE A.CODIGO_EMPRESA > 99',
'                AND A.TIPO_EMPRESA = ''FIN'';',
'        BEGIN',
'            FOR R_EMPRESA IN C_EMPRESA',
'            LOOP',
'                APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''COLLECTION_EMPRESA'',',
'                    p_c001 => R_EMPRESA.CODIGO_EMPRESA',
'                );',
'            END LOOP;',
'        END;',
'    ELSE',
'        DECLARE',
'            CURSOR C_EMPRESA IS',
'                SELECT ',
'                    REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) AS CODIGO_EMPRESA',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) IS NOT NULL;',
'        BEGIN',
'            FOR R_EMPRESA IN C_EMPRESA',
'            LOOP',
'                APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''COLLECTION_EMPRESA'',',
'                    p_c001 => R_EMPRESA.CODIGO_EMPRESA',
'                );',
'            END LOOP;',
'        END;',
'    END IF;',
'END;'))
,p_attribute_02=>'P119_CODIGO_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1145628438988797233)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_VECTOR_EMPRESAS'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            C001 AS DATO',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA'';',
'',
'    V_VECTOR VARCHAR2(32767) := NULL;',
'BEGIN',
'    V_VECTOR := ''['';',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        V_VECTOR := V_VECTOR || R_DATOS.DATO || ''|'';',
'    END LOOP;',
'    V_VECTOR := V_VECTOR || '']'';',
'    V_VECTOR := REPLACE(V_VECTOR,''|]'','']'');',
'    ',
'    RETURN V_VECTOR;',
'END;'))
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1106544082038689439)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_UNIDAD NUMBER := 0;',
'BEGIN',
'    APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_UNIDAD'');',
'',
'    SELECT COUNT(*) INTO V_UNIDAD FROM ',
'    (',
'        SELECT ',
'            REGEXP_SUBSTR(:P119_CODIGO_UNIDAD, ''[^\,]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P119_CODIGO_UNIDAD, ''[^\,]+'', 1, level) IS NOT NULL',
'    ) WHERE CODIGO_DIVISION = ''TODAS_LAS_UNIDADES'';',
'',
'    IF V_UNIDAD > 0 THEN',
'        DECLARE',
'            CURSOR C_EMPRESA IS',
'                SELECT',
'                    A.CODIGO_DIVISION',
'                FROM SAF.GRAL_EMPRESAS_DIVISION A',
'                WHERE A.CODIGO_EMPRESA IN',
'                (',
'                    SELECT C001 FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'                );',
'        BEGIN',
'            FOR R_UNIDAD IN C_EMPRESA',
'            LOOP',
'                APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''COLLECTION_UNIDAD'',',
'                    p_c001 => R_UNIDAD.CODIGO_DIVISION',
'                );',
'            END LOOP;',
'        END;',
'    ELSE',
'        DECLARE',
'            CURSOR C_UNIDAD IS',
'                SELECT ',
'                    REGEXP_SUBSTR(:P119_CODIGO_UNIDAD, ''[^\,]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P119_CODIGO_UNIDAD, ''[^\,]+'', 1, level) IS NOT NULL;',
'        BEGIN',
'            FOR R_UNIDAD IN C_UNIDAD',
'            LOOP',
'                APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''COLLECTION_UNIDAD'',',
'                    p_c001 => R_UNIDAD.CODIGO_DIVISION',
'                );',
'            END LOOP;',
'        END;',
'    END IF;',
'END;'))
,p_attribute_02=>'P119_CODIGO_UNIDAD'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1145628570455797234)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_VECTOR_UNIDADES'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            C001 AS DATO',
'        FROM APEX_COLLECTIONS ',
'        WHERE COLLECTION_NAME = ''COLLECTION_UNIDAD'';',
'',
'    V_VECTOR VARCHAR2(32767) := NULL;',
'BEGIN',
'    V_VECTOR := ''['';',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        V_VECTOR := V_VECTOR || R_DATOS.DATO || ''|'';',
'    END LOOP;',
'    V_VECTOR := V_VECTOR || '']'';',
'    V_VECTOR := REPLACE(V_VECTOR,''|]'','']'');',
'    ',
'    RETURN V_VECTOR;',
'END;'))
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(264848491541554531)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_INTEGRACION_GERENCIAL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_LIBROS VARCHAR2(255) := NULL;',
'    V_EMPRESA NUMBER := 0;',
'    LIBRO_INICIO NUMBER := TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P119_FECHA_INICIO, ''DD/MM/YYYY'')));',
'    LIBRO_FIN NUMBER := TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY'')));',
'BEGIN',
'    SELECT COUNT(*) INTO V_EMPRESA FROM ',
'    (',
'        SELECT ',
'            REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) AS CODIGO_EMPRESA',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P119_CODIGO_EMPRESA, ''[^\,]+'', 1, level) IS NOT NULL',
'    ) WHERE CODIGO_EMPRESA = ''TODAS_LAS_EMPRESAS'';',
'',
'    SELECT',
'    	LISTAGG(LIBRO, '','') WITHIN GROUP (ORDER BY LIBRO) INTO V_LIBROS',
'    FROM SAF.CON_LIBROS;',
'',
'    PR_ACTUALIZA_INFO_INTEGRACION_GERENCIAL',
'    (',
'        PEmpresa => ',
'            (',
'                CASE WHEN V_EMPRESA > 0 THEN',
'                    NULL',
'                ELSE',
'                    REPLACE(REPLACE(REPLACE(:P119_VECTOR_EMPRESAS, ''['',''''), '']'', ''''), ''|'', '','')',
'                END',
'            ),',
'        PCentro_costo => NULL,',
'        PEjercicio => TO_NUMBER(EXTRACT(YEAR FROM TO_DATE(:P119_FECHA_FIN, ''DD/MM/YYYY''))),',
'        PFechaDesde => :P119_FECHA_INICIO,',
'        PFechaHasta => :P119_FECHA_FIN,',
'        PLibro => V_LIBROS,',
'        PTipoReporte => ''Financiero'',',
'        PDivision => REPLACE(REPLACE(REPLACE(:P119_VECTOR_UNIDADES, ''['',''''), '']'', ''''), ''|'', '',''),',
'        PCuenta => NULL,',
'        P_Usuario => 1',
'    );',
'    ',
'    EXCEPTION ',
'        WHEN no_data_found THEN',
'            NULL;',
'END;'))
,p_attribute_02=>'P119_CODIGO_EMPRESA,P141_FECHA_FIN,P119_FECHA_INICIO,P119_FECHA_FIN,P119_VECTOR_UNIDADES,P119_VECTOR_EMPRESAS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1102791652845595427)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1102790704449595418)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1102791868066595429)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1102790857928595419)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1107110153797142630)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1107107794441142606)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1107110294637142631)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1107109330423142622)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1107111676323142645)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1107110824714142637)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1117601056118033421)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1117600271262033413)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1117602170443033432)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1117601359207033424)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1123186012313012603)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1120138633650998645)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1123190675224012649)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1123189831376012641)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1145626771595797216)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1145625963662797208)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1145628130298797230)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>180
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1145627361330797222)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1149145048196916118)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>190
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1149144290637916110)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1149146026209916128)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>200
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1149145214485916120)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1164555897012161403)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>210
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1149147730954916145)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1164556284361161407)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>220
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1147173495881879017)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1164557182109161416)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>230
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1164556309010161408)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1164560471473161449)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>240
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1141793199471308019)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168426126348347906)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>250
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1167078498469101748)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60020577013475211)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>260
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_PROYECTOS IS',
'        SELECT ',
'            DISTINCT CODIGO_PROYECTO ',
'        FROM SAF.EST_PROYECTOS WHERE CODIGO_PROYECTO IS NOT NULL',
'        AND CODIGO_EMPRESA IN',
'        (',
'            SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'        );',
'    ',
'    CURSOR C_FECHA_INICIO IS',
'        SELECT',
'        	CODIGO_PROYECTO,',
'        	MIN(FECHA) AS FECHA',
'        FROM SAF.VW_CON_INICIO_EFECTIVO_PROYECTO_EMPRESA',
'        WHERE CODIGO_EMPRESA IN',
'        (',
'        	SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'        )',
'        AND CODIGO_PROYECTO IN ',
'        (',
'            SELECT ',
'                DISTINCT CODIGO_PROYECTO ',
'            FROM SAF.EST_PROYECTOS WHERE CODIGO_PROYECTO IS NOT NULL',
'            AND CODIGO_EMPRESA IN',
'            (',
'                SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'            )',
'        )',
'        GROUP BY CODIGO_PROYECTO;',
'    ',
'    CURSOR C_FECHA_FIN IS',
'        SELECT',
'        	B.CODIGO_PROYECTO,',
'        	NVL(MAX(A.FECHA_GRABACION), SYSDATE) AS FECHA',
'        FROM SAF.CXC_DESGLOSE A',
'        INNER JOIN SAF.CXC_TRANSACCIONES B ON B.ID_TRANSACCION = A.ID_TRANSACCION AND B.CODIGO_PROYECTO IS NOT NULL',
'        WHERE B.CODIGO_PROYECTO IN',
'        (',
'        	SELECT ',
'                DISTINCT CODIGO_PROYECTO ',
'            FROM SAF.EST_PROYECTOS WHERE CODIGO_PROYECTO IS NOT NULL',
'            AND CODIGO_EMPRESA IN',
'            (',
'                SELECT TO_NUMBER(C001) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_EMPRESA''',
'            )',
'        )',
'        GROUP BY B.CODIGO_PROYECTO;',
'BEGIN',
'    APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_CICLO_PERIODO'');',
'',
'    FOR R_PROYECTOS IN C_PROYECTOS',
'    LOOP',
'        APEX_COLLECTION.ADD_MEMBER(',
'        p_collection_name => ''COLLECTION_CICLO_PERIODO'',',
'            p_c001 => R_PROYECTOS.CODIGO_PROYECTO',
'        );',
'    END LOOP;',
'',
'    FOR R_FECHA IN C_FECHA_INICIO',
'    LOOP',
'        DECLARE',
'            CURSOR C_DATO IS',
'                SELECT',
'                    SEQ_ID',
'                FROM APEX_COLLECTIONS',
'                WHERE COLLECTION_NAME = ''COLLECTION_CICLO_PERIODO''',
'                AND C001 = R_FECHA.CODIGO_PROYECTO;',
'        BEGIN',
'            FOR R_DATO IN C_DATO',
'            LOOP',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_CICLO_PERIODO'',',
'                    p_seq => R_DATO.SEQ_ID,',
'                    p_attr_number => 2,',
'                    p_attr_value  => ',
'                    (',
'                        TO_DATE(TO_CHAR(R_FECHA.FECHA, ''DD'') || ''/'' || TO_CHAR(R_FECHA.FECHA, ''MM'') || ''/20'' || TO_CHAR(R_FECHA.FECHA, ''YY''), ''DD/MM/YYYY'')',
'                    )',
'                );',
'            END LOOP;',
'        END;',
'    END LOOP;',
'',
'    FOR R_FECHA IN C_FECHA_FIN',
'    LOOP',
'        DECLARE',
'            CURSOR C_DATO IS',
'                SELECT',
'                    SEQ_ID',
'                FROM APEX_COLLECTIONS',
'                WHERE COLLECTION_NAME = ''COLLECTION_CICLO_PERIODO''',
'                AND C001 = R_FECHA.CODIGO_PROYECTO',
'                AND C002 IS NOT NULL;',
'        BEGIN',
'            FOR R_DATO IN C_DATO',
'            LOOP',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_CICLO_PERIODO'',',
'                    p_seq => R_DATO.SEQ_ID,',
'                    p_attr_number => 3,',
'                    p_attr_value  => NVL(R_FECHA.FECHA, SYSDATE)',
'                );',
'            END LOOP;',
'        END;',
'    END LOOP;',
'END;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168427234992347917)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>270
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1168426430983347909)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1145630030215797249)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>280
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_ESTADO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(264848316309554530)
,p_event_id=>wwv_flow_imp.id(1102791520288595426)
,p_event_result=>'TRUE'
,p_action_sequence=>290
,p_execute_on_page_init=>'N'
,p_name=>'SPLITTER'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    $wP.remove()',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1107110656923142635)
,p_name=>'MODAL_DETALLE_INDICADOR'
,p_event_sequence=>70
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLE_INDICADOR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1107110713483142636)
,p_event_id=>wwv_flow_imp.id(1107110656923142635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let unidades = apex.item("P119_CODIGO_UNIDAD").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:124:&APP_SESSION.::NO:124:P124_FECHA_FIN,P124_FECHA_INICIO,P124_EMPRESA,P124_UNIDAD,P124_TIPO_INDICADOR:${fin},${inicio},[${empresas}],[${unidades}],${indicador}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168427394746347918)
,p_event_id=>wwv_flow_imp.id(1107110656923142635)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1117601158085033422)
,p_name=>'MODAL_DETALLE_INDICADOR_5'
,p_event_sequence=>80
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLE_INDICADOR_5'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1117601231095033423)
,p_event_id=>wwv_flow_imp.id(1117601158085033422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let unidades = apex.item("P119_CODIGO_UNIDAD").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:131:&APP_SESSION.::NO:131:P131_FECHA_FIN,P131_FECHA_INICIO,P131_EMPRESA,P131_UNIDAD,P131_TIPO_INDICADOR:${fin},${inicio},[${empresas}],[${unidades}],${indicador}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168427444358347919)
,p_event_id=>wwv_flow_imp.id(1117601158085033422)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1123186703850012610)
,p_name=>'MODAL_DETALLE_INDICADOR_9'
,p_event_sequence=>90
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLE_INDICADOR_9'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1123186806252012611)
,p_event_id=>wwv_flow_imp.id(1123186703850012610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let unidades = apex.item("P119_CODIGO_UNIDAD").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:127:&APP_SESSION.::NO:127:P127_FECHA_FIN,P127_FECHA_INICIO,P127_EMPRESA,P127_UNIDAD,P127_TIPO_INDICADOR:${fin},${inicio},[${empresas}],[${unidades}],${indicador}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168427505625347920)
,p_event_id=>wwv_flow_imp.id(1123186703850012610)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1149143999333916107)
,p_name=>'MODAL_DETALLE_ROTACION_CUENTA_PAGAR'
,p_event_sequence=>110
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLE_ROTACION_CUENTA_PAGAR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1149144088595916108)
,p_event_id=>wwv_flow_imp.id(1149143999333916107)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let unidades = apex.item("P119_CODIGO_UNIDAD").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'let intercompany = apex.item(''P119_INTERCOMPANY'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:133:&APP_SESSION.::NO:133:P133_FECHA_FIN,P133_FECHA_INICIO,P133_EMPRESA,P133_UNIDAD,P133_TIPO_INDICADOR,P133_INTERCOMPANY:${fin},${inicio},[${empresas}],[${unidades}],${indicador},${intercompany}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168427695245347921)
,p_event_id=>wwv_flow_imp.id(1149143999333916107)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1149146230428916130)
,p_name=>'MODAL_DETALLES_TIEMPOS_AP_PAGOS'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLES_TIEMPOS_AP_PAGOS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1149146349146916131)
,p_event_id=>wwv_flow_imp.id(1149146230428916130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let unidades = apex.item("P119_CODIGO_UNIDAD").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'let intercompany = apex.item(''P119_INTERCOMPANY'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:132:&APP_SESSION.::NO:132:P132_FECHA_FIN,P132_FECHA_INICIO,P132_EMPRESA,P132_UNIDAD,P132_TIPO_INDICADOR,P132_INTERCOMPANY:${fin},${inicio},[${empresas}],[${unidades}],${indicador},${intercompany}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168427752777347922)
,p_event_id=>wwv_flow_imp.id(1149146230428916130)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1164556086746161405)
,p_name=>'MODAL_DETALLES_CUMPLIMIENTO_PAGO'
,p_event_sequence=>130
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLES_CUMPLIMIENTO_PAGO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1164556193327161406)
,p_event_id=>wwv_flow_imp.id(1164556086746161405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let unidades = apex.item("P119_CODIGO_UNIDAD").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'let intercompany = apex.item(''P119_INTERCOMPANY'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:137:&APP_SESSION.::NO:137:P137_FECHA_FIN,P137_FECHA_INICIO,P137_EMPRESA,P137_UNIDAD,P137_TIPO_INDICADOR,P137_INTERCOMPANY:${fin},${inicio},[${empresas}],[${unidades}],${indicador},${intercompany}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168427805139347923)
,p_event_id=>wwv_flow_imp.id(1164556086746161405)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1164557292630161417)
,p_name=>'MODAL_DETALLES_CIERRE_MENSUAL'
,p_event_sequence=>140
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLES_CIERRE_MENSUAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1164557328187161418)
,p_event_id=>wwv_flow_imp.id(1164557292630161417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:138:&APP_SESSION.::NO:138:P138_FECHA_FIN,P138_FECHA_INICIO,P138_EMPRESA,P138_TIPO_INDICADOR:${fin},${inicio},[${empresas}],${indicador}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168427913439347924)
,p_event_id=>wwv_flow_imp.id(1164557292630161417)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1145629253861797241)
,p_name=>'REFRESH_AFECTADOS'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P119_INTERCOMPANY'
,p_condition_element=>'P119_ESTADO'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1145629367854797242)
,p_event_id=>wwv_flow_imp.id(1145629253861797241)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1145627361330797222)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1149145154680916119)
,p_event_id=>wwv_flow_imp.id(1145629253861797241)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1149144290637916110)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1149146181992916129)
,p_event_id=>wwv_flow_imp.id(1145629253861797241)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1149145214485916120)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1164555905652161404)
,p_event_id=>wwv_flow_imp.id(1145629253861797241)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1149147730954916145)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1141793990299308027)
,p_name=>'MODAL_ANTIGUEDAD_PROMEDIO_PERIODO_PAGO'
,p_event_sequence=>160
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_ANTIGUEDAD_PROMEDIO_PERIODO_PAGO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1141794120566308029)
,p_event_id=>wwv_flow_imp.id(1141793990299308027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:141:&APP_SESSION.::NO:141:P141_FECHA_FIN,P141_FECHA_INICIO,P141_EMPRESA,P141_TIPO_INDICADOR:${fin},${inicio},[${empresas}],${indicador}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168428008968347925)
,p_event_id=>wwv_flow_imp.id(1141793990299308027)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1131867391530875839)
,p_name=>'MODAL_DETALLE_INDICADOR_PLAZO_PROMEDIO_COBRANZA'
,p_event_sequence=>170
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLE_INDICADOR_PLAZO_PROMEDIO_COBRANZA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1131867497965875840)
,p_event_id=>wwv_flow_imp.id(1131867391530875839)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:142:&APP_SESSION.::NO:142:P142_FECHA_FIN,P142_FECHA_INICIO,P142_EMPRESA,P142_TIPO_INDICADOR:${fin},${inicio},[${empresas}],${indicador}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168428103468347926)
,p_event_id=>wwv_flow_imp.id(1131867391530875839)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1168426255359347907)
,p_name=>'MODAL_DETALLE_CONCILIACIONES_BANCARIAS'
,p_event_sequence=>180
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLE_CONCILIACIONES_BANCARIAS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168426311125347908)
,p_event_id=>wwv_flow_imp.id(1168426255359347907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:143:&APP_SESSION.::NO:143:P143_FECHA_FIN,P143_FECHA_INICIO,P143_EMPRESA,P143_TIPO_INDICADOR:${fin},${inicio},[${empresas}],${indicador}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1168428220475347927)
,p_event_id=>wwv_flow_imp.id(1168426255359347907)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(64487330649338703)
,p_name=>'MODAL_DETALLE_CICLO'
,p_event_sequence=>190
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P119_CODIGO_EMPRESA'').value != "" &&',
'apex.item(''P119_CODIGO_UNIDAD'').value != "" &&',
'apex.item(''P119_FECHA_INICIO'').value != "" &&',
'apex.item(''P119_FECHA_FIN'').value != ""'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODAL_DETALLE_CICLO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64487412952338704)
,p_event_id=>wwv_flow_imp.id(64487330649338703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let empresas = apex.item("P119_CODIGO_EMPRESA").getValue().toString().replaceAll('','',''|'');',
'let inicio = apex.item(''P119_FECHA_INICIO'').getValue();',
'let fin = apex.item(''P119_FECHA_FIN'').getValue();',
'let indicador = apex.item(''P119_TIPO_INDICADOR'').getValue();',
'',
'console.log(empresas.toString());',
'',
'var url = `f?p=&APP_ID.:149:&APP_SESSION.::NO:149:P149_FECHA_FIN,P149_FECHA_INICIO,P149_EMPRESA,P149_TIPO_INDICADOR:${fin},${inicio},[${empresas}],${indicador}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    } else {',
'        console.log("FALSE");',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(64487517717338705)
,p_event_id=>wwv_flow_imp.id(64487330649338703)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'No se han ingresado todos los datos'
,p_attribute_02=>'Datos incompletos'
,p_attribute_03=>'danger'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1106543994356689438)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'COLLECTIONS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''COLLECTION_EMPRESA'') THEN',
'	APEX_COLLECTION.CREATE_COLLECTION(''COLLECTION_EMPRESA'');',
'ELSE',
'	APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_EMPRESA'');',
'END IF;',
'',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''COLLECTION_UNIDAD'') THEN',
'	APEX_COLLECTION.CREATE_COLLECTION(''COLLECTION_UNIDAD'');',
'ELSE',
'	APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_UNIDAD'');',
'END IF;',
'',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''COLLECTION_CICLO_PERIODO'') THEN',
'	APEX_COLLECTION.CREATE_COLLECTION(''COLLECTION_CICLO_PERIODO'');',
'ELSE',
'	APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_CICLO_PERIODO'');',
'END IF;',
'',
':P119_CODIGO_EMPRESA := ''TODAS_LAS_EMPRESAS'';',
':P119_CODIGO_UNIDAD := ''TODAS_LAS_UNIDADES'';',
':P119_FECHA_INICIO := TRUNC(SYSDATE, ''YEAR'');',
':P119_FECHA_FIN := SYSDATE;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1103092708520247522)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREPARE_URL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   result varchar2(32767);',
'begin',
'   result:=apex_util.prepare_url(',
'       p_url => apex_application.g_x01,',
'       p_triggering_element => ''document''',
'       );',
'   apex_json.open_object;',
'   apex_json.write(''success'', true);',
'   apex_json.write(''url'', result);',
'   apex_json.close_object;',
'exception',
' when others then',
'   apex_json.open_object;',
'   apex_json.write(''success'', false);',
'   apex_json.write(''message'', sqlerrm);',
'   apex_json.close_object;',
'end;'))
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
