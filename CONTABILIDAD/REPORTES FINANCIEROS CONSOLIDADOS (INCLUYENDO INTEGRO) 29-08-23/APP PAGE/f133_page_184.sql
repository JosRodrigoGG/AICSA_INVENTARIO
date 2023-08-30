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
--     PAGE: 184
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00184
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>184);
end;
/
prompt --application/pages/page_00184
begin
wwv_flow_imp_page.create_page(
 p_id=>184
,p_name=>'REPORTE_EERR_COST_X_UN'
,p_alias=>'REPORTE-EERR-COST-X-UN'
,p_step_title=>'REPORTE_EERR_COST_X_UN'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js',
'#APP_FILES#PIVOT EERR CONSxUN.js',
'--#APP_FILES#clientSidePdf.js',
'#WORKSPACE_FILES#html2pdf.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var $wP;',
'',
'async function cargarDatos() {',
'    $(''#REPORTE'').hide();',
'',
'    setTimeout(function(){',
'        $wP = apex.widget.waitPopup();',
'    }, 10);',
'',
'    var url;',
'    var respuesta;',
'    const nombres = [''Margen Bruto'',''Resultados En Operacion'', ''Resultado'', ''EBITDA'', ''Resultados Antes de Otros Ingresos y Gastos'', ''Resultados Antes de Impuestos''];',
'    const ids = [''3'',''5'',''7'',''10'',''12'',''16''];',
'    const meses = {',
'        1: "Enero", 2: "Febrero", 3: "Marzo", 4: "Abril", 5: "Mayo", 6: "Junio",',
'        7: "Julio", 8: "Agosto", 9: "Septiembre", 10: "Octubre", 11: "Noviembre", 12: "Diciembre",',
'        13: "Acumulado", 14: "%", 24: "Otros Ingresos \ny Gastos", 25: "Corporacion AICSA / \nProyectos AICSA / \nAICSA Business Corp",',
'        26: "Otras Unidades \nde Negocio", 27: "Sub Total Integro, \nCentros Comerciales, \nInmobiliario y Retail", 28: "ERROR",',
'        29: "Consolidado", 30: "%", 31: "Eliminaciones", 32: "Sub Total", 33: "%"',
'    };',
'    const blods = [7,9,11,14,16,20];',
'',
'    let mes_inicio = apex.item(''P184_MES_INICIAL'').getValue();',
'    let mes_fin = apex.item(''P184_MES_FINAL'').getValue();',
'    let anio = apex.item(''P184_ANIO'').getValue();',
'    let moneda = apex.item(''P184_MONEDA'').getValue();',
'    let version = apex.item(''P184_VERSION'').getValue();',
'',
'    try {',
'        url = await fetch(`https://saf.aicsacorp.com/ords/safws/reporte/eerr/consxun/${mes_inicio}/${mes_fin}/${anio}/${moneda}/${version}`);',
'        respuesta = await url.json();',
'',
'        $( document ).ready( function () {',
'            $( "#REPORTE_EERR" ).pivot({',
'                data: respuesta.items,',
'                agg: ',
'                [',
'                    {',
'                        index: "valor",',
'                        func: "sum",',
'                        format: ',
'                            {',
'                                decimalPlaces: 2',
'                            }',
'                    }',
'                ],',
'                inactive: [ ],',
'                cols: [ "bloque", "codigo_division", "mes" ],',
'                rows: [ "id", "nombre" ],',
'                subtotals: false,',
'                totals: false,',
'                sort: { "id": { direction: "asc" } },',
'                labels:',
'                {',
'                    agg: "EERR Consolidado x Unidad",',
'                    inactive: "Reporte",',
'                    id: "No.",',
'                    nombre: "Renglon"',
'                },',
'                afterDraw : function () {',
'                    $(''[id="REPORTE"]'').each(function(index, elemento) {',
'                        $(elemento).find("tr").each(function(index) {',
'                            if (blods.includes($(this).index())) {',
'                                $(this).find("td").each(function(){',
'                                    $(this).css({',
'                                        "font-weight": "bold"',
'                                    });',
'                                });',
'                            }',
'                        });',
'                    });',
'',
'                    document.querySelectorAll(''[class="cell"]'').forEach(item => {',
'                        var contenido = item.textContent;',
'                        if (contenido.includes(''.-'') || contenido.includes(''-,'')) {',
'                            contenido = contenido.replace(''.-'', ''.'').replace(''-,'', '''');',
'                            item.textContent = ''-'' + contenido;',
'                        }',
'                    });',
'',
'                    $(''[index="nombre"]'').each(function(index, elemento) {',
'                        if (nombres.includes($(elemento).text())) {',
'                            $(elemento).css({',
'                                "font-weight": "bold"',
'                            });',
'                        }',
'                        $(elemento).css({',
'                            "text-align": "left"',
'                        });',
'                    });',
'',
'                    $(''[index="id"]'').each(function(index, elemento) {',
'                        if (ids.includes($(elemento).text())) {',
'                            $(elemento).css({',
'                                "font-weight": "bold"',
'                            });',
'                        }',
'                    });',
'',
'                    Array.from(document.getElementsByClassName(''TITULO_ENCABEZADO_COLUMNA'')).forEach(function(elemento) {',
'                        if (elemento.textContent == ''id'') {',
'                            elemento.textContent = ''No.'';',
'                        } else {',
'                            elemento.textContent = ''Descripcion'';',
'                        }',
'                    });',
'',
'                    Array.from(document.getElementsByClassName(''TITULO_AGRUPADOR_COLUMNA'')).forEach(function(elemento) {',
'                        elemento.textContent = '''';',
'                    });',
'',
'                    Array.from(document.getElementsByClassName(''ENCABEZADO_NOMBRE'')).forEach(async function(elemento) {',
'                        if (elemento.textContent != 34) {',
'                            elemento.style.background = ''black'';',
'                            elemento.style.color = ''white'';',
'                            elemento.style.fontWeight = ''bold'';',
'                        }',
'',
'                        if (elemento.textContent >= 1 && elemento.textContent <= 14 ||',
'                            elemento.textContent >= 24 && elemento.textContent <= 33) {',
'                            if (elemento.textContent == 24) {',
'                                elemento.setAttribute(''rowspan'', 2);',
'                            }',
'                            elemento.textContent = meses[elemento.textContent];',
'                        } else if (elemento.textContent >= 15 && elemento.textContent <= 23) {',
'                            elemento.style.display = ''none'';',
'                        } else if (elemento.textContent == 34) {',
'                            elemento.classList.remove("ui-pivot-dim");',
'                            elemento.classList.remove("ui-state-default");',
'                            elemento.textContent = '''';',
'                        } else if (elemento.textContent == 0.9) {',
'                            elemento.style.display = ''none'';',
'                        } else if (elemento.textContent.includes(''DIV'')) {',
'                            url = await fetch(`https://saf.aicsacorp.com/ords/safws/reporte/nombre/division/${elemento.textContent}`);',
'                            respuesta = await url.json();',
'                            elemento.textContent = respuesta.items[0].nombre;',
'                        }',
'                    });',
'                }',
'            });',
'        });',
'    } catch (err) {',
'        console.error(err);',
'    }',
'',
'    $(''#REPORTE'').show();',
'',
'    setTimeout(function(){',
'        $wP.remove()',
'    }, 1000);',
'}'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#saf-cssnew.css',
'#APP_FILES#PIVOT EERR CONSxUN#MIN#.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'table.ui-pivot td,',
'table.ui-pivot th {',
'    white-space: pre !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230829154719'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(226865883946637111)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(250265262046485627)
,p_plug_name=>'ZONA_REPORTE'
,p_region_name=>'ZONA_REPORTE'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(216560784323949627)
,p_plug_name=>'REPORTE'
,p_region_name=>'REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(250265262046485627)
,p_region_css_classes=>'pdf-Body'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'<div id="REPORTE_EERR"></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P184_MES_INICIAL IS NOT NULL AND',
':P184_MES_FINAL IS NOT NULL AND',
':P184_ANIO IS NOT NULL AND',
':P184_VERSION IS NOT NULL AND',
':P184_MONEDA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(250263017909485605)
,p_plug_name=>'ENCABEZADO'
,p_parent_plug_id=>wwv_flow_imp.id(250265262046485627)
,p_region_css_classes=>'pdf-Header'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:rigth;">AICSA CORP.</h4>',
unistr('<h5 style="text-align:rigth;">A\00F1o &P184_ANIO.</h5>'),
'<h5 style="text-align:rigth;">&P184_NOMBRE_MES_INICIO. a &P184_NOMBRE_MES_FIN.</h5>',
'<h5 style="text-align:rigth;">(Cifras Expresadas en &P184_NOMBRE_MONEDA.)</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P184_MES_INICIAL IS NOT NULL AND',
':P184_MES_FINAL IS NOT NULL AND',
':P184_ANIO IS NOT NULL AND',
':P184_VERSION IS NOT NULL AND',
':P184_MONEDA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(226866105103637114)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(226865883946637111)
,p_button_name=>'ACTUALIZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Actualizar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-retweet'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(226866241788637115)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(226865883946637111)
,p_button_name=>'REPORTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Reporte'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P184_MES_INICIAL IS NOT NULL AND',
':P184_MES_FINAL IS NOT NULL AND',
':P184_ANIO IS NOT NULL AND',
':P184_VERSION IS NOT NULL AND',
':P184_MONEDA IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(226867170936637124)
,p_branch_name=>'ACTUALIZAR'
,p_branch_action=>'f?p=&APP_ID.:184:&SESSION.::&DEBUG.:184:P184_MES_INICIAL,P184_MES_FINAL,P184_ANIO,P184_VERSION,P184_MONEDA:&P184_MES_INICIAL.,&P184_MES_FINAL.,&P184_ANIO.,&P184_VERSION.,&P184_MONEDA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'ACTUALIZAR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(226866020961637113)
,p_name=>'P184_ANIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(226865883946637111)
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
 p_id=>wwv_flow_imp.id(226866344804637116)
,p_name=>'P184_MES_INICIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(226865883946637111)
,p_prompt=>'Mes Inicial'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'GRAL_MESES'
,p_lov=>'.'||wwv_flow_imp.id(105398202110893169)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(226866455172637117)
,p_name=>'P184_MES_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(226865883946637111)
,p_prompt=>'Mes Final'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'GRAL_MESES'
,p_lov=>'.'||wwv_flow_imp.id(105398202110893169)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(226866798223637120)
,p_name=>'P184_VECTOR_DIVISION'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(226867265333637125)
,p_name=>'P184_VERSION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(226865883946637111)
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
 p_id=>wwv_flow_imp.id(226867332131637126)
,p_name=>'P184_MONEDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(226865883946637111)
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
 p_id=>wwv_flow_imp.id(250263109220485606)
,p_name=>'P184_NOMBRE_MES_FIN'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(250263328894485608)
,p_name=>'P184_NOMBRE_MES_INICIO'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(250263438758485609)
,p_name=>'P184_NOMBRE_MONEDA'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(216560845484949628)
,p_name=>'CARGAR_DATOS'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P184_MES_INICIAL IS NOT NULL AND',
':P184_MES_FINAL IS NOT NULL AND',
':P184_ANIO IS NOT NULL AND',
':P184_VERSION IS NOT NULL AND',
':P184_MONEDA IS NOT NULL'))
,p_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216560922825949629)
,p_event_id=>wwv_flow_imp.id(216560845484949628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'FUNCTION'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cargarDatos();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(226866860588637121)
,p_name=>'ACTUALIZAR'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(226866105103637114)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(226866907558637122)
,p_event_id=>wwv_flow_imp.id(226866860588637121)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ACTUALIZAR'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'ACTUALIZAR'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(250265372134485628)
,p_name=>'REPORTE'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(226866241788637115)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(250265455780485629)
,p_event_id=>wwv_flow_imp.id(250265372134485628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'IMPRIMIR_REPORTE'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var reporte = document.getElementById(''ZONA_REPORTE'');',
'var widthInInches = document.getElementById(''REPORTE_EERR'').scrollWidth;',
'var heightInInches = reporte.offsetHeight;',
'var margin = 0.5;',
'',
'importRegiontoDPF(''Reporte EERR CostxUn'', margin, widthInInches, heightInInches, ''ZONA_REPORTE'');'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(250263263408485607)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARAMETROS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P184_NOMBRE_MES_INICIO := TO_CHAR(TO_DATE(:P184_MES_INICIAL, ''MM''), ''Month'', ''nls_date_language=spanish'');',
':P184_NOMBRE_MES_FIN := TO_CHAR(TO_DATE(:P184_MES_FINAL, ''MM''), ''Month'', ''nls_date_language=spanish'');',
'',
'SELECT ',
'    NOMBRE_MONEDA',
'    INTO',
'    :P184_NOMBRE_MONEDA',
'FROM SAF.GRAL_MONEDAS ',
'WHERE CODIGO_MONEDA = :P184_MONEDA;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P184_MES_INICIAL IS NOT NULL AND',
':P184_MES_FINAL IS NOT NULL AND',
':P184_ANIO IS NOT NULL AND',
':P184_VERSION IS NOT NULL AND',
':P184_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(222336108420275552)
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
