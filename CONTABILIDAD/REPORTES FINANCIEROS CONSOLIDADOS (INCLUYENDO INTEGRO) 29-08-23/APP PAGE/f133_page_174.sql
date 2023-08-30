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
--     PAGE: 174
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00174
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>174);
end;
/
prompt --application/pages/page_00174
begin
wwv_flow_imp_page.create_page(
 p_id=>174
,p_name=>'PRESTAMOS_BANCARIOS_CORPORATIVO'
,p_alias=>'PRESTAMOS-BANCARIOS-CORPORATIVO'
,p_step_title=>'Prestamos Bancarios'
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
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ACTIVO th#ANIO_1, #ACTIVO td[headers=ANIO_1],',
'#ACTIVO th#ANIO_2, #ACTIVO td[headers=ANIO_2]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#ACTIVO th#ID_NOTA, #ACTIVO td[headers=ID_NOTA]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#ACTIVO th#BOTON, #ACTIVO td[headers=BOTON]',
'{',
'    width: 80px !important;',
'    min-width: 80px !important;',
'    max-width: 80px !important;',
'}',
'',
'#ACTIVO th#NOMBRE, #ACTIVO td[headers=NOMBRE]',
'{',
'    width: 400px !important;',
'    min-width: 400px !important;',
'    max-width: 400px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230829121643'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1859133054404397948)
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
 p_id=>wwv_flow_imp.id(1924001876249667049)
,p_plug_name=>'LISTA'
,p_region_name=>'LISTA_DESCARGAS'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(99548300376243627)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_list_id=>wwv_flow_imp.id(260525851835723074)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(99634242810244021)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2064174379040803112)
,p_plug_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P174_EMPRESA IS NOT NULL AND',
':P174_MES_INICIO IS NOT NULL AND',
':P174_MES_FINAL IS NOT NULL AND',
':P174_ANIO IS NOT NULL AND',
':P174_VERSION IS NOT NULL AND',
':P174_MONEDA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1890226211184006183)
,p_plug_name=>'TITULO_REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(2064174379040803112)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:center;">&P174_NOMBRE_TITULO.</h4>',
'<h5 style="text-align:center;">Prestamos Bancarios</h5>',
'<h5 style="text-align:center;">&P174_FECHA_TITULO.</h5>',
'<h5 style="text-align:center;">(Cifras Expresadas en &P174_NOMBRE_MONEDA.)</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2064174631394803114)
,p_plug_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(2064174379040803112)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>8
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2064175493682803123)
,p_plug_name=>'Activo'
,p_region_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(2064174631394803114)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    A.ID,',
'    (',
'        CASE WHEN B.ID_NOTA IS NOT NULL THEN',
'            ''Nota '' || C.NOMBRE',
'        ELSE',
'            NULL',
'        END',
'    ) ID_NOTA,',
'    A.NOMBRE AS NOMBRE,',
'    A.COD_CTA,',
'    A.ORDEN_1,',
'    A.ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'	NULL ANIO_2,',
'    ''DETALLE'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    B.ID_NOTA ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P174_VERSION',
'LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'WHERE A.ORDEN_1 = ''Corriente''',
'AND A.TIPO_REPORTE = 5',
'UNION ALL',
'SELECT',
'	NULL ID,',
'    NULL ID_NOTA,',
'    (',
'    	CASE WHEN F.NOMBRE_BANCO IS NOT NULL THEN',
'    		F.NOMBRE_BANCO || '' No. ''  || E.NUMERO_PRESTAMO || '' '' || E.OBSERVACIONES_PRESTAMO',
'    	ELSE',
'    		''Cuenta no asociada a un prestamo - '' || C.COD_CTA',
'    	END',
'    ) NOMBRE,',
'    C.COD_CTA COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'        	CASE WHEN B.VERSION != ''1311'' THEN',
'        		(SELECT',
'        			SUM(AA.VALOR)',
'    			FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'    			WHERE AA.COD_CTA = C.COD_CTA',
'    			AND AA.MES <= :P174_MES_FINAL',
'    			AND AA.EJERCICIO = :P174_ANIO',
'                AND AA.CODIGO_EMPRESA IN',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                ))',
'        	ELSE',
'        		(SELECT',
'        			SUM(AA.VALOR)',
'    			FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'    			WHERE AA.COD_CTA = C.COD_CTA',
'    			AND AA.MES <= :P174_MES_FINAL',
'    			AND AA.EJERCICIO = :P174_ANIO',
'                AND AA.CODIGO_EMPRESA IN',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                ))',
'        	END',
'        ), 0),',
'		1,',
'		:P174_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'        	CASE WHEN B.VERSION != ''1311'' THEN',
'        		(SELECT',
'        			SUM(AA.VALOR)',
'    			FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'    			WHERE AA.COD_CTA = C.COD_CTA',
'    			AND AA.MES <= :P174_MES_FINAL',
'    			AND AA.EJERCICIO = :P174_ANIO_MENOS_1',
'                AND AA.CODIGO_EMPRESA IN',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                ))',
'        	ELSE',
'        		(SELECT',
'        			SUM(AA.VALOR)',
'    			FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'    			WHERE AA.COD_CTA = C.COD_CTA',
'    			AND AA.MES <= :P174_MES_FINAL',
'    			AND AA.EJERCICIO = :P174_ANIO_MENOS_1',
'                AND AA.CODIGO_EMPRESA IN',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                ))',
'        	END',
'        ), 0),',
'		1,',
'		:P174_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''DETALLE_PRESTAMO'' AS TIPO,',
'    (',
'        CASE WHEN F.NOMBRE_BANCO IS NOT NULL THEN',
'    		NULL',
'    	ELSE',
'    		''color: red;''',
'    	END',
'    ) CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P174_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'INNER JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ',
'	ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P174_VERSION',
'INNER JOIN SAF.CON_DETALLE_PLANTILLA_NOTAS C ',
'	ON C.ID_PLANTILLA = B.ID_NOTA',
'	AND C.VERSION = B.VERSION',
'LEFT JOIN SAF.CON_COD_CTA_PRESTAMO_BANCARIO D ',
'	ON D.VERSION = B.VERSION ',
'	AND D.COD_CTA = C.COD_CTA',
'LEFT JOIN SAF.CXC_PRESTAMOS_BANCARIOS E',
'	ON E.ID = D.ID_PRESTAMO_BANCARIO',
'LEFT JOIN SAF.BCOBANCOS F',
'	ON F.CODBCO = E.CODBCO',
'WHERE A.TIPO_REPORTE = 5',
'AND A.ID = 283',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    (',
'    	A.CODIGO_EMPRESA || '' - '' || SAF.FN_NOMBRE_EMPRESA(A.CODIGO_EMPRESA) || '': '' || (SELECT',
'    		BB.CONCEPTO',
'		FROM SAF.REPORTES_FINANCIEROS_INTEGRO BB',
'		WHERE BB.NUMERO_PRESTAMO = A.NUMERO_PRESTAMO',
'		AND BB.ID = (SELECT MAX(CC.ID) FROM SAF.REPORTES_FINANCIEROS_INTEGRO CC WHERE CC.NUMERO_PRESTAMO = A.NUMERO_PRESTAMO AND CC.ID_PLANTILLA_NOTA = A.ID_PLANTILLA_NOTA))',
'    ) NOMBRE,',
'    A.NUMERO_PRESTAMO COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P174_ANIO THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P174_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ) ANIO_1,',
'    SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P174_ANIO_MENOS_1 THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P174_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ) ANIO_2,',
'    ''DETALLE_PRESTAMO_INTEGRO'' AS TIPO,',
'    NULL CLASE,',
'    A.ID_PLANTILLA_NOTA ID_NOTA_NUM,',
'    :P174_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.REPORTES_FINANCIEROS_INTEGRO A',
'WHERE A.TIPO_REPORTE = 5',
'AND A.ID_PLANTILLA_NOTA = 283',
'AND (A.ANIO = :P174_ANIO OR A.ANIO = :P174_ANIO_MENOS_1)',
'AND A.MES_INICIO = 1',
'AND A.MES_FIN = :P174_MES_FINAL',
'AND A.CODIGO_EMPRESA IN',
'(',
'     SELECT ',
'        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'    FROM ',
'        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
')',
'GROUP BY A.NUMERO_PRESTAMO, A.ID_PLANTILLA_NOTA, A.CODIGO_EMPRESA',
'UNION ALL',
'SELECT',
'	NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;'' || ''Total '' || A.NOMBRE AS NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    (SUM(SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		CASE WHEN B.VERSION != ''1311'' THEN',
'    		(SELECT',
'    			NVL(SUM(AA.VALOR), 0)',
'			FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'			WHERE AA.COD_CTA = C.COD_CTA',
'			AND AA.MES <= :P174_MES_FINAL',
'			AND AA.EJERCICIO = :P174_ANIO',
'            AND AA.CODIGO_EMPRESA IN',
'            (',
'                SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            ))',
'    	ELSE',
'    		(SELECT',
'    			NVL(SUM(AA.VALOR), 0)',
'			FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'			WHERE AA.COD_CTA = C.COD_CTA',
'			AND AA.MES <= :P174_MES_FINAL',
'			AND AA.EJERCICIO = :P174_ANIO',
'            AND AA.CODIGO_EMPRESA IN',
'            (',
'                SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            ))',
'    	END,',
'		1,',
'		:P174_MONEDA,',
'		1,',
'		NULL',
'	))) + ',
'	(',
'		NVL((',
'            SELECT',
'                SUM(',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                	(',
'                		(',
'                            CASE WHEN A.ANIO = :P174_ANIO THEN',
'                                NVL(A.VALOR, 0)',
'                            ELSE',
'                                0',
'                            END',
'                        ),',
'                		A.MONEDA_ORIGEN,',
'                		:P174_MONEDA,',
'                		A.VALOR_CAMBIO,',
'                		NULL',
'                	)',
'                )',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO A',
'            WHERE A.TIPO_REPORTE = 5',
'            AND A.ID_PLANTILLA_NOTA = 283',
'            AND (A.ANIO = :P174_ANIO OR A.ANIO = :P174_ANIO_MENOS_1)',
'            AND A.MES_INICIO = 1',
'            AND A.MES_FIN = :P174_MES_FINAL',
'            AND A.CODIGO_EMPRESA IN',
'            (',
'                 SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            )',
'        ), 0)',
'	) ANIO_1,',
'    SUM(SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		CASE WHEN B.VERSION != ''1311'' THEN',
'    		(SELECT',
'    			SUM(AA.VALOR)',
'			FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'			WHERE AA.COD_CTA = C.COD_CTA',
'			AND AA.MES <= :P174_MES_FINAL',
'			AND AA.EJERCICIO = :P174_ANIO_MENOS_1',
'            AND AA.CODIGO_EMPRESA IN',
'            (',
'                SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            ))',
'    	ELSE',
'    		(SELECT',
'    			SUM(AA.VALOR)',
'			FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'			WHERE AA.COD_CTA = C.COD_CTA',
'			AND AA.MES <= :P174_MES_FINAL',
'			AND AA.EJERCICIO = :P174_ANIO_MENOS_1',
'            AND AA.CODIGO_EMPRESA IN',
'            (',
'                SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            ))',
'    	END,',
'		1,',
'		:P174_MONEDA,',
'		1,',
'		NULL',
'	)) +',
'	(',
'		NVL((',
'            SELECT',
'                SUM(',
'                    SAF.APX_FNC_CONVERSION_MONEDAS',
'                	(',
'                		(',
'                            CASE WHEN A.ANIO = :P174_ANIO_MENOS_1 THEN',
'                                NVL(A.VALOR, 0)',
'                            ELSE',
'                                0',
'                            END',
'                        ),',
'                		A.MONEDA_ORIGEN,',
'                		:P174_MONEDA,',
'                		A.VALOR_CAMBIO,',
'                		NULL',
'                	)',
'                ) ANIO_2',
'            FROM SAF.REPORTES_FINANCIEROS_INTEGRO A',
'            WHERE A.TIPO_REPORTE = 5',
'            AND A.ID_PLANTILLA_NOTA = 283',
'            AND (A.ANIO = :P174_ANIO OR A.ANIO = :P174_ANIO_MENOS_1)',
'            AND A.MES_INICIO = 1',
'            AND A.MES_FIN = :P174_MES_FINAL',
'            AND A.CODIGO_EMPRESA IN',
'            (',
'                 SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            )',
'        ), 0)',
'	) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P174_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ',
'	ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P174_VERSION',
'LEFT JOIN SAF.CON_DETALLE_PLANTILLA_NOTAS C ',
'	ON C.ID_PLANTILLA = B.ID_NOTA',
'	AND C.VERSION = B.VERSION',
'WHERE A.TIPO_REPORTE = 5',
'AND A.ID = 283',
'GROUP BY A.NOMBRE',
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
'    A.NOMBRE AS NOMBRE,',
'    A.COD_CTA,',
'    A.ORDEN_1,',
'    A.ORDEN_2,',
'    NULL BOTON,',
'    NULL ANIO_1,',
'	NULL ANIO_2,',
'    ''DETALLE'' AS TIPO,',
'    ''font-weight: bold; text-decoration: underline;'' AS CLASE,',
'    B.ID_NOTA ID_NOTA_NUM,',
'    NULL SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P174_VERSION',
'LEFT JOIN CON_PLANTILLA_NOTAS C ON C.ID = B.ID_NOTA',
'WHERE A.ORDEN_1 = ''No Corriente''',
'AND A.TIPO_REPORTE = 5',
'UNION ALL',
'SELECT',
'	NULL ID,',
'    NULL ID_NOTA,',
'    (',
'    	CASE WHEN F.NOMBRE_BANCO IS NOT NULL THEN',
'    		F.NOMBRE_BANCO || '' No. ''  || E.NUMERO_PRESTAMO || '' '' || E.OBSERVACIONES_PRESTAMO',
'    	ELSE',
'    		''Cuenta no asociada a un prestamo - '' || C.COD_CTA',
'    	END',
'    ) NOMBRE,',
'    C.COD_CTA COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'        	CASE WHEN B.VERSION != ''1311'' THEN',
'        		(SELECT',
'        			SUM(AA.VALOR)',
'    			FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'    			WHERE AA.COD_CTA = C.COD_CTA',
'    			AND AA.MES <= :P174_MES_FINAL',
'    			AND AA.EJERCICIO = :P174_ANIO',
'                AND AA.CODIGO_EMPRESA IN',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                ))',
'        	ELSE',
'        		(SELECT',
'        			SUM(AA.VALOR)',
'    			FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'    			WHERE AA.COD_CTA = C.COD_CTA',
'    			AND AA.MES <= :P174_MES_FINAL',
'    			AND AA.EJERCICIO = :P174_ANIO',
'                AND AA.CODIGO_EMPRESA IN',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                ))',
'        	END',
'        ), 0),',
'		1,',
'		:P174_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_1,',
'    SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		NVL((',
'        	CASE WHEN B.VERSION != ''1311'' THEN',
'        		(SELECT',
'        			SUM(AA.VALOR)',
'    			FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'    			WHERE AA.COD_CTA = C.COD_CTA',
'    			AND AA.MES <= :P174_MES_FINAL',
'    			AND AA.EJERCICIO = :P174_ANIO_MENOS_1',
'                AND AA.CODIGO_EMPRESA IN',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                ))',
'        	ELSE',
'        		(SELECT',
'        			SUM(AA.VALOR)',
'    			FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'    			WHERE AA.COD_CTA = C.COD_CTA',
'    			AND AA.MES <= :P174_MES_FINAL',
'    			AND AA.EJERCICIO = :P174_ANIO_MENOS_1',
'                AND AA.CODIGO_EMPRESA IN',
'                (',
'                    SELECT ',
'                        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                    FROM ',
'                        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'                ))',
'        	END',
'        ), 0),',
'		1,',
'		:P174_MONEDA,',
'		1,',
'		NULL',
'	) ANIO_2,',
'    ''DETALLE_PRESTAMO'' AS TIPO,',
'    (',
'        CASE WHEN F.NOMBRE_BANCO IS NOT NULL THEN',
'    		NULL',
'    	ELSE',
'    		''color: red;''',
'    	END',
'    ) CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P174_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'INNER JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ',
'	ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P174_VERSION',
'INNER JOIN SAF.CON_DETALLE_PLANTILLA_NOTAS C ',
'	ON C.ID_PLANTILLA = B.ID_NOTA',
'	AND C.VERSION = B.VERSION',
'LEFT JOIN SAF.CON_COD_CTA_PRESTAMO_BANCARIO D ',
'	ON D.VERSION = B.VERSION ',
'	AND D.COD_CTA = C.COD_CTA',
'LEFT JOIN SAF.CXC_PRESTAMOS_BANCARIOS E',
'	ON E.ID = D.ID_PRESTAMO_BANCARIO',
'LEFT JOIN SAF.BCOBANCOS F',
'	ON F.CODBCO = E.CODBCO',
'WHERE A.TIPO_REPORTE = 5',
'AND A.ID = 284',
'UNION ALL',
'SELECT',
'    NULL ID,',
'    NULL ID_NOTA,',
'    (',
'    	A.CODIGO_EMPRESA || '' - '' || SAF.FN_NOMBRE_EMPRESA(A.CODIGO_EMPRESA) || '': '' || (SELECT',
'    		BB.CONCEPTO',
'		FROM SAF.REPORTES_FINANCIEROS_INTEGRO BB',
'		WHERE BB.NUMERO_PRESTAMO = A.NUMERO_PRESTAMO',
'		AND BB.ID = (SELECT MAX(CC.ID) FROM SAF.REPORTES_FINANCIEROS_INTEGRO CC WHERE CC.NUMERO_PRESTAMO = A.NUMERO_PRESTAMO AND CC.ID_PLANTILLA_NOTA = A.ID_PLANTILLA_NOTA))',
'    ) NOMBRE,',
'    A.NUMERO_PRESTAMO COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P174_ANIO THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P174_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ) ANIO_1,',
'    SUM(',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'    	(',
'    		(',
'                CASE WHEN A.ANIO = :P174_ANIO_MENOS_1 THEN',
'                    NVL(A.VALOR, 0)',
'                ELSE',
'                    0',
'                END',
'            ),',
'    		A.MONEDA_ORIGEN,',
'    		:P174_MONEDA,',
'    		A.VALOR_CAMBIO,',
'    		NULL',
'    	)',
'    ) ANIO_2,',
'    ''DETALLE_PRESTAMO_INTEGRO'' AS TIPO,',
'    NULL CLASE,',
'    A.ID_PLANTILLA_NOTA ID_NOTA_NUM,',
'    :P174_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.REPORTES_FINANCIEROS_INTEGRO A',
'WHERE A.TIPO_REPORTE = 5',
'AND A.ID_PLANTILLA_NOTA = 284',
'AND (A.ANIO = :P174_ANIO OR A.ANIO = :P174_ANIO_MENOS_1)',
'AND A.MES_INICIO = 1',
'AND A.MES_FIN = :P174_MES_FINAL',
'AND A.CODIGO_EMPRESA IN',
'(',
'     SELECT ',
'        REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'    FROM ',
'        dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
')',
'GROUP BY A.NUMERO_PRESTAMO, A.ID_PLANTILLA_NOTA, A.CODIGO_EMPRESA',
'UNION ALL',
'SELECT',
'	NULL ID,',
'    NULL ID_NOTA,',
'    ''&emsp;'' || ''Total '' || A.NOMBRE AS NOMBRE,',
'    NULL COD_CTA,',
'    NULL ORDEN_1,',
'    NULL ORDEN_2,',
'    NULL BOTON,',
'    NVL((SUM(SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		CASE WHEN B.VERSION != ''1311'' THEN',
'    		(SELECT',
'    			NVL(SUM(AA.VALOR), 0)',
'			FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'			WHERE AA.COD_CTA = C.COD_CTA',
'			AND AA.MES <= :P174_MES_FINAL',
'			AND AA.EJERCICIO = :P174_ANIO',
'            AND AA.CODIGO_EMPRESA IN',
'            (',
'                SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            ))',
'    	ELSE',
'    		(SELECT',
'    			NVL(SUM(AA.VALOR), 0)',
'			FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'			WHERE AA.COD_CTA = C.COD_CTA',
'			AND AA.MES <= :P174_MES_FINAL',
'			AND AA.EJERCICIO = :P174_ANIO',
'            AND AA.CODIGO_EMPRESA IN',
'            (',
'                SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            ))',
'    	END,',
'		1,',
'		:P174_MONEDA,',
'		1,',
'		NULL',
'	))) + ',
'	(',
'		NVL((SELECT',
'            SUM(',
'                SAF.APX_FNC_CONVERSION_MONEDAS',
'            	(',
'            		(',
'                        CASE WHEN A.ANIO = :P174_ANIO THEN',
'                            NVL(A.VALOR, 0)',
'                        ELSE',
'                            0',
'                        END',
'                    ),',
'            		A.MONEDA_ORIGEN,',
'            		:P174_MONEDA,',
'            		A.VALOR_CAMBIO,',
'            		NULL',
'            	)',
'            ) ANIO_1',
'        FROM SAF.REPORTES_FINANCIEROS_INTEGRO A',
'        WHERE A.TIPO_REPORTE = 5',
'        AND A.ID_PLANTILLA_NOTA = 284',
'        AND (A.ANIO = :P174_ANIO OR A.ANIO = :P174_ANIO_MENOS_1)',
'        AND A.MES_INICIO = 1',
'        AND A.MES_FIN = :P174_MES_FINAL',
'        AND A.CODIGO_EMPRESA IN',
'        (',
'             SELECT ',
'                REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'            FROM ',
'                dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'        )), 0)',
'	), 0) ANIO_1,',
'    (SUM(SAF.APX_FNC_CONVERSION_MONEDAS',
'	(',
'		CASE WHEN B.VERSION != ''1311'' THEN',
'    		(SELECT',
'    			NVL(SUM(AA.VALOR), 0)',
'			FROM SAF.APX_VW_CON_NOTAS_POLIZASD AA',
'			WHERE AA.COD_CTA = C.COD_CTA',
'			AND AA.MES <= :P174_MES_FINAL',
'			AND AA.EJERCICIO = :P174_ANIO_MENOS_1',
'            AND AA.CODIGO_EMPRESA IN',
'            (',
'                SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            ))',
'    	ELSE',
'    		(SELECT',
'    			NVL(SUM(AA.VALOR), 0)',
'			FROM SAF.APX_VW_CON_NOTAS_POLIZASD_HOMOLOGADAS AA',
'			WHERE AA.COD_CTA = C.COD_CTA',
'			AND AA.MES <= :P174_MES_FINAL',
'			AND AA.EJERCICIO = :P174_ANIO_MENOS_1',
'            AND AA.CODIGO_EMPRESA IN',
'            (',
'                SELECT ',
'                    REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'                FROM ',
'                    dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'            ))',
'    	END,',
'		1,',
'		:P174_MONEDA,',
'		1,',
'		NULL',
'	)) +',
'	(',
'		NVL((SELECT',
'            SUM(',
'                SAF.APX_FNC_CONVERSION_MONEDAS',
'            	(',
'            		(',
'                        CASE WHEN A.ANIO = :P174_ANIO_MENOS_1 THEN',
'                            NVL(A.VALOR, 0)',
'                        ELSE',
'                            0',
'                        END',
'                    ),',
'            		A.MONEDA_ORIGEN,',
'            		:P174_MONEDA,',
'            		A.VALOR_CAMBIO,',
'            		NULL',
'            	)',
'            ) ANIO_2',
'        FROM SAF.REPORTES_FINANCIEROS_INTEGRO A',
'        WHERE A.TIPO_REPORTE = 5',
'        AND A.ID_PLANTILLA_NOTA = 284',
'        AND (A.ANIO = :P174_ANIO OR A.ANIO = :P174_ANIO_MENOS_1)',
'        AND A.MES_INICIO = 1',
'        AND A.MES_FIN = :P174_MES_FINAL',
'        AND A.CODIGO_EMPRESA IN',
'        (',
'             SELECT ',
'                REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'            FROM ',
'                dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'        )), 0)',
'	)) ANIO_2,',
'    ''TOTAL'' AS TIPO,',
'    ''font-weight: bold;'' AS CLASE,',
'    NULL ID_NOTA_NUM,',
'    :P174_SIMBOLO_MONEDA SIMBOLO_MONEDA',
'FROM SAF.PLANTILLA_ASIGNACION_NOTAS A',
'LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ',
'	ON B.ID_PLANTILLA = A.ID AND B.VERSION = :P174_VERSION',
'LEFT JOIN SAF.CON_DETALLE_PLANTILLA_NOTAS C ',
'	ON C.ID_PLANTILLA = B.ID_NOTA',
'	AND C.VERSION = B.VERSION',
'WHERE A.TIPO_REPORTE = 5',
'AND A.ID = 284',
'GROUP BY A.NOMBRE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P174_ANIO,P174_MES_FINAL,P174_VERSION,P174_SIMBOLO_MONEDA,P174_MONEDA,P174_MES_INICIO,P174_ANIO_MENOS_1,P174_VECTOR_EMPRESA,P174_EMPRESA'
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
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2064175594077803124)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>2064175594077803124
);
end;
/
begin
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211516097176318040)
,p_db_column_name=>'NOMBRE'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Descripcion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="padding-left:0; display:inline-block; white-space:nowrap; width:calc(100%); overflow: hidden; white-space: normal; #CLASE#">  ',
'    #NOMBRE#',
'</span>',
'',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="ID_NOTA" type="hidden" value="#ID_NOTA_NUM#">',
'<input id="TIPO" type="hidden" value="#TIPO#">',
'<input id="COD_CTA" type="hidden" value="#COD_CTA#">'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'NOMBRE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211516435256318041)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211516809281318042)
,p_db_column_name=>'COD_CTA'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Cod Cta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211517255544318043)
,p_db_column_name=>'ORDEN_1'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Orden 1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211517662814318043)
,p_db_column_name=>'ORDEN_2'
,p_display_order=>60
,p_column_identifier=>'L'
,p_column_label=>'Orden 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211518049209318044)
,p_db_column_name=>'ANIO_1'
,p_display_order=>80
,p_column_identifier=>'T'
,p_column_label=>'&P174_ANIO.'
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
 p_id=>wwv_flow_imp.id(211518480560318045)
,p_db_column_name=>'ANIO_2'
,p_display_order=>90
,p_column_identifier=>'U'
,p_column_label=>'&P174_ANIO_MENOS_1.'
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
 p_id=>wwv_flow_imp.id(211518804117318046)
,p_db_column_name=>'TIPO'
,p_display_order=>100
,p_column_identifier=>'V'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211519294871318046)
,p_db_column_name=>'CLASE'
,p_display_order=>110
,p_column_identifier=>'W'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211519669995318047)
,p_db_column_name=>'ID_NOTA_NUM'
,p_display_order=>120
,p_column_identifier=>'X'
,p_column_label=>'Id Nota Num'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211515640967318040)
,p_db_column_name=>'ID_NOTA'
,p_display_order=>130
,p_column_identifier=>'Y'
,p_column_label=>'Nota'
,p_column_type=>'STRING'
,p_static_id=>'ID_NOTA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211515288669318039)
,p_db_column_name=>'BOTON'
,p_display_order=>140
,p_column_identifier=>'AA'
,p_column_label=>'Boton'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211514872475318038)
,p_db_column_name=>'SIMBOLO_MONEDA'
,p_display_order=>150
,p_column_identifier=>'AB'
,p_column_label=>'Simbolo Moneda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2064767874822121359)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'1834497'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'NOMBRE:ID_NOTA:ANIO_1:ANIO_2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(211505835679318019)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(1859133054404397948)
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
 p_id=>wwv_flow_imp.id(211506227919318020)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(1859133054404397948)
,p_button_name=>'REPORTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Reporte'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P174_EMPRESA IS NOT NULL AND',
':P174_MES_INICIO IS NOT NULL AND',
':P174_MES_FINAL IS NOT NULL AND',
':P174_ANIO IS NOT NULL AND',
':P174_VERSION IS NOT NULL AND',
':P174_MONEDA IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_button_cattributes=>'style="margin-top:30px"; data-menu="LISTA_DESCARGAS_menu"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(211554024545318090)
,p_branch_name=>'CARGAR_DATOS'
,p_branch_action=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:174:P174_MES_INICIO,P174_MES_FINAL,P174_ANIO,P174_VERSION,P174_MONEDA,P174_EMPRESA,P174_VECTOR_EMPRESA:&P174_MES_INICIO.,&P174_MES_FINAL.,&P174_ANIO.,&P174_VERSION.,&P174_MONEDA.,&P174_EMPRESA.,&P174_VECTOR_EMPRESA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CARGAR_DATOS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(206940110800982126)
,p_name=>'P174_COD_CTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2064174379040803112)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211506602001318021)
,p_name=>'P174_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
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
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(211507033391318022)
,p_name=>'P174_MES_INICIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211507497116318022)
,p_name=>'P174_MES_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
,p_prompt=>'Mes Final'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'GRAL_MESES'
,p_lov=>'.'||wwv_flow_imp.id(105398202110893169)||'.'
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
 p_id=>wwv_flow_imp.id(211507891855318023)
,p_name=>'P174_ANIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
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
 p_id=>wwv_flow_imp.id(211508268875318024)
,p_name=>'P174_VERSION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
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
 p_id=>wwv_flow_imp.id(211508687776318024)
,p_name=>'P174_MONEDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
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
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211509074257318025)
,p_name=>'P174_ANIO_MENOS_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211509470220318025)
,p_name=>'P174_NOMBRE_TITULO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211509893165318026)
,p_name=>'P174_FECHA_TITULO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211510252448318027)
,p_name=>'P174_NOMBRE_MONEDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211510667834318027)
,p_name=>'P174_SIMBOLO_MONEDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211511056611318028)
,p_name=>'P174_VECTOR_EMPRESA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(1859133054404397948)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211512009419318030)
,p_name=>'P174_ID_NOTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2064174379040803112)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211512401347318031)
,p_name=>'P174_ID_REGISTRO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2064174379040803112)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211512885238318031)
,p_name=>'P174_TIPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2064174379040803112)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211513204351318032)
,p_name=>'P174_URL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2064174379040803112)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211526743930318064)
,p_name=>'P174_JASPER'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211527180896318064)
,p_name=>'P174_AUTENTICATION'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211527581269318065)
,p_name=>'P174_DIA_FIN'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211527905411318065)
,p_name=>'P174_CODIGO_USUARIO'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211528302078318065)
,p_name=>'P174_PERMISOS'
,p_item_sequence=>70
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211551552584318088)
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
 p_id=>wwv_flow_imp.id(211552553822318089)
,p_event_id=>wwv_flow_imp.id(211551552584318088)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID_NOTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_NOTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211553032272318089)
,p_event_id=>wwv_flow_imp.id(211551552584318088)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211553553773318090)
,p_event_id=>wwv_flow_imp.id(211551552584318088)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_TIPO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206940204020982127)
,p_event_id=>wwv_flow_imp.id(211551552584318088)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'COD_CTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_COD_CTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=COD_CTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211552096708318088)
,p_event_id=>wwv_flow_imp.id(211551552584318088)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "EDITAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P174_ID_NOTA'').getValue() != '''') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "VER_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "CREAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P174_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                return false;',
'            }',
'        }',
'    },',
'    "ELIMINAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P174_ID_NOTA'').getValue() != '''') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "ASOCIAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P174_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                return false;',
'            }',
'        }',
'    }',
'};'))
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P174_TIPO'').getValue() == ''DETALLE'''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(206940071090982125)
,p_event_id=>wwv_flow_imp.id(211551552584318088)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'MENU_DETALLE_PRESTAMO'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "EDITAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "VER_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return false;',
'        }',
'    },',
'    "CREAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "ELIMINAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "ASOCIAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    },',
'    "MODIFICAR_NOMBRE": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            return true;',
'        }',
'    }',
'};'))
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P174_TIPO'').getValue() == ''DETALLE_PRESTAMO'''
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211532315176318071)
,p_name=>'EDITAR_NOTAS_PASIVO'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#PASIVO td'
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
 p_id=>wwv_flow_imp.id(211532883878318072)
,p_event_id=>wwv_flow_imp.id(211532315176318071)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID_NOTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_ID_NOTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_NOTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211533316230318073)
,p_event_id=>wwv_flow_imp.id(211532315176318071)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211533858139318073)
,p_event_id=>wwv_flow_imp.id(211532315176318071)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'TIPO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_TIPO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211534306738318073)
,p_event_id=>wwv_flow_imp.id(211532315176318071)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'MENU_EDICION_NOTA'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'EDITAR_NOTA'
,p_attribute_02=>'OMB:SEP'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return {',
'    "EDITAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P174_ID_NOTA'').getValue() != '''' && apex.item(''P174_ID_REGISTRO'').getValue() != ''25'') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "VER_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P174_ID_NOTA'').getValue() != '''' && apex.item(''P174_ID_REGISTRO'').getValue() != ''25'') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "CREAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P174_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                if (apex.item(''P174_ID_REGISTRO'').getValue() == ''25'') {',
'                    return true;',
'                } else {',
'                    return false;',
'                }',
'            }',
'        }',
'    },',
'    "ELIMINAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P174_ID_NOTA'').getValue() != '''' && apex.item(''P174_ID_REGISTRO'').getValue() != ''25'') {',
'                return false;',
'            } else {',
'                return true;',
'            }',
'        }',
'    },',
'    "ASOCIAR_NOTA": {',
'        "hide": function( pMenuOptions, pEntry ) {',
'            if (apex.item(''P174_ID_NOTA'').getValue() != '''') {',
'                return true;',
'            } else {',
'                if (apex.item(''P174_ID_REGISTRO'').getValue() == ''25'') {',
'                    return true;',
'                } else {',
'                    return false;',
'                }',
'            }',
'        }',
'    }',
'};'))
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item(''P174_TIPO'').getValue() == ''DETALLE'' /*&& $(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value != 25*/'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211534774773318074)
,p_name=>'EDITAR_NOTA'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P174_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'EDITAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211535205573318074)
,p_event_id=>wwv_flow_imp.id(211534774773318074)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID,P158_ID_ASOCIACION:''||',
'        :P174_ID_NOTA || '','' || :P174_ID_REGISTRO,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P174_URL',
'FROM DUAL;'))
,p_attribute_02=>'P174_ID_NOTA,P174_ID_REGISTRO'
,p_attribute_03=>'P174_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211535751234318075)
,p_event_id=>wwv_flow_imp.id(211534774773318074)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P174_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211536138379318075)
,p_name=>'CREAR_NOTA'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P174_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CREAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211536681577318075)
,p_event_id=>wwv_flow_imp.id(211536138379318075)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=&APP_ID.:158:&APP_SESSION.::NO:158:P158_ID_ASOCIACION,P158_CTA_VERSION:''|| :P174_ID_REGISTRO || '','' || :P174_VERSION,',
'    p_triggering_element => ''apex.jQuery(''''#BALANCE_SITUACION_FINANCIERA'''')'' ) url ',
'into :P174_URL',
'FROM DUAL;'))
,p_attribute_02=>'P174_ID_REGISTRO,P174_VERSION'
,p_attribute_03=>'P174_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211537131413318076)
,p_event_id=>wwv_flow_imp.id(211536138379318075)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P174_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211537525274318076)
,p_name=>'REFRESH_REPORTE'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211538051659318076)
,p_event_id=>wwv_flow_imp.id(211537525274318076)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ACTIVOS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2064175493682803123)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211538950744318077)
,p_name=>'ELIMINAR_NOTA'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P174_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ELIMINAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211539458143318078)
,p_event_id=>wwv_flow_imp.id(211538950744318077)
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
'WHERE ID = :P174_ID_REGISTRO',
'AND TIPO_REPORTE = 1;*/',
'',
'DELETE FROM SAF.ASOCIACION_PLANTILLA_NOTA_VERSION',
'WHERE ID_PLANTILLA = :P174_ID_REGISTRO',
'AND VERSION = :P174_VERSION;'))
,p_attribute_02=>'P174_ID_REGISTRO,P174_VERSION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211539910243318078)
,p_event_id=>wwv_flow_imp.id(211538950744318077)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_ASIGNACION'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_ID_NOTA,P174_ID_REGISTRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211540483238318078)
,p_event_id=>wwv_flow_imp.id(211538950744318077)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_ACTIVO'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2064175493682803123)
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211541394956318079)
,p_name=>'GENERAR_DATOS'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(211505835679318019)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P174_EMPRESA'').getValue() != '''' &&',
'apex.item(''P174_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P174_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P174_ANIO'').getValue() != '''' &&',
'apex.item(''P174_VERSION'').getValue() != '''' &&',
'apex.item(''P174_MONEDA'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211541882580318080)
,p_event_id=>wwv_flow_imp.id(211541394956318079)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR VECTOR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_VECTOR IS',
'        SELECT',
'            COUNT(*) CONTADOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P174_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P174_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
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
'            REGEXP_SUBSTR(:P174_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P174_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
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
'    :P174_VECTOR_EMPRESA := V_VECTOR;',
'END;'))
,p_attribute_02=>'P174_EMPRESA'
,p_attribute_03=>'P174_VECTOR_EMPRESA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211542342521318080)
,p_event_id=>wwv_flow_imp.id(211541394956318079)
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
 p_id=>wwv_flow_imp.id(211542801346318081)
,p_event_id=>wwv_flow_imp.id(211541394956318079)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR_DATOS'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211543274900318081)
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
 p_id=>wwv_flow_imp.id(211543766533318081)
,p_event_id=>wwv_flow_imp.id(211543274900318081)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let mesInicio = apex.item("P174_MES_INICIO").getValue();',
'let mesFin = apex.item(''P174_MES_FINAL'').getValue();',
'let anio = apex.item(''P174_ANIO'').getValue();',
'let nota = apex.item(''P174_ID_REGISTRO'').getValue();',
'let moneda = apex.item(''P174_MONEDA'').getValue();',
'let version = apex.item(''P174_VERSION'').getValue();',
'let cod_cta = apex.item(''P174_COD_CTA'').getValue();',
'let vector = apex.item(''P174_VECTOR_EMPRESA'').getValue();',
'',
'var url = `f?p=&APP_ID.:176:&APP_SESSION.::NO:176:P176_MONEDA,P176_FECHA_INICIO,P176_FECHA_FIN,P176_ANIO,P176_NOTA,P176_VERSION,P176_COD_CTA,P176_EMPRESA:${moneda},${mesInicio},${mesFin},${anio},${nota},${version},${cod_cta},${vector}`;',
'apex.server.process("PREPARE_URL", {',
'    x01: url',
'}, {',
'success: function(pData) {',
'    if (pData.success === true) {',
'        //console.log(pData.url);',
'        apex.navigation.redirect(pData.url);',
'    }',
'},',
'error: function(request, status, error) {',
unistr('    console.log("status---" + status + " error----"\00A0+\00A0error);'),
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211544158890318082)
,p_name=>'ASOCIAR_NOTA'
,p_event_sequence=>110
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P174_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ASOCIAR_NOTA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211544507560318082)
,p_event_id=>wwv_flow_imp.id(211544158890318082)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P174_ID_REGISTRO'').getValue();',
'let version = apex.item(''P174_VERSION'').getValue();',
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
 p_id=>wwv_flow_imp.id(211544920506318082)
,p_name=>'MODIFICAR_RENGLON'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P174_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODIFICAR_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211545427860318083)
,p_event_id=>wwv_flow_imp.id(211544920506318082)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P174_ID_REGISTRO'').getValue();',
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
 p_id=>wwv_flow_imp.id(211545831104318083)
,p_name=>'IMPRIMIR_REPORTE'
,p_event_sequence=>130
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P174_EMPRESA'').getValue() != '''' &&',
'apex.item(''P174_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P174_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P174_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_REPORTE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211546871067318084)
,p_event_id=>wwv_flow_imp.id(211545831104318083)
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
 p_id=>wwv_flow_imp.id(250264783475485622)
,p_event_id=>wwv_flow_imp.id(211545831104318083)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_USUARIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_CODIGO_USUARIO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':GLOBAL_CODIGO_USUARIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(250264836427485623)
,p_event_id=>wwv_flow_imp.id(211545831104318083)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_EMPRESA'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_EMPRESA IS',
'        SELECT ',
'            REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL;',
'BEGIN',
'    DELETE FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'        WHERE TIPO_REPORTE = 92',
'        AND USUARIO_GRABACION = :GLOBAL_CODIGO_USUARIO;',
'',
'    FOR R_EMPRESA IN C_EMPRESA',
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
'            92,',
'            R_EMPRESA.CODIGO,',
'            ''EMPRESA PARA JASPER'',',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        );',
'    END LOOP;',
'END;'))
,p_attribute_02=>'P174_VECTOR_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211546339119318084)
,p_event_id=>wwv_flow_imp.id(211545831104318083)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/PRESTAMOS_BANCARIOS.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P174_JASPER,:P174_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P174_JASPER,P174_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211547384015318084)
,p_event_id=>wwv_flow_imp.id(211545831104318083)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P174_JASPER" ).getValue() +',
'    "&P_MES="+ apex.item( "P174_MES_FINAL" ).getValue() +',
'    "&P_ANIO=" + apex.item( "P174_ANIO" ).getValue() +',
'    "&P_MONEDA="+ apex.item( "P174_MONEDA" ).getValue() +',
'    "&P_VERSION=" + apex.item( "P174_VERSION" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P174_CODIGO_USUARIO" ).getValue() +',
'    apex.item( "P174_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211547756416318085)
,p_name=>'CALCULAR_DIA_FIN'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_MES_FINAL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211548255694318085)
,p_event_id=>wwv_flow_imp.id(211547756416318085)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DIA'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'SELECT TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P174_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'') INTO :P174_DIA_FIN FROM DUAL;'
,p_attribute_02=>'P174_MES_FINAL'
,p_attribute_03=>'P174_DIA_FIN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211548623100318085)
,p_name=>'IMPRIMIR_NOTAS'
,p_event_sequence=>150
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P174_EMPRESA'').getValue() != '''' &&',
'apex.item(''P174_MES_INICIO'').getValue() != '''' &&',
'apex.item(''P174_MES_FINAL'').getValue() != '''' &&',
'apex.item(''P174_ANIO'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'IMPRIMIR_NOTAS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211549179065318086)
,p_event_id=>wwv_flow_imp.id(211548623100318085)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_NOTAS'
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
'    DELETE FROM SAF.CON_NOTAS_DETALLE_JASPER WHERE TIPO_REPORTE = 1 AND USUARIO_GRABACION = :GLOBAL_CODIGO_USUARIO;',
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
'                1,',
'                :GLOBAL_CODIGO_USUARIO,',
'                SYSDATE',
'            );',
'    END LOOP;',
'END;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211549600533318086)
,p_event_id=>wwv_flow_imp.id(211548623100318085)
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
 p_id=>wwv_flow_imp.id(211550142702318087)
,p_event_id=>wwv_flow_imp.id(211548623100318085)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/Balance_Situacion_Financiera_Notas.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P174_JASPER,:P174_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P174_JASPER,P174_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211550609899318087)
,p_event_id=>wwv_flow_imp.id(211548623100318085)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_USUARIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P174_CODIGO_USUARIO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':GLOBAL_CODIGO_USUARIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211551162637318088)
,p_event_id=>wwv_flow_imp.id(211548623100318085)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P174_JASPER" ).getValue() +',
'    "&P_CODIGO_EMPRESA="+ apex.item( "P174_EMPRESA" ).getValue() +',
'    "&P_FECHA_INICIO=" + apex.item( "P174_DIA_FIN" ).getValue() +',
'    "&P_MES_INICIO="+ apex.item( "P174_MES_FINAL" ).getValue() +',
'    "&P_ANIO=" + apex.item( "P174_ANIO" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P174_CODIGO_USUARIO" ).getValue() +',
'    "&P_TIPO_PARAMETRO=" + "1" +',
'    apex.item( "P174_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(211529102678318066)
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
 p_id=>wwv_flow_imp.id(211531909044318071)
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
'    :P174_PERMISOS := 0;',
'    --:P174_EMPRESA := 0;',
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
'                :P174_PERMISOS := 1;',
'            END IF;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(211528777605318066)
,p_process_sequence=>40
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
'            REGEXP_SUBSTR(:P174_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P174_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
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
'            LISTAGG(CODIGO_DIVISION, ''|'') INTO V_VECTOR',
'        FROM',
'        (',
'        SELECT ',
'            REGEXP_SUBSTR(:P174_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P174_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        );',
'    ELSE',
'        SELECT',
'	        LISTAGG(DISTINCT CODIGO_EMPRESA, ''|'') INTO V_VECTOR',
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
'    :P174_VECTOR_EMPRESA := V_VECTOR;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P174_MES_INICIO IS NOT NULL AND',
':P174_MES_FINAL IS NOT NULL AND',
':P174_ANIO IS NOT NULL AND',
':P174_VERSION IS NOT NULL AND',
':P174_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(211531568513318070)
,p_process_sequence=>50
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
'            SELECT ',
'                REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_DIVISION',
'            FROM ',
'                dual CONNECT BY REGEXP_SUBSTR(:P174_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'        ); ',
'    ',
'    V_CONTADOR NUMBER := 0;',
'BEGIN',
'    OPEN C_VECTOR;',
'        FETCH C_VECTOR INTO V_CONTADOR;',
'    CLOSE C_VECTOR;',
'',
'    IF V_CONTADOR = 1 THEN',
'        :P174_NOMBRE_TITULO := SAF.FN_NOMBRE_EMPRESA(:P174_VECTOR_EMPRESA);',
'    ELSE',
'        :P174_NOMBRE_TITULO := ''AICSA CORP.'';',
'    END IF;',
'',
'    SELECT',
'        NOMBRE_MONEDA,',
'        SIMBOLO_MONEDA',
'        INTO ',
'        :P174_NOMBRE_MONEDA,',
'        :P174_SIMBOLO_MONEDA',
'    FROM SAF.GRAL_MONEDAS',
'    WHERE CODIGO_MONEDA = :P174_MONEDA;',
'',
'    :P174_ANIO_MENOS_1:= TO_NUMBER(:P174_ANIO) - 1;',
'',
'    :P174_FECHA_TITULO := '' Al mes de '' || TO_CHAR(TO_DATE(:P174_MES_FINAL, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' '' || :P174_ANIO || '' y '' || :P174_ANIO_MENOS_1;',
'',
'    :P174_DIA_FIN := TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P174_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P174_MES_INICIO IS NOT NULL AND',
':P174_MES_FINAL IS NOT NULL AND',
':P174_ANIO IS NOT NULL AND',
':P174_VERSION IS NOT NULL AND',
':P174_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(211530720349318069)
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
