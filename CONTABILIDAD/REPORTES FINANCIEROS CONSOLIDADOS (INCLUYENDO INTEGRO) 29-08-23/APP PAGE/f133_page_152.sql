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
--   Date and Time:   17:01 Tuesday August 29, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 152
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00152
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>152);
end;
/
prompt --application/pages/page_00152
begin
wwv_flow_imp_page.create_page(
 p_id=>152
,p_name=>'PLANTILLA_ESTADO_RESULTADO_CORPORACION'
,p_alias=>'PLANTILLA-ESTADO-RESULTADO-CORPORACION'
,p_step_title=>'PLANTILLA_ESTADO_RESULTADO_CORPORACION'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function editarNota() {',
'    $.event.trigger(''EDITAR_NOTA'');',
'}',
'',
'function crearNota() {',
'    $.event.trigger(''CREAR_NOTA'');',
'}',
'',
'function eliminarNota() {',
'    $.event.trigger(''ELIMINAR_NOTA'');',
'}',
'',
'function verNota() {',
'    $.event.trigger(''VER_NOTA'');',
'}',
'',
'function asociarNota() {',
'    $.event.trigger(''ASOCIAR_NOTA'');',
'}',
'',
'function modificarRenglon() {',
'    $.event.trigger(''MODIFICAR_RENGLON'');',
'}',
'',
'function descargarReporte() {',
'    $.event.trigger(''IMPRIMIR_REPORTE'');',
'}',
'',
'function descargarNotas() {',
'    $.event.trigger(''IMPRIMIR_NOTAS'');',
'}',
'',
'function descargarTodos() {',
'    $.event.trigger(''IMPRIMIR_REPORTE'');',
'    $.event.trigger(''IMPRIMIR_NOTAS'');',
'}',
'',
'function descargarPlantilla() {',
'    $.event.trigger(''DESCARGAR_PLANTILLA'');',
'} '))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ACTIVO th#ANIO_1, #ACTIVO td[headers=ANIO_1],',
'#ACTIVO th#ANIO_2, #ACTIVO td[headers=ANIO_2],',
'#PASIVO th#ANIO_1, #PASIVO td[headers=ANIO_1],',
'#PASIVO th#ANIO_2, #PASIVO td[headers=ANIO_2]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#ACTIVO th#ID_NOTA, #ACTIVO td[headers=ID_NOTA],',
'#PASIVO th#ID_NOTA, #PASIVO td[headers=ID_NOTA]',
'{',
'    width: 250px !important;',
'    min-width: 250px !important;',
'    max-width: 250px !important;',
'}',
'',
'#ACTIVO th#BOTON, #ACTIVO td[headers=BOTON],',
'#PASIVO th#BOTON, #PASIVO td[headers=BOTON]',
'{',
'    width: 80px !important;',
'    min-width: 80px !important;',
'    max-width: 80px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230828151955'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1225730889589913174)
,p_plug_name=>'LISTA'
,p_region_name=>'LISTA_DESCARGAS'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(99548300376243627)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_list_id=>wwv_flow_imp.id(141338030786815689)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(99634242810244021)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1366827350700647694)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1571868675337052858)
,p_plug_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1571868927691052860)
,p_plug_name=>'BALANCE'
,p_parent_plug_id=>wwv_flow_imp.id(1571868675337052858)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>9
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P152_EMPRESA IS NOT NULL AND',
':P152_MES_INICIO IS NOT NULL AND',
':P152_MES_FINAL IS NOT NULL AND',
':P152_ANIO IS NOT NULL AND ',
':P152_VERSION IS NOT NULL AND',
':P152_MONEDA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1191954685380252303)
,p_plug_name=>'TITULO_REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(1571868927691052860)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:center;">&P152_NOMBRE_TITULO.</h4>',
'<h5 style="text-align:center;">Estado de Resultado</h5>',
'<h5 style="text-align:center;">&P152_FECHA_TITULO.</h5>',
'<h5 style="text-align:center;">(Cifras Expresadas en &P152_NOMBRE_MONEDA.)</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1571869789979052869)
,p_plug_name=>'Balance'
,p_region_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(1571868927691052860)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Ingresos Ordinarios'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ENCABEZADO'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    A.ID,',
'    (',
'        CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'            ''Nota '' || C.NOMBRE',
'        ELSE',
'            NULL',
'        END',
'    ) ID_NOTA,',
'    ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'    A.COD_CTA,',
'    A.ORDEN_1,',
'    A.ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C006), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C007), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''DETALLE'' AS TIPO,',
'    NULL CLASE,',
'    B.ID_NOTA ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P152_VERSION',
'LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'WHERE A.ORDEN_1 = ''Ingresos Ordinarios''',
'AND A.TIPO_REPORTE = 2',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Total Ingresos Ordinarios'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Ingresos Ordinari'
||'os'') AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Ingresos Ordinari'
||'os'') AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Costos de Ventas'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ENCABEZADO'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    A.ID,',
'    (',
'        CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'            ''Nota '' || C.NOMBRE',
'        ELSE',
'            NULL',
'        END',
'    ) ID_NOTA,',
'    ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'    A.COD_CTA,',
'    A.ORDEN_1,',
'    A.ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C006), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C007), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''DETALLE'' AS TIPO,',
'    NULL CLASE,',
'    B.ID_NOTA ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P152_VERSION',
'LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'WHERE A.ORDEN_1 = ''Costos Ventas''',
'AND A.TIPO_REPORTE = 2',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Total Costo de Ventas'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Costos Ventas'') A'
||'ND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Costos Ventas'') A'
||'ND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Ganancia Bruta'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		(',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Ingresos Ordi'
||'narios'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Costos Ventas'
||''') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'        ),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		(',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Ingresos Ordi'
||'narios'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Costos Ventas'
||''') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'        ),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    A.ID,',
'    (',
'        CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'            ''Nota '' || C.NOMBRE',
'        ELSE',
'            NULL',
'        END',
'    ) ID_NOTA,',
'    ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'    A.COD_CTA,',
'    A.ORDEN_1,',
'    A.ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C006), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C007), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''DETALLE'' AS TIPO,',
'    NULL CLASE,',
'    B.ID_NOTA ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P152_VERSION',
'LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'WHERE A.ORDEN_1 = ''Otros Ingresos''',
'AND A.TIPO_REPORTE = 2',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Gastos de Operacion'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ENCABEZADO'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    ID,',
'    ID_NOTA,',
'    NOMBRE,',
'    COD_CTA,',
'    ORDEN_1,',
'    ORDEN_2,',
'    BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL(ANIO_1, 0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL(ANIO_2, 0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    TIPO,',
'    CLASE,',
'    ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM',
'(',
'    SELECT',
'        A.ID,',
'        (',
'            CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'                ''Nota '' || C.NOMBRE',
'            ELSE',
'                NULL',
'            END',
'        ) ID_NOTA,',
'        ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'        A.COD_CTA,',
'        A.ORDEN_1,',
'        A.ORDEN_2,',
'        NULL BOTON,',
'        NVL((',
'            SELECT NVL(TO_NUMBER(C006), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0) ANIO_1,',
'        NVL((',
'            SELECT NVL(TO_NUMBER(C007), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0) ANIO_2,',
'        ''DETALLE'' AS TIPO,',
'        NULL CLASE,',
'        B.ID_NOTA ID_NOTA_NUM',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'    LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P152_VERSION',
'    LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'    WHERE A.ORDEN_1 = ''Gastos de Operacion''',
'    AND A.TIPO_REPORTE = 2',
'    ORDER BY TO_NUMBER(A.ORDEN_2) ASC',
')',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Total Gastos de Operacion'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Gastos de Operaci'
||'on'') AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Gastos de Operaci'
||'on'') AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    UPPER(''Otros Gastos'') NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ENCABEZADO'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    A.ID,',
'    (',
'        CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'            ''Nota '' || C.NOMBRE',
'        ELSE',
'            NULL',
'        END',
'    ) ID_NOTA,',
'    ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'    A.COD_CTA,',
'    A.ORDEN_1,',
'    A.ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C006), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C007), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''DETALLE'' AS TIPO,',
'    NULL CLASE,',
'    B.ID_NOTA ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P152_VERSION',
'LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'WHERE A.ORDEN_1 = ''Otros Gastos''',
'AND A.TIPO_REPORTE = 2',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Resultado Antes de Impuesto Sobre la Renta'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		(',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Ingresos Ordi'
||'narios'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Costos Ventas'
||''') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            +',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Otros Ingreso'
||'s'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Gastos de Ope'
||'racion'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Otros Gastos'''
||') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'        ),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		(',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Ingresos Ordi'
||'narios'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Costos Ventas'
||''') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            +',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Otros Ingreso'
||'s'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Gastos de Ope'
||'racion'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Otros Gastos'''
||') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'        ),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    A.ID,',
'    (',
'        CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'            ''Nota '' || C.NOMBRE',
'        ELSE',
'            NULL',
'        END',
'    ) ID_NOTA,',
'    ''&emsp;'' || A.NOMBRE AS NOMBRE,',
'    A.COD_CTA,',
'    A.ORDEN_1,',
'    A.ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C006), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'            SELECT NVL(TO_NUMBER(C007), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 = (''NOTA '' || B.ID_PLANTILLA) AND C011 = ''TOTAL_NOTA''',
'        ),0),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''DETALLE'' AS TIPO,',
'    NULL CLASE,',
'    B.ID_NOTA ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P152_VERSION',
'LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'WHERE A.ORDEN_1 = ''Impuesto''',
'AND A.TIPO_REPORTE = 2',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    NULL NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'    NULL ANIO_2,',
'    ''ESPACIO'' AS TIPO,',
'    NULL CLASE,',
'    NULL ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;&emsp;'' || ''Resultado del Periodo'' NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		(',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Ingresos Ordi'
||'narios'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Costos Ventas'
||''') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            +',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Otros Ingreso'
||'s'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Gastos de Ope'
||'racion'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Otros Gastos'''
||') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C006)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Impuesto'') AN'
||'D C011 = ''TOTAL_NOTA''',
'            ),0)',
'        ),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		(',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Ingresos Ordi'
||'narios'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Costos Ventas'
||''') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            +',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Otros Ingreso'
||'s'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Gastos de Ope'
||'racion'') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Otros Gastos'''
||') AND C011 = ''TOTAL_NOTA''',
'            ),0)',
'            -',
'            NVL((',
'                SELECT NVL(SUM(TO_NUMBER(C007)), 0) FROM APEX_COLLECTIONS WHERE COLLECTION_NAME = ''COLLECTION_INFORME'' AND C001 IN (SELECT (''NOTA '' || B.ID) FROM SAF.PLANTILLA_ASIGNACION_NOTAS B WHERE B.TIPO_REPORTE = 2 AND B.ORDEN_1 = ''Impuesto'') AN'
||'D C011 = ''TOTAL_NOTA''',
'            ),0)',
'        ),',
'		1,',
'		:P152_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P152_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM DUAL'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P152_VERSION,P152_SIMBOLO_MONEDA,P152_MONEDA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Activo'
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
end;
/
begin
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1571869890374052870)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>1571869890374052870
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204356770182406236)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204357135359406237)
,p_db_column_name=>'COD_CTA'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Cod Cta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204357546072406238)
,p_db_column_name=>'ORDEN_1'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Orden 1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204357932668406239)
,p_db_column_name=>'ORDEN_2'
,p_display_order=>60
,p_column_identifier=>'L'
,p_column_label=>'Orden 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204358339517406240)
,p_db_column_name=>'BOTON'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>'&nbsp'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_static_id=>'BOTON'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204358740424406241)
,p_db_column_name=>'ANIO_1'
,p_display_order=>80
,p_column_identifier=>'T'
,p_column_label=>'&P152_ANIO.'
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
 p_id=>wwv_flow_imp.id(204359125976406242)
,p_db_column_name=>'ANIO_2'
,p_display_order=>90
,p_column_identifier=>'U'
,p_column_label=>'&P152_ANIO_MENOS_1.'
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
 p_id=>wwv_flow_imp.id(204359504499406243)
,p_db_column_name=>'TIPO'
,p_display_order=>100
,p_column_identifier=>'V'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204359951389406244)
,p_db_column_name=>'CLASE'
,p_display_order=>110
,p_column_identifier=>'W'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204360381074406245)
,p_db_column_name=>'ID_NOTA_NUM'
,p_display_order=>120
,p_column_identifier=>'X'
,p_column_label=>'Id Nota Num'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204356302653406235)
,p_db_column_name=>'ID_NOTA'
,p_display_order=>130
,p_column_identifier=>'Y'
,p_column_label=>'Nota'
,p_column_type=>'STRING'
,p_static_id=>'ID_NOTA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(204355972289406234)
,p_db_column_name=>'NOMBRE'
,p_display_order=>140
,p_column_identifier=>'AA'
,p_column_label=>'Nombre'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="#CLASE#">  ',
'    #NOMBRE#',
'</span>',
'',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="ID_NOTA" type="hidden" value="#ID_NOTA_NUM#">',
'<input id="TIPO" type="hidden" value="#TIPO#">'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(202309243657953438)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>150
,p_column_identifier=>'AB'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1572462171118371105)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'1834497'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:ID_NOTA:ANIO_1:ANIO_2:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204348366962406214)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_button_name=>'ACTUALIZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Actualizar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-retweet'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204348743947406215)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_button_name=>'REPORTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Reporte'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P152_EMPRESA IS NOT NULL AND',
':P152_MES_INICIO IS NOT NULL AND',
':P152_MES_FINAL IS NOT NULL AND',
':P152_ANIO IS NOT NULL AND ',
':P152_VERSION IS NOT NULL AND',
':P152_MONEDA IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_button_cattributes=>'style="margin-top:30px"; data-menu="LISTA_DESCARGAS_menu"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(204384109686406284)
,p_branch_name=>'CARGAR_DATOS'
,p_branch_action=>'f?p=&APP_ID.:152:&SESSION.::&DEBUG.:152:P152_MES_INICIO,P152_MES_FINAL,P152_ANIO,P152_VERSION,P152_MONEDA,P152_EMPRESA,P152_VECTOR_EMPRESA:&P152_MES_INICIO.,&P152_MES_FINAL.,&P152_ANIO.,&P152_VERSION.,&P152_MONEDA.,&P152_EMPRESA.,&P152_VECTOR_EMPRESA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CARGAR_DATOS'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(216561299383949632)
,p_branch_name=>'DESCARGAR'
,p_branch_action=>'f?p=202:38:&SESSION.::&DEBUG.::P38_FILE_NAME,P38_ID_EN_REPOSITORIO:&P152_NOMBRE_ARCHIVO.,&P152_ID_REPOSITORIO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DESCARGAR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202308429755953430)
,p_name=>'P152_MONEDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS',
'WHERE MONEDA_LOCAL IS NOT NULL'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	NOMBRE_MONEDA,',
'    CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202308692875953432)
,p_name=>'P152_VECTOR_EMPRESA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202308949138953435)
,p_name=>'P152_NOMBRE_MONEDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202309093799953436)
,p_name=>'P152_SIMBOLO_MONEDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204349180499406216)
,p_name=>'P152_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_prompt=>'Empresa'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	''0 - Todas las Empresas'' AS NOMBRE,',
'	0 AS CODIGO_EMPRESA',
'FROM DUAL',
'UNION ALL',
'SELECT',
'	NOMBRE,',
'	CODIGO_EMPRESA',
'FROM',
'(',
'Select codigo_empresa||'' - ''||nvl(Nombre_Persona,Razon_Social) nombre, codigo_empresa',
'  FROM Gral_personas_Table e, gral_empresas p',
' Where e.codigo_persona = p.codigo_persona',
'   And p.Codigo_Empresa in',
'       (Select a.Codigo_Empresa',
'          From Gral_Empresas_Usuarios a,',
'               Gral_Empresas          b,',
'               Gral_Personas_Table    c',
'         Where upper(globalfunc.Fnc_NUsuario(Codigo_Usuario)) = upper(NVL(V(''APP_USER''),user))',
'           And a.Codigo_Empresa = b.Codigo_Empresa',
'           And b.Codigo_Persona = c.Codigo_Persona)',
'           ',
'   And p.Codigo_Estado in (Select Codigo_Estatus',
'                            From Gral_Estatus_Modulos',
'                           Where Codigo_Modulo = 1',
'                             And Permite_Movtos = ''S'')    ',
' Order by p.codigo_empresa',
' );'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_attribute_11=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204349515881406217)
,p_name=>'P152_MES_INICIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_prompt=>'Mes Inicio'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'GRAL_MESES321'
,p_lov=>'.'||wwv_flow_imp.id(141331722281815680)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204349957300406218)
,p_name=>'P152_MES_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_prompt=>'Mes Final'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'GRAL_MESES321'
,p_lov=>'.'||wwv_flow_imp.id(141331722281815680)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204350397355406218)
,p_name=>'P152_ANIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_item_default=>'TO_CHAR(SYSDATE, ''YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>unistr('A\00F1o')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    YEAR,',
'    YEAR ID',
'FROM',
'(',
'    SELECT ',
'        TO_CHAR(add_months(sysdate,-61) + (LEVEL-1)*365, ''YYYY'') AS YEAR',
'    FROM DUAL',
'    CONNECT BY LEVEL <= 11',
')'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204350716249406219)
,p_name=>'P152_VERSION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_prompt=>'Version'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	DISTINCT',
'	VERSION,',
'	VERSION ID',
'FROM SAF.CON_CATCTAS',
'ORDER BY VERSION ASC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204351138220406219)
,p_name=>'P152_ANIO_MENOS_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204351508380406220)
,p_name=>'P152_NOMBRE_TITULO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204351981355406221)
,p_name=>'P152_FECHA_TITULO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1366827350700647694)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204352647613406222)
,p_name=>'P152_ID_NOTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1571868675337052858)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204353087845406223)
,p_name=>'P152_ID_REGISTRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1571868675337052858)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204353403370406223)
,p_name=>'P152_TIPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1571868675337052858)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204353873133406224)
,p_name=>'P152_URL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1571868675337052858)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204354250656406225)
,p_name=>'P152_CODIGO_USUARIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1571868675337052858)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204354620441406225)
,p_name=>'P152_DIA_FINAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1571868675337052858)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204361077130406248)
,p_name=>'P152_JASPER'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204361476072406248)
,p_name=>'P152_AUTENTICATION'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204361893797406249)
,p_name=>'P152_DIA_FIN'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204362298395406249)
,p_name=>'P152_PERMISOS'
,p_item_sequence=>70
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216561304650949633)
,p_name=>'P152_NOMBRE_ARCHIVO'
,p_item_sequence=>80
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216561414931949634)
,p_name=>'P152_ID_REPOSITORIO'
,p_item_sequence=>90
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204365806464406258)
,p_name=>'EDITAR_NOTAS_ACTIVO'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#ACTIVO td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined &&',
'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0] != undefined'))
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204366323185406260)
,p_event_id=>wwv_flow_imp.id(204365806464406258)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID_NOTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_NOTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204366861501406260)
,p_event_id=>wwv_flow_imp.id(204365806464406258)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204367372075406261)
,p_event_id=>wwv_flow_imp.id(204365806464406258)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_TIPO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204367809192406263)
,p_event_id=>wwv_flow_imp.id(204365806464406258)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "EDITAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P152_ID_NOTA'').getValue() != '''') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "VER_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P152_ID_NOTA'').getValue() != '''') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "CREAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P152_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                return false;',
'            }',
'        }',
'    },',
'    "ELIMINAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P152_ID_NOTA'').getValue() != '''') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "ASOCIAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P152_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                return false;',
'            }',
'        }',
'    }',
'};'))
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P152_TIPO'').getValue() == ''DETALLE'''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204368299351406264)
,p_name=>'EDITAR_NOTA'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P152_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'EDITAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204368789602406264)
,p_event_id=>wwv_flow_imp.id(204368299351406264)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID,P158_ID_ASOCIACION:''||',
'        :P152_ID_NOTA || '','' || :P152_ID_REGISTRO,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P152_URL',
'FROM DUAL;'))
,p_attribute_02=>'P152_ID_NOTA,P152_ID_REGISTRO'
,p_attribute_03=>'P152_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204369215429406265)
,p_event_id=>wwv_flow_imp.id(204368299351406264)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P152_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204369678536406265)
,p_name=>'CREAR_NOTA'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P152_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CREAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204370189820406266)
,p_event_id=>wwv_flow_imp.id(204369678536406265)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID_ASOCIACION,P158_CTA_VERSION:''|| :P152_ID_REGISTRO || '','' || :P152_VERSION,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P152_URL',
'FROM DUAL;'))
,p_attribute_02=>'P152_ID_REGISTRO,P152_VERSION'
,p_attribute_03=>'P152_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204370626410406267)
,p_event_id=>wwv_flow_imp.id(204369678536406265)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P152_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204371004766406267)
,p_name=>'REFRESH_REPORTE'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204371544679406268)
,p_event_id=>wwv_flow_imp.id(204371004766406267)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ACTIVOS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1571869789979052869)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204371924211406268)
,p_name=>'ELIMINAR_NOTA'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P152_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ELIMINAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204372453627406269)
,p_event_id=>wwv_flow_imp.id(204371924211406268)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_ASIGNACION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*UPDATE SAF.PLANTILLA_ASIGNACION_NOTAS SET ',
'    ID_NOTA = NULL,',
'    USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'    FECHA_MODIFICACION = SYSDATE',
'WHERE ID = :P152_ID_REGISTRO',
'AND TIPO_REPORTE = 2;*/',
'',
'DELETE FROM SAF.ASOCIACION_PLANTILLA_NOTA_VERSION',
'WHERE ID_PLANTILLA = :P152_ID_REGISTRO',
'AND VERSION = :P152_VERSION;'))
,p_attribute_02=>'P152_ID_REGISTRO,P152_VERSION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204372974805406269)
,p_event_id=>wwv_flow_imp.id(204371924211406268)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_ASIGNACION'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_ID_NOTA,P152_ID_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204373467699406270)
,p_event_id=>wwv_flow_imp.id(204371924211406268)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ACTIVO'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1571869789979052869)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204373844654406271)
,p_name=>'GENERAR_DATOS'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(204348366962406214)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P152_EMPRESA'').getValue() != '''' &&',
'apex.item(''P152_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P152_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P152_ANIO'').getValue() != '''' &&',
'apex.item(''P152_VERSION'').getValue() != '''' &&',
'apex.item(''P152_MONEDA'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(202309173507953437)
,p_event_id=>wwv_flow_imp.id(204373844654406271)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_VECTOR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VECTOR IS',
'        SELECT',
'            COUNT(*) CONTADOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P152_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P152_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        )',
'        WHERE TO_NUMBER(CODIGO_DIVISION) = 0; ',
'    ',
'    V_CONTADOR NUMBER := 0;',
'    V_VECTOR VARCHAR2(1124);',
'BEGIN',
'    OPEN C_VECTOR;',
'        FETCH C_VECTOR INTO V_CONTADOR;',
'    CLOSE C_VECTOR;',
'',
'    IF V_CONTADOR = 0 THEN',
'        SELECT',
'            LISTAGG(CODIGO_DIVISION, '':'') INTO V_VECTOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P152_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P152_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        );',
'    ELSE',
'        SELECT',
'	        LISTAGG(DISTINCT CODIGO_EMPRESA, '':'') INTO V_VECTOR',
'        FROM',
'        (',
'        Select codigo_empresa||'' - ''||nvl(Nombre_Persona,Razon_Social) nombre, codigo_empresa',
'          FROM Gral_personas_Table e, gral_empresas p',
'         Where e.codigo_persona = p.codigo_persona',
'           And p.Codigo_Empresa in',
'               (Select a.Codigo_Empresa',
'                  From Gral_Empresas_Usuarios a,',
'                       Gral_Empresas          b,',
'                       Gral_Personas_Table    c',
'                 Where upper(globalfunc.Fnc_NUsuario(Codigo_Usuario)) = upper(NVL(V(''APP_USER''),user))',
'                   And a.Codigo_Empresa = b.Codigo_Empresa',
'                   And b.Codigo_Persona = c.Codigo_Persona)',
'                   ',
'           And p.Codigo_Estado in (Select Codigo_Estatus',
'                                    From Gral_Estatus_Modulos',
'                                   Where Codigo_Modulo = 1',
'                                     And Permite_Movtos = ''S'')    ',
'         Order by p.codigo_empresa',
'         );',
'    END IF;',
'',
'    :P152_VECTOR_EMPRESA := V_VECTOR;',
'END;'))
,p_attribute_02=>'P152_EMPRESA'
,p_attribute_03=>'P152_VECTOR_EMPRESA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204374346240406271)
,p_event_id=>wwv_flow_imp.id(204373844654406271)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DATOS_NO_COMPLETADOS'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Los campos requeridos no han sigo ingresados'
,p_attribute_02=>'Campos Requeridos'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204374877001406272)
,p_event_id=>wwv_flow_imp.id(204373844654406271)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR_DATOS'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204375274210406272)
,p_name=>'VER_NOTA'
,p_event_sequence=>100
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'VER_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204375797432406273)
,p_event_id=>wwv_flow_imp.id(204375274210406272)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let mesInicio = apex.item("P152_MES_INICIO").getValue();',
'let mesFin = apex.item(''P152_MES_FINAL'').getValue();',
'let anio = apex.item(''P152_ANIO'').getValue();',
'let nota = apex.item(''P152_ID_REGISTRO'').getValue();',
'let moneda = apex.item(''P152_MONEDA'').getValue();',
'',
'var url = `f?p=&APP_ID.:163:&APP_SESSION.::NO:163:P163_MONEDA,P163_FECHA_INICIO,P163_FECHA_FIN,P163_ANIO,P163_NOTA:${moneda},${mesInicio},${mesFin},${anio},${nota}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204376137083406273)
,p_name=>'ASOCIAR_NOTA'
,p_event_sequence=>110
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P152_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ASOCIAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204376675413406274)
,p_event_id=>wwv_flow_imp.id(204376137083406273)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P152_ID_REGISTRO'').getValue();',
'let version = apex.item(''P152_VERSION'').getValue();',
'',
'var url = `f?p=&APP_ID.:168:&APP_SESSION.::NO:168:P168_NOTA,P168_VERSION:${nota},${version}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204377063172406275)
,p_name=>'MODIFICAR_RENGLON'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P152_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODIFICAR_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204377501202406275)
,p_event_id=>wwv_flow_imp.id(204377063172406275)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P152_ID_REGISTRO'').getValue();',
'',
'var url = `f?p=&APP_ID.:169:&APP_SESSION.::NO:169:P169_NOTA:${nota}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        console.log(pData)',
'        apex.navigation.redirect(pData.url);',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204377925539406276)
,p_name=>'IMPRIMIR_REPORTE'
,p_event_sequence=>130
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P152_EMPRESA'').getValue() != '''' &&',
'apex.item(''P152_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P152_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P152_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_REPORTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204378933890406277)
,p_event_id=>wwv_flow_imp.id(204377925539406276)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DATOS_NO_COMPLETADOS'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Los campos requeridos no han sigo ingresados'
,p_attribute_02=>'Campos Requeridos'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(250264564981485620)
,p_event_id=>wwv_flow_imp.id(204377925539406276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CODIGO_USUARIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_CODIGO_USUARIO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':GLOBAL_CODIGO_USUARIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(250264622202485621)
,p_event_id=>wwv_flow_imp.id(204377925539406276)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_EMPRESAS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_EMPRESAS IS',
'        SELECT ',
'            REGEXP_SUBSTR(:P152_VECTOR_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_EMPRESA',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P152_VECTOR_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL;',
'BEGIN',
'    DELETE FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'        WHERE USUARIO_GRABACION = :GLOBAL_CODIGO_USUARIO',
'        AND TIPO_REPORTE = 91;',
'    COMMIT;',
'',
'    FOR R_EMPRESAS IN C_EMPRESAS',
'    LOOP',
'        INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'        (',
'            TIPO_REPORTE,',
'            ID_ASOCIACION,',
'            CONCEPTO,',
'            USUARIO_GRABACION,',
'            FECHA_GRABACION',
'        )',
'        VALUES',
'        (',
'            91,',
'            R_EMPRESAS.CODIGO_EMPRESA,',
'            ''EMPRESA PARA JASPER'',',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        );',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_attribute_02=>'P152_VECTOR_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204378441851406276)
,p_event_id=>wwv_flow_imp.id(204377925539406276)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/Estado_de_Resultados_INTEGRO.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P152_JASPER,:P152_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P152_JASPER,P152_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204379485296406278)
,p_event_id=>wwv_flow_imp.id(204377925539406276)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P152_JASPER" ).getValue() +',
'    "&P_EMPRESA="+ apex.item( "P152_VECTOR_EMPRESA" ).getValue() +',
'    "&FECHA_FIN=" + apex.item( "P152_DIA_FIN" ).getValue() +',
'    "&MES_FIN="+ apex.item( "P152_MES_FINAL" ).getValue() +',
'    "&ANIO=" + apex.item( "P152_ANIO" ).getValue() +',
'    "&FECHA_INICIO=" + ''1'' +',
'    "&MES_INICIO=" + apex.item( "P152_MES_INICIO" ).getValue() +',
'    "&P_VERSION=" + apex.item( "P152_VERSION" ).getValue() +',
'    "&P_VERSION_CTA=" + apex.item( "P152_VERSION" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P152_CODIGO_USUARIO" ).getValue() +',
'    "&P_MONEDA=" + apex.item( "P152_MONEDA" ).getValue() +',
'    apex.item( "P152_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204379828935406278)
,p_name=>'CALCULAR_DIA_FIN'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P152_MES_FINAL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204380366907406279)
,p_event_id=>wwv_flow_imp.id(204379828935406278)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DIA'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'SELECT TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P152_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'') INTO :P152_DIA_FIN FROM DUAL;'
,p_attribute_02=>'P152_MES_FINAL'
,p_attribute_03=>'P152_DIA_FIN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204380793354406279)
,p_name=>'IMPRIMIR_NOTAS'
,p_event_sequence=>150
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P152_EMPRESA'').getValue() != '''' &&',
'apex.item(''P152_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P152_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P152_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_NOTAS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204382654326406282)
,p_event_id=>wwv_flow_imp.id(204380793354406279)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_USUARIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_CODIGO_USUARIO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':GLOBAL_CODIGO_USUARIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204383142671406283)
,p_event_id=>wwv_flow_imp.id(204380793354406279)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DATOS_NO_COMPLETADOS'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Los campos requeridos no han sigo ingresados'
,p_attribute_02=>'Campos Requeridos'
,p_attribute_03=>'warning'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204383600083406283)
,p_event_id=>wwv_flow_imp.id(204380793354406279)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DIA_FIN'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_DIA_FIN'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'TO_CHAR(LAST_DAY(TO_DATE(''1/'' || :P152_MES_FINAL || ''/'' || :P152_ANIO, ''DD/MM/YYYY'')), ''DD'')'
,p_attribute_07=>'P152_MES_FINAL,P152_ANIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204381229132406280)
,p_event_id=>wwv_flow_imp.id(204380793354406279)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_NOTAS IS',
'        SELECT',
'            C001 AS NOTA,',
'            C002 AS ID,',
'            C003 AS ID_PADRE,',
'            C004 AS NUMERO,',
'            C005 AS NOMBRE,',
'            TO_NUMBER(C006) AS SALDO_1,',
'            TO_NUMBER(C007) AS SALDO_2,',
'            TO_NUMBER(C008) AS ORDER_1,',
'            TO_NUMBER(C009) AS ORDER_2,',
'            TO_NUMBER(C010) AS ORDER_3,',
'            C011 AS TIPO,',
'            LEVEL NIVEL',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'        START WITH C003 IS NULL ',
'        CONNECT BY PRIOR C002 = C003',
'        ORDER SIBLINGS BY (C008), (C009);',
'BEGIN',
'    DELETE FROM SAF.CON_NOTAS_DETALLE_JASPER WHERE TIPO_REPORTE = 2 AND USUARIO_GRABACION = :GLOBAL_CODIGO_USUARIO;',
'    COMMIT;',
'    FOR R_NOTAS IN C_NOTAS',
'    LOOP',
'        INSERT INTO SAF.CON_NOTAS_DETALLE_JASPER',
'            (',
'                NOTA, ',
'                CODIGO_ID, ',
'                CODIGO_ID_PADRE, ',
'                NOMBRE, ',
'                SALDO_1, ',
'                SALDO_2, ',
'                ORDEN_1, ',
'                ORDEN_2, ',
'                ORDEN_3,',
'                TIPO,',
'                NIVEL,',
'                TIPO_REPORTE,',
'                USUARIO_GRABACION,',
'                FECHA_GRABACION',
'            )',
'        VALUES',
'            (',
'                R_NOTAS.NOTA,',
'                R_NOTAS.ID,',
'                R_NOTAS.ID_PADRE,',
'                R_NOTAS.NOMBRE,',
'                R_NOTAS.SALDO_1,',
'                R_NOTAS.SALDO_2,',
'                R_NOTAS.ORDER_1,',
'                R_NOTAS.ORDER_2,',
'                R_NOTAS.ORDER_3,',
'                R_NOTAS.TIPO,',
'                R_NOTAS.NIVEL,',
'                2,',
'                :GLOBAL_CODIGO_USUARIO,',
'                SYSDATE',
'            );',
'    END LOOP;',
'END;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204381763430406281)
,p_event_id=>wwv_flow_imp.id(204380793354406279)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/Estado_de_Resultados_Notas_INTEGRO.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P152_JASPER,:P152_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P152_JASPER,P152_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204382276871406281)
,p_event_id=>wwv_flow_imp.id(204380793354406279)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P152_JASPER" ).getValue() +',
'    "&P_CODIGO_EMPRESA="+ apex.item( "P152_EMPRESA" ).getValue() +',
'    "&P_FECHA_INICIO=" + "1" +',
'    "&P_MES_INICIO="+ apex.item( "P152_MES_INICIO" ).getValue() +',
'    "&P_ANIO=" + apex.item( "P152_ANIO" ).getValue() +',
'    "&P_FECHA_FIN=" + apex.item( "P152_DIA_FIN" ).getValue() +',
'    "&P_MES_FIN=" + apex.item( "P152_MES_FINAL" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P152_CODIGO_USUARIO" ).getValue() +',
'    "&P_TIPO_PARAMETRO=" + ''2'' +',
'    "&P_MONEDA=" + apex.item( "P152_MONEDA" ).getValue() +',
'    apex.item( "P152_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(216561012498949630)
,p_name=>'DESCARGAR_PLANTILLA'
,p_event_sequence=>160
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'DESCARGAR_PLANTILLA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216561563410949635)
,p_event_id=>wwv_flow_imp.id(216561012498949630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'NOMBRE_ARCHIVO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_NOMBRE_ARCHIVO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'PLANTILLA - Balance de Situacion Financiera.xlsx'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216561630183949636)
,p_event_id=>wwv_flow_imp.id(216561012498949630)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ID_REPOSITORIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P152_ID_REPOSITORIO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0000002295'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216561104678949631)
,p_event_id=>wwv_flow_imp.id(216561012498949630)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DESCARGAR'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204362672125406250)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'COLLECTIONS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''COLLECTION_INFORME'') THEN',
'	APEX_COLLECTION.CREATE_COLLECTION(''COLLECTION_INFORME'');',
'ELSE',
'	APEX_COLLECTION.TRUNCATE_COLLECTION(''COLLECTION_INFORME'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204365438926406257)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_PERMISOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_PERMISOS IS',
'        SELECT',
'            CODIGO_USUARIO',
'        FROM GRAL_REGISTROS_PERMISOS_USUARIOS',
'        WHERE TABLE_NAME = ''PLANTILLA_ASIGNACION_NOTAS'';',
'BEGIN',
'    :P152_PERMISOS := 0;',
'    ',
'    FOR R_PERMISOS IN C_PERMISOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_USUARIOS IS',
'                SELECT',
'                    COUNT(*)',
'                FROM SAF.GRAL_USUARIOS_ROLES',
'                WHERE CODIGO_USUARIO = :GLOBAL_CODIGO_USUARIO',
'                AND CODIGO_ROLE = R_PERMISOS.CODIGO_USUARIO;',
'',
'            V_PERMISO NUMBER := 0;',
'        BEGIN',
'            OPEN C_USUARIOS;',
'                FETCH C_USUARIOS INTO V_PERMISO;',
'            CLOSE C_USUARIOS;',
'',
'            IF NVL(V_PERMISO, 0) > 0 THEN',
'                :P152_PERMISOS := 1;',
'            END IF;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204365073686406257)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VECTOR_EMPRESA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VECTOR IS',
'        SELECT',
'            COUNT(*) CONTADOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P152_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P152_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        )',
'        WHERE TO_NUMBER(CODIGO_DIVISION) = 0; ',
'    ',
'    V_CONTADOR NUMBER := 0;',
'    V_VECTOR VARCHAR2(1124);',
'BEGIN',
'    OPEN C_VECTOR;',
'        FETCH C_VECTOR INTO V_CONTADOR;',
'    CLOSE C_VECTOR;',
'',
'    IF V_CONTADOR = 0 THEN',
'        SELECT',
'            LISTAGG(CODIGO_DIVISION, '':'') INTO V_VECTOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P152_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P152_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        );',
'    ELSE',
'        SELECT',
'	        LISTAGG(DISTINCT CODIGO_EMPRESA, '':'') INTO V_VECTOR',
'        FROM',
'        (',
'        Select codigo_empresa||'' - ''||nvl(Nombre_Persona,Razon_Social) nombre, codigo_empresa',
'          FROM Gral_personas_Table e, gral_empresas p',
'         Where e.codigo_persona = p.codigo_persona',
'           And p.Codigo_Empresa in',
'               (Select a.Codigo_Empresa',
'                  From Gral_Empresas_Usuarios a,',
'                       Gral_Empresas          b,',
'                       Gral_Personas_Table    c',
'                 Where upper(globalfunc.Fnc_NUsuario(Codigo_Usuario)) = upper(NVL(V(''APP_USER''),user))',
'                   And a.Codigo_Empresa = b.Codigo_Empresa',
'                   And b.Codigo_Persona = c.Codigo_Persona)',
'                   ',
'           And p.Codigo_Estado in (Select Codigo_Estatus',
'                                    From Gral_Estatus_Modulos',
'                                   Where Codigo_Modulo = 1',
'                                     And Permite_Movtos = ''S'')    ',
'         Order by p.codigo_empresa',
'         );',
'    END IF;',
'',
'    :P152_VECTOR_EMPRESA := V_VECTOR;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P152_EMPRESA IS NOT NULL AND',
':P152_MES_INICIO IS NOT NULL AND',
':P152_MES_FINAL IS NOT NULL AND',
':P152_ANIO IS NOT NULL AND',
':P152_VERSION IS NOT NULL AND',
':P152_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202308544953953431)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARAMETOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VECTOR IS',
'        SELECT',
'            COUNT(*) CONTADOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P152_VECTOR_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P152_VECTOR_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        ); ',
'    ',
'    V_CONTADOR NUMBER := 0;',
'BEGIN',
'    OPEN C_VECTOR;',
'        FETCH C_VECTOR INTO V_CONTADOR;',
'    CLOSE C_VECTOR;',
'',
'    IF V_CONTADOR = 1 THEN',
'        :P152_NOMBRE_TITULO := SAF.FN_NOMBRE_EMPRESA(:P152_VECTOR_EMPRESA);',
'    ELSE',
'        :P152_NOMBRE_TITULO := ''AICSA CORP.'';',
'    END IF;',
'',
'    /*SELECT',
'        NOMBRE_MONEDA,',
'        SIMBOLO_MONEDA',
'        INTO ',
'        :P152_NOMBRE_MONEDA,',
'        :P152_SIMBOLO_MONEDA',
'    FROM SAF.GRAL_MONEDAS',
'    WHERE CODIGO_MONEDA = :P152_MONEDA;*/',
'    SELECT',
'        NOMBRE_MONEDA',
'        INTO ',
'        :P152_NOMBRE_MONEDA',
'    FROM SAF.GRAL_MONEDAS',
'    WHERE CODIGO_MONEDA = :P152_MONEDA;',
'',
'    :P152_ANIO_MENOS_1 := TO_NUMBER(:P152_ANIO) - 1;',
'',
'    :P152_FECHA_TITULO := ''Del 01 de '' || TO_CHAR(TO_DATE(:P152_MES_INICIO, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' al '' ',
'        || TO_CHAR(LAST_DAY(TO_DATE(''01/''||:P152_MES_FINAL||''/''||:P152_ANIO_MENOS_1,''DD/MM/YYYY'')), ''DD'')',
'        || '' de '' || TO_CHAR(TO_DATE(:P152_MES_FINAL, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' de '' || :P152_ANIO || '' y '' || :P152_ANIO_MENOS_1;',
'',
'    :P152_DIA_FIN := TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P152_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P152_EMPRESA IS NOT NULL AND',
':P152_MES_INICIO IS NOT NULL AND',
':P152_MES_FINAL IS NOT NULL AND',
':P152_ANIO IS NOT NULL AND',
':P152_VERSION IS NOT NULL AND',
':P152_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204363034024406251)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_FUNTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATO IS',
'        SELECT',
'        	A.ID,',
'        	A.NOMBRE,',
'        	B.ID_NOTA,',
'        	B.VERSION,',
'            A.TIPO_REPORTE',
'        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'        LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ',
'        	ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P152_VERSION',
'        WHERE A.TIPO_REPORTE = 2',
'        ORDER BY A.ID ASC;',
'    ',
'    V_CONTADOR NUMBER := 0;',
'    V_CONTADOR_INTERNO NUMBER := 0;',
'',
'    V_ID NUMBER := 0;',
'    V_NOMBRE_NOTA VARCHAR2(128);',
'BEGIN',
'    FOR R_DATO IN C_DATO',
'    LOOP',
'        V_ID := V_CONTADOR;',
'        V_CONTADOR := V_CONTADOR + 1;',
'        APEX_COLLECTION.ADD_MEMBER',
'        (',
'            p_collection_name => ''COLLECTION_INFORME'',',
'            p_c001 => ''NOTA '' || TO_CHAR(R_DATO.ID),',
'            p_c002 => ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-'' || V_CONTADOR,',
'            p_c003 => NULL,',
'            p_c004 => NULL,',
'            p_c005 => ''NOTA '' || R_DATO.NOMBRE,',
'            p_c006 => NULL,',
'            p_c007 => NULL,',
'            p_c008 => R_DATO.ID,',
'            p_c009 => V_CONTADOR,',
'            p_c010 => V_CONTADOR_INTERNO,',
'            p_c011 => ''ENCABEZADO_NOTA''',
'        );',
'',
'        DECLARE',
'            CURSOR C_AGRUPADORES IS',
'                SELECT',
'                	*',
'                FROM SAF.CON_DETALLE_PLANTILLA_NOTAS ',
'                WHERE ID_PLANTILLA = R_DATO.ID_NOTA',
'                AND ES_AGRUPADOR = ''S''',
'                START WITH ID_PADRE IS NULL ',
'                CONNECT BY PRIOR ID = ID_PADRE;',
'        BEGIN',
'            V_ID := V_CONTADOR;',
'            FOR R_AGRUPADORES IN C_AGRUPADORES',
'            LOOP',
'                V_CONTADOR := V_CONTADOR + 1;',
'                APEX_COLLECTION.ADD_MEMBER',
'                (',
'                    p_collection_name => ''COLLECTION_INFORME'',',
'                    p_c001 => ''NOTA '' || TO_CHAR(R_DATO.ID),',
'                    p_c002 => ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-DETALLE-'' || R_AGRUPADORES.ID,',
'                    p_c003 => ',
'                    (',
'                        CASE WHEN R_AGRUPADORES.ID_PADRE IS NULL THEN',
'                            ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-'' || V_ID',
'                        ELSE',
'                            ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-DETALLE-'' || R_AGRUPADORES.ID_PADRE',
'                        END',
'                    ),',
'                    p_c004 => NULL,',
'                    p_c005 => R_AGRUPADORES.DESCRIPCION,',
'                    p_c006 => NULL,',
'                    p_c007 => NULL,',
'                    p_c008 => R_DATO.ID,',
'                    p_c009 => V_CONTADOR,',
'                    p_c010 => V_CONTADOR_INTERNO,',
'                    p_c011 => ''TITULO_DETALLE''',
'                );',
'',
'                DECLARE',
'                    V_BANDERA NUMBER := 0;',
'                BEGIN',
'                    SELECT ',
'                    	COUNT(*) INTO V_BANDERA',
'                    FROM SAF.CON_DETALLE_PLANTILLA_NOTAS',
'                    WHERE ID_PLANTILLA = R_DATO.ID_NOTA',
'                    AND ID_PADRE = R_AGRUPADORES.ID',
'                    AND ES_AGRUPADOR = ''N'';',
'',
'                    IF V_BANDERA > 0 THEN',
'                        DECLARE',
'                            CURSOR C_CUENTAS IS',
'                                SELECT',
'                                    CODIGO,',
'                                    NOMBRE AS NOMBRE,',
'                                    TOTAL_1,',
'                                    TOTAL_2',
'                                FROM TABLE',
'                                (',
'                                    SAF.DETALLE_NOTAS_FINANCIERAS_VERSIONAMIENTO_CORPORACION',
'                                    (',
'                                        V_EMPRESA => :P152_VECTOR_EMPRESA,',
'                                    	V_ID_PLANTILLA => R_DATO.ID_NOTA,',
'                                    	V_ID_PADRE => R_AGRUPADORES.ID,',
'                                        V_INTERCOMPANY => NVL(R_AGRUPADORES.INTERCOMPANY, ''N''),',
'                                    	V_AGRUPADOR => R_AGRUPADORES.AGRUPADOR,',
'                                    	V_AGRUPAR_MENOR_A => R_AGRUPADORES.AGRUPAR_MENOR_A,',
'                                        V_ANIO => TO_NUMBER(:P152_ANIO),',
'                                        V_MES_INICIO => TO_NUMBER(:P152_MES_INICIO),',
'                                        V_MES_FIN => TO_NUMBER(:P152_MES_FINAL),',
'                                        V_VERSION => :P152_VERSION',
'                                    )',
'                                );',
'                        BEGIN',
'                            FOR R_CUENTAS IN C_CUENTAS',
'                            LOOP',
'                                V_CONTADOR := V_CONTADOR + 1;',
'                                APEX_COLLECTION.ADD_MEMBER',
'                                (',
'                                    p_collection_name => ''COLLECTION_INFORME'',',
'                                    p_c001 => ''NOTA '' || TO_CHAR(R_DATO.ID),',
'                                    p_c002 => ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-'' || R_CUENTAS.CODIGO,',
'                                    p_c003 => ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-DETALLE-'' || R_AGRUPADORES.ID,',
'                                    p_c004 => R_CUENTAS.CODIGO,',
'                                    p_c005 => NVL(R_CUENTAS.NOMBRE, R_CUENTAS.CODIGO),',
'                                    p_c006 => (R_CUENTAS.TOTAL_1),',
'                                    p_c007 => (R_CUENTAS.TOTAL_2),',
'                                    p_c008 => R_DATO.ID,',
'                                    p_c009 => V_CONTADOR,',
'                                    p_c010 => V_CONTADOR_INTERNO,',
'                                    p_c011 => ''DETALLE''',
'                                );',
'                            END LOOP;',
'                        END;',
'                    END IF;',
'                END;',
'            END LOOP;',
'        END;',
'        ',
'        DECLARE',
'            CURSOR C_EMPRESAS IS',
'                SELECT',
'                    A.CODIGO_EMPRESA,',
'                    FN_NOMBRE_EMPRESA(A.CODIGO_EMPRESA) AS NOMBRE',
'                FROM',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P152_VECTOR_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_EMPRESA',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P152_VECTOR_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'                ) A',
'                INNER JOIN SAF.GRAL_EMPRESAS B ON B.CODIGO_EMPRESA = A.CODIGO_EMPRESA AND B.ID_GRUPO = 2;',
'        BEGIN',
'            FOR R_EMPRESAS IN C_EMPRESAS',
'            LOOP',
'                DECLARE',
'                    CURSOR C_ANIO IS',
'                    SELECT',
'                        SAF.APX_FNC_CONVERSION_MONEDAS',
'                    	(',
'                    		D.VALOR,',
'                    		D.MONEDA_ORIGEN,',
'                    		1,',
'                    		D.VALOR_CAMBIO,',
'                    		1',
'                    	)',
'                    FROM SAF.REPORTES_FINANCIEROS_INTEGRO D',
'                    WHERE D.ID_PLANTILLA_NOTA = R_DATO.ID',
'                    AND D.TIPO_REPORTE = R_DATO.TIPO_REPORTE',
'                    AND D.ANIO = :P152_ANIO',
'                    AND D.MES_INICIO = :P152_MES_INICIO',
'                    AND D.MES_FIN = :P152_MES_FINAL',
'                    AND D.CODIGO_EMPRESA = R_EMPRESAS.CODIGO_EMPRESA;',
'',
'                    CURSOR C_ANIO_1 IS',
'                        SELECT',
'                            SAF.APX_FNC_CONVERSION_MONEDAS',
'                        	(',
'                        		E.VALOR,',
'                        		E.MONEDA_ORIGEN,',
'                        		1,',
'                        		E.VALOR_CAMBIO,',
'                        		1',
'                        	)',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO E',
'                        WHERE E.ID_PLANTILLA_NOTA = R_DATO.ID',
'                        AND E.TIPO_REPORTE = R_DATO.TIPO_REPORTE',
'                        AND E.ANIO = :P152_ANIO_MENOS_1',
'                        AND E.MES_INICIO = :P152_MES_INICIO',
'                        AND E.MES_FIN = :P152_MES_FINAL',
'                        AND E.CODIGO_EMPRESA = R_EMPRESAS.CODIGO_EMPRESA;',
'',
'                    T_ANIO NUMBER;',
'                    T_ANIO_1 NUMBER;',
'                BEGIN',
'                    OPEN C_ANIO;',
'                        FETCH C_ANIO INTO T_ANIO;',
'                    CLOSE C_ANIO;',
'',
'                    OPEN C_ANIO_1;',
'                        FETCH C_ANIO_1 INTO T_ANIO_1;',
'                    CLOSE C_ANIO_1;',
'',
'                    V_CONTADOR := V_CONTADOR + 1;',
'                    APEX_COLLECTION.ADD_MEMBER',
'                    (',
'                        p_collection_name => ''COLLECTION_INFORME'',',
'                        p_c001 => ''NOTA '' || TO_CHAR(R_DATO.ID),',
'                        p_c002 => ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-'' || V_CONTADOR,',
'                        p_c003 => ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-'' || V_ID,',
'                        p_c004 => NULL,',
'                        p_c005 => R_EMPRESAS.CODIGO_EMPRESA || '' - '' || R_EMPRESAS.NOMBRE,',
'                        p_c006 => NVL(T_ANIO, 0),',
'                        p_c007 => NVL(T_ANIO_1, 0),',
'                        p_c008 => R_DATO.ID,',
'                        p_c009 => V_CONTADOR,',
'                        p_c010 => V_CONTADOR_INTERNO,',
'                        p_c011 => ''TOTAL_NOTA_223''',
'                    );',
'                END;',
'            END LOOP;',
'        END;',
'        ',
'        V_CONTADOR := V_CONTADOR + 1;',
'        APEX_COLLECTION.ADD_MEMBER',
'        (',
'            p_collection_name => ''COLLECTION_INFORME'',',
'            p_c001 => ''NOTA '' || TO_CHAR(R_DATO.ID),',
'            p_c002 => ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-'' || V_CONTADOR,',
'            p_c003 => ''NOTA '' || TO_CHAR(R_DATO.ID) || ''-'' || V_ID,',
'            p_c004 => NULL,',
'            p_c005 => ''NOTA '' || R_DATO.NOMBRE,',
'            p_c006 => 0,',
'            p_c007 => 0,',
'            p_c008 => R_DATO.ID,',
'            p_c009 => V_CONTADOR,',
'            p_c010 => V_CONTADOR_INTERNO,',
'            p_c011 => ''TOTAL_NOTA''',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P152_EMPRESA IS NOT NULL AND',
':P152_MES_INICIO IS NOT NULL AND',
':P152_MES_FINAL IS NOT NULL AND',
':P152_ANIO IS NOT NULL AND',
':P152_VERSION IS NOT NULL AND',
':P152_MONEDA IS NOT NULL AND',
':P152_VECTOR_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204363414422406253)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SUMA_TOTALES_NOTAS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_TOTALES IS',
'        SELECT',
'            SEQ_ID,',
'            C001 NOTA',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'        AND C011 = ''TOTAL_NOTA'';',
'BEGIN',
'    FOR R_TOTALES IN C_TOTALES',
'    LOOP',
'        DECLARE',
'            CURSOR C_DETALLES IS',
'                SELECT',
'                    NVL(SUM(TO_NUMBER(NVL(C006, 0))), 0) TOTAL_1,',
'                    NVL(SUM(TO_NUMBER(NVL(C007, 0))), 0) TOTAL_2',
'                FROM APEX_COLLECTIONS',
'                WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                AND (C011 = ''DETALLE'' OR C011 = ''TOTAL_NOTA_223'')',
'                AND C001 = R_TOTALES.NOTA;',
'        BEGIN',
'            FOR R_DETALLES IN C_DETALLES',
'            LOOP',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_INFORME'',',
'                    p_seq => R_TOTALES.SEQ_ID,',
'                    p_attr_number => 6,',
'                    p_attr_value  => R_DETALLES.TOTAL_1',
'                );',
'',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_INFORME'',',
'                    p_seq => R_TOTALES.SEQ_ID,',
'                    p_attr_number => 7,',
'                    p_attr_value  => R_DETALLES.TOTAL_2',
'                );',
'            END LOOP;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P152_EMPRESA IS NOT NULL AND',
':P152_MES_INICIO IS NOT NULL AND',
':P152_MES_FINAL IS NOT NULL AND',
':P152_ANIO IS NOT NULL AND',
':P152_VERSION IS NOT NULL AND',
':P152_MONEDA IS NOT NULL AND',
':P152_VECTOR_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204363846334406254)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BORRAR_DETALLES_CEROS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_TOTALES IS',
'        SELECT',
'            SEQ_ID',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'        AND C011 = ''DETALLE''',
'        AND TO_NUMBER(C006) = 0',
'        AND TO_NUMBER(C007) = 0;',
'BEGIN',
'    FOR R_TOTALES IN C_TOTALES',
'    LOOP',
'        APEX_COLLECTION.DELETE_MEMBER (',
'            p_collection_name => ''COLLECTION_INFORME'',',
'            p_seq => R_TOTALES.SEQ_ID',
'        );',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P152_EMPRESA IS NOT NULL AND',
':P152_MES_INICIO IS NOT NULL AND',
':P152_MES_FINAL IS NOT NULL AND',
':P152_ANIO IS NOT NULL AND',
':P152_VERSION IS NOT NULL AND',
':P152_MONEDA IS NOT NULL AND',
':P152_VECTOR_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204364608238406255)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INGRESAR_TOTALES_BLOQUES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_NOTAS IS',
'        SELECT',
'            DISTINCT C001 NOTA',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''COLLECTION_INFORME'';',
'BEGIN',
'    FOR R_NOTAS IN C_NOTAS',
'    LOOP',
'        DECLARE',
'            CURSOR C_TITULOS IS',
'                SELECT',
'                    *',
'                FROM APEX_COLLECTIONS',
'                WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                AND C011 = ''TITULO_DETALLE''',
'                AND C001 = R_NOTAS.NOTA;',
'            ',
'            V_CONTADOR NUMBER := 0;',
'            V_NOMBRE VARCHAR2(512);',
'        BEGIN',
'            FOR R_TITULOS IN C_TITULOS',
'            LOOP',
'                SELECT',
'                    (''Total '' || C005) INTO V_NOMBRE',
'                FROM APEX_COLLECTIONS',
'                WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                AND C001 = R_NOTAS.NOTA',
'                AND C002 = R_TITULOS.C002;',
'',
'                DECLARE',
'                    CURSOR C_POSICION IS',
'                        SELECT',
'                            *',
'                        FROM APEX_COLLECTIONS',
'                        WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                        AND C001 = R_NOTAS.NOTA',
'                        AND TO_NUMBER(C009) IN',
'                        (',
'                            SELECT',
'                                MAX(TO_NUMBER(C009))',
'                            FROM APEX_COLLECTIONS',
'                            WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                            AND C003 = R_TITULOS.C002',
'                        ); ',
'                BEGIN',
'                    SELECT',
'                        COUNT(*) INTO V_CONTADOR',
'                    FROM APEX_COLLECTIONS',
'                    WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                    AND C001 = R_NOTAS.NOTA',
'                    AND TO_NUMBER(C009) IN',
'                    (',
'                        SELECT',
'                            MAX(TO_NUMBER(C009))',
'                        FROM APEX_COLLECTIONS',
'                        WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                        AND C003 = R_TITULOS.C002',
'                    );',
'                    ',
'                    IF V_CONTADOR > 0 THEN',
'                        FOR R_POSICION IN C_POSICION',
'                        LOOP',
'                            APEX_COLLECTION.ADD_MEMBER',
'                            (',
'                                p_collection_name => ''COLLECTION_INFORME'',',
'                                p_c001 => R_POSICION.C001,',
'                                p_c002 => R_POSICION.C002 || ''-'' || ''TOTAL'',',
'                                p_c003 => R_POSICION.C003,',
'                                p_c004 => NULL,',
'                                p_c005 => V_NOMBRE,',
'                                p_c006 => 0,',
'                                p_c007 => 0,',
'                                p_c008 => R_POSICION.C008,',
'                                p_c009 => (TO_NUMBER(R_POSICION.C009) + 0.1),',
'                                p_c010 => R_POSICION.C010,',
'                                p_c011 => ''TOTAL_TITULO''',
'                            );',
'                        END LOOP;',
'                    ELSE',
'                        APEX_COLLECTION.ADD_MEMBER',
'                        (',
'                            p_collection_name => ''COLLECTION_INFORME'',',
'                            p_c001 => R_TITULOS.C001,',
'                            p_c002 => R_TITULOS.C002 || ''-'' || ''TOTAL'',',
'                            p_c003 => R_TITULOS.C002,',
'                            p_c004 => NULL,',
'                            p_c005 => V_NOMBRE,',
'                            p_c006 => 0,',
'                            p_c007 => 0,',
'                            p_c008 => R_TITULOS.C008,',
'                            p_c009 => (TO_NUMBER(R_TITULOS.C009) + 0.1),',
'                            p_c010 => R_TITULOS.C010,',
'                            p_c011 => ''TOTAL_TITULO''',
'                        );',
'                    END IF;',
'                END;',
'            END LOOP;',
'        END;',
'    END LOOP;',
'',
'    FOR R_NOTAS IN C_NOTAS',
'    LOOP',
'        DECLARE',
'            CURSOR C_TOTALES IS',
'                SELECT',
'                    SEQ_ID,',
'                    C002 ID,',
'                    C003 ID_PADRE',
'                FROM APEX_COLLECTIONS',
'                WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                AND C011 = ''TOTAL_TITULO''',
'                AND C001 = R_NOTAS.NOTA;',
'        BEGIN',
'            FOR R_TOTALES IN C_TOTALES',
'            LOOP',
'                DECLARE',
'                    CURSOR C_SALDO IS',
'                        SELECT',
'                            NVL(SUM(TO_NUMBER(C006)), 0) SALDO_1,',
'                            NVL(SUM(TO_NUMBER(C007)), 0) SALDO_2',
'                        FROM APEX_COLLECTIONS',
'                        WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                        AND C011 = ''DETALLE''',
'                        AND C001 = R_NOTAS.NOTA',
'                        --AND C003 = R_TOTALES.ID_PADRE',
'                        AND TO_NUMBER(C009) BETWEEN ',
'                        (',
'                            SELECT',
'                                 TO_NUMBER(C009)',
'                            FROM APEX_COLLECTIONS',
'                            WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                            AND C002 = R_TOTALES.ID_PADRE',
'                            --AND C001 = ''TITULO_DETALLE''',
'                        ) ',
'                            AND ',
'                        (',
'                            SELECT',
'                                MAX(TO_NUMBER(C009))',
'                            FROM APEX_COLLECTIONS',
'                            WHERE COLLECTION_NAME = ''COLLECTION_INFORME''',
'                            AND C003 = R_TOTALES.ID_PADRE',
'                            --AND C001 = ''TOTAL_TITULO''',
'                        )',
'                        AND SEQ_ID != R_TOTALES.SEQ_ID;',
'                BEGIN',
'                    FOR R_SALDO IN C_SALDO',
'                    LOOP',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_INFORME'',',
'                            p_seq => R_TOTALES.SEQ_ID,',
'                            p_attr_number => 6,',
'                            p_attr_value  => R_SALDO.SALDO_1',
'                        );',
'',
'                        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                            p_collection_name => ''COLLECTION_INFORME'',',
'                            p_seq => R_TOTALES.SEQ_ID,',
'                            p_attr_number => 7,',
'                            p_attr_value  => R_SALDO.SALDO_2',
'                        );',
'                    END LOOP;',
'                END;',
'            END LOOP;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P152_EMPRESA IS NOT NULL AND',
':P152_MES_INICIO IS NOT NULL AND',
':P152_MES_FINAL IS NOT NULL AND',
':P152_ANIO IS NOT NULL AND',
':P152_VERSION IS NOT NULL AND',
':P152_MONEDA IS NOT NULL AND',
':P152_VECTOR_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(204364234974406255)
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
