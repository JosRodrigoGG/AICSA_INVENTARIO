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
--     PAGE: 84003
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84003
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84003);
end;
/
prompt --application/pages/page_84003
begin
wwv_flow_imp_page.create_page(
 p_id=>84003
,p_name=>'REPORTE_EERR_RESUMEN'
,p_alias=>'REPORTE-EERR-RESUMEN'
,p_step_title=>'REPORTE_EERR_RESUMEN'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js',
'#APP_FILES#PIVOT EERR CONSxUN.js',
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
'    const meses = {',
'        1: "Enero", 2: "Febrero", 3: "Marzo", 4: "Abril", 5: "Mayo", 6: "Junio",',
'        7: "Julio", 8: "Agosto", 9: "Septiembre", 10: "Octubre", 11: "Noviembre", 12: "Diciembre",',
'        13: "Acumulado", 14: "%"',
'    };',
'',
'    let mes_inicio = apex.item(''P84003_MES_INICIAL'').getValue();',
'    let mes_fin = apex.item(''P84003_MES_FINAL'').getValue();',
'    let anio = apex.item(''P84003_ANIO'').getValue();',
'    let moneda = apex.item(''P84003_MONEDA'').getValue();',
'    let version = apex.item(''P84003_VERSION'').getValue();',
'',
'    try {',
'        url = await fetch(`https://saf.aicsacorp.com/ords/safws/reporte/eerr/resumen/${mes_inicio}/${mes_fin}/${anio}/${moneda}/${version}`);',
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
'                cols: [ "mes" ],',
'                rows: [ "id", "nombre" ],',
'                subtotals: false,',
'                totals: false,',
'                sort: { "id": { direction: "asc" } },',
'                labels:',
'                {',
'                    agg: "Cuadro Resumen Resultados",',
'                    inactive: "Reporte",',
'                    id: "No.",',
'                    nombre: "Renglon"',
'                },',
'                totals: true,',
'                afterDraw : function () {',
'                    document.querySelectorAll(''[class="cell"]'').forEach(item => {',
'                        var contenido = item.textContent;',
'                        if (contenido.includes(''.-'') || contenido.includes(''-,'')) {',
'                            contenido = contenido.replace(''.-'', ''.'').replace(''-,'', '''');',
'                            item.textContent = ''-'' + contenido;',
'                        }',
'                    });',
'',
'                    document.querySelectorAll(''[class="ui-pivot-tot-cell"]'').forEach(item => {',
'                        var contenido = item.textContent;',
'                        if (contenido.includes(''.-'') || contenido.includes(''-,'')) {',
'                            contenido = contenido.replace(''.-'', ''.'').replace(''-,'', '''');',
'                            item.textContent = ''-'' + contenido;',
'                        }',
'                    });',
'',
'                    $(''[index="nombre"]'').each(function(index, elemento) {',
'                        $(elemento).css({',
'                            "text-align": "left"',
'                        });',
'                    });',
'',
'                    Array.from(document.getElementsByClassName(''TITULO_ENCABEZADO_COLUMNA'')).forEach(function(elemento) {',
'                        if (elemento.textContent == ''id'') {',
'                            elemento.textContent = ''No.'';',
'                        } else {',
'                            elemento.textContent = ''Unidad de Negocio'';',
'                        }',
'                    });',
'',
'                    Array.from(document.getElementsByClassName(''ENCABEZADO_NOMBRE'')).forEach(async function(elemento) {',
'                        if (elemento.textContent >= 1 && elemento.textContent <= 14) {',
'                            elemento.style.background = ''black'';',
'                            elemento.style.color = ''white'';',
'                            elemento.style.fontWeight = ''bold'';',
'                            ',
'                            elemento.textContent = meses[elemento.textContent];',
'                        }',
'                    });',
'                    ',
'                    Array.from(document.getElementsByClassName(''TITULO_AGRUPADOR_COLUMNA'')).forEach(function(elemento) {',
'                        elemento.textContent = '''';',
'                    });',
'',
'                    Array.from(document.getElementsByClassName(''ui-pivot-tot'')).forEach(function(elemento) {',
'                        if (elemento.colSpan == 1) {',
'                            elemento.style.background = ''black'';',
'                            elemento.style.color = ''white'';',
'                            elemento.style.fontWeight = ''bold'';',
'',
'                            elemento.textContent = ''Acumulado'';',
'                        } else {',
'                            elemento.style.background = ''white'';',
'                            elemento.style.color = ''black'';',
'                            elemento.style.fontWeight = ''bold'';',
'                            ',
'                            elemento.textContent = ''Utilidad'';',
'                        }',
'                    });',
'',
'                    Array.from(document.getElementsByClassName(''ui-pivot-tot-cell'')).forEach(function(elemento) {',
'                        elemento.classList.remove(''ui-pivot-tot-cell'');',
'                        elemento.classList.add(''cell-total-table'');',
'                    });',
'',
'                    Array.from(document.getElementsByClassName(''cell'')).forEach(function(elemento) {',
'                        if (elemento.textContent.includes(''-'')) {',
'                            elemento.style.color = ''red'';',
'                            elemento.textContent = ''('' + elemento.textContent.replace(''-'','''') + '')'';',
'                        }',
'                    });',
'',
'                    Array.from(document.getElementsByClassName(''cell-total-table'')).forEach(function(elemento) {',
'                        if (elemento.textContent.includes(''-'')) {',
'                            elemento.style.color = ''red'';',
'                            elemento.textContent = ''('' + elemento.textContent.replace(''-'','''') + '')'';',
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
'}',
'',
'.cell-total-table {',
'    text-align: right !important;',
'    //background: #ffff !important;',
'    padding: 1px 2px;',
'    border: 1px solid #bebebe;',
'    font-weight: bold;',
'}',
'',
'table.ui-pivot th.cell-total-table:hover {',
'    background: rgb(213, 227, 246);',
'    border-color: #bebebe;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230829160322'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(250265913013485634)
,p_plug_name=>'ZONA_REPORTE'
,p_region_name=>'ZONA_REPORTE'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(250264006595485615)
,p_plug_name=>'ENCABEZADO'
,p_parent_plug_id=>wwv_flow_imp.id(250265913013485634)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:rigth;">AICSA CORP.</h4>',
'<h5 style="text-align:rigth;">Cuadro Resumen Resultados</h5>',
unistr('<h5 style="text-align:rigth;">A\00F1o &P84003_ANIO.</h5>'),
'<h5 style="text-align:rigth;">(Cifras Expresadas en &P84003_NOMBRE_MONEDA.)</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84003_MES_INICIAL IS NOT NULL AND',
':P84003_MES_FINAL IS NOT NULL AND',
':P84003_ANIO IS NOT NULL AND',
':P84003_VERSION IS NOT NULL AND',
':P84003_MONEDA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(465440731218968076)
,p_plug_name=>'REPORTE'
,p_region_name=>'REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(250265913013485634)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'<div id="REPORTE_EERR"></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84003_MES_INICIAL IS NOT NULL AND',
':P84003_MES_FINAL IS NOT NULL AND',
':P84003_ANIO IS NOT NULL AND',
':P84003_VERSION IS NOT NULL AND',
':P84003_MONEDA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(475745830841655560)
,p_plug_name=>'PARAMETROS'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(248881232289018456)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(475745830841655560)
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
 p_id=>wwv_flow_imp.id(248880853500018455)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(475745830841655560)
,p_button_name=>'REPORTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Reporte'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84003_MES_INICIAL IS NOT NULL AND',
':P84003_MES_FINAL IS NOT NULL AND',
':P84003_ANIO IS NOT NULL AND',
':P84003_VERSION IS NOT NULL AND',
':P84003_MONEDA IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_button_cattributes=>'style="margin-top:30px"'
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(248886339265018464)
,p_branch_name=>'ACTUALIZAR'
,p_branch_action=>'f?p=&APP_ID.:84003:&SESSION.::&DEBUG.:84003:P84003_MES_INICIAL,P84003_MES_FINAL,P84003_ANIO,P84003_VERSION,P84003_MONEDA:&P84003_MES_INICIAL.,&P84003_MES_FINAL.,&P84003_ANIO.,&P84003_VERSION.,&P84003_MONEDA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'ACTUALIZAR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(248881634977018456)
,p_name=>'P84003_MES_INICIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(475745830841655560)
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
 p_id=>wwv_flow_imp.id(248882092787018457)
,p_name=>'P84003_MES_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(475745830841655560)
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
 p_id=>wwv_flow_imp.id(248882490087018458)
,p_name=>'P84003_ANIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(475745830841655560)
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
 p_id=>wwv_flow_imp.id(248882876524018458)
,p_name=>'P84003_VERSION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(475745830841655560)
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
 p_id=>wwv_flow_imp.id(248883279054018459)
,p_name=>'P84003_MONEDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(475745830841655560)
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
 p_id=>wwv_flow_imp.id(248883662038018460)
,p_name=>'P84003_VECTOR_DIVISION'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(250264189163485616)
,p_name=>'P84003_NOMBRE_MONEDA'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248885332702018462)
,p_name=>'CARGAR_DATOS'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84003_MES_INICIAL IS NOT NULL AND',
':P84003_MES_FINAL IS NOT NULL AND',
':P84003_ANIO IS NOT NULL AND',
':P84003_VERSION IS NOT NULL AND',
':P84003_MONEDA IS NOT NULL'))
,p_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248885849978018463)
,p_event_id=>wwv_flow_imp.id(248885332702018462)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'FUNCTION'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cargarDatos();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248884471436018461)
,p_name=>'ACTUALIZAR'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(248881232289018456)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248884927747018462)
,p_event_id=>wwv_flow_imp.id(248884471436018461)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ACTUALIZAR'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'ACTUALIZAR'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(250266026945485635)
,p_name=>'REPORTE'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(248880853500018455)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(250266160861485636)
,p_event_id=>wwv_flow_imp.id(250266026945485635)
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
'importRegiontoDPF(''Reporte EERR consolidado'', margin, widthInInches, heightInInches, ''ZONA_REPORTE'');'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(250264219915485617)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARAMETROS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    NOMBRE_MONEDA',
'    INTO',
'    :P84003_NOMBRE_MONEDA',
'FROM SAF.GRAL_MONEDAS ',
'WHERE CODIGO_MONEDA = :P84003_MONEDA;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84003_MES_INICIAL IS NOT NULL AND',
':P84003_MES_FINAL IS NOT NULL AND',
':P84003_ANIO IS NOT NULL AND',
':P84003_VERSION IS NOT NULL AND',
':P84003_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(248884092198018460)
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
