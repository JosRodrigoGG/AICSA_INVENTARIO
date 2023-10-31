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
--   Date and Time:   08:42 Thursday September 28, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 84006
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84006
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84006);
end;
/
prompt --application/pages/page_84006
begin
wwv_flow_imp_page.create_page(
 p_id=>84006
,p_name=>'MODAL_SOLICITUD_TRANFERENCIAS_FINANCIERAS'
,p_alias=>'MODAL-SOLICITUD-TRANFERENCIAS-FINANCIERAS'
,p_page_mode=>'MODAL'
,p_step_title=>'MODAL_SOLICITUD_TRANFERENCIAS_FINANCIERAS'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#crear-btns-modal.js',
'--#WORKSPACE_FILES#reportes/convertir_IR_to_treeview#MIN#.js',
'--#WORKSPACE_FILES#jquery.treetable_last.js',
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const $btns = [',
'    {',
'        textBtn: ''Guardar'',',
'        icon: ''fa-save'',',
'        idbtn: ''GUARDAR'',',
'        itemCondicional: ''P84006_ACCION_MODAL'',',
'        condicional: ''CREAR''',
'    },',
'    {',
'        textBtn: ''Flujo'',',
'        icon: ''fa-workflow'',',
'        idbtn: ''FLUJO_BT_1'',',
'        itemCondicional: ''P84006_ACCION_MODAL'',',
'        condicional: ''CREAR''',
'    },',
'    {',
'        textBtn: ''Guardar'',',
'        icon: ''fa-save-as'',',
'        idbtn: ''MODIFICAR'',',
'        itemCondicional: ''P84006_ACCION_MODAL'',',
'        condicional: ''MODIFICAR_SOLICITUD''',
'    },',
'    {',
'        textBtn: ''Flujo'',',
'        icon: ''fa-workflow'',',
'        idbtn: ''FLUJO_BT_2'',',
'        itemCondicional: ''P84006_ACCION_MODAL'',',
'        condicional: ''MODIFICAR_SOLICITUD''',
'    },',
'    {',
'        textBtn: ''Revisar'',',
'        icon: ''fa-clipboard-search'',',
'        idbtn: ''ACEPTAR_REVISAR_BTN'',',
'        itemCondicional: ''P84006_ACCION_MODAL'',',
'        condicional: ''ACEPTAR_REVISION''',
'    },',
'    {',
'        textBtn: ''Guardar'',',
'        icon: ''fa-save-as'',',
'        idbtn: ''MODIFICAR'',',
'        itemCondicional: ''P84006_ACCION_MODAL'',',
'        condicional: ''REVISAR_SOLICITUD''',
'    },',
'    {',
'        textBtn: ''Flujo'',',
'        icon: ''fa-workflow'',',
'        idbtn: ''FLUJO_BT_3'',',
'        itemCondicional: ''P84006_ACCION_MODAL'',',
'        condicional: ''REVISAR_SOLICITUD''',
'    },',
'    {',
'        textBtn: ''Aprobar'',',
'        icon: ''fa-clipboard-search'',',
'        idbtn: ''ACEPTAR_APROBACION'',',
'        itemCondicional: ''P84006_ACCION_MODAL'',',
'        condicional: ''ACEPTAR_APROBACION''',
'    },',
'    {',
'        textBtn: ''Flujo'',',
'        icon: ''fa-workflow'',',
'        idbtn: ''FLUJO_BT_4'',',
'        itemCondicional: ''P84006_ACCION_MODAL'',',
'        condicional: ''APROBAR_SOLICITUD''',
'    },',
'    {',
'        textBtn: ''Cancelar'',',
'        icon: ''fa-remove'',',
'        idbtn: ''CANCELAR'',',
'    }',
']',
'',
'const $validar_inversion = [',
'    ''P84006_CODIGO_EMPRESA'',',
'    ''P84006_TIPO_DESTINATARIO'',',
'    ''P84006_ID_ASOCIACION'',',
'    ''P84006_CODIGO_MONEDA'',',
'    ''P84006_MONTO_ORIGEN'',',
'    ''P84006_OBSERVACIONES''',
'];',
'',
'const $validar_prestamo = [',
'    ''P84006_CODIGO_EMPRESA'',',
'    ''P84006_TIPO_DESTINATARIO'',',
'    ''P84006_ID_ASOCIACION'',',
'    ''P84006_CODIGO_MONEDA'',',
'    ''P84006_MONTO_ORIGEN'',',
'    ''P84006_OBSERVACIONES'',',
'    ''P84006_TIPO_PRESTAMO'',',
'    ''P84006_MEDIDA_PLAZO'',',
'    ''P84006_PLAZO'',',
'    ''P84006_TIPO_TASA'',',
'    ''P84006_TASA_INTERES'',',
'    //''P84006_FECHA_COBRO'',',
'    ''P84006_TIPO_COBRO_MORA''',
'];',
'',
'const $validar_movimiento = [',
'    ''P84006_FECHA_DOCUMENTO_P'',',
'    ''P84006_CODMAE_P'',',
'    ''P84006_TIPO_TRANSACCION_P'',',
'    ''P84006_SERIE_P'',',
'    ''P84006_NUMDOC_P'',',
'    ''P84006_NROSOLCHE_P'',',
'    ''P84006_ID_CUENTA_P'',',
'    ''P84006_CODIGO_OPERACION_P'',',
'    ''P84006_CONCEPTO_P'',',
'    ''P84006_CODIGO_MONEDA_P'',',
'    ''P84006_TASA_CAMBIO_P'',',
'    ''P84006_MONTO_ORIGEN_P''',
']',
'',
'let errores = {',
'    "1" : "No se han ingresado todos los campos para la creacion de la inversion.",',
'    "2" : "No se han ingresado todos los campos para la creacion del prestamo.",',
'    "3" : "Tasa de interes incorrecta.",',
'    "4" : "Porcentaje de mora incorrecta.",',
'    "5" : "Numero invalido.",',
'    "6" : "No se han ingresado todos los campos para la creacion del movimiento.",',
'    "7" : "El total del documento no recubre los rubros cargados",',
'}',
'',
'customButtonsModal(''MODAL_SOLICITUD'', $btns);',
'',
'function validarCamposRequeridos(elementos) {',
'  for (let i = 0; i < elementos.length; i++) {',
'    if (apex.item(elementos[i]).getValue() == '''') {',
'      return false;',
'    }',
'  }',
'  return true;',
'}',
'',
'function validarNumerosDecimales(cadena) {',
'    if (cadena.length != 0) {',
'        var patron = /^[0-9]+(\.[0-9]+)?$/;',
'        return patron.test(cadena);',
'    }',
'    return true;',
'}',
'',
'function validarNumerosDecimalesEnRango(cadena, rangoMinimo, rangoMaximo) {',
'    if (cadena.length != 0) {',
'        var patron = /^(\d+(\.\d{1,2})?)$/;',
'        //var patron = /^[0-9]+(\.[0-9]+)?$/;',
'        if (!patron.test(cadena)) {',
'            return false;',
'        }',
'        ',
'        var numero = parseFloat(cadena);',
'        return numero >= rangoMinimo && numero <= rangoMaximo;',
'    }',
'    return true;',
'}',
'',
'function validarMora() {',
'    const tipoMora = apex.item(''P84006_TIPO_MORA'').getValue();',
'    const porcentajeMora = apex.item(''P84006_PORCENTAJE_MORA'').getValue();',
'    const montoMoraOrigen = apex.item(''P84006_MONTO_MORA_ORIGEN'').getValue();',
'',
'    return (tipoMora === ''1'' && porcentajeMora !== '''') || (tipoMora !== ''1'' && montoMoraOrigen !== '''');',
'}',
'',
'function functionResetInteresGenerado()',
'{',
'    apex.jQuery(''#INTERES_GENERADO_ir'').interactiveReport("reset");',
'}',
'',
'function functionResetInteresGeneradoMes()',
'{',
'    apex.jQuery(''#INTERES_GENERADO_CONJUNTO_ir'').interactiveReport("reset");',
'}',
'',
'function functionResetDETALLE_INTERES_SELECT()',
'{',
'    apex.jQuery(''#DETALLE_INTERES_SELECT_ir'').interactiveReport("reset");',
'}',
'',
'function functionResetPAGO_CAPITAL_BTS()',
'{',
'    apex.jQuery(''#PAGO_CAPITAL_ir'').interactiveReport("reset");',
'}',
'',
'function functionResetLISTA_MOVIMIENTOS_BTN()',
'{',
'    apex.jQuery(''#LISTA_MOVIMIENTOS_ir'').interactiveReport("reset");',
'}',
'',
'function functionResetMORA_BTS()',
'{',
'    apex.jQuery(''#MORA_GENERADO_ir'').interactiveReport("reset");',
'}',
'',
'function eliminarRegistro() {',
'    $.event.trigger("BORRAR_RUBRO_BOLETA");',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (typeof $.apex.interactiveReport === "function") {',
'    // only extend when the IR code is present',
'    $.apex.interactiveReport.prototype.reset = function() {this._reset();};',
'}'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--#APP_FILES#treeTable/jquery.treetable.min.css',
'--#APP_FILES#treeTable/jquery.treetable.theme.default.css',
'#WORKSPACE_FILES#saf-cssnew.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.fos-notification-themeroller-steps li {',
'    line-height: 32px;',
'}',
'.fos-notification-themeroller-steps img.img-border {',
'    margin: auto;',
'    padding: 20px;',
'    border: 1px solid #ccc;',
'    width: 630px;',
'}',
'.demo-button.mnw150{',
'    min-width: 150px;',
'}',
'',
'#LISTA_AUDIT th#ACTION_BY, #LISTA_AUDIT td[headers=ACTION_BY]',
'{',
'    width: 275px !important;',
'    min-width: 275px !important;',
'    max-width: 275px !important;',
'}',
'',
'#LISTA_AUDIT th#ACTION, #LISTA_AUDIT td[headers=ACTION]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'    max-width: 100px !important;',
'}',
'',
'#LISTA_AUDIT th#ACTION_DATE, #LISTA_AUDIT td[headers=ACTION_DATE]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#LISTA_AUDIT th#OLD_VC, #LISTA_AUDIT td[headers=OLD_VC],',
'#LISTA_AUDIT th#NEW_VC, #LISTA_AUDIT td[headers=NEW_VC]',
'{',
'    width: 500px !important;',
'    min-width: 500px !important;',
'    max-width: 500px !important;',
'}',
'',
'#INTERES_GENERADO th#TASA_MONEDA, #INTERES_GENERADO td[headers=TASA_MONEDA],',
'#INTERES_GENERADO_CONJUNTO th#TASA_MONEDA, #INTERES_GENERADO_CONJUNTO td[headers=TASA_MONEDA],',
'#DETALLE_INTERES_SELECT th#TASA_MONEDA, #DETALLE_INTERES_SELECT td[headers=TASA_MONEDA]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'    max-width: 100px !important;',
'}',
'',
'#INTERES_GENERADO th#MONTO_ORIGEN, #INTERES_GENERADO td[headers=MONTO_ORIGEN],',
'#INTERES_GENERADO th#MONTO_LOCAL, #INTERES_GENERADO td[headers=MONTO_LOCAL],',
'#INTERES_GENERADO th#CAPITAL, #INTERES_GENERADO td[headers=CAPITAL],',
'#INTERES_GENERADO_CONJUNTO th#MONTO_ORIGEN, #INTERES_GENERADO_CONJUNTO td[headers=MONTO_ORIGEN],',
'#INTERES_GENERADO_CONJUNTO th#MONTO_LOCAL, #INTERES_GENERADO_CONJUNTO td[headers=MONTO_LOCAL],',
'#DETALLE_INTERES_SELECT th#CAPITAL, #DETALLE_INTERES_SELECT td[headers=CAPITAL],',
'#DETALLE_INTERES_SELECT th#MONTO_ORIGEN, #DETALLE_INTERES_SELECT td[headers=MONTO_ORIGEN],',
'#DETALLE_INTERES_SELECT th#MONTO_LOCAL, #DETALLE_INTERES_SELECT td[headers=MONTO_LOCAL]',
'{',
'    width: 250px !important;',
'    min-width: 250px !important;',
'    max-width: 250px !important;',
'}',
'',
'#INTERES_GENERADO th#FECHA_INTERES, #INTERES_GENERADO td[headers=FECHA_INTERES],',
'#DETALLE_INTERES_SELECT th#FECHA_INTERES, #DETALLE_INTERES_SELECT td[headers=FECHA_INTERES]',
'{',
'    width: 200px !important;',
'    min-width: 200px !important;',
'    max-width: 200px !important;',
'}',
'',
'#INTERES_GENERADO th#ESTADO, #INTERES_GENERADO td[headers=ESTADO],',
'#INTERES_GENERADO_CONJUNTO th#ESTADO, #INTERES_GENERADO_CONJUNTO td[headers=ESTADO]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'    max-width: 100px !important;',
'}',
'',
'#INTERES_GENERADO_CONJUNTO th#MES, #INTERES_GENERADO_CONJUNTO td[headers=MES],',
'#INTERES_GENERADO_CONJUNTO th#ANIO, #INTERES_GENERADO_CONJUNTO td[headers=ANIO]',
'{',
'    width: 200px !important;',
'    min-width: 200px !important;',
'    max-width: 200px !important;',
'}',
'',
'#INTERES_GENERADO_CONJUNTO th#MES_ID, #INTERES_GENERADO_CONJUNTO td[headers=MES_ID]',
'{',
'    width: 50px !important;',
'    min-width: 50px !important;',
'    max-width: 50px !important;',
'}',
'',
'.a-IRR-pagination-label',
'{',
'    font-weight: bold !important;',
'}',
'',
'#LISTA_MOVIMIENTOS th#ANULADO, #LISTA_MOVIMIENTOS td[headers=ANULADO]',
'{',
'    width: 80px !important;',
'    min-width: 80px !important;',
'    max-width: 80px !important;',
'}',
'',
'#LISTA_MOVIMIENTOS th#DOCUMENTO, #LISTA_MOVIMIENTOS td[headers=DOCUMENTO],',
'#LISTA_MOVIMIENTOS th#TASA_MONEDA, #LISTA_MOVIMIENTOS td[headers=TASA_MONEDA]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#LISTA_MOVIMIENTOS th#MONTO_ORIGEN, #LISTA_MOVIMIENTOS td[headers=MONTO_ORIGEN],',
'#LISTA_MOVIMIENTOS th#MONTO_LOCAL, #LISTA_MOVIMIENTOS td[headers=MONTO_LOCAL],',
'#LISTA_MOVIMIENTOS th#MONTO_VALIDADO, #LISTA_MOVIMIENTOS td[headers=MONTO_VALIDADO],',
'#LISTA_MOVIMIENTOS th#USUARIO_GRABACION, #LISTA_MOVIMIENTOS td[headers=USUARIO_GRABACION]',
'{',
'    width: 200px !important;',
'    min-width: 200px !important;',
'    max-width: 200px !important;',
'}',
'',
'#LISTA_MOVIMIENTOS th#FECHA_DOCUMENTO, #LISTA_MOVIMIENTOS td[headers=FECHA_DOCUMENTO]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'    max-width: 100px !important;',
'}',
'',
'#REGISTRO_BOLETA {',
'    height: 650px !important;',
'    overflow: scroll !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'MODAL_SOLICITUD'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230928084034'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407633307906819655)
,p_plug_name=>'FOS'
,p_region_name=>'splitter-action'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>170
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'PLUGIN_COM.FOS.SPLITTER'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'horizontal'
,p_attribute_02=>'end'
,p_attribute_03=>'0'
,p_attribute_05=>'0'
,p_attribute_06=>'780'
,p_attribute_10=>'can-collapse:continuous-resize:lazy-render'
,p_attribute_15=>'Y'
,p_attribute_18=>'10'
,p_attribute_23=>'0'
,p_attribute_24=>'0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407369222857508182)
,p_plug_name=>'TAB'
,p_parent_plug_id=>wwv_flow_imp.id(407633307906819655)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(1025424856130191876)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407369314846508183)
,p_plug_name=>'General'
,p_region_name=>'REGION_GENERAL'
,p_parent_plug_id=>wwv_flow_imp.id(407369222857508182)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(564832889306409762)
,p_plug_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(407369314846508183)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(564833782680409771)
,p_plug_name=>'Informacion Contractual'
,p_parent_plug_id=>wwv_flow_imp.id(407369314846508183)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(594582374506001531)
,p_plug_name=>'Informacion Prestamo'
,p_parent_plug_id=>wwv_flow_imp.id(407369314846508183)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(594584100128001549)
,p_plug_name=>'Informacion Reintegro'
,p_parent_plug_id=>wwv_flow_imp.id(407369314846508183)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(594584598152001553)
,p_plug_name=>'&nbsp;'
,p_parent_plug_id=>wwv_flow_imp.id(407369314846508183)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(408967663987511187)
,p_plug_name=>'Audit'
,p_parent_plug_id=>wwv_flow_imp.id(407369222857508182)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P84006_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(408967767443511188)
,p_plug_name=>'LISTA_AUDIT'
,p_region_name=>'LISTA_AUDIT'
,p_parent_plug_id=>wwv_flow_imp.id(408967663987511187)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	COLUMN_NAME,',
'	(',
'		CASE WHEN "ACTION" = ''U'' THEN',
'			''UPDATE''',
'		ELSE',
'			''DELETE''			',
'		END',
'	) "ACTION",',
'	TO_CHAR(ACTION_DATE, ''DD/MM/YYYY hh:mm:ss'') ACTION_DATE,',
'	SAF.FNC_GET_USUARIONOMBRE(ACTION_BY) ACTION_BY,',
'	OLD_VC,',
'	NEW_VC',
'FROM SAF.HISTORY ',
'WHERE TABLE_NAME = ''FDU_TRANSACCIONES_FINANCIERAS'' ',
'AND PK1 = :P84006_ID',
'ORDER BY ID ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84006_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LISTA_AUDIT'
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
 p_id=>wwv_flow_imp.id(408967841741511189)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>408967841741511189
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214877767111634209)
,p_db_column_name=>'COLUMN_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Dato'
,p_column_type=>'STRING'
,p_static_id=>'COLUMN_NAME'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214878177105634210)
,p_db_column_name=>'ACTION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Accion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'ACTION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214878520037634211)
,p_db_column_name=>'ACTION_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Modificacion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'ACTION_DATE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214878913272634211)
,p_db_column_name=>'ACTION_BY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_static_id=>'ACTION_BY'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214879309392634212)
,p_db_column_name=>'OLD_VC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Anterior'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style=''white-space:nowrap; width:calc(100%); overflow: hidden; white-space: normal;''>',
'    #OLD_VC# ',
'</div>'))
,p_column_type=>'STRING'
,p_static_id=>'OLD_VC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214879728083634212)
,p_db_column_name=>'NEW_VC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Nuevo'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style=''white-space:nowrap; width:calc(100%); overflow: hidden; white-space: normal;''>',
'    #NEW_VC# ',
'</div>'))
,p_column_type=>'STRING'
,p_static_id=>'NEW_VC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(409198215345868634)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1943867'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'COLUMN_NAME:OLD_VC:NEW_VC:ACTION_BY:ACTION_DATE:ACTION:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(409221881481145656)
,p_plug_name=>'Rubros'
,p_parent_plug_id=>wwv_flow_imp.id(407369222857508182)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(1025424856130191876)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84006_ID IS NOT NULL AND',
':P84006_VALIDAR_ES_PRESTAMO = ''S'' AND',
'(:P84006_VALIDAR_ESTADO = ''ACEPTADO'' OR :P84006_VALIDAR_ESTADO = ''CANCELADO'')'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(409222481531145662)
,p_plug_name=>'Interes Diario'
,p_parent_plug_id=>wwv_flow_imp.id(409221881481145656)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(409222782429145665)
,p_plug_name=>'INTERES_GENERADO'
,p_region_name=>'INTERES_GENERADO'
,p_parent_plug_id=>wwv_flow_imp.id(409222481531145662)
,p_region_css_classes=>'INTERES_GENERADO_BTN'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>9
,p_plug_display_column=>2
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    A.FECHA_INTERES,',
'    A.TASA_MONEDA,',
'    A.MONTO_ORIGEN,',
'    A.MONTO_LOCAL,',
'    A.CAPITAL,',
'    B.SIMBOLO_MONEDA SIMBOLO_MONEDA_ORIGEN,',
'    C.SIMBOLO_MONEDA SIMBOLO_MONEDA_LOCAL,',
'    (',
'    	CASE ',
'    	WHEN A.ESTADO = 1 THEN',
'    		''Generado''',
'		WHEN A.ESTADO = 2 THEN',
'			''Asignado''',
'		WHEN A.ESTADO = 3 THEN',
'			''Solventado''',
'    	ELSE',
'    		''Invalido''',
'    	END',
'    ) ESTADO',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE A',
'INNER JOIN SAF.GRAL_MONEDAS B ON B.CODIGO_MONEDA = A.CODIGO_MONEDA',
'INNER JOIN SAF.GRAL_MONEDAS C ON C.MONEDA_LOCAL IS NOT NULL',
'WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID',
'ORDER BY A.FECHA_INTERES ASC;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84006_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'INTERES_GENERADO'
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
 p_id=>wwv_flow_imp.id(409224041465145678)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_finder_drop_down=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>409224041465145678
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214839508083634124)
,p_db_column_name=>'FECHA_INTERES'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Interes'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'FECHA_INTERES'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214839982346634124)
,p_db_column_name=>'TASA_MONEDA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tasa de Cambio'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_LOCAL#</div> <div style="float:right;">#TASA_MONEDA#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'TASA_MONEDA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214840318220634125)
,p_db_column_name=>'MONTO_ORIGEN'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Monto Origen'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_ORIGEN#</div> <div style="float:right;">#MONTO_ORIGEN#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_ORIGEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214840798706634126)
,p_db_column_name=>'MONTO_LOCAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Monto Local'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_LOCAL#</div> <div style="float:right;">#MONTO_LOCAL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_LOCAL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214841104747634126)
,p_db_column_name=>'CAPITAL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Capital a la Fecha'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_ORIGEN#</div> <div style="float:right;">#CAPITAL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'CAPITAL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214841592856634127)
,p_db_column_name=>'SIMBOLO_MONEDA_ORIGEN'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Simbolo Moneda Origen'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214841902834634128)
,p_db_column_name=>'SIMBOLO_MONEDA_LOCAL'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Simbolo Moneda Local'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214842375228634128)
,p_db_column_name=>'ESTADO'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_static_id=>'ESTADO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(415150302727776864)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2003387'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'FECHA_INTERES:CAPITAL:TASA_MONEDA:MONTO_ORIGEN:MONTO_LOCAL:ESTADO:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(409222567784145663)
,p_plug_name=>'Capital'
,p_parent_plug_id=>wwv_flow_imp.id(409221881481145656)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(409225788622145695)
,p_plug_name=>'PAGO_CAPITAL'
,p_region_name=>'PAGO_CAPITAL'
,p_parent_plug_id=>wwv_flow_imp.id(409222567784145663)
,p_region_css_classes=>'PAGO_CAPITAL_BTS'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	A.TASA_MONEDA,',
'	A.MONTO_ORIGEN,',
'	A.MONTO_LOCAL,',
'	A.MES,',
'    A.MES MES_NOMBRE,',
'	A.ANIO,',
'	(',
'    	CASE ',
'    	WHEN A.ESTADO = 1 THEN',
'    		''Generado''',
'		WHEN A.ESTADO = 2 THEN',
'			''Asignado''',
'		WHEN A.ESTADO = 3 THEN',
'			''Solventado''',
'    	ELSE',
'    		''Invalido''',
'    	END',
'    ) ESTADO,',
'    B.SIMBOLO_MONEDA SIMBOLO_MONEDA_ORIGEN,',
'	C.SIMBOLO_MONEDA SIMBOLO_MONEDA_LOCAL,',
'	(',
'		CASE ',
'    	WHEN A.TIPO_PAGO  = 1 THEN',
'    		''Mensualidad''',
'		WHEN A.TIPO_PAGO = 2 THEN',
'			''Abono''',
'    	ELSE',
'    		''Invalido''',
'    	END',
'	) TIPO_PAGO',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL A',
'INNER JOIN SAF.GRAL_MONEDAS B ON B.CODIGO_MONEDA = A.CODIGO_MONEDA',
'INNER JOIN SAF.GRAL_MONEDAS C ON C.MONEDA_LOCAL IS NOT NULL',
'WHERE A.ID_FDU_TRANSACCIONES_FINANCIERA = :P84006_ID',
'ORDER BY A.MES ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84006_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(409225827961145696)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_finder_drop_down=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>409225827961145696
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214829344295634101)
,p_db_column_name=>'TASA_MONEDA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tasa de Cambio'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_LOCAL#</div> <div style="float:right;">#TASA_MONEDA#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214829721392634102)
,p_db_column_name=>'MONTO_ORIGEN'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Monto Origen'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_ORIGEN#</div> <div style="float:right;">#MONTO_ORIGEN#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214830148932634102)
,p_db_column_name=>'MONTO_LOCAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Monto Local'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_LOCAL#</div> <div style="float:right;">#MONTO_LOCAL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214830578374634103)
,p_db_column_name=>'SIMBOLO_MONEDA_ORIGEN'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Simbolo Moneda Origen'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214830994229634104)
,p_db_column_name=>'SIMBOLO_MONEDA_LOCAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Simbolo Moneda Local'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214831319281634104)
,p_db_column_name=>'MES'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Mes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214831729859634105)
,p_db_column_name=>'ANIO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Anio'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214832155406634105)
,p_db_column_name=>'ESTADO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214832587830634106)
,p_db_column_name=>'TIPO_PAGO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Tipo Pago'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214832962903634107)
,p_db_column_name=>'MES_NOMBRE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Mes Nombre'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(415187710350071508)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2003761'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'ANIO:MES:MES_NOMBRE:TASA_MONEDA:MONTO_ORIGEN:MONTO_LOCAL:TIPO_PAGO:ESTADO:'
,p_sort_column_1=>'MES'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'ANIO:0:0:0:0:0'
,p_break_enabled_on=>'ANIO:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(409222670780145664)
,p_plug_name=>'Mora'
,p_parent_plug_id=>wwv_flow_imp.id(409221881481145656)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(415297716094759382)
,p_plug_name=>'MORA_GENERADO'
,p_region_name=>'MORA_GENERADO'
,p_parent_plug_id=>wwv_flow_imp.id(409222670780145664)
,p_region_css_classes=>'MORA_BTS'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    A.FECHA_GRABACION FECHA_INTERES,',
'    A.TASA_MONEDA,',
'    A.MONTO_ORIGEN,',
'    A.MONTO_LOCAL,',
'    B.SIMBOLO_MONEDA SIMBOLO_MONEDA_ORIGEN,',
'    C.SIMBOLO_MONEDA SIMBOLO_MONEDA_LOCAL,',
'    (',
'    	CASE ',
'    	WHEN A.ESTADO = 1 THEN',
'    		''Generado''',
'		WHEN A.ESTADO = 2 THEN',
'			''Asignado''',
'		WHEN A.ESTADO = 3 THEN',
'			''Solventado''',
'    	ELSE',
'    		''Invalido''',
'    	END',
'    ) ESTADO,',
'    A.ID,',
'    A.MES,',
'    A.MES MES_NOMBRE,',
'    A.ANIO',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS A',
'INNER JOIN SAF.GRAL_MONEDAS B ON B.CODIGO_MONEDA = A.CODIGO_MONEDA',
'INNER JOIN SAF.GRAL_MONEDAS C ON C.MONEDA_LOCAL IS NOT NULL',
'WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84006_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(415297879379759383)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_finder_drop_down=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>415297879379759383
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214834245502634110)
,p_db_column_name=>'TASA_MONEDA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tasa de Cambio'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_LOCAL#</div> <div style="float:right;">#TASA_MONEDA#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214834614752634111)
,p_db_column_name=>'MONTO_ORIGEN'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Monto Origen'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_ORIGEN#</div> <div style="float:right;">#MONTO_ORIGEN#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214835068522634111)
,p_db_column_name=>'MONTO_LOCAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Monto Local'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_LOCAL#</div> <div style="float:right;">#MONTO_LOCAL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214835497713634112)
,p_db_column_name=>'MES'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'Mes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214835854670634112)
,p_db_column_name=>'ANIO'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Anio'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214836261263634113)
,p_db_column_name=>'ID'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214836660823634115)
,p_db_column_name=>'FECHA_INTERES'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Fecha Interes'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214837037361634116)
,p_db_column_name=>'SIMBOLO_MONEDA_ORIGEN'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Simbolo Moneda Origen'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214837449355634117)
,p_db_column_name=>'SIMBOLO_MONEDA_LOCAL'
,p_display_order=>110
,p_column_identifier=>'N'
,p_column_label=>'Simbolo Moneda Local'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214837841502634117)
,p_db_column_name=>'ESTADO'
,p_display_order=>120
,p_column_identifier=>'O'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214838262403634118)
,p_db_column_name=>'MES_NOMBRE'
,p_display_order=>130
,p_column_identifier=>'P'
,p_column_label=>'Mes Nombre'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(418252443672173622)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2034409'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ANIO:MES:MES_NOMBRE:TASA_MONEDA:MONTO_ORIGEN:MONTO_LOCAL:ESTADO:'
,p_break_on=>'ANIO:0:0:0:0:0'
,p_break_enabled_on=>'ANIO:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(415177959983468755)
,p_plug_name=>'Interes Generado'
,p_parent_plug_id=>wwv_flow_imp.id(409221881481145656)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(415180515786468781)
,p_plug_name=>'FOS_INTERES'
,p_region_name=>'FOS_DETALLE_INTERES'
,p_parent_plug_id=>wwv_flow_imp.id(415177959983468755)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_COM.FOS.SPLITTER'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'horizontal'
,p_attribute_02=>'end'
,p_attribute_03=>'0'
,p_attribute_05=>'0'
,p_attribute_06=>'690'
,p_attribute_10=>'can-collapse:continuous-resize:lazy-render'
,p_attribute_15=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(415178101418468756)
,p_plug_name=>'INTERES_GENERADO_CONJUNTO'
,p_region_name=>'INTERES_GENERADO_CONJUNTO'
,p_parent_plug_id=>wwv_flow_imp.id(415180515786468781)
,p_region_css_classes=>'INTERES_GENERADO_CONJUNTO_BTS'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    A.FECHA_GRABACION FECHA_INTERES,',
'    A.TASA_MONEDA,',
'    A.MONTO_ORIGEN,',
'    A.MONTO_LOCAL,',
'    B.SIMBOLO_MONEDA SIMBOLO_MONEDA_ORIGEN,',
'    C.SIMBOLO_MONEDA SIMBOLO_MONEDA_LOCAL,',
'    (',
'    	CASE ',
'    	WHEN A.ESTADO = 1 THEN',
'    		''Generado''',
'		WHEN A.ESTADO = 2 THEN',
'			''Asignado''',
'		WHEN A.ESTADO = 3 THEN',
'			''Solventado''',
'    	ELSE',
'    		''Invalido''',
'    	END',
'    ) ESTADO,',
'    A.ID,',
'    A.MES,',
'    A.MES MES_NOMBRE,',
'    A.ANIO',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS A',
'INNER JOIN SAF.GRAL_MONEDAS B ON B.CODIGO_MONEDA = A.CODIGO_MONEDA',
'INNER JOIN SAF.GRAL_MONEDAS C ON C.MONEDA_LOCAL IS NOT NULL',
'WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84006_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(415178172025468757)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_finder_drop_down=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>415178172025468757
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214818769453634078)
,p_db_column_name=>'TASA_MONEDA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tasa de Cambio'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_LOCAL#</div> <div style="float:right;">#TASA_MONEDA#</div>',
'',
'<input id="ID" type="hidden" value="#ID#">'))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'TASA_MONEDA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214819115467634080)
,p_db_column_name=>'MONTO_ORIGEN'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Monto Origen'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_ORIGEN#</div> <div style="float:right;">#MONTO_ORIGEN#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_ORIGEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214819578789634080)
,p_db_column_name=>'MONTO_LOCAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Monto Local'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_LOCAL#</div> <div style="float:right;">#MONTO_LOCAL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_LOCAL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214819915187634081)
,p_db_column_name=>'ESTADO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_static_id=>'ESTADO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214820358006634081)
,p_db_column_name=>'FECHA_INTERES'
,p_display_order=>90
,p_column_identifier=>'O'
,p_column_label=>'Fecha Interes'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214820797916634082)
,p_db_column_name=>'SIMBOLO_MONEDA_ORIGEN'
,p_display_order=>110
,p_column_identifier=>'Q'
,p_column_label=>'Simbolo Moneda Origen'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214821187329634083)
,p_db_column_name=>'SIMBOLO_MONEDA_LOCAL'
,p_display_order=>120
,p_column_identifier=>'R'
,p_column_label=>'Simbolo Moneda Local'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214821584143634083)
,p_db_column_name=>'ID'
,p_display_order=>130
,p_column_identifier=>'S'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214821939144634084)
,p_db_column_name=>'MES'
,p_display_order=>140
,p_column_identifier=>'T'
,p_column_label=>'Mes'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'MES_ID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214822309411634084)
,p_db_column_name=>'ANIO'
,p_display_order=>150
,p_column_identifier=>'U'
,p_column_label=>unistr('A\00F1o')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214822718326634085)
,p_db_column_name=>'MES_NOMBRE'
,p_display_order=>160
,p_column_identifier=>'V'
,p_column_label=>'Mes Nombre'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'MES'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(415266392301574744)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2004548'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'ANIO:MES:MES_NOMBRE:TASA_MONEDA:MONTO_ORIGEN:MONTO_LOCAL:ESTADO:'
,p_sort_column_1=>'MES'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'ANIO:0:0:0:0:0'
,p_break_enabled_on=>'ANIO:0:0:0:0:0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(415180743487468783)
,p_plug_name=>'DETALLE_INTERES_SELECT'
,p_region_name=>'DETALLE_INTERES_SELECT'
,p_parent_plug_id=>wwv_flow_imp.id(415180515786468781)
,p_region_css_classes=>'DETALLE_INTERES_SELECT_BTS'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS AS ',
'(',
'    SELECT',
'        TO_CHAR(A.FECHA_INTERES, ''DD/MM/YYYY'') FECHA_INTERES,',
'        A.TASA_MONEDA,',
'        A.MONTO_ORIGEN,',
'        A.MONTO_LOCAL,',
'        A.CAPITAL,',
'        B.SIMBOLO_MONEDA SIMBOLO_MONEDA_ORIGEN,',
'        C.SIMBOLO_MONEDA SIMBOLO_MONEDA_LOCAL,',
'        (',
'        	CASE ',
'        	WHEN A.ESTADO = 1 THEN',
'        		''Generado''',
'    		WHEN A.ESTADO = 2 THEN',
'    			''Asignado''',
'    		WHEN A.ESTADO = 3 THEN',
'    			''Solventado''',
'        	ELSE',
'        		''Invalido''',
'        	END',
'        ) ESTADO',
'    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE A',
'    INNER JOIN SAF.GRAL_MONEDAS B ON B.CODIGO_MONEDA = A.CODIGO_MONEDA',
'    INNER JOIN SAF.GRAL_MONEDAS C ON C.MONEDA_LOCAL IS NOT NULL',
'    WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID',
'    AND A.ID_INTERES_COBRADO = :P84006_ID_INTERES_GENERADO_CONJUNTO',
'    ORDER BY A.FECHA_INTERES ASC',
')',
'SELECT',
'    FECHA_INTERES,',
'    TASA_MONEDA,',
'    MONTO_ORIGEN,',
'    MONTO_LOCAL,',
'    CAPITAL,',
'    SIMBOLO_MONEDA_ORIGEN,',
'    SIMBOLO_MONEDA_LOCAL,',
'    SIMBOLO_MONEDA_LOCAL SIMBOLO_MONEDA_LOCAL_TASA,',
'    SIMBOLO_MONEDA_ORIGEN SIMBOLO_MONEDA_ORIGEN_CAPITAL,',
'    ESTADO,',
'    '''' CLASE',
'FROM DATOS',
'/*UNION ALL',
'SELECT',
'    NULL FECHA_INTERES,',
'    NULL TASA_MONEDA,',
'    NVL(SUM(MONTO_ORIGEN), 0) MONTO_ORIGEN,',
'    NVL(SUM(MONTO_LOCAL), 0) MONTO_LOCAL,',
'    NULL CAPITAL,',
'    SIMBOLO_MONEDA_ORIGEN,',
'    SIMBOLO_MONEDA_LOCAL,',
'    NULL SIMBOLO_MONEDA_LOCAL_TASA,',
'    NULL SIMBOLO_MONEDA_ORIGEN_CAPITAL,',
'    NULL ESTADO,',
'    ''font-weight: bold;'' CLASE',
'FROM DATOS',
'GROUP BY SIMBOLO_MONEDA_ORIGEN, SIMBOLO_MONEDA_LOCAL*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84006_ID,P84006_ID_INTERES_GENERADO_CONJUNTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(415180856438468784)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>415180856438468784
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214824154405634090)
,p_db_column_name=>'TASA_MONEDA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tasa de Cambio'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#SIMBOLO_MONEDA_LOCAL_TASA#</div> <div style="float:right;">#TASA_MONEDA#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'TASA_MONEDA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214824597041634090)
,p_db_column_name=>'MONTO_ORIGEN'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Monto Origen'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA_ORIGEN#</div> <div style="float:right; #CLASE#">#MONTO_ORIGEN#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_ORIGEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214824958044634091)
,p_db_column_name=>'MONTO_LOCAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Monto Local'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA_LOCAL#</div> <div style="float:right; #CLASE#">#MONTO_LOCAL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_LOCAL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214825308135634092)
,p_db_column_name=>'ESTADO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214825632719634092)
,p_db_column_name=>'CAPITAL'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>'Capital a la Fecha'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px; #CLASE#">#SIMBOLO_MONEDA_ORIGEN_CAPITAL#</div> <div style="float:right; #CLASE#">#CAPITAL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'CAPITAL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214826010877634093)
,p_db_column_name=>'SIMBOLO_MONEDA_ORIGEN'
,p_display_order=>70
,p_column_identifier=>'L'
,p_column_label=>'Simbolo Moneda Origen'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214826495294634093)
,p_db_column_name=>'SIMBOLO_MONEDA_LOCAL'
,p_display_order=>80
,p_column_identifier=>'M'
,p_column_label=>'Simbolo Moneda Local'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214826845879634094)
,p_db_column_name=>'CLASE'
,p_display_order=>90
,p_column_identifier=>'N'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214827229386634095)
,p_db_column_name=>'SIMBOLO_MONEDA_LOCAL_TASA'
,p_display_order=>100
,p_column_identifier=>'Q'
,p_column_label=>'Simbolo Moneda Local Tasa'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214827623383634095)
,p_db_column_name=>'SIMBOLO_MONEDA_ORIGEN_CAPITAL'
,p_display_order=>110
,p_column_identifier=>'R'
,p_column_label=>'Simbolo Moneda Origen Capital'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214828095875634097)
,p_db_column_name=>'FECHA_INTERES'
,p_display_order=>120
,p_column_identifier=>'S'
,p_column_label=>'Fecha Interes'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'FECHA_INTERES'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(415284785834689054)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2004732'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'FECHA_INTERES:CAPITAL:TASA_MONEDA:MONTO_ORIGEN:MONTO_LOCAL:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419151349771309350)
,p_plug_name=>'Pagos'
,p_parent_plug_id=>wwv_flow_imp.id(407369222857508182)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(1025424856130191876)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84006_ID IS NOT NULL AND',
'(:P84006_VALIDAR_ES_PRESTAMO = ''S'' OR :P84006_VALIDAR_ES_PRESTAMO = ''N'') AND',
'(:P84006_VALIDAR_ESTADO = ''ACEPTADO'' OR :P84006_VALIDAR_ESTADO = ''CANCELADO'')'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419155150985309388)
,p_plug_name=>'Movimientos'
,p_parent_plug_id=>wwv_flow_imp.id(419151349771309350)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419214032932671361)
,p_plug_name=>'FOS_MOVIMIENTO'
,p_region_name=>'FOS_MOVIMIENTO_BANCARIO'
,p_parent_plug_id=>wwv_flow_imp.id(419155150985309388)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_COM.FOS.SPLITTER'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'horizontal'
,p_attribute_02=>'end'
,p_attribute_03=>'0'
,p_attribute_05=>'0'
,p_attribute_06=>'650'
,p_attribute_10=>'can-collapse:continuous-resize:lazy-render'
,p_attribute_15=>'Y'
,p_attribute_18=>'10'
,p_attribute_23=>'0'
,p_attribute_24=>'0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419151415000309351)
,p_plug_name=>'Registro Movimientos'
,p_region_name=>'REGISTRO_BOLETA'
,p_parent_plug_id=>wwv_flow_imp.id(419214032932671361)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419151621604309353)
,p_plug_name=>'Informacion Contractual'
,p_parent_plug_id=>wwv_flow_imp.id(419151415000309351)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>30
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419153252910309369)
,p_plug_name=>'Informacion Boleta'
,p_parent_plug_id=>wwv_flow_imp.id(419151415000309351)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>20
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419214679363671367)
,p_plug_name=>'&nbsp;'
,p_parent_plug_id=>wwv_flow_imp.id(419151415000309351)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>60
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419429510386493067)
,p_plug_name=>'Asignar Rubros'
,p_parent_plug_id=>wwv_flow_imp.id(419151415000309351)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:t-Region--noUI:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>40
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419318689311790493)
,p_plug_name=>'Asignar Rubros Lista'
,p_region_name=>'ASIGNAR_RUBROS_COBRO'
,p_parent_plug_id=>wwv_flow_imp.id(419429510386493067)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	A.ID,',
'	(',
'		''Pago de '' || E.SIMBOLO_MONEDA || ''.'' || REPLACE(TO_CHAR((NVL(A.MONTO_ORIGEN, 0) + NVL(C.MONTO_ORIGEN, 0) + NVL(D.MONTO_ORIGEN, 0)), ''999G999G999G999G990D00''), '' '', '''') || '' Incluye pagos de: '' ||',
'		(',
'			CASE',
'				WHEN A.ID IS NOT NULL THEN',
'					''Intereses generados '' || E.SIMBOLO_MONEDA || ''.'' || REPLACE(TO_CHAR((NVL(A.MONTO_ORIGEN, 0)), ''999G999G999G999G990D00''), '' '', '''') || '': ''',
'				ELSE',
'					''''',
'			END',
'		) ||',
'		(',
'			CASE',
'				WHEN C.ID IS NOT NULL THEN',
'					''Aporte mensual a capital '' || E.SIMBOLO_MONEDA || ''.'' || REPLACE(TO_CHAR((NVL(C.MONTO_ORIGEN, 0)), ''999G999G999G999G990D00''), '' '', '''') || '': ''',
'				ELSE',
'					''''',
'			END',
'		) ||',
'		(',
'			CASE',
'				WHEN D.ID IS NOT NULL THEN',
'					''Importe de mora '' || E.SIMBOLO_MONEDA || ''.'' || REPLACE(TO_CHAR((NVL(D.MONTO_ORIGEN, 0)), ''999G999G999G999G990D00''), '' '', '''') || '': ''',
'				ELSE',
'					''''',
'			END',
'		) ||',
'		'' Datos generados correspondientes al mes de '' || TO_CHAR(TO_DATE(A.MES, ''MM''), ''Month'', ''NLS_DATE_LANGUAGE=SPANISH'') || '' del '' || A.ANIO ',
'	) DESCRIPCION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS A',
'INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS B',
'	ON B.ID = A.ID_FDU_TRANSACCIONES_FINANCIERAS',
'LEFT JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL C',
'	ON C.ID_FDU_TRANSACCIONES_FINANCIERA = A.ID_FDU_TRANSACCIONES_FINANCIERAS',
'	AND C.MES = A.MES',
'	AND C.ANIO = A.ANIO',
'    AND C.TIPO_PAGO = 1',
'LEFT JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS D',
'	ON D.ID_FDU_TRANSACCIONES_FINANCIERAS = A.ID_FDU_TRANSACCIONES_FINANCIERAS',
'	AND D.MES = A.MES',
'	AND D.ANIO = A.ANIO',
'	AND D.MONTO_ORIGEN > 0',
'INNER JOIN SAF.GRAL_MONEDAS E',
'	ON B.CODIGO_MONEDA = E.CODIGO_MONEDA',
'WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID',
'AND A.ID IN',
'(',
'	SELECT',
'        A.C003 ID_ASOCIACION',
'    FROM APEX_COLLECTIONS A',
'    INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS B',
'        ON B.ID = A.C003',
'        AND A.C002 = ''INTERES''',
'    WHERE A.COLLECTION_NAME = ''COLLECTION_DETALLE_PAGOS''',
'    AND A.C007 <> 3',
');'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84006_CODIGO_MONEDA,P84006_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Asignar Rubros Lista'
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
 p_id=>wwv_flow_imp.id(419428423354493057)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_search_textbox=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>419428423354493057
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214847914431634152)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214848325154634152)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>20
,p_column_identifier=>'I'
,p_column_label=>'Descripcion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch"',
'    style=''padding-left:0; display:inline-block; white-space:nowrap; width:calc(100%); overflow: hidden; white-space: normal;''>',
'    #DESCRIPCION#',
'</span>',
'',
'<input id="ID" type="hidden" value="#ID#">'))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(420412506311011121)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2056009'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DESCRIPCION:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(419155281241309389)
,p_plug_name=>'LISTA_MOVIMIENTOS'
,p_region_name=>'LISTA_MOVIMIENTOS'
,p_parent_plug_id=>wwv_flow_imp.id(419214032932671361)
,p_region_css_classes=>'LISTA_MOVIMIENTOS_BTN'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	A.ID,',
'	A.TASA_MONEDA,',
'	A.MONTO_ORIGEN,',
'	A.MONTO_LOCAL,',
'	A.FECHA_DOCUMENTO,',
'	(A.SERIE || ''-'' || A.NUMDOC) DOCUMENTO,',
'	(',
'        CASE',
'            WHEN A.ANULADO = ''S'' THEN',
'                ''fa-ban''',
'            WHEN A.ANULADO = ''V'' THEN',
'                ''fa-check''',
'            ELSE',
'                ''''',
'        END',
'    ) ANULADO,',
'	A.USUARIO_GRABACION,',
'	(',
'        CASE WHEN A.ANULADO = ''N'' THEN',
'            SAF.APX_FNC_CONVERSION_MONEDAS(A.MONTO_ORIGEN, A.CODIGO_MONEDA, 1, A.TASA_MONEDA, NULL)',
'            - SAF.APX_FNC_CONVERSION_MONEDAS(NVL(SAF.GET_FDU_VALOR_VALIDADO_BOLETA(A.ID, :P84006_ID), 0), :P84006_CODIGO_MONEDA, 1, :P84006_TASA_CAMBIO, NULL)',
'        ELSE',
'            0',
'        END',
'    ) MONTO_VALIDADO,',
'	C.SIMBOLO_MONEDA MONEDA_ORIGEN,',
'	D.SIMBOLO_MONEDA MONEDA_LOCAL',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS A',
'INNER JOIN SAF.GRAL_MONEDAS C ON C.CODIGO_MONEDA = A.CODIGO_MONEDA',
'INNER JOIN SAF.GRAL_MONEDAS D ON D.MONEDA_LOCAL IS NOT NULL',
'WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84006_ID,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LISTA_MOVIMIENTOS'
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
 p_id=>wwv_flow_imp.id(419155320288309390)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_finder_drop_down=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>419155320288309390
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214858319322634172)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214858794636634175)
,p_db_column_name=>'TASA_MONEDA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tasa Moneda'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#MONEDA_LOCAL#</div> <div style="float:right;">#TASA_MONEDA#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'TASA_MONEDA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214859112102634176)
,p_db_column_name=>'MONTO_ORIGEN'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Monto Origen'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#MONEDA_ORIGEN#</div> <div style="float:right;">#MONTO_ORIGEN#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_ORIGEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214859536196634177)
,p_db_column_name=>'MONTO_LOCAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Monto Local'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#MONEDA_LOCAL#</div> <div style="float:right;">#MONTO_LOCAL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_LOCAL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214859909240634177)
,p_db_column_name=>'FECHA_DOCUMENTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Documento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'FECHA_DOCUMENTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214860395358634178)
,p_db_column_name=>'USUARIO_GRABACION'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Usuario Grabacion'
,p_column_type=>'NUMBER'
,p_static_id=>'USUARIO_GRABACION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214860702898634179)
,p_db_column_name=>'DOCUMENTO'
,p_display_order=>170
,p_column_identifier=>'T'
,p_column_label=>'Documento'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#DOCUMENTO#',
'',
'<input id="ID" type="hidden" value="#ID#">'))
,p_column_type=>'STRING'
,p_static_id=>'DOCUMENTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214861101264634179)
,p_db_column_name=>'ANULADO'
,p_display_order=>180
,p_column_identifier=>'U'
,p_column_label=>'Estado'
,p_column_html_expression=>'<span class="fa fa #ANULADO#"></span>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'ANULADO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214861574095634180)
,p_db_column_name=>'MONTO_VALIDADO'
,p_display_order=>190
,p_column_identifier=>'V'
,p_column_label=>'Monto Residual'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#MONEDA_LOCAL#</div> <div style="float:right;">#MONTO_VALIDADO#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_static_id=>'MONTO_VALIDADO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214861961624634181)
,p_db_column_name=>'MONEDA_ORIGEN'
,p_display_order=>200
,p_column_identifier=>'W'
,p_column_label=>'Moneda Origen'
,p_column_html_expression=>'<div style="float:left; padding-right: 5px;">#MONEDA_ORIGEN#</div> <div style="float:right;">#MONTO_VALIDADO#</div>'
,p_column_type=>'STRING'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(214862352002634181)
,p_db_column_name=>'MONEDA_LOCAL'
,p_display_order=>210
,p_column_identifier=>'X'
,p_column_label=>'Moneda Local'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(419231677639720569)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2044201'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'ANULADO:DOCUMENTO:TASA_MONEDA:MONTO_ORIGEN:MONTO_LOCAL:MONTO_VALIDADO:FECHA_DOCUMENTO:USUARIO_GRABACION:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407633321741819656)
,p_plug_name=>'OPCIONES_FLUJO'
,p_parent_plug_id=>wwv_flow_imp.id(407633307906819655)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(407633490249819657)
,p_plug_name=>'ENVIAR_A_REVISION'
,p_parent_plug_id=>wwv_flow_imp.id(407633321741819656)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(408642283628778675)
,p_plug_name=>'FLUJO_1'
,p_parent_plug_id=>wwv_flow_imp.id(407633321741819656)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(408644278942778695)
,p_plug_name=>'FLUJO_2'
,p_parent_plug_id=>wwv_flow_imp.id(407633321741819656)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(408705372233208153)
,p_plug_name=>'FLUJO_3'
,p_parent_plug_id=>wwv_flow_imp.id(407633321741819656)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(408964171059511152)
,p_plug_name=>'FLUJO_4'
,p_parent_plug_id=>wwv_flow_imp.id(407633321741819656)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214812836164634056)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(408644278942778695)
,p_button_name=>'ENVIADO_REVISION_ENVIAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'ENVIAR A REVISION'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214815305787634066)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(408642283628778675)
,p_button_name=>'ENVIADO_REVISION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'ENVIAR A REVISION'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214816020525634067)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(408705372233208153)
,p_button_name=>'REGRESAR_SOLICITUD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'REGRESAR SOLICITUD'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214816807664634068)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(408705372233208153)
,p_button_name=>'ENVIAR_APROBACION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'ENVIAR A APROBACION'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214816400262634068)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(408705372233208153)
,p_button_name=>'RECHAZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'RECHAZAR SOLICITUD'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214813546693634061)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(408964171059511152)
,p_button_name=>'RECHAZAR_FINAL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'RECHAZAR SOLICITUD'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214813902003634061)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(408964171059511152)
,p_button_name=>'ACEPTAR_FINAL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'ACEPTAR SOLICITUD'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214882810965634219)
,p_button_sequence=>80
,p_button_name=>'CANCELAR'
,p_button_static_id=>'CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'CANCELAR'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214883274394634219)
,p_button_sequence=>90
,p_button_name=>'GUARDAR'
,p_button_static_id=>'GUARDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'GUARDAR'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214882441297634218)
,p_button_sequence=>100
,p_button_name=>'MODIFICAR'
,p_button_static_id=>'MODIFICAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'GUARDAR'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214880485501634214)
,p_button_sequence=>110
,p_button_name=>'ACEPTAR_REVISAR'
,p_button_static_id=>'ACEPTAR_REVISAR_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'Enviado Revision'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214881658697634217)
,p_button_sequence=>120
,p_button_name=>'ACEPTAR_APROBACION'
,p_button_static_id=>'ACEPTAR_APROBACION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'Enviado Revision'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214881293526634217)
,p_button_sequence=>130
,p_button_name=>'FLUJO_BT_1'
,p_button_static_id=>'FLUJO_BT_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'RECHAZAR'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214882042300634218)
,p_button_sequence=>140
,p_button_name=>'FLUJO_BT_2'
,p_button_static_id=>'FLUJO_BT_2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'RECHAZAR'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214883678468634220)
,p_button_sequence=>150
,p_button_name=>'FLUJO_BT_3'
,p_button_static_id=>'FLUJO_BT_3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'RECHAZAR'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214880883433634216)
,p_button_sequence=>160
,p_button_name=>'FLUJO_BT_4'
,p_button_static_id=>'FLUJO_BT_4'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'RECHAZAR'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214852434302634160)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_button_name=>'VALIDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'Validar'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214852015917634159)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_button_name=>'ANULAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'Anular'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214844230030634143)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(419151415000309351)
,p_button_name=>'CANCELAR_MOVIMIENTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214844609645634144)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(419151415000309351)
,p_button_name=>'CREAR_MOVIMIENTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214845022901634144)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(419151415000309351)
,p_button_name=>'GUARDAR_MOVIMIENTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214849006930634154)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(419318689311790493)
,p_button_name=>'CREAR_DETALLE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637163676244042)
,p_button_image_alt=>'Crear Detalle'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(214863013602634183)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(419155281241309389)
,p_button_name=>'CREAR'
,p_button_static_id=>'FOS_MOVIMIENTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'alineacionbutton buttonSize2'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214814633548634063)
,p_name=>'P84006_OBSERVACION_ESTADO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(407633490249819657)
,p_prompt=>'Observaciones'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214823455974634088)
,p_name=>'P84006_ID_INTERES_GENERADO_CONJUNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(415178101418468756)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214845709434634147)
,p_name=>'P84006_CODIGO_MONEDA_P'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(419151621604309353)
,p_item_default=>'SELECT CODIGO_MONEDA FROM SAF.GRAL_MONEDAS WHERE MONEDA_LOCAL IS NOT NULL'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	NOMBRE_MONEDA,',
'	CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS',
'ORDER BY CODIGO_MONEDA ASC'))
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214846131277634148)
,p_name=>'P84006_TASA_CAMBIO_P'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(419151621604309353)
,p_item_default=>'1'
,p_prompt=>'Tasa Cambio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214846561237634149)
,p_name=>'P84006_MONTO_ORIGEN_P'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(419151621604309353)
,p_item_default=>'0'
,p_prompt=>'Monto Origen'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214846976085634149)
,p_name=>'P84006_MONTO_LOCAL_P'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(419151621604309353)
,p_item_default=>'0'
,p_prompt=>'Monto Local'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214849422319634154)
,p_name=>'P84006_ID_RUBRO_LISTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(419318689311790493)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214850133577634156)
,p_name=>'P84006_USUARIO_GRABACION_P'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(419214679363671367)
,p_prompt=>'Usuario Grabacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214850582654634156)
,p_name=>'P84006_USUARIO_MODIFICACION_P'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(419214679363671367)
,p_prompt=>'Usuario Modificacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214850975786634157)
,p_name=>'P84006_FECHA_CREACION_P'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(419214679363671367)
,p_prompt=>'Fecha Grabacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214851365418634158)
,p_name=>'P84006_FECHA_MODIFICACION_P'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(419214679363671367)
,p_prompt=>'Fecha Modificacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214852878583634161)
,p_name=>'P84006_FECHA_DOCUMENTO_P'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha Documento P'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214853240130634161)
,p_name=>'P84006_CODMAE_P'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_prompt=>'# Maestro Bancos'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  CODMAE||''-''||nrocta||''-''||NOMCTA,CODMAE',
'FROM BCOMAESTRO',
'WHERE CODIGO_EMPRESA = :GLOBAL_EMPRESA',
'And FCancel is null',
'ORDER BY CODMAE'))
,p_cSize=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(214853657131634162)
,p_name=>'P84006_TIPO_TRANSACCION_P'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_prompt=>'Tipo Transaccion'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TIPO_TRANSACCION||''-''||NOMBRE_TRANSACCION Nombre,tipo_transaccion Tipo',
'FROM GRAL_TIPOS_TRANSAC_MODULOS',
'Where Codigo_Modulo = 8',
'and tipo_transaccion not in (958, 959, 931, 14, 15) ',
'ORDER BY TIPO_TRANSACCION, NOMBRE_TRANSACCION;'))
,p_cSize=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(214854031269634164)
,p_name=>'P84006_SERIE_P'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_prompt=>'Serie'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct SERIE ',
'FROM SAF.BCOSERIE ',
'WHERE CODIGO_EMPRESA=:GLOBAL_EMPRESA',
'and TIPO_TRANSACCION = :P84006_TIPO_TRANSACCION_P',
'and CODMAE = :P84006_CODMAE_P'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P84006_TIPO_TRANSACCION_P,P84006_CODMAE_P'
,p_ajax_items_to_submit=>'P84006_TIPO_TRANSACCION_P,P84006_CODMAE_P'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214854408969634165)
,p_name=>'P84006_NUMDOC_P'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_prompt=>'# Documento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214854861418634166)
,p_name=>'P84006_NROSOLCHE_P'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_prompt=>'# Solche'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select '' Solche # ''||',
'Cast(a.Nrosolche as varchar2(100))||'' con fecha ''||trim(to_char(a.fsolicitud,''DD/MM/YYYY''))||'' por valor de ''|| d.SIMBOLO_MONEDA ||',
'trim(to_char((a.Monto-APX_FNC_BCO_SALDO_BCOMOVIG_SOLCHE(:GLOBAL_EMPRESA,a.nrosolche)),''999,999,990.00''))|| '' a nombre de ''||',
'c.Nombre_Persona info,a.nrosolche',
'  From BcoSolche a, Gral_Estatus_Modulos b, Gral_Personas_Table c, Gral_Monedas d, Gral_Empresas e, Gral_Personas_Table f, Gral_Modulos g',
' where a.estatus         = b.Codigo_Estatus',
'   And a.Codigo_Persona  = c.Codigo_Persona',
'   And a.Codigo_Moneda   = d.Codigo_Moneda',
'   And a.Codigo_Empresa  = e.Codigo_Empresa',
'   And e.Codigo_Persona  = f.Codigo_Persona',
'   And a.Codigo_modulo   = g.Codigo_Modulo(+)',
'   And b.Codigo_Modulo   = 8',
'   And a.Codigo_Empresa  = :GLOBAL_EMPRESA',
'   And (a.Monto-APX_FNC_BCO_SALDO_BCOMOVIG_SOLCHE(:GLOBAL_EMPRESA,a.nrosolche))>0',
'and to_Char(a.FSolicitud,''YYYY'') >= 2020',
'order by a.nrosolche desc;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(214855274503634166)
,p_name=>'P84006_ID_CUENTA_P'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_prompt=>'Agrupador Contable'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'SELECT DESCRIPCION,ID_CUENTA FROM BCOCONCILIACION_CUENTAS'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(214855680793634167)
,p_name=>'P84006_CODIGO_OPERACION_P'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_prompt=>'Operacion Contable'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Codigo_Operacion || '' - '' || Descripcion d, Codigo_Operacion R',
'  from con_enc_param_polizas',
' Where Codigo_Empresa = :GLOBAL_EMPRESA',
'   and codigo_operacion  in (Select codigo_operacion',
'  from OPERACION_CONTABLE_TIPOSTRS oct ',
'where CODIGO_EMPRESA = :GLOBAL_EMPRESA',
'and TIPO_TRANSACCION = :P84006_TIPO_TRANSACCION_P',
'   )',
'   And Estado <> ''INACTIVO''',
' Order by Codigo_Operacion'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P84006_TIPO_TRANSACCION_P'
,p_ajax_items_to_submit=>'P84006_TIPO_TRANSACCION_P'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(214856084592634168)
,p_name=>'P84006_CONCEPTO_P'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_prompt=>'Concepto'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214856431806634168)
,p_name=>'P84006_FORMATO_P'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214856889842634169)
,p_name=>'P84006_ID_MOVIMIENTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214857223873634169)
,p_name=>'P84006_ANULAR'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214857666133634170)
,p_name=>'P84006_MONTO_RESIDUAL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(419153252910309369)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214864038323634185)
,p_name=>'P84006_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(564832889306409762)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214864412759634186)
,p_name=>'P84006_CODIGO_EMPRESA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(564832889306409762)
,p_prompt=>'Empresa'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	CODIGO_EMPRESA||'' - ''||NVL(NOMBRE_PERSONA,RAZON_SOCIAL) NOMBRE, ',
'	CODIGO_EMPRESA',
'FROM GRAL_PERSONAS_TABLE E, GRAL_EMPRESAS P',
'WHERE E.CODIGO_PERSONA = P.CODIGO_PERSONA',
'AND P.CODIGO_ESTADO IN ',
'(',
'	SELECT ',
'		CODIGO_ESTATUS',
'    FROM GRAL_ESTATUS_MODULOS',
'	WHERE CODIGO_MODULO = 1',
'	AND PERMITE_MOVTOS = ''S''',
')    ',
'AND P.CODIGO_EMPRESA >= 99',
'ORDER BY P.CODIGO_EMPRESA'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(214864828737634187)
,p_name=>'P84006_ES_PRESTAMO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(564832889306409762)
,p_item_default=>'N'
,p_prompt=>'Tipo Solicitud'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:PRESTAMO;S,INVERSION;N'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(99636457529244025)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214865203069634187)
,p_name=>'P84006_TIPO_DESTINATARIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(564832889306409762)
,p_prompt=>'Tipo Deudor'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC:EMPRESA;EMPRESA,PROVEEDOR;PROVEEDOR,CLIENTE;CLIENTE,PROYECTO;PROYECTO'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(214865628699634188)
,p_name=>'P84006_ID_ASOCIACION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(564832889306409762)
,p_prompt=>'Deudor'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	NOMBRE,',
'    VALOR',
'FROM TABLE',
'(',
'	SAF.GET_FDU_LISTA_DESTINATARIOS',
'	(',
'		V_EMPRESA => :P84006_CODIGO_EMPRESA,',
'		V_TIPO_DESTINATARIO => :P84006_TIPO_DESTINATARIO',
'	)',
');'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO'
,p_ajax_items_to_submit=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(214866009102634188)
,p_name=>'P84006_ESTADO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(564832889306409762)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_grid_column=>7
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
 p_id=>wwv_flow_imp.id(214866726329634190)
,p_name=>'P84006_USUARIO_GRABACION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(594584598152001553)
,p_prompt=>'Usuario Grabacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214867135265634191)
,p_name=>'P84006_USUARIO_MODIFICACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(594584598152001553)
,p_prompt=>'Usuario Modificacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214867546947634191)
,p_name=>'P84006_FECHA_GRABACION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(594584598152001553)
,p_prompt=>'Fecha Grabacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214867991622634192)
,p_name=>'P84006_FECHA_MODIFICACION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(594584598152001553)
,p_prompt=>'Fecha Modificacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214868524739634193)
,p_name=>'P84006_CODIGO_MONEDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(564833782680409771)
,p_item_default=>'SELECT CODIGO_MONEDA FROM SAF.GRAL_MONEDAS WHERE MONEDA_LOCAL IS NOT NULL'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	NOMBRE_MONEDA,',
'	CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS',
'ORDER BY CODIGO_MONEDA ASC'))
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214868976240634194)
,p_name=>'P84006_TASA_CAMBIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(564833782680409771)
,p_item_default=>'1'
,p_prompt=>'Tasa Cambio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214869315959634195)
,p_name=>'P84006_MONTO_ORIGEN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(564833782680409771)
,p_prompt=>'Monto Origen'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214869794916634195)
,p_name=>'P84006_MONTO_LOCAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(564833782680409771)
,p_prompt=>'Monto Local'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214870118078634196)
,p_name=>'P84006_OBSERVACIONES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(564833782680409771)
,p_prompt=>'Observaciones'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214870820538634198)
,p_name=>'P84006_MONTO_RECUPERADO_ORIGEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(594584100128001549)
,p_prompt=>'Monto Recuperado Origen'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214871242353634198)
,p_name=>'P84006_MONTO_RECUPERADO_LOCAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(594584100128001549)
,p_prompt=>'Monto Recuperado Local'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214871636745634199)
,p_name=>'P84006_FECHA_RECUPERACION_TOTAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(594584100128001549)
,p_prompt=>'Fecha Recuperacion Total'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214872027538634199)
,p_name=>'P84006_FECHA_APROBACION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(594584100128001549)
,p_prompt=>'Fecha Aprobacion'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214872757713634201)
,p_name=>'P84006_TIPO_PRESTAMO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Tipo Prestamo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	DESCRIPCION,',
'	ID',
'FROM CXC_TIPOS_PRESTAMO',
'ORDER BY ID ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214873169121634202)
,p_name=>'P84006_MEDIDA_PLAZO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Medida de Plazo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	DESCRIPCION_MEDIDA,',
'	CODIGO_MEDIDA',
'FROM SAF.GRAL_MEDIDAS',
'WHERE CODIGO_MEDIDA IN (510, 511)'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214873569285634202)
,p_name=>'P84006_PLAZO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Plazo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214873932024634203)
,p_name=>'P84006_TIPO_TASA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Tipo Tasa de Interes'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Mensual;1,Anual;2'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214874377844634203)
,p_name=>'P84006_TASA_INTERES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Tasa de Interes (%)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214874737471634204)
,p_name=>'P84006_FECHA_COBRO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Dia de Cobro'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>6
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214875136003634204)
,p_name=>'P84006_TIPO_COBRO_MORA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Tipo Cobro de Mora'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Mensual;1,Final de Plazo;2'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214875556042634205)
,p_name=>'P84006_TIPO_MORA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_item_default=>'1'
,p_prompt=>'Tipo Mora'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Porcentaje;1,Monto Fijo;2'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214875917003634206)
,p_name=>'P84006_PORCENTAJE_MORA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Mora (%)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214876309232634206)
,p_name=>'P84006_MONTO_MORA_ORIGEN'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Mora Origen'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214876706216634207)
,p_name=>'P84006_MONTO_MORA_LOCAL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(594582374506001531)
,p_prompt=>'Mora Local'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align: right;"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214884095787634220)
,p_name=>'P84006_ACCION_MODAL'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214884489991634221)
,p_name=>'P84006_ERROR'
,p_item_sequence=>30
,p_item_default=>'-1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214884863381634221)
,p_name=>'P84006_OPCIONES_FLUJO'
,p_item_sequence=>40
,p_item_default=>'-1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214885257592634223)
,p_name=>'P84006_VALIDAR_ES_PRESTAMO'
,p_item_sequence=>50
,p_item_default=>'-1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214885644260634224)
,p_name=>'P84006_VALIDAR_ESTADO'
,p_item_sequence=>60
,p_item_default=>'-1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(214886064898634224)
,p_name=>'P84006_URL'
,p_item_sequence=>70
,p_item_default=>'-1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214920160424634284)
,p_name=>'CARGAR_NOMBRE_MODAL'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214920631363634287)
,p_event_id=>wwv_flow_imp.id(214920160424634284)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'NOMBRE_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var opcion = apex.item(''P84006_ACCION_MODAL'').getValue();',
'if (opcion == ''CREAR'') {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''Crear Solicitud'');',
'} else if (opcion == ''MODIFICAR_SOLICITUD'') {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''Modificar Solicitud'');',
'} else if (opcion == ''ACEPTAR_REVISION'') {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''Aceptar Revision'');',
'} else if (opcion == ''REVISAR_SOLICITUD'') {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''Revision de Solicitud'');',
'} else if (opcion == ''ACEPTAR_APROBACION'') {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''Aceptar Aprobacion'');',
'} else if (opcion == ''APROBAR_SOLICITUD'') {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''Aprobar Solicitud'');',
'} else if (opcion == ''VER_REGISTRO'') {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''Solicitud'');',
'} else if (opcion == ''RECHAZADO_SOLICITUD'') {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''Solicitud Rechazada'');',
'} else if (opcion == ''INGRESO_SOLICITUD'') {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''Solicitud Aceptada'');',
'} else {',
'    apex.util.getTopApex().jQuery(".MODAL_SOLICITUD .ui-dialog-title").text(''ESTADO_INVALIDO'');',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214921105479634288)
,p_event_id=>wwv_flow_imp.id(214920160424634284)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ESTADO,P84006_MONTO_MORA_LOCAL,P84006_MONTO_LOCAL,P84006_MONTO_RECUPERADO_ORIGEN,P84006_MONTO_RECUPERADO_LOCAL,P84006_FECHA_RECUPERACION_TOTAL,P84006_USUARIO_GRABACION,P84006_FECHA_GRABACION,P84006_USUARIO_MODIFICACION,P84006_FECHA_MODIFICACIO'
||'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214915434272634276)
,p_name=>'CANCELAR_BTN'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214882810965634219)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214915958695634277)
,p_event_id=>wwv_flow_imp.id(214915434272634276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MORAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:0});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214916371522634277)
,p_name=>'CARGAR_DATOS_INICIO'
,p_event_sequence=>30
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CREAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214917386390634279)
,p_event_id=>wwv_flow_imp.id(214916371522634277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'OCULTAR_REGIONES'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594582374506001531)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214917845855634279)
,p_event_id=>wwv_flow_imp.id(214916371522634277)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'OCULTAR_REGIONES'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594584100128001549)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214918383127634280)
,p_event_id=>wwv_flow_imp.id(214916371522634277)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'OCULTAR_REGIONES'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594584598152001553)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214916896983634278)
,p_event_id=>wwv_flow_imp.id(214916371522634277)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'ESTADO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ESTADO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'SOLICITUD'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215011309478634436)
,p_name=>'CARGAR_DATOS_MODIFICAR_SOLICITUD'
,p_event_sequence=>50
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'MODIFICAR_SOLICITUD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215012882111634443)
,p_event_id=>wwv_flow_imp.id(215011309478634436)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215013372733634443)
,p_event_id=>wwv_flow_imp.id(215011309478634436)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_EMPRESA,',
'	TIPO_DESTINATARIO,',
'	ID_ASOCIACION,',
'	ES_PRESTAMO,',
'    ESTADO,',
'    CODIGO_MONEDA,',
'    TASA_CAMBIO,',
'    ROUND(MONTO_ORIGEN, 2),',
'    ROUND(MONTO_LOCAL, 2),',
'    OBSERVACIONES,',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'    FECHA_GRABACION,',
'    FECHA_MODIFICACION',
'    INTO',
'    :P84006_CODIGO_EMPRESA,',
'    :P84006_TIPO_DESTINATARIO,',
'    :P84006_ID_ASOCIACION,',
'    :P84006_ES_PRESTAMO,',
'    :P84006_ESTADO,',
'    :P84006_CODIGO_MONEDA,',
'    :P84006_TASA_CAMBIO,',
'    :P84006_MONTO_ORIGEN,',
'    :P84006_MONTO_LOCAL,',
'    :P84006_OBSERVACIONES,',
'    :P84006_USUARIO_GRABACION,',
'    :P84006_USUARIO_MODIFICACION,',
'    :P84006_FECHA_GRABACION,',
'    :P84006_FECHA_MODIFICACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_LOCAL,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_USUARIO_GRABACION,P84006_USUARIO_MODIFICAC'
||'ION,P84006_FECHA_GRABACION,P84006_FECHA_MODIFICACION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215012361413634442)
,p_event_id=>wwv_flow_imp.id(215011309478634436)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	TIPO_PRESTAMO,',
'    PLAZO,',
'    MEDIDA_PLAZO,',
'    TIPO_TASA,',
'    TASA_INTERES,',
'    FECHA_COBRO,',
'    TIPO_COBRO_MORA',
'    INTO',
'    :P84006_TIPO_PRESTAMO,',
'    :P84006_PLAZO,',
'    :P84006_MEDIDA_PLAZO,',
'    :P84006_TIPO_TASA,',
'    :P84006_TASA_INTERES,',
'    :P84006_FECHA_COBRO,',
'    :P84006_TIPO_COBRO_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TASA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215011871804634437)
,p_event_id=>wwv_flow_imp.id(215011309478634436)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	PORCENTAJE_MORA',
'    INTO',
'    :P84006_PORCENTAJE_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_PORCENTAJE_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''1'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215014376637634445)
,p_event_id=>wwv_flow_imp.id(215011309478634436)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	MONTO_MORA_LOCAL,',
'    MONTO_MORA_ORIGEN',
'    INTO',
'    :P84006_MONTO_MORA_LOCAL,',
'    :P84006_MONTO_MORA_ORIGEN',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''2'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215013853924634444)
,p_event_id=>wwv_flow_imp.id(215011309478634436)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'OCULTAR_REGION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594584100128001549)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214939127650634316)
,p_name=>'CARGAR_DATOS_ACEPTAR_APROBACION'
,p_event_sequence=>60
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ACEPTAR_APROBACION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214939654714634317)
,p_event_id=>wwv_flow_imp.id(214939127650634316)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_TIPO_PRESTAMO,P84006_MEDIDA_PLAZO,P84006_PLAZO,P84006_TIPO_TASA,P84006_TASA'
||'_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA,P84006_TIPO_MORA,P84006_PORCENTAJE_MORA,P84006_MONTO_MORA_ORIGEN,P84006_MONTO_MORA_LOCALP84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_CODIGO_MONEDA,P84'
||'006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_TIPO_PRESTAMO,P84006_MEDIDA_PLAZO,P84006_PLAZO,P84006_TIPO_TASA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA,P84006_TIPO_MORA,P84006_PORCENTAJE_MORA,P84006_MONTO_MORA_OR'
||'IGEN,P84006_MONTO_MORA_LOCAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214940106044634318)
,p_event_id=>wwv_flow_imp.id(214939127650634316)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_EMPRESA,',
'	TIPO_DESTINATARIO,',
'	ID_ASOCIACION,',
'	ES_PRESTAMO,',
'    ESTADO,',
'    CODIGO_MONEDA,',
'    TASA_CAMBIO,',
'    ROUND(MONTO_ORIGEN, 2),',
'    ROUND(MONTO_LOCAL, 2),',
'    OBSERVACIONES,',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'    FECHA_GRABACION,',
'    FECHA_MODIFICACION',
'    INTO',
'    :P84006_CODIGO_EMPRESA,',
'    :P84006_TIPO_DESTINATARIO,',
'    :P84006_ID_ASOCIACION,',
'    :P84006_ES_PRESTAMO,',
'    :P84006_ESTADO,',
'    :P84006_CODIGO_MONEDA,',
'    :P84006_TASA_CAMBIO,',
'    :P84006_MONTO_ORIGEN,',
'    :P84006_MONTO_LOCAL,',
'    :P84006_OBSERVACIONES,',
'    :P84006_USUARIO_GRABACION,',
'    :P84006_USUARIO_MODIFICACION,',
'    :P84006_FECHA_GRABACION,',
'    :P84006_FECHA_MODIFICACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_LOCAL,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_USUARIO_GRABACION,P84006_USUARIO_MODIFICAC'
||'ION,P84006_FECHA_GRABACION,P84006_FECHA_MODIFICACION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214940620455634319)
,p_event_id=>wwv_flow_imp.id(214939127650634316)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	TIPO_PRESTAMO,',
'    PLAZO,',
'    MEDIDA_PLAZO,',
'    TIPO_TASA,',
'    TASA_INTERES,',
'    FECHA_COBRO,',
'    TIPO_COBRO_MORA',
'    INTO',
'    :P84006_TIPO_PRESTAMO,',
'    :P84006_PLAZO,',
'    :P84006_MEDIDA_PLAZO,',
'    :P84006_TIPO_TASA,',
'    :P84006_TASA_INTERES,',
'    :P84006_FECHA_COBRO,',
'    :P84006_TIPO_COBRO_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TASA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214941128549634320)
,p_event_id=>wwv_flow_imp.id(214939127650634316)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	PORCENTAJE_MORA',
'    INTO',
'    :P84006_PORCENTAJE_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_PORCENTAJE_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''1'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214941680911634321)
,p_event_id=>wwv_flow_imp.id(214939127650634316)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	MONTO_MORA_LOCAL,',
'    MONTO_MORA_ORIGEN',
'    INTO',
'    :P84006_MONTO_MORA_LOCAL,',
'    :P84006_MONTO_MORA_ORIGEN',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''2'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214942105466634321)
,p_event_id=>wwv_flow_imp.id(214939127650634316)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'OCULTAR_REGION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594584100128001549)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215045421315634513)
,p_name=>'CARGAR_DATOS_VER_REGISTRO'
,p_event_sequence=>70
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'VER_REGISTRO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215045908363634513)
,p_event_id=>wwv_flow_imp.id(215045421315634513)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_TIPO_PRESTAMO,P84006_MEDIDA_PLAZO,P84006_PLAZO,P84006_TIPO_TASA,P84006_TASA'
||'_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA,P84006_TIPO_MORA,P84006_PORCENTAJE_MORA,P84006_MONTO_MORA_ORIGEN,P84006_MONTO_MORA_LOCAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215046466881634514)
,p_event_id=>wwv_flow_imp.id(215045421315634513)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_EMPRESA,',
'	TIPO_DESTINATARIO,',
'	ID_ASOCIACION,',
'	ES_PRESTAMO,',
'    ESTADO,',
'    CODIGO_MONEDA,',
'    TASA_CAMBIO,',
'    ROUND(MONTO_ORIGEN, 2),',
'    ROUND(MONTO_LOCAL, 2),',
'    OBSERVACIONES,',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'    FECHA_GRABACION,',
'    FECHA_MODIFICACION',
'    INTO',
'    :P84006_CODIGO_EMPRESA,',
'    :P84006_TIPO_DESTINATARIO,',
'    :P84006_ID_ASOCIACION,',
'    :P84006_ES_PRESTAMO,',
'    :P84006_ESTADO,',
'    :P84006_CODIGO_MONEDA,',
'    :P84006_TASA_CAMBIO,',
'    :P84006_MONTO_ORIGEN,',
'    :P84006_MONTO_LOCAL,',
'    :P84006_OBSERVACIONES,',
'    :P84006_USUARIO_GRABACION,',
'    :P84006_USUARIO_MODIFICACION,',
'    :P84006_FECHA_GRABACION,',
'    :P84006_FECHA_MODIFICACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_LOCAL,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_USUARIO_GRABACION,P84006_USUARIO_MODIFICAC'
||'ION,P84006_FECHA_GRABACION,P84006_FECHA_MODIFICACION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215046949610634515)
,p_event_id=>wwv_flow_imp.id(215045421315634513)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	TIPO_PRESTAMO,',
'    PLAZO,',
'    MEDIDA_PLAZO,',
'    TIPO_TASA,',
'    TASA_INTERES,',
'    FECHA_COBRO,',
'    TIPO_COBRO_MORA',
'    INTO',
'    :P84006_TIPO_PRESTAMO,',
'    :P84006_PLAZO,',
'    :P84006_MEDIDA_PLAZO,',
'    :P84006_TIPO_TASA,',
'    :P84006_TASA_INTERES,',
'    :P84006_FECHA_COBRO,',
'    :P84006_TIPO_COBRO_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TASA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215047416514634516)
,p_event_id=>wwv_flow_imp.id(215045421315634513)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	PORCENTAJE_MORA',
'    INTO',
'    :P84006_PORCENTAJE_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_PORCENTAJE_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''1'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215047920867634522)
,p_event_id=>wwv_flow_imp.id(215045421315634513)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	MONTO_MORA_LOCAL,',
'    MONTO_MORA_ORIGEN',
'    INTO',
'    :P84006_MONTO_MORA_LOCAL,',
'    :P84006_MONTO_MORA_ORIGEN',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''2'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215048401468634522)
,p_event_id=>wwv_flow_imp.id(215045421315634513)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'OCULTAR_REGION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594584100128001549)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214931442106634304)
,p_name=>'CARGAR_DATOS_REVISAR_SOLICITUD'
,p_event_sequence=>80
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'REVISAR_SOLICITUD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214931945884634305)
,p_event_id=>wwv_flow_imp.id(214931442106634304)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'OPCIONES_BOTON'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try{',
'    $(`.MODAL_SOLICITUD > .ui-dialog-titlebar > .button-ACEPTAR_REVISAR_BTN`, window.parent.document).remove();',
'    $(`.MODAL_SOLICITUD > .ui-dialog-titlebar > .button-CANCELAR`, window.parent.document).remove();',
'}catch{',
'    console.log(''BTN'')',
'}',
'',
'',
'customButtonsModal(''MODAL_SOLICITUD'', $btns);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214932491734634306)
,p_event_id=>wwv_flow_imp.id(214931442106634304)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214932906471634306)
,p_event_id=>wwv_flow_imp.id(214931442106634304)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_EMPRESA,',
'	TIPO_DESTINATARIO,',
'	ID_ASOCIACION,',
'	ES_PRESTAMO,',
'    ESTADO,',
'    CODIGO_MONEDA,',
'    TASA_CAMBIO,',
'    ROUND(MONTO_ORIGEN, 2),',
'    ROUND(MONTO_LOCAL, 2),',
'    OBSERVACIONES,',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'    FECHA_GRABACION,',
'    FECHA_MODIFICACION',
'    INTO',
'    :P84006_CODIGO_EMPRESA,',
'    :P84006_TIPO_DESTINATARIO,',
'    :P84006_ID_ASOCIACION,',
'    :P84006_ES_PRESTAMO,',
'    :P84006_ESTADO,',
'    :P84006_CODIGO_MONEDA,',
'    :P84006_TASA_CAMBIO,',
'    :P84006_MONTO_ORIGEN,',
'    :P84006_MONTO_LOCAL,',
'    :P84006_OBSERVACIONES,',
'    :P84006_USUARIO_GRABACION,',
'    :P84006_USUARIO_MODIFICACION,',
'    :P84006_FECHA_GRABACION,',
'    :P84006_FECHA_MODIFICACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_LOCAL,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_USUARIO_GRABACION,P84006_USUARIO_MODIFICAC'
||'ION,P84006_FECHA_GRABACION,P84006_FECHA_MODIFICACION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214933408015634307)
,p_event_id=>wwv_flow_imp.id(214931442106634304)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	TIPO_PRESTAMO,',
'    PLAZO,',
'    MEDIDA_PLAZO,',
'    TIPO_TASA,',
'    TASA_INTERES,',
'    FECHA_COBRO,',
'    TIPO_COBRO_MORA',
'    INTO',
'    :P84006_TIPO_PRESTAMO,',
'    :P84006_PLAZO,',
'    :P84006_MEDIDA_PLAZO,',
'    :P84006_TIPO_TASA,',
'    :P84006_TASA_INTERES,',
'    :P84006_FECHA_COBRO,',
'    :P84006_TIPO_COBRO_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TASA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214933965077634308)
,p_event_id=>wwv_flow_imp.id(214931442106634304)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	PORCENTAJE_MORA',
'    INTO',
'    :P84006_PORCENTAJE_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_PORCENTAJE_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''1'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214934425963634309)
,p_event_id=>wwv_flow_imp.id(214931442106634304)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	MONTO_MORA_LOCAL,',
'    MONTO_MORA_ORIGEN',
'    INTO',
'    :P84006_MONTO_MORA_LOCAL,',
'    :P84006_MONTO_MORA_ORIGEN',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''2'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214934938723634310)
,p_event_id=>wwv_flow_imp.id(214931442106634304)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'OCULTAR_REGION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594584100128001549)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214974628512634375)
,p_name=>'CARGAR_DATOS_APROBAR_SOLICITUD'
,p_event_sequence=>90
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'APROBAR_SOLICITUD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214975128323634376)
,p_event_id=>wwv_flow_imp.id(214974628512634375)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'OPCIONES_BOTON'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try{',
'    $(`.MODAL_SOLICITUD > .ui-dialog-titlebar > .button-ACEPTAR_APROBACION`, window.parent.document).remove();',
'    $(`.MODAL_SOLICITUD > .ui-dialog-titlebar > .button-CANCELAR`, window.parent.document).remove();',
'}catch{',
'    console.log(''BTN'')',
'}',
'',
'',
'customButtonsModal(''MODAL_SOLICITUD'', $btns);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214978177363634381)
,p_event_id=>wwv_flow_imp.id(214974628512634375)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_TIPO_PRESTAMO,P84006_MEDIDA_PLAZO,P84006_PLAZO,P84006_TIPO_TASA,P84006_TASA'
||'_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA,P84006_TIPO_MORA,P84006_PORCENTAJE_MORA,P84006_MONTO_MORA_ORIGEN,P84006_MONTO_MORA_LOCAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214975626008634377)
,p_event_id=>wwv_flow_imp.id(214974628512634375)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_EMPRESA,',
'	TIPO_DESTINATARIO,',
'	ID_ASOCIACION,',
'	ES_PRESTAMO,',
'    ESTADO,',
'    CODIGO_MONEDA,',
'    TASA_CAMBIO,',
'    ROUND(MONTO_ORIGEN, 2),',
'    ROUND(MONTO_LOCAL, 2),',
'    OBSERVACIONES,',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'    FECHA_GRABACION,',
'    FECHA_MODIFICACION',
'    INTO',
'    :P84006_CODIGO_EMPRESA,',
'    :P84006_TIPO_DESTINATARIO,',
'    :P84006_ID_ASOCIACION,',
'    :P84006_ES_PRESTAMO,',
'    :P84006_ESTADO,',
'    :P84006_CODIGO_MONEDA,',
'    :P84006_TASA_CAMBIO,',
'    :P84006_MONTO_ORIGEN,',
'    :P84006_MONTO_LOCAL,',
'    :P84006_OBSERVACIONES,',
'    :P84006_USUARIO_GRABACION,',
'    :P84006_USUARIO_MODIFICACION,',
'    :P84006_FECHA_GRABACION,',
'    :P84006_FECHA_MODIFICACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_LOCAL,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_USUARIO_GRABACION,P84006_USUARIO_MODIFICAC'
||'ION,P84006_FECHA_GRABACION,P84006_FECHA_MODIFICACION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214976114538634378)
,p_event_id=>wwv_flow_imp.id(214974628512634375)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	TIPO_PRESTAMO,',
'    PLAZO,',
'    MEDIDA_PLAZO,',
'    TIPO_TASA,',
'    TASA_INTERES,',
'    FECHA_COBRO,',
'    TIPO_COBRO_MORA',
'    INTO',
'    :P84006_TIPO_PRESTAMO,',
'    :P84006_PLAZO,',
'    :P84006_MEDIDA_PLAZO,',
'    :P84006_TIPO_TASA,',
'    :P84006_TASA_INTERES,',
'    :P84006_FECHA_COBRO,',
'    :P84006_TIPO_COBRO_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TASA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214976640327634378)
,p_event_id=>wwv_flow_imp.id(214974628512634375)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	PORCENTAJE_MORA',
'    INTO',
'    :P84006_PORCENTAJE_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_PORCENTAJE_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''1'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214977186703634379)
,p_event_id=>wwv_flow_imp.id(214974628512634375)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	MONTO_MORA_LOCAL,',
'    MONTO_MORA_ORIGEN',
'    INTO',
'    :P84006_MONTO_MORA_LOCAL,',
'    :P84006_MONTO_MORA_ORIGEN',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''2'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214977692254634380)
,p_event_id=>wwv_flow_imp.id(214974628512634375)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'OCULTAR_REGION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594584100128001549)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214981856958634388)
,p_name=>'CARGAR_DATOS_RECHAZADO_SOLICITUD'
,p_event_sequence=>100
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'RECHAZADO_SOLICITUD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214982312798634388)
,p_event_id=>wwv_flow_imp.id(214981856958634388)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_TIPO_PRESTAMO,P84006_MEDIDA_PLAZO,P84006_PLAZO,P84006_TIPO_TASA,P84006_TASA'
||'_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA,P84006_TIPO_MORA,P84006_PORCENTAJE_MORA,P84006_MONTO_MORA_ORIGEN,P84006_MONTO_MORA_LOCAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214982843402634389)
,p_event_id=>wwv_flow_imp.id(214981856958634388)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_EMPRESA,',
'	TIPO_DESTINATARIO,',
'	ID_ASOCIACION,',
'	ES_PRESTAMO,',
'    ESTADO,',
'    CODIGO_MONEDA,',
'    TASA_CAMBIO,',
'    ROUND(MONTO_ORIGEN, 2),',
'    ROUND(MONTO_LOCAL, 2),',
'    OBSERVACIONES,',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'    FECHA_GRABACION,',
'    FECHA_MODIFICACION',
'    INTO',
'    :P84006_CODIGO_EMPRESA,',
'    :P84006_TIPO_DESTINATARIO,',
'    :P84006_ID_ASOCIACION,',
'    :P84006_ES_PRESTAMO,',
'    :P84006_ESTADO,',
'    :P84006_CODIGO_MONEDA,',
'    :P84006_TASA_CAMBIO,',
'    :P84006_MONTO_ORIGEN,',
'    :P84006_MONTO_LOCAL,',
'    :P84006_OBSERVACIONES,',
'    :P84006_USUARIO_GRABACION,',
'    :P84006_USUARIO_MODIFICACION,',
'    :P84006_FECHA_GRABACION,',
'    :P84006_FECHA_MODIFICACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_LOCAL,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_USUARIO_GRABACION,P84006_USUARIO_MODIFICAC'
||'ION,P84006_FECHA_GRABACION,P84006_FECHA_MODIFICACION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214983351742634390)
,p_event_id=>wwv_flow_imp.id(214981856958634388)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	TIPO_PRESTAMO,',
'    PLAZO,',
'    MEDIDA_PLAZO,',
'    TIPO_TASA,',
'    TASA_INTERES,',
'    FECHA_COBRO,',
'    TIPO_COBRO_MORA',
'    INTO',
'    :P84006_TIPO_PRESTAMO,',
'    :P84006_PLAZO,',
'    :P84006_MEDIDA_PLAZO,',
'    :P84006_TIPO_TASA,',
'    :P84006_TASA_INTERES,',
'    :P84006_FECHA_COBRO,',
'    :P84006_TIPO_COBRO_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TASA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214983850120634391)
,p_event_id=>wwv_flow_imp.id(214981856958634388)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	PORCENTAJE_MORA',
'    INTO',
'    :P84006_PORCENTAJE_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_PORCENTAJE_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''1'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214984372031634392)
,p_event_id=>wwv_flow_imp.id(214981856958634388)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	MONTO_MORA_LOCAL,',
'    MONTO_MORA_ORIGEN',
'    INTO',
'    :P84006_MONTO_MORA_LOCAL,',
'    :P84006_MONTO_MORA_ORIGEN',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''2'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214984884820634392)
,p_event_id=>wwv_flow_imp.id(214981856958634388)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'OCULTAR_REGION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594584100128001549)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215040107233634505)
,p_name=>'CARGAR_DATOS_ACEPTAR_REVISION'
,p_event_sequence=>110
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ACEPTAR_REVISION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215040628951634506)
,p_event_id=>wwv_flow_imp.id(215040107233634505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_TIPO_PRESTAMO,P84006_MEDIDA_PLAZO,P84006_PLAZO,P84006_TIPO_TASA,P84006_TASA'
||'_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA,P84006_TIPO_MORA,P84006_PORCENTAJE_MORA,P84006_MONTO_MORA_ORIGEN,P84006_MONTO_MORA_LOCAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215041134544634507)
,p_event_id=>wwv_flow_imp.id(215040107233634505)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_EMPRESA,',
'	TIPO_DESTINATARIO,',
'	ID_ASOCIACION,',
'	ES_PRESTAMO,',
'    ESTADO,',
'    CODIGO_MONEDA,',
'    TASA_CAMBIO,',
'    ROUND(MONTO_ORIGEN, 2),',
'    ROUND(MONTO_LOCAL, 2),',
'    OBSERVACIONES,',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'    FECHA_GRABACION,',
'    FECHA_MODIFICACION',
'    INTO',
'    :P84006_CODIGO_EMPRESA,',
'    :P84006_TIPO_DESTINATARIO,',
'    :P84006_ID_ASOCIACION,',
'    :P84006_ES_PRESTAMO,',
'    :P84006_ESTADO,',
'    :P84006_CODIGO_MONEDA,',
'    :P84006_TASA_CAMBIO,',
'    :P84006_MONTO_ORIGEN,',
'    :P84006_MONTO_LOCAL,',
'    :P84006_OBSERVACIONES,',
'    :P84006_USUARIO_GRABACION,',
'    :P84006_USUARIO_MODIFICACION,',
'    :P84006_FECHA_GRABACION,',
'    :P84006_FECHA_MODIFICACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_LOCAL,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_USUARIO_GRABACION,P84006_USUARIO_MODIFICAC'
||'ION,P84006_FECHA_GRABACION,P84006_FECHA_MODIFICACION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215041677030634508)
,p_event_id=>wwv_flow_imp.id(215040107233634505)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	TIPO_PRESTAMO,',
'    PLAZO,',
'    MEDIDA_PLAZO,',
'    TIPO_TASA,',
'    TASA_INTERES,',
'    FECHA_COBRO,',
'    TIPO_COBRO_MORA',
'    INTO',
'    :P84006_TIPO_PRESTAMO,',
'    :P84006_PLAZO,',
'    :P84006_MEDIDA_PLAZO,',
'    :P84006_TIPO_TASA,',
'    :P84006_TASA_INTERES,',
'    :P84006_FECHA_COBRO,',
'    :P84006_TIPO_COBRO_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TASA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215042195525634508)
,p_event_id=>wwv_flow_imp.id(215040107233634505)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	PORCENTAJE_MORA',
'    INTO',
'    :P84006_PORCENTAJE_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_PORCENTAJE_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''1'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215042695576634509)
,p_event_id=>wwv_flow_imp.id(215040107233634505)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	MONTO_MORA_LOCAL,',
'    MONTO_MORA_ORIGEN',
'    INTO',
'    :P84006_MONTO_MORA_LOCAL,',
'    :P84006_MONTO_MORA_ORIGEN',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''2'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215043156375634510)
,p_event_id=>wwv_flow_imp.id(215040107233634505)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'OCULTAR_REGION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594584100128001549)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214918772130634280)
,p_name=>'MOSTRAR_REGION'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_ES_PRESTAMO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214919795540634282)
,p_event_id=>wwv_flow_imp.id(214918772130634280)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594582374506001531)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214919287897634281)
,p_event_id=>wwv_flow_imp.id(214918772130634280)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(594582374506001531)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214908376953634265)
,p_name=>'MOSTRAR_CUADROS'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_TIPO_MORA'
,p_condition_element=>'P84006_TIPO_MORA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214908820107634266)
,p_event_id=>wwv_flow_imp.id(214908376953634265)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'MOSTRAR_MORA%'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_PORCENTAJE_MORA'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_TIPO_MORA'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214909310588634267)
,p_event_id=>wwv_flow_imp.id(214908376953634265)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'OCULTAR_MORA%'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_PORCENTAJE_MORA'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_TIPO_MORA'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214909811114634267)
,p_event_id=>wwv_flow_imp.id(214908376953634265)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'MOSTRAR_MORA_FIJA'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_MORA_ORIGEN,P84006_MONTO_MORA_LOCAL'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_TIPO_MORA'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214910303087634268)
,p_event_id=>wwv_flow_imp.id(214908376953634265)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_name=>'OCULTAR_MORA_FIJA'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_MORA_ORIGEN,P84006_MONTO_MORA_LOCAL'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_TIPO_MORA'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214912167202634270)
,p_name=>'GUARDAR_BTN'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214883274394634219)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214912665392634271)
,p_event_id=>wwv_flow_imp.id(214912167202634270)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item(''P84006_ES_PRESTAMO'').getValue() == ''N'') {',
'    $.event.trigger(''CREAR_INVERSION'');',
'} else {',
'    $.event.trigger(''CREAR_PRESTAMO'');',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214913033774634271)
,p_name=>'CREAR_INVERSION'
,p_event_sequence=>150
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'validarCamposRequeridos($validar_inversion)'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CREAR_INVERSION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214914075547634273)
,p_event_id=>wwv_flow_imp.id(214913033774634271)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CREAR_INVERSION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ID NUMBER;',
'BEGIN',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS',
'    (',
'        CODIGO_EMPRESA,',
'        TIPO_DESTINATARIO,',
'        ID_ASOCIACION,',
'        ESTADO,',
'        CODIGO_MONEDA,',
'        TASA_CAMBIO,',
'        MONTO_ORIGEN,',
'        MONTO_LOCAL,',
'        OBSERVACIONES,',
'        ES_PRESTAMO,',
'        USUARIO_GRABACION,',
'        FECHA_GRABACION',
'    )',
'    VALUES',
'    (',
'        :P84006_CODIGO_EMPRESA,',
'        :P84006_TIPO_DESTINATARIO,',
'        :P84006_ID_ASOCIACION,',
'        :P84006_ESTADO,',
'        :P84006_CODIGO_MONEDA,',
'        NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)),',
'        :P84006_MONTO_ORIGEN,',
'        SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL),',
'        :P84006_OBSERVACIONES,',
'        :P84006_ES_PRESTAMO,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    ) RETURNING ID INTO V_ID;',
'',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'    (',
'        ID_FDU_TRANSACCIONES_FINANCIERAS,',
'        ESTADO,',
'        OBSERVACION,',
'        USUARIO_ACEPTACION,',
'        FECHA_ACEPTACION',
'    )',
'    VALUES',
'    (',
'        V_ID,',
'        ''SOLICITUD'',',
'        NULL,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'',
'    IF :P84006_ESTADO = ''ENVIADO A REVISION'' THEN',
'        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'        (',
'            ID_FDU_TRANSACCIONES_FINANCIERAS,',
'            ESTADO,',
'            OBSERVACION,',
'            USUARIO_ACEPTACION,',
'            FECHA_ACEPTACION',
'        )',
'        VALUES',
'        (',
'            V_ID,',
'            ''ENVIADO A REVISION'',',
'            :P84006_OBSERVACION_ESTADO,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        );',
'    END IF;',
'END;'))
,p_attribute_02=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_ES_PRESTAMO,P84006_OBSERVACION_ESTADO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214915027581634276)
,p_event_id=>wwv_flow_imp.id(214913033774634271)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'1'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214913589031634272)
,p_event_id=>wwv_flow_imp.id(214913033774634271)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MORAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:1});'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214914513334634275)
,p_event_id=>wwv_flow_imp.id(214913033774634271)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215020477394634453)
,p_name=>'ACTUALIZAR_INVERSION'
,p_event_sequence=>160
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'validarCamposRequeridos($validar_inversion)'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ACTUALIZAR_INVERSION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215021482259634455)
,p_event_id=>wwv_flow_imp.id(215020477394634453)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'1'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215020995229634454)
,p_event_id=>wwv_flow_imp.id(215020477394634453)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ACTUALIZAR_INVERSION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'        CODIGO_MONEDA = :P84006_CODIGO_MONEDA,',
'        TASA_CAMBIO = NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)),',
'        MONTO_ORIGEN = :P84006_MONTO_ORIGEN,',
'        MONTO_LOCAL = SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL),',
'        OBSERVACIONES = :P84006_OBSERVACIONES,',
'        USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'        FECHA_MODIFICACION = SYSDATE',
'    WHERE ID = :P84006_ID;',
'',
'    IF :P84006_ESTADO = ''AVANZAR SOLICITUD F2'' THEN',
'         UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            ESTADO = ''ENVIADO A REVISION''',
'        WHERE ID = :P84006_ID;',
'',
'        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'        (',
'            ID_FDU_TRANSACCIONES_FINANCIERAS,',
'            ESTADO,',
'            OBSERVACION,',
'            USUARIO_ACEPTACION,',
'            FECHA_ACEPTACION',
'        )',
'        VALUES',
'        (',
'            :P84006_ID,',
'            ''ENVIADO A REVISION'',',
'            :P84006_OBSERVACION_ESTADO,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        );',
'    END IF;',
'END;'))
,p_attribute_02=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_ES_PRESTAMO,P84006_OBSERVACION_ESTADO,P84006_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215022478764634456)
,p_event_id=>wwv_flow_imp.id(215020477394634453)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215021980963634456)
,p_event_id=>wwv_flow_imp.id(215020477394634453)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MORAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:1});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214905483939634259)
,p_name=>'CREAR_PRESTAMO'
,p_event_sequence=>170
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validarCamposRequeridos($validar_prestamo) &&',
'validarMora()'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CREAR_PRESTAMO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214906453659634261)
,p_event_id=>wwv_flow_imp.id(214905483939634259)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CREAR_PRESTAMO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ID NUMBER;',
'BEGIN',
'    IF :P84006_TIPO_MORA = 1 THEN',
'        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS',
'        (',
'            CODIGO_EMPRESA,',
'            TIPO_DESTINATARIO,',
'            ID_ASOCIACION,',
'            ESTADO,',
'            CODIGO_MONEDA,',
'            TASA_CAMBIO,',
'            MONTO_ORIGEN,',
'            MONTO_LOCAL,',
'            OBSERVACIONES,',
'            ES_PRESTAMO,',
'            TIPO_PRESTAMO,',
'            PLAZO,',
'            MEDIDA_PLAZO,',
'            TIPO_TASA,',
'            TASA_INTERES,',
'            FECHA_COBRO,',
'            TIPO_COBRO_MORA,',
'            TIPO_MORA,',
'            PORCENTAJE_MORA,',
'            USUARIO_GRABACION,',
'            FECHA_GRABACION',
'        )',
'        VALUES',
'        (',
'            :P84006_CODIGO_EMPRESA,',
'            :P84006_TIPO_DESTINATARIO,',
'            :P84006_ID_ASOCIACION,',
'            :P84006_ESTADO,',
'            :P84006_CODIGO_MONEDA,',
'            NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)),',
'            :P84006_MONTO_ORIGEN,',
'            SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL),',
'            :P84006_OBSERVACIONES,',
'            :P84006_ES_PRESTAMO,',
'            :P84006_TIPO_PRESTAMO,',
'            :P84006_PLAZO,',
'            :P84006_MEDIDA_PLAZO,',
'            :P84006_TIPO_TASA,',
'            :P84006_TASA_INTERES,',
'            :P84006_FECHA_COBRO,',
'            :P84006_TIPO_COBRO_MORA,',
'            :P84006_TIPO_MORA,',
'            :P84006_PORCENTAJE_MORA,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        ) RETURNING ID INTO V_ID;',
'    ELSE',
'        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS',
'        (',
'            CODIGO_EMPRESA,',
'            TIPO_DESTINATARIO,',
'            ID_ASOCIACION,',
'            ESTADO,',
'            CODIGO_MONEDA,',
'            TASA_CAMBIO,',
'            MONTO_ORIGEN,',
'            MONTO_LOCAL,',
'            OBSERVACIONES,',
'            ES_PRESTAMO,',
'            TIPO_PRESTAMO,',
'            PLAZO,',
'            MEDIDA_PLAZO,',
'            TIPO_TASA,',
'            TASA_INTERES,',
'            FECHA_COBRO,',
'            TIPO_COBRO_MORA,',
'            TIPO_MORA,',
'            MONTO_MORA_LOCAL,',
'            MONTO_MORA_ORIGEN,',
'            USUARIO_GRABACION,',
'            FECHA_GRABACION',
'        )',
'        VALUES',
'        (',
'            :P84006_CODIGO_EMPRESA,',
'            :P84006_TIPO_DESTINATARIO,',
'            :P84006_ID_ASOCIACION,',
'            :P84006_ESTADO,',
'            :P84006_CODIGO_MONEDA,',
'            NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)),',
'            :P84006_MONTO_ORIGEN,',
'            SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL),',
'            :P84006_OBSERVACIONES,',
'            :P84006_ES_PRESTAMO,',
'            :P84006_TIPO_PRESTAMO,',
'            :P84006_PLAZO,',
'            :P84006_MEDIDA_PLAZO,',
'            :P84006_TIPO_TASA,',
'            :P84006_TASA_INTERES,',
'            :P84006_FECHA_COBRO,',
'            :P84006_TIPO_COBRO_MORA,',
'            :P84006_TIPO_MORA,',
'            :P84006_MONTO_MORA_LOCAL,',
'            :P84006_MONTO_MORA_ORIGEN,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        ) RETURNING ID INTO V_ID;',
'    END IF;',
'',
'    :P84006_ID := V_ID;',
'END;'))
,p_attribute_02=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_ES_PRESTAMO,P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TA'
||'SA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA,P84006_TIPO_MORA,P84006_PORCENTAJE_MORA,P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN,P84006_OBSERVACION_ESTADO'
,p_attribute_03=>'P84006_ID'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214906957164634263)
,p_event_id=>wwv_flow_imp.id(214905483939634259)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'2'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214905997484634260)
,p_event_id=>wwv_flow_imp.id(214905483939634259)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CREAR_PRESTAMO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ID NUMBER;',
'BEGIN',
'    V_ID := :P84006_ID;',
'',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'    (',
'        ID_FDU_TRANSACCIONES_FINANCIERAS,',
'        ESTADO,',
'        OBSERVACION,',
'        USUARIO_ACEPTACION,',
'        FECHA_ACEPTACION',
'    )',
'    VALUES',
'    (',
'        V_ID,',
'        ''SOLICITUD'',',
'        NULL,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'    ',
'    IF :P84006_ESTADO = ''ENVIADO A REVISION'' THEN',
'        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'        (',
'            ID_FDU_TRANSACCIONES_FINANCIERAS,',
'            ESTADO,',
'            OBSERVACION,',
'            USUARIO_ACEPTACION,',
'            FECHA_ACEPTACION',
'        )',
'        VALUES',
'        (',
'            V_ID,',
'            ''ENVIADO A REVISION'',',
'            :P84006_OBSERVACION_ESTADO,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        );',
'    END IF;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_OBSERVACION_ESTADO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214907993027634264)
,p_event_id=>wwv_flow_imp.id(214905483939634259)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214907499873634264)
,p_event_id=>wwv_flow_imp.id(214905483939634259)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MORAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:1});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215022876666634457)
,p_name=>'ACTUALIZAR_PRESTAMO'
,p_event_sequence=>180
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validarCamposRequeridos($validar_prestamo) &&',
'validarMora()'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ACTUALIZAR_PRESTAMO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215023346843634458)
,p_event_id=>wwv_flow_imp.id(215022876666634457)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_PRESTAMO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P84006_TIPO_MORA = 1 THEN',
'        UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            CODIGO_MONEDA = :P84006_CODIGO_MONEDA,',
'            TASA_CAMBIO = NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)),',
'            MONTO_ORIGEN = :P84006_MONTO_ORIGEN,',
'            MONTO_LOCAL = SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL),',
'            OBSERVACIONES = :P84006_OBSERVACIONES,',
'            TIPO_PRESTAMO = :P84006_TIPO_PRESTAMO,',
'            PLAZO = :P84006_PLAZO,',
'            MEDIDA_PLAZO = :P84006_MEDIDA_PLAZO,',
'            TIPO_TASA = :P84006_TIPO_TASA,',
'            TASA_INTERES = :P84006_TASA_INTERES,',
'            FECHA_COBRO = :P84006_FECHA_COBRO,',
'            TIPO_COBRO_MORA = :P84006_TIPO_COBRO_MORA,',
'            TIPO_MORA = :P84006_TIPO_MORA,',
'            PORCENTAJE_MORA = :P84006_PORCENTAJE_MORA,',
'            USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'            FECHA_MODIFICACION = SYSDATE',
'        WHERE ID = :P84006_ID;',
'    ELSE',
'        UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            CODIGO_MONEDA = :P84006_CODIGO_MONEDA,',
'            TASA_CAMBIO = NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)),',
'            MONTO_ORIGEN = :P84006_MONTO_ORIGEN,',
'            MONTO_LOCAL = SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL),',
'            OBSERVACIONES = :P84006_OBSERVACIONES,',
'            TIPO_PRESTAMO = :P84006_TIPO_PRESTAMO,',
'            PLAZO = :P84006_PLAZO,',
'            MEDIDA_PLAZO = :P84006_MEDIDA_PLAZO,',
'            TIPO_TASA = :P84006_TIPO_TASA,',
'            TASA_INTERES = :P84006_TASA_INTERES,',
'            FECHA_COBRO = :P84006_FECHA_COBRO,',
'            TIPO_COBRO_MORA = :P84006_TIPO_COBRO_MORA,',
'            TIPO_MORA = :P84006_TIPO_MORA,',
'            MONTO_MORA_LOCAL = :P84006_MONTO_MORA_LOCAL,',
'            MONTO_MORA_ORIGEN = :P84006_MONTO_MORA_ORIGEN,',
'            USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'            FECHA_MODIFICACION = SYSDATE',
'        WHERE ID = :P84006_ID;',
'    END IF;',
'END;'))
,p_attribute_02=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_ES_PRESTAMO,P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TA'
||'SA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA,P84006_TIPO_MORA,P84006_PORCENTAJE_MORA,P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN,P84006_OBSERVACION_ESTADO,P84006_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215023806981634479)
,p_event_id=>wwv_flow_imp.id(215022876666634457)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'2'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215024809059634480)
,p_event_id=>wwv_flow_imp.id(215022876666634457)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_PRESTAMO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P84006_ESTADO = ''AVANZAR SOLICITUD F2'' THEN',
'         UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            ESTADO = ''ENVIADO A REVISION''',
'        WHERE ID = :P84006_ID;',
'',
'        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'        (',
'            ID_FDU_TRANSACCIONES_FINANCIERAS,',
'            ESTADO,',
'            OBSERVACION,',
'            USUARIO_ACEPTACION,',
'            FECHA_ACEPTACION',
'        )',
'        VALUES',
'        (',
'            :P84006_ID,',
'            ''ENVIADO A REVISION'',',
'            :P84006_OBSERVACION_ESTADO,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        );',
'    END IF;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_OBSERVACION_ESTADO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215024352065634480)
,p_event_id=>wwv_flow_imp.id(215022876666634457)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215025358179634481)
,p_event_id=>wwv_flow_imp.id(215022876666634457)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MORAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:1});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214910792814634268)
,p_name=>'MENSAJE_ERROR'
,p_event_sequence=>190
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MENSAJE_ERROR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214911207900634269)
,p_event_id=>wwv_flow_imp.id(214910792814634268)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P84006_ERROR'').value != ''-1''){',
'    apex.message.clearErrors();',
'    apex.message.showErrors([{',
'        type: "error",',
'        location: ["page"],',
'        message: errores[apex.item(''P84006_ERROR'').value],',
'        unsafe: false',
'    }]);',
'',
'    new Promise((r) => setTimeout(r, 4000)).then(() => apex.message.clearErrors());',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214911725617634270)
,p_event_id=>wwv_flow_imp.id(214910792814634268)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR_MENSAJE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'-1'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214903537592634256)
,p_name=>'MODIFICAR_MONTOS_CONVERSION'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_CODIGO_MONEDA'
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'CARGAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214904005969634257)
,p_event_id=>wwv_flow_imp.id(214903537592634256)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'BUSCAR_CAMBIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_TASA_CAMBIO'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'ROUND(SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA), 2)'
,p_attribute_07=>'P84006_CODIGO_MONEDA'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84006_CODIGO_MONEDA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214904594743634258)
,p_event_id=>wwv_flow_imp.id(214903537592634256)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'BUSCAR_MONTO_VALOR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_LOCAL'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'ROUND(SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL), 2)'
,p_attribute_07=>'P84006_MONTO_ORIGEN,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84006_MONTO_ORIGEN'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214905016671634258)
,p_event_id=>wwv_flow_imp.id(214903537592634256)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'BUSCAR_MONTO_MORA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_MORA_LOCAL'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'ROUND(SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_MORA_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL), 2)'
,p_attribute_07=>'P84006_MONTO_MORA_ORIGEN,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84006_MONTO_MORA_ORIGEN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215009921439634434)
,p_name=>'MODIFICAR_MONTOS_CONVERSION_P'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_CODIGO_MONEDA_P'
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'CARGAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215010984918634436)
,p_event_id=>wwv_flow_imp.id(215009921439634434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'BUSCAR_CAMBIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_TASA_CAMBIO_P'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'ROUND(SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA_P), 2)'
,p_attribute_07=>'P84006_CODIGO_MONEDA_P'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84006_CODIGO_MONEDA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215010493995634435)
,p_event_id=>wwv_flow_imp.id(215009921439634434)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'BUSCAR_MONTO_VALOR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_LOCAL_P'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'ROUND(SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN_P, :P84006_CODIGO_MONEDA_P, 1, NVL(:P84006_TASA_CAMBIO_P, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA_P)), NULL), 2)'
,p_attribute_07=>'P84006_MONTO_ORIGEN_P,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84006_MONTO_ORIGEN_P'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215014768074634445)
,p_name=>'CALCULAR_MONTO_ORIGEN'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_MONTO_ORIGEN'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'validarNumerosDecimales(apex.item(''P84006_MONTO_ORIGEN'').getValue())'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215015271326634446)
,p_event_id=>wwv_flow_imp.id(215014768074634445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'BUSCAR_MONTO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_LOCAL'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL)'
,p_attribute_07=>'P84006_MONTO_ORIGEN,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84006_MONTO_ORIGEN'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215015792972634447)
,p_event_id=>wwv_flow_imp.id(215014768074634445)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'5'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215016215110634448)
,p_event_id=>wwv_flow_imp.id(215014768074634445)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215016728439634448)
,p_event_id=>wwv_flow_imp.id(215014768074634445)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_ORIGEN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215051104061634535)
,p_name=>'MORA_MONTO_LOCAL'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_MONTO_MORA_ORIGEN'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'validarNumerosDecimales(apex.item(''P84006_MONTO_MORA_ORIGEN'').getValue())'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215051603707634536)
,p_event_id=>wwv_flow_imp.id(215051104061634535)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'5'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215053150320634538)
,p_event_id=>wwv_flow_imp.id(215051104061634535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'BUSCAR_MONTO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_MORA_LOCAL'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_MORA_ORIGEN, :P84006_CODIGO_MONEDA, 1, NVL(:P84006_TASA_CAMBIO, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA)), NULL)'
,p_attribute_07=>'P84006_MONTO_MORA_ORIGEN,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84006_MONTO_MORA_ORIGEN'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215052133100634537)
,p_event_id=>wwv_flow_imp.id(215051104061634535)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215052606828634537)
,p_event_id=>wwv_flow_imp.id(215051104061634535)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_MORA_ORIGEN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214960934772634356)
,p_name=>'VALIDAR_PORCENTAJE'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_TASA_INTERES'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'!validarNumerosDecimalesEnRango(apex.item(''P84006_TASA_INTERES'').getValue(), 0, 100) &&',
'apex.item(''P84006_TASA_INTERES'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214961995584634357)
,p_event_id=>wwv_flow_imp.id(214960934772634356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'3'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214962469619634358)
,p_event_id=>wwv_flow_imp.id(214960934772634356)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214961424504634357)
,p_event_id=>wwv_flow_imp.id(214960934772634356)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_TASA_INTERES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215018566435634451)
,p_name=>'VALIDAR_MORA_%'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_PORCENTAJE_MORA'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'!validarNumerosDecimalesEnRango(apex.item(''P84006_PORCENTAJE_MORA'').getValue(), 0, 100)'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215019010878634452)
,p_event_id=>wwv_flow_imp.id(215018566435634451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'4'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215019582940634452)
,p_event_id=>wwv_flow_imp.id(215018566435634451)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215020004969634453)
,p_event_id=>wwv_flow_imp.id(215018566435634451)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_PORCENTAJE_MORA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214962875521634358)
,p_name=>'OCULTAR_FLUJO'
,p_event_sequence=>260
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214964815592634361)
,p_event_id=>wwv_flow_imp.id(214962875521634358)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'ENVIADO_REVISION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(407633490249819657)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214965358586634362)
,p_event_id=>wwv_flow_imp.id(214962875521634358)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'ENVIADO_REVISION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(408642283628778675)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214963837902634359)
,p_event_id=>wwv_flow_imp.id(214962875521634358)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'ENVIADO_REVISION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(408644278942778695)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214964331136634360)
,p_event_id=>wwv_flow_imp.id(214962875521634358)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'ENVIADO_REVISION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(408705372233208153)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214963320161634359)
,p_event_id=>wwv_flow_imp.id(214962875521634358)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_name=>'ENVIADO_REVISION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(408964171059511152)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214930589978634303)
,p_name=>'ACEPTAR_REVISAR'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214880485501634214)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214931050763634304)
,p_event_id=>wwv_flow_imp.id(214930589978634303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RECARGAR_MODAL_REVISION'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214966668800634364)
,p_name=>'FLUJO_BT_1'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214881293526634217)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214967136317634364)
,p_event_id=>wwv_flow_imp.id(214966668800634364)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(407633490249819657)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214968158182634365)
,p_event_id=>wwv_flow_imp.id(214966668800634364)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(408642283628778675)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214967645752634365)
,p_event_id=>wwv_flow_imp.id(214966668800634364)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#splitter-action_splitter'').splitter({collapsed:false,position:500});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214968541552634366)
,p_name=>'ENVIADO_REVISION'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214815305787634066)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214969566308634367)
,p_event_id=>wwv_flow_imp.id(214968541552634366)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ENVIAR_REVISION'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ESTADO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'ENVIADO A REVISION'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214969021250634366)
,p_event_id=>wwv_flow_imp.id(214968541552634366)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item(''P84006_ES_PRESTAMO'').getValue() == ''N'') {',
'    $.event.trigger(''CREAR_INVERSION'');',
'} else {',
'    $.event.trigger(''CREAR_PRESTAMO'');',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215053507137634539)
,p_name=>'FLUJO_BT_2'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214882042300634218)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215054030440634539)
,p_event_id=>wwv_flow_imp.id(215053507137634539)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(407633490249819657)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215054526841634540)
,p_event_id=>wwv_flow_imp.id(215053507137634539)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(408644278942778695)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215055020351634543)
,p_event_id=>wwv_flow_imp.id(215053507137634539)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#splitter-action_splitter'').splitter({collapsed:false,position:500});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214969936304634369)
,p_name=>'MODIFICAR'
,p_event_sequence=>310
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214882441297634218)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214970469183634370)
,p_event_id=>wwv_flow_imp.id(214969936304634369)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item(''P84006_ES_PRESTAMO'').getValue() == ''N'') {',
'    $.event.trigger(''ACTUALIZAR_INVERSION'');',
'} else {',
'    $.event.trigger(''ACTUALIZAR_PRESTAMO'');',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215017185459634449)
,p_name=>'ENVIADO_REVISION_ENVIAR'
,p_event_sequence=>320
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214812836164634056)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215017643635634450)
,p_event_id=>wwv_flow_imp.id(215017185459634449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ENVIAR_REVISION'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ESTADO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'AVANZAR SOLICITUD F2'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215018198279634450)
,p_event_id=>wwv_flow_imp.id(215017185459634449)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item(''P84006_ES_PRESTAMO'').getValue() == ''N'') {',
'    $.event.trigger(''ACTUALIZAR_INVERSION'');',
'} else {',
'    $.event.trigger(''ACTUALIZAR_PRESTAMO'');',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214970845098634370)
,p_name=>'FLUJO_BT_3'
,p_event_sequence=>330
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214883678468634220)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214971372541634371)
,p_event_id=>wwv_flow_imp.id(214970845098634370)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(407633490249819657)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214971848121634371)
,p_event_id=>wwv_flow_imp.id(214970845098634370)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(408705372233208153)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214972368829634372)
,p_event_id=>wwv_flow_imp.id(214970845098634370)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#splitter-action_splitter'').splitter({collapsed:false,position:500});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214972755028634373)
,p_name=>'REGRESAR_SOLICITUD'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214816020525634067)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214973223300634373)
,p_event_id=>wwv_flow_imp.id(214972755028634373)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'OPCION_FLUJO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_OPCIONES_FLUJO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'REGRESAR_SOLICITUD'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214973745584634374)
,p_event_id=>wwv_flow_imp.id(214972755028634373)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REGRESAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'        ESTADO = ''SOLICITUD''',
'    WHERE ID = :P84006_ID;',
'',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'    (',
'        ID_FDU_TRANSACCIONES_FINANCIERAS,',
'        ESTADO,',
'        OBSERVACION,',
'        USUARIO_ACEPTACION,',
'        FECHA_ACEPTACION',
'    )',
'    VALUES',
'    (',
'        :P84006_ID,',
'        ''SOLICITUD'',',
'        :P84006_OBSERVACION_ESTADO,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_OBSERVACION_ESTADO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214974248250634375)
,p_event_id=>wwv_flow_imp.id(214972755028634373)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:1});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214935329447634310)
,p_name=>'RECHAZAR'
,p_event_sequence=>350
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214816400262634068)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214935821181634311)
,p_event_id=>wwv_flow_imp.id(214935329447634310)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'OPCION_FLUJO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_OPCIONES_FLUJO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'RECHAZAR_SOLICITUD'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214936379826634312)
,p_event_id=>wwv_flow_imp.id(214935329447634310)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'RECHAZAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'        ESTADO = ''RECHAZADO''',
'    WHERE ID = :P84006_ID;',
'',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'    (',
'        ID_FDU_TRANSACCIONES_FINANCIERAS,',
'        ESTADO,',
'        OBSERVACION,',
'        USUARIO_ACEPTACION,',
'        FECHA_ACEPTACION',
'    )',
'    VALUES',
'    (',
'        :P84006_ID,',
'        ''RECHAZADO'',',
'        :P84006_OBSERVACION_ESTADO,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_OBSERVACION_ESTADO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214936892137634313)
,p_event_id=>wwv_flow_imp.id(214935329447634310)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:1});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214937254221634313)
,p_name=>'ENVIAR_APROBACION'
,p_event_sequence=>360
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214816807664634068)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214938280738634315)
,p_event_id=>wwv_flow_imp.id(214937254221634313)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'PENDIENTE APROBACION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'        ESTADO = ''PENDIENTE APROBACION''',
'    WHERE ID = :P84006_ID;',
'',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'    (',
'        ID_FDU_TRANSACCIONES_FINANCIERAS,',
'        ESTADO,',
'        OBSERVACION,',
'        USUARIO_ACEPTACION,',
'        FECHA_ACEPTACION',
'    )',
'    VALUES',
'    (',
'        :P84006_ID,',
'        ''PENDIENTE APROBACION'',',
'        :P84006_OBSERVACION_ESTADO,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_OBSERVACION_ESTADO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214937703317634314)
,p_event_id=>wwv_flow_imp.id(214937254221634313)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item(''P84006_ES_PRESTAMO'').getValue() == ''N'') {',
'    $.event.trigger(''ACTUALIZAR_INVERSION'');',
'} else {',
'    $.event.trigger(''ACTUALIZAR_PRESTAMO'');',
'}'))
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214938788095634315)
,p_event_id=>wwv_flow_imp.id(214937254221634313)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:1});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214965794404634362)
,p_name=>'ACEPTAR_APROBACION'
,p_event_sequence=>370
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214881658697634217)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214966293150634363)
,p_event_id=>wwv_flow_imp.id(214965794404634362)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'RECARGAR_MODAL_APROBACION'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215043518385634510)
,p_name=>'FLUJO_BT_4'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214880883433634216)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215044047152634511)
,p_event_id=>wwv_flow_imp.id(215043518385634510)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(407633490249819657)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215044546692634512)
,p_event_id=>wwv_flow_imp.id(215043518385634510)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_REGION'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(408964171059511152)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215045084986634512)
,p_event_id=>wwv_flow_imp.id(215043518385634510)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#splitter-action_splitter'').splitter({collapsed:false,position:500});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214978539351634381)
,p_name=>'RECHAZAR_FINAL'
,p_event_sequence=>390
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214813546693634061)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214979028419634382)
,p_event_id=>wwv_flow_imp.id(214978539351634381)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'OPCION_FLUJO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_OPCIONES_FLUJO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'RECHAZAR_SOLICITUD'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214979514141634383)
,p_event_id=>wwv_flow_imp.id(214978539351634381)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'RECHAZAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'        ESTADO = ''RECHAZADO''',
'    WHERE ID = :P84006_ID;',
'',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'    (',
'        ID_FDU_TRANSACCIONES_FINANCIERAS,',
'        ESTADO,',
'        OBSERVACION,',
'        USUARIO_ACEPTACION,',
'        FECHA_ACEPTACION',
'    )',
'    VALUES',
'    (',
'        :P84006_ID,',
'        ''RECHAZADO'',',
'        :P84006_OBSERVACION_ESTADO,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_OBSERVACION_ESTADO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214980006460634383)
,p_event_id=>wwv_flow_imp.id(214978539351634381)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:1});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214980469055634384)
,p_name=>'ACEPTAR_FINAL'
,p_event_sequence=>400
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214813902003634061)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214980950682634385)
,p_event_id=>wwv_flow_imp.id(214980469055634384)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ACEPTAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'        ESTADO = ''LIBERACION''',
'    WHERE ID = :P84006_ID;',
'',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'    (',
'        ID_FDU_TRANSACCIONES_FINANCIERAS,',
'        ESTADO,',
'        OBSERVACION,',
'        USUARIO_ACEPTACION,',
'        FECHA_ACEPTACION',
'    )',
'    VALUES',
'    (',
'        :P84006_ID,',
'        ''LIBERACION'',',
'        :P84006_OBSERVACION_ESTADO,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'',
'    /*IF :P84006_ES_PRESTAMO = ''S'' THEN',
'        SAF.PR_FDU_GENERAR_CALCULO_PAGOS(:P84006_ID);',
'    END IF;*/',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_OBSERVACION_ESTADO,P84006_ES_PRESTAMO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214981453993634387)
,p_event_id=>wwv_flow_imp.id(214980469055634384)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84006,estado:1});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215038345703634503)
,p_name=>'LISTA_AUDIT'
,p_event_sequence=>410
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(408967767443511188)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215038886905634504)
,p_event_id=>wwv_flow_imp.id(215038345703634503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'FORMATO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroRegistrosIR(''LISTA_AUDIT'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214921596373634288)
,p_name=>'CARGAR_DATOS_INGRESO_SOLICITUD'
,p_event_sequence=>420
,p_condition_element=>'P84006_ACCION_MODAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'INGRESO_SOLICITUD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214923919920634292)
,p_event_id=>wwv_flow_imp.id(214921596373634288)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_TIPO_PRESTAMO,P84006_MEDIDA_PLAZO,P84006_PLAZO,P84006_TIPO_TASA,P84006_TASA'
||'_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA,P84006_TIPO_MORA,P84006_PORCENTAJE_MORA,P84006_MONTO_MORA_ORIGEN,P84006_MONTO_MORA_LOCAL,P84006_FECHA_APROBACION,P84006_MONTO_LOCAL_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214922067726634289)
,p_event_id=>wwv_flow_imp.id(214921596373634288)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	CODIGO_EMPRESA,',
'	TIPO_DESTINATARIO,',
'	ID_ASOCIACION,',
'	ES_PRESTAMO,',
'    ESTADO,',
'    CODIGO_MONEDA,',
'    TASA_CAMBIO,',
'    ROUND(MONTO_ORIGEN, 2),',
'    ROUND(MONTO_LOCAL, 2),',
'    OBSERVACIONES,',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'    SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'    FECHA_GRABACION,',
'    FECHA_MODIFICACION,',
'    FECHA_RECUPERACION_TOTAL,',
'    ROUND(NVL(MONTO_RECUPERADO_LOCAL, 0), 2),',
'    ROUND(NVL(MONTO_RECUPERADO_ORIGEN, 0), 2)',
'    INTO',
'    :P84006_CODIGO_EMPRESA,',
'    :P84006_TIPO_DESTINATARIO,',
'    :P84006_ID_ASOCIACION,',
'    :P84006_ES_PRESTAMO,',
'    :P84006_ESTADO,',
'    :P84006_CODIGO_MONEDA,',
'    :P84006_TASA_CAMBIO,',
'    :P84006_MONTO_ORIGEN,',
'    :P84006_MONTO_LOCAL,',
'    :P84006_OBSERVACIONES,',
'    :P84006_USUARIO_GRABACION,',
'    :P84006_USUARIO_MODIFICACION,',
'    :P84006_FECHA_GRABACION,',
'    :P84006_FECHA_MODIFICACION,',
'    :P84006_FECHA_RECUPERACION_TOTAL,',
'    :P84006_MONTO_RECUPERADO_LOCAL,',
'    :P84006_MONTO_RECUPERADO_ORIGEN',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_CODIGO_EMPRESA,P84006_TIPO_DESTINATARIO,P84006_ID_ASOCIACION,P84006_ES_PRESTAMO,P84006_ESTADO,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_LOCAL,P84006_MONTO_ORIGEN,P84006_OBSERVACIONES,P84006_USUARIO_GRABACION,P84006_USUARIO_MODIFICAC'
||'ION,P84006_FECHA_GRABACION,P84006_FECHA_MODIFICACION,P84006_FECHA_RECUPERACION_TOTAL,P84006_MONTO_RECUPERADO_LOCAL,P84006_MONTO_RECUPERADO_ORIGEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214922511640634290)
,p_event_id=>wwv_flow_imp.id(214921596373634288)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	TIPO_PRESTAMO,',
'    PLAZO,',
'    MEDIDA_PLAZO,',
'    TIPO_TASA,',
'    TASA_INTERES,',
'    FECHA_COBRO,',
'    TIPO_COBRO_MORA',
'    INTO',
'    :P84006_TIPO_PRESTAMO,',
'    :P84006_PLAZO,',
'    :P84006_MEDIDA_PLAZO,',
'    :P84006_TIPO_TASA,',
'    :P84006_TASA_INTERES,',
'    :P84006_FECHA_COBRO,',
'    :P84006_TIPO_COBRO_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_TIPO_PRESTAMO,P84006_PLAZO,P84006_MEDIDA_PLAZO,P84006_TIPO_TASA,P84006_TASA_INTERES,P84006_FECHA_COBRO,P84006_TIPO_COBRO_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214923018071634291)
,p_event_id=>wwv_flow_imp.id(214921596373634288)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	PORCENTAJE_MORA',
'    INTO',
'    :P84006_PORCENTAJE_MORA',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_PORCENTAJE_MORA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''1'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214923597787634292)
,p_event_id=>wwv_flow_imp.id(214921596373634288)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_2.2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	MONTO_MORA_LOCAL,',
'    MONTO_MORA_ORIGEN',
'    INTO',
'    :P84006_MONTO_MORA_LOCAL,',
'    :P84006_MONTO_MORA_ORIGEN',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'WHERE ID = :P84006_ID;'))
,p_attribute_02=>'P84006_ID,P84006_TIPO_COBRO_MORA'
,p_attribute_03=>'P84006_MONTO_MORA_LOCAL,P84006_MONTO_MORA_ORIGEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84006_ES_PRESTAMO'').getValue() == ''S'' &&',
'apex.item(''P84006_TIPO_MORA'').getValue() == ''2'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214924975196634294)
,p_event_id=>wwv_flow_imp.id(214921596373634288)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS_FECHA_APROBACION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	A.FECHA_ACEPTACION',
'    INTO',
'    :P84006_FECHA_APROBACION',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG A',
'WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID',
'AND A.ESTADO = ''ACEPTADO''',
'AND ID = ',
'(',
'	SELECT MAX(B.ID) FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG B WHERE B.ESTADO = A.ESTADO AND B.ID_FDU_TRANSACCIONES_FINANCIERAS = A.ID_FDU_TRANSACCIONES_FINANCIERAS',
');'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_FECHA_APROBACION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214924461763634293)
,p_event_id=>wwv_flow_imp.id(214921596373634288)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'DISABLE'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214863013602634183)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ESTADO'
,p_client_condition_expression=>'CANCELADO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214929182273634300)
,p_name=>'ESTRUCTURA_1'
,p_event_sequence=>440
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(409222782429145665)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214929646327634300)
,p_event_id=>wwv_flow_imp.id(214929182273634300)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'REGISTROS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    g_MostrarNumeroRegistrosIR(''INTERES_GENERADO'');',
'    $(''#INTERES_GENERADO_saved_reports'').hide();',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214930112027634303)
,p_event_id=>wwv_flow_imp.id(214929182273634300)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'REFRESH'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    $(''.INTERES_GENERADO_BTN .a-IRR-savedReports'').append(''<button class="a-Button a-IRR-button t-Button--noLabel t-Button--icon positionButtonReset  t-Button--small" type="button" id="buttonReset" title="Reset" onclick="functionResetInteresGenerado('
||')" aria-label="Reset"><span class="t-Icon fa fa-rotate-left" aria-hidden="true"></span></button>'');',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214925350079634294)
,p_name=>'ESTRUCTURA_2'
,p_event_sequence=>450
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(415178101418468756)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214926302867634296)
,p_event_id=>wwv_flow_imp.id(214925350079634294)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'REGISTROS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    g_MostrarNumeroRegistrosIR(''INTERES_GENERADO_CONJUNTO'');',
'    $(''#INTERES_GENERADO_CONJUNTO_saved_reports'').hide();',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214925891623634296)
,p_event_id=>wwv_flow_imp.id(214925350079634294)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'REFRESH'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    $(''.INTERES_GENERADO_CONJUNTO_BTS .a-IRR-savedReports'').append(''<button class="a-Button a-IRR-button t-Button--noLabel t-Button--icon positionButtonReset  t-Button--small" type="button" id="buttonReset" title="Reset" onclick="functionResetInteres'
||'GeneradoMes()" aria-label="Reset"><span class="t-Icon fa fa-rotate-left" aria-hidden="true"></span></button>'');',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214926766430634297)
,p_name=>'INTERES_GENERADO_CONJUNTO_DETALLE'
,p_event_sequence=>460
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#INTERES_GENERADO_CONJUNTO td'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214927299861634297)
,p_event_id=>wwv_flow_imp.id(214926766430634297)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ID_INTERES_GENERADO_CONJUNTO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214928765426634299)
,p_event_id=>wwv_flow_imp.id(214926766430634297)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415180743487468783)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214928265288634299)
,p_event_id=>wwv_flow_imp.id(214926766430634297)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#FOS_DETALLE_INTERES_splitter'').splitter({collapsed:false,position:800});'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214927772788634298)
,p_event_id=>wwv_flow_imp.id(214926766430634297)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'ASIGNAR_COLOR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#INTERES_GENERADO_CONJUNTO'').find(''tr'').removeClass("selected");',
'$(this.triggeringElement).closest(''tr'')[0].classList.toggle("selected");'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214986154147634394)
,p_name=>'LISTA_MOVIMIENTOS_DETALLE'
,p_event_sequence=>470
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#LISTA_MOVIMIENTOS td'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214988663463634398)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214844609645634144)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214989107231634399)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214845022901634144)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214986671827634395)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214852434302634160)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214993199648634405)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ID_MOVIMIENTO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214987600480634397)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'MOSTRAR_AUDIT'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419214679363671367)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214994111151634406)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'BLOQUEAR_ITEM'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_USUARIO_GRABACION_P,P84006_FECHA_CREACION_P,P84006_USUARIO_MODIFICACION_P,P84006_FECHA_MODIFICACION_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214992639468634404)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_INFORMACION'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P840'
||'06_MONTO_LOCAL_P,P84006_USUARIO_GRABACION_P,P84006_FECHA_CREACION_P,P84006_USUARIO_MODIFICACION_P,P84006_FECHA_MODIFICACION_P,P84006_ANULAR'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	A.FECHA_DOCUMENTO,',
'	A.CODMAE,',
'	A.TIPO_TRANSACCION,',
'	A.SERIE,',
'	A.NUMDOC,',
'	A.NROSOLCHE,',
'	A.ID_CUENTA,',
'	A.CODIGO_OPERACION,',
'	A.CONCEPTO,',
'	A.CODIGO_MONEDA,',
'	A.TASA_MONEDA,',
'	A.MONTO_ORIGEN,',
'	A.MONTO_LOCAL,',
'	SAF.FNC_GET_USUARIONOMBRE(A.USUARIO_GRABACION),',
'	A.FECHA_GRABACION,',
'	SAF.FNC_GET_USUARIONOMBRE(A.USUARIO_MODIFICACION),',
'	A.FECHA_MODIFICACION,',
'    A.ANULADO',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS A',
'WHERE A.ID = :P84006_ID_MOVIMIENTO;'))
,p_attribute_07=>'P84006_ID_MOVIMIENTO'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214990623447634401)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_COLLECTIONS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'        	ID,',
'        	RUBRO_COBRO,',
'        	ID_ASOCIACION,',
'        	MES,',
'        	ANIO,',
'            ID_PAGO',
'        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'        WHERE ID_FDU_TRANSACCIONES_FINANCIERA = :P84006_ID_MOVIMIENTO;',
'BEGIN',
'    --DETALLE_PAGOS',
'    if not apex_collection.collection_exists(''COLLECTION_DETALLE_PAGOS'') then',
'    	apex_collection.create_collection(''COLLECTION_DETALLE_PAGOS'');',
'    else',
'    	apex_collection.truncate_collection(''COLLECTION_DETALLE_PAGOS'');',
'    end if;',
'',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        APEX_COLLECTION.ADD_MEMBER(',
'            P_COLLECTION_NAME  => ''COLLECTION_DETALLE_PAGOS'',',
'            P_C001 => R_DATOS.ID,',
'            P_C002 => R_DATOS.RUBRO_COBRO,',
'            P_C003 => R_DATOS.ID_ASOCIACION,',
'            P_C004 => R_DATOS.MES,',
'            P_C005 => R_DATOS.ANIO,',
'            P_C006 => R_DATOS.ID_PAGO,',
'            P_C007 => 1',
'        );',
'    END LOOP;',
'END;'))
,p_attribute_02=>'P84006_ID_MOVIMIENTO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214992125623634403)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_COLLECTIONS'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419318689311790493)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214995166258634409)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214852015917634159)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ANULAR'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214991197479634402)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214849006930634154)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ANULAR'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214995693339634410)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214852015917634159)
,p_client_condition_type=>'IN_LIST'
,p_client_condition_element=>'P84006_ANULAR'
,p_client_condition_expression=>'S,V'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214991610288634403)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214849006930634154)
,p_client_condition_type=>'IN_LIST'
,p_client_condition_element=>'P84006_ANULAR'
,p_client_condition_expression=>'S,V'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214994682246634407)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214845022901634144)
,p_client_condition_type=>'IN_LIST'
,p_client_condition_element=>'P84006_ANULAR'
,p_client_condition_expression=>'S,V'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214987103994634396)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214852434302634160)
,p_client_condition_type=>'IN_LIST'
,p_client_condition_element=>'P84006_ANULAR'
,p_client_condition_expression=>'S,V'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214988180815634397)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>180
,p_execute_on_page_init=>'N'
,p_name=>'BLOQUEAR_CAMPOS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P'
,p_client_condition_type=>'IN_LIST'
,p_client_condition_element=>'P84006_ANULAR'
,p_client_condition_expression=>'S,V'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214989681087634400)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>190
,p_execute_on_page_init=>'N'
,p_name=>'HABILITAR_CAMPOS'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ANULAR'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214990113051634400)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>200
,p_execute_on_page_init=>'N'
,p_name=>'INVERSION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419429510386493067)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214993621815634406)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>210
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#FOS_MOVIMIENTO_BANCARIO_splitter'').splitter({collapsed:false,position:600});'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214996146640634411)
,p_event_id=>wwv_flow_imp.id(214986154147634394)
,p_event_result=>'TRUE'
,p_action_sequence=>220
,p_execute_on_page_init=>'N'
,p_name=>'ASIGNAR_COLOR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#LISTA_MOVIMIENTOS'').find(''tr'').removeClass("selected");',
'$(this.triggeringElement).closest(''tr'')[0].classList.toggle("selected");'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215050214909634534)
,p_name=>'ESTRUCTURA_3'
,p_event_sequence=>480
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(415180743487468783)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215050724519634535)
,p_event_id=>wwv_flow_imp.id(215050214909634534)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'REGISTROS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroRegistrosIR(''DETALLE_INTERES_SELECT'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215007118393634430)
,p_name=>'ESTRUCTURA_4'
,p_event_sequence=>490
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(409225788622145695)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215008162831634432)
,p_event_id=>wwv_flow_imp.id(215007118393634430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'REGISTROS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    g_MostrarNumeroRegistrosIR(''PAGO_CAPITAL'');',
'    $(''#PAGO_CAPITAL_saved_reports'').hide();',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215007620175634431)
,p_event_id=>wwv_flow_imp.id(215007118393634430)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'REFRESH'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    $(''.PAGO_CAPITAL_BTS .a-IRR-savedReports'').append(''<button class="a-Button a-IRR-button t-Button--noLabel t-Button--icon positionButtonReset  t-Button--small" type="button" id="buttonReset" title="Reset" onclick="functionResetPAGO_CAPITAL_BTS()" '
||'aria-label="Reset"><span class="t-Icon fa fa-rotate-left" aria-hidden="true"></span></button>'');',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214888486689634233)
,p_name=>'SCROLL'
,p_event_sequence=>500
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214888925259634235)
,p_event_id=>wwv_flow_imp.id(214888486689634233)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let width = document.getElementById(''SR_REGION_GENERAL'').scrollWidth + 20;',
'',
'var estilo = document.createElement("style");',
'estilo.innerHTML = `',
'    .t-TabsRegionPN2 > .t-TabsRegion-itemsPN2 > .a-Tabs-panel > .t-Region > .t-Region-bodyWrap > .t-Region-body{',
'        height:${width}px !important;',
'    }          ',
'    `;',
'document.body.appendChild(estilo);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214889961398634237)
,p_event_id=>wwv_flow_imp.id(214888486689634233)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let width = document.getElementById(''SR_REGISTRO_BOLETA'').scrollWidth + 20;',
'',
'var estilo = document.createElement("style");',
'estilo.innerHTML = `',
'    .t-TabsRegionPN2 > .t-TabsRegion-itemsPN2 > .a-Tabs-panel > .t-Region > .t-Region-bodyWrap > .t-Region-body{',
'        height:${width}px !important;',
'    }          ',
'    `;',
'document.body.appendChild(estilo);'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214889438742634236)
,p_event_id=>wwv_flow_imp.id(214888486689634233)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let width = document.getElementById(''SR_REGISTRO_BOLETA'').scrollWidth - 30;',
'',
'var estilo2 = document.createElement("style");',
'estilo2.innerHTML = `',
'    .t-TabsRegionPN2 > .t-TabsRegion-itemsPN2 > .a-Tabs-panel > .t-Region > .t-Region-bodyWrap > .t-Region-body{',
'        height:${width}px !important;',
'    }          ',
'    `;',
'document.body.appendChild(estilo2);'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214942514003634322)
,p_name=>'CALCULAR_MONTO_ORIGEN_p'
,p_event_sequence=>510
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_MONTO_ORIGEN_P'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'validarNumerosDecimales(apex.item(''P84006_MONTO_ORIGEN_P'').getValue())'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214943096427634323)
,p_event_id=>wwv_flow_imp.id(214942514003634322)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'BUSCAR_CAMBIO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_LOCAL_P'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'SAF.APX_FNC_CONVERSION_MONEDAS(:P84006_MONTO_ORIGEN_P, :P84006_CODIGO_MONEDA_P, 1, NVL(:P84006_TASA_CAMBIO_P, SAF.FNC_GET_TIPO_CAMBIO(:P84006_CODIGO_MONEDA_P)), NULL)'
,p_attribute_07=>'P84006_MONTO_ORIGEN_P,P84006_TASA_CAMBIO_P,P84006_CODIGO_MONEDA_P'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84006_MONTO_ORIGEN_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214943507770634323)
,p_event_id=>wwv_flow_imp.id(214942514003634322)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'5'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214944078789634324)
,p_event_id=>wwv_flow_imp.id(214942514003634322)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214944530777634325)
,p_event_id=>wwv_flow_imp.id(214942514003634322)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_ORIGEN_P'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214951340878634338)
,p_name=>'SET_NUMERO_DOCUMENTO'
,p_event_sequence=>520
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_SERIE_P'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214951886815634339)
,p_event_id=>wwv_flow_imp.id(214951340878634338)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'NUMERO_DOCUMENTO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'    cursor c_correlativo is',
'       SELECT PROXIMO ',
'         FROM BCOSERIE',
'        WHERE CODIGO_EMPRESA   = :GLOBAL_EMPRESA',
'          AND CODMAE 		  = :P84006_CODMAE_P',
'          AND TIPO_TRANSACCION = :P84006_TIPO_TRANSACCION_P',
'          AND SERIE 		      = :P84006_SERIE_P;',
'    VNUMDOC BCOSERIE.PROXIMO%TYPE;',
' Begin',
'    if :P84006_TIPO_TRANSACCION_P = 10 then',
'        open c_correlativo;',
'        fetch c_correlativo into vnumdoc;',
'        close c_correlativo;',
'',
'        :P84006_NUMDOC_P := VNUMDOC;',
'   End if;',
' End;'))
,p_attribute_02=>'P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P'
,p_attribute_03=>'P84006_NUMDOC_P'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214890328212634237)
,p_name=>'VALORES_SERIE'
,p_event_sequence=>530
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_SERIE_P'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214890815608634238)
,p_event_id=>wwv_flow_imp.id(214890328212634237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'FORMATO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FORMATO_P'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT FORMATO',
'FROM BCOSERIE',
'WHERE CODIGO_EMPRESA 	 = :GLOBAL_EMPRESA',
'AND CODmae 		 = :P84006_CODMAE_P',
'AND TIPO_TRANSACCION     = :P84006_TIPO_TRANSACCION_P',
'AND SERIE 		 = :P84006_SERIE_P;'))
,p_attribute_07=>'P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214985265248634393)
,p_name=>'VALIDAR_NUMDOC'
,p_event_sequence=>540
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84006_SERIE_P'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214985774627634394)
,p_event_id=>wwv_flow_imp.id(214985265248634393)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'VALIDAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    APX_PR_BCO_BCOMOVIG_VALIDANUMDOC(:GLOBAL_EMPRESA,:P84006_CODMAE_P,:P84006_TIPO_TRANSACCION_P,:P84006_SERIE_P,:P84006_NUMDOC_P);',
'End;'))
,p_attribute_02=>'P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214891256821634238)
,p_name=>'CREAR_MOVIMIENTO'
,p_event_sequence=>550
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214863013602634183)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214895281267634245)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'HABILITAR_CAMPOS'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214894771830634244)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR_COLLECTIONS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if not apex_collection.collection_exists(''COLLECTION_DETALLE_PAGOS'') then',
'	apex_collection.create_collection(''COLLECTION_DETALLE_PAGOS'');',
'else',
'	apex_collection.truncate_collection(''COLLECTION_DETALLE_PAGOS'');',
'end if;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214896713480634247)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214894258491634244)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_FORMATO_P,P84006_ID_MOVIMIENTO,P84006_CODIGO_MONEDA_P,P84006_TA'
||'SA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214896259586634246)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'OCULTAR_AUDIT'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419214679363671367)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214893210728634241)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214844609645634144)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214897766157634248)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214849006930634154)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214893733172634243)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214845022901634144)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214897289392634248)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214852015917634159)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214892226464634240)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(214852434302634160)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214895798904634246)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419318689311790493)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214892749198634240)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_name=>'INVERSION'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419429510386493067)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214891728728634239)
,p_event_id=>wwv_flow_imp.id(214891256821634238)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#FOS_MOVIMIENTO_BANCARIO_splitter'').splitter({collapsed:false,position:600});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214944928689634325)
,p_name=>'CREAR_MOVIMIENTO_BTN'
,p_event_sequence=>560
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214844609645634144)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'validarCamposRequeridos($validar_movimiento)'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214945436789634326)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'6'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214947498846634330)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CREAR_MOVIMIENTO_PRESTAMO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            A.C001 ID,',
'            A.C002 RUBRO_COBRO,',
'            A.C003 ID_ASOCIACION,',
'            A.C004 MES,',
'            A.C005 ANIO,',
'            A.C006 ID_PAGO,',
'            A.C007 ESTADO',
'        FROM APEX_COLLECTIONS A',
'        WHERE A.COLLECTION_NAME = ''COLLECTION_DETALLE_PAGOS'';',
'',
'    V_ID NUMBER;',
'BEGIN',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS',
'    (',
'    	ID_FDU_TRANSACCIONES_FINANCIERAS,',
'    	ANULADO,',
'    	CODIGO_MONEDA,',
'    	TASA_MONEDA,',
'    	MONTO_ORIGEN,',
'    	MONTO_LOCAL,',
'    	FECHA_DOCUMENTO,',
'    	NUMDOC,',
'    	CODMAE,',
'    	TIPO_TRANSACCION,',
'    	SERIE,',
'    	NROSOLCHE,',
'    	ID_CUENTA,',
'    	CODIGO_OPERACION,',
'    	CONCEPTO,',
'    	USUARIO_GRABACION,',
'    	FECHA_GRABACION',
'    )',
'    VALUES',
'    (',
'        :P84006_ID,',
'        ''N'',',
'        :P84006_CODIGO_MONEDA_P,',
'        :P84006_TASA_CAMBIO_P,',
'        :P84006_MONTO_ORIGEN_P,',
'        :P84006_MONTO_LOCAL_P,',
'        :P84006_FECHA_DOCUMENTO_P,',
'        :P84006_NUMDOC_P,',
'        :P84006_CODMAE_P,',
'        :P84006_TIPO_TRANSACCION_P,',
'        :P84006_SERIE_P,',
'        :P84006_NROSOLCHE_P,',
'        :P84006_ID_CUENTA_P,',
'        :P84006_CODIGO_OPERACION_P,',
'        :P84006_CONCEPTO_P,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    ) RETURNING ID INTO V_ID;',
'',
'    COMMIT;',
'',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        IF R_DATOS.ID IS NULL THEN',
'            INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'            (',
'                ID_FDU_TRANSACCIONES_FINANCIERA,',
'            	RUBRO_COBRO,',
'            	ID_ASOCIACION,',
'            	MES,',
'            	ANIO,',
'                ID_PAGO,',
'            	USUARIO_GRABACION,',
'            	FECHA_MODIFICACION',
'            )',
'            VALUES',
'            (',
'                V_ID,',
'                R_DATOS.RUBRO_COBRO,',
'                R_DATOS.ID_ASOCIACION,',
'                R_DATOS.MES,',
'                R_DATOS.ANIO,',
'                NULL,',
'                :GLOBAL_CODIGO_USUARIO,',
'                SYSDATE',
'            );',
'        END IF;',
'',
'        IF R_DATOS.RUBRO_COBRO = ''INTERES'' THEN',
'            UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS SET',
'                ESTADO = 3',
'            WHERE ID = R_DATOS.ID_ASOCIACION;',
'',
'            UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE SET',
'                ESTADO = 3',
'            WHERE ID_INTERES_COBRADO = R_DATOS.ID_ASOCIACION;',
'        END IF;',
'',
'        IF R_DATOS.RUBRO_COBRO = ''CAPITAL'' THEN',
'            UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL SET',
'                ESTADO = 3',
'            WHERE ID = R_DATOS.ID_ASOCIACION;',
'        END IF;',
'',
'        IF R_DATOS.RUBRO_COBRO = ''MORA'' THEN',
'            UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS SET',
'                ESTADO = 3',
'            WHERE ID = R_DATOS.ID_ASOCIACION;',
'        END IF;',
'    END LOOP;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P,P84006_FECHA_DOCUMENTO_P,P84006_NUMDOC_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPE'
||'RACION_P,P84006_CONCEPTO_P'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214949957873634333)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CREAR_MOVIMIENTO_INVERSION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS',
'    (',
'    	ID_FDU_TRANSACCIONES_FINANCIERAS,',
'    	ANULADO,',
'    	CODIGO_MONEDA,',
'    	TASA_MONEDA,',
'    	MONTO_ORIGEN,',
'    	MONTO_LOCAL,',
'    	FECHA_DOCUMENTO,',
'    	NUMDOC,',
'    	CODMAE,',
'    	TIPO_TRANSACCION,',
'    	SERIE,',
'    	NROSOLCHE,',
'    	ID_CUENTA,',
'    	CODIGO_OPERACION,',
'    	CONCEPTO,',
'    	USUARIO_GRABACION,',
'    	FECHA_GRABACION',
'    )',
'    VALUES',
'    (',
'        :P84006_ID,',
'        ''N'',',
'        :P84006_CODIGO_MONEDA_P,',
'        :P84006_TASA_CAMBIO_P,',
'        :P84006_MONTO_ORIGEN_P,',
'        :P84006_MONTO_LOCAL_P,',
'        :P84006_FECHA_DOCUMENTO_P,',
'        :P84006_NUMDOC_P,',
'        :P84006_CODMAE_P,',
'        :P84006_TIPO_TRANSACCION_P,',
'        :P84006_SERIE_P,',
'        :P84006_NROSOLCHE_P,',
'        :P84006_ID_CUENTA_P,',
'        :P84006_CODIGO_OPERACION_P,',
'        :P84006_CONCEPTO_P,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'    COMMIT;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P,P84006_FECHA_DOCUMENTO_P,P84006_NUMDOC_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPE'
||'RACION_P,P84006_CONCEPTO_P'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214945977988634327)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214946925961634328)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_FORMATO_P,P84006_ID_MOVIMIENTO,P84006_CODIGO_MONEDA_P,P84006_TA'
||'SA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214946471856634328)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#FOS_MOVIMIENTO_BANCARIO_splitter'').splitter({collapsed:false,position:0});'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214950483328634336)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419155281241309389)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214948937101634332)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409222782429145665)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214947950746634331)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415180743487468783)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214948483586634331)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415297716094759382)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214949434755634333)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409225788622145695)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214950933020634337)
,p_event_id=>wwv_flow_imp.id(214944928689634325)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415178101418468756)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215008535803634432)
,p_name=>'CANCELAR_MOVIMIENTO_P'
,p_event_sequence=>570
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214844230030634143)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215009507895634434)
,p_event_id=>wwv_flow_imp.id(215008535803634432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_FORMATO_P,P84006_ID_MOVIMIENTO,P84006_CODIGO_MONEDA_P,P84006_TA'
||'SA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215009059813634433)
,p_event_id=>wwv_flow_imp.id(215008535803634432)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#FOS_MOVIMIENTO_BANCARIO_splitter'').splitter({collapsed:false,position:0});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214952265405634344)
,p_name=>'LISTA_MOVIMIENTOS'
,p_event_sequence=>580
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(419155281241309389)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214952792384634345)
,p_event_id=>wwv_flow_imp.id(214952265405634344)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'REGISTROS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    g_MostrarNumeroRegistrosIR(''LISTA_MOVIMIENTOS'');',
'    $(''#LISTA_MOVIMIENTOS_saved_reports'').hide();',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214953234268634346)
,p_event_id=>wwv_flow_imp.id(214952265405634344)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'REFRESH'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    $(''.LISTA_MOVIMIENTOS_BTN .a-IRR-savedReports'').append(''<button class="a-Button a-IRR-button t-Button--noLabel t-Button--icon positionButtonReset  t-Button--small" type="button" id="buttonReset" title="Reset" onclick="functionResetLISTA_MOVIMIENT'
||'OS_BTN()" aria-label="Reset"><span class="t-Icon fa fa-rotate-left" aria-hidden="true"></span></button>'');',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214954506591634347)
,p_name=>'GUARDAR_MOVIMIENTO'
,p_event_sequence=>590
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214845022901634144)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'validarCamposRequeridos($validar_movimiento)'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214956562521634350)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'6'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214957560048634352)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_MOVIMIENTO_PRESTAMO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            A.C001 ID,',
'            A.C002 RUBRO_COBRO,',
'            A.C003 ID_ASOCIACION,',
'            A.C004 MES,',
'            A.C005 ANIO,',
'            A.C006 ID_PAGO,',
'            A.C007 ESTADO',
'        FROM APEX_COLLECTIONS A',
'        WHERE A.COLLECTION_NAME = ''COLLECTION_DETALLE_PAGOS''',
'        AND A.C007 <> 1;',
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS SET',
'    	CODIGO_MONEDA = :P84006_CODIGO_MONEDA_P,',
'    	TASA_MONEDA = :P84006_TASA_CAMBIO_P,',
'    	MONTO_ORIGEN = :P84006_MONTO_ORIGEN_P,',
'    	MONTO_LOCAL = :P84006_MONTO_LOCAL_P,',
'    	FECHA_DOCUMENTO = :P84006_FECHA_DOCUMENTO_P,',
'    	NUMDOC = :P84006_NUMDOC_P,',
'    	CODMAE = :P84006_CODMAE_P,',
'    	TIPO_TRANSACCION = :P84006_TIPO_TRANSACCION_P,',
'    	SERIE = :P84006_SERIE_P,',
'    	NROSOLCHE = :P84006_NROSOLCHE_P,',
'    	ID_CUENTA = :P84006_ID_CUENTA_P,',
'    	CODIGO_OPERACION = :P84006_CODIGO_OPERACION_P,',
'    	CONCEPTO = :P84006_CONCEPTO_P,',
'        USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'        FECHA_MODIFICACION = SYSDATE',
'    WHERE ID = :P84006_ID_MOVIMIENTO;',
'',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        IF R_DATOS.ESTADO = 4 THEN',
'            INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'            (',
'                ID_FDU_TRANSACCIONES_FINANCIERA,',
'            	RUBRO_COBRO,',
'            	ID_ASOCIACION,',
'            	MES,',
'            	ANIO,',
'                ID_PAGO,',
'            	USUARIO_GRABACION,',
'            	FECHA_MODIFICACION',
'            )',
'            VALUES',
'            (',
'                :P84006_ID_MOVIMIENTO,',
'                R_DATOS.RUBRO_COBRO,',
'                R_DATOS.ID_ASOCIACION,',
'                R_DATOS.MES,',
'                R_DATOS.ANIO,',
'                NULL,',
'                :GLOBAL_CODIGO_USUARIO,',
'                SYSDATE',
'            );',
'',
'            IF R_DATOS.RUBRO_COBRO = ''INTERES'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS SET',
'                    ESTADO = 3',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE SET',
'                    ESTADO = 3',
'                WHERE ID_INTERES_COBRADO = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''CAPITAL'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL SET',
'                    ESTADO = 3',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''MORA'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS SET',
'                    ESTADO = 3',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'        ELSIF R_DATOS.ESTADO = 3 THEN',
'            DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'                WHERE ID = R_DATOS.ID;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''INTERES'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS SET',
'                    ESTADO = 1',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE SET',
'                    ESTADO = 2',
'                WHERE ID_INTERES_COBRADO = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''CAPITAL'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL SET',
'                    ESTADO = 1',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''MORA'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS SET',
'                    ESTADO = 1',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'        END IF;',
'    END LOOP;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P,P84006_FECHA_DOCUMENTO_P,P84006_NUMDOC_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPE'
||'RACION_P,P84006_CONCEPTO_P,P84006_ID_MOVIMIENTO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214956042982634349)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_MOVIMIENTO_INVERSION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS SET',
'    	CODIGO_MONEDA = :P84006_CODIGO_MONEDA_P,',
'    	TASA_MONEDA = :P84006_TASA_CAMBIO_P,',
'    	MONTO_ORIGEN = :P84006_MONTO_ORIGEN_P,',
'    	MONTO_LOCAL = :P84006_MONTO_LOCAL_P,',
'    	FECHA_DOCUMENTO = :P84006_FECHA_DOCUMENTO_P,',
'    	NUMDOC = :P84006_NUMDOC_P,',
'    	CODMAE = :P84006_CODMAE_P,',
'    	TIPO_TRANSACCION = :P84006_TIPO_TRANSACCION_P,',
'    	SERIE = :P84006_SERIE_P,',
'    	NROSOLCHE = :P84006_NROSOLCHE_P,',
'    	ID_CUENTA = :P84006_ID_CUENTA_P,',
'    	CODIGO_OPERACION = :P84006_CODIGO_OPERACION_P,',
'    	CONCEPTO = :P84006_CONCEPTO_P,',
'        USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'        FECHA_MODIFICACION = SYSDATE',
'    WHERE ID = :P84006_ID_MOVIMIENTO;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P,P84006_FECHA_DOCUMENTO_P,P84006_NUMDOC_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPE'
||'RACION_P,P84006_CONCEPTO_P,P84006_ID_MOVIMIENTO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214957055346634351)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214955060454634348)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_FORMATO_P,P84006_ID_MOVIMIENTO,P84006_CODIGO_MONEDA_P,P84006_TA'
||'SA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214955569523634349)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#FOS_MOVIMIENTO_BANCARIO_splitter'').splitter({collapsed:false,position:0});'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214958065615634352)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419155281241309389)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214958518325634353)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409222782429145665)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214959072571634354)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415180743487468783)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214959576910634354)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415297716094759382)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214960065188634355)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409225788622145695)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214960596600634355)
,p_event_id=>wwv_flow_imp.id(214954506591634347)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415178101418468756)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214898193730634248)
,p_name=>'ANULAR_BOLETA'
,p_event_sequence=>600
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214852015917634159)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214898642503634249)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_MOVIMIENTO_PRESTAMO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            A.C001 ID,',
'            A.C002 RUBRO_COBRO,',
'            A.C003 ID_ASOCIACION,',
'            A.C004 MES,',
'            A.C005 ANIO,',
'            A.C006 ID_PAGO,',
'            A.C007 ESTADO',
'        FROM APEX_COLLECTIONS A',
'        WHERE A.COLLECTION_NAME = ''COLLECTION_DETALLE_PAGOS''',
'        AND A.C007 <> 4;',
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS SET',
'    	ANULADO = ''S'',',
'        USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'        FECHA_MODIFICACION = SYSDATE',
'    WHERE ID = :P84006_ID_MOVIMIENTO;',
'',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'            WHERE ID = R_DATOS.ID;',
'',
'        IF R_DATOS.RUBRO_COBRO = ''INTERES'' THEN',
'            UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS SET',
'                ESTADO = 1',
'            WHERE ID = R_DATOS.ID_ASOCIACION;',
'',
'            UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE SET',
'                ESTADO = 2',
'            WHERE ID_INTERES_COBRADO = R_DATOS.ID_ASOCIACION;',
'        END IF;',
'',
'        IF R_DATOS.RUBRO_COBRO = ''CAPITAL'' THEN',
'            UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL SET',
'                ESTADO = 1',
'            WHERE ID = R_DATOS.ID_ASOCIACION;',
'        END IF;',
'',
'        IF R_DATOS.RUBRO_COBRO = ''MORA'' THEN',
'            UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS SET',
'                ESTADO = 1',
'            WHERE ID = R_DATOS.ID_ASOCIACION;',
'        END IF;',
'    END LOOP;',
'END;',
''))
,p_attribute_02=>'P84006_ID,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P,P84006_FECHA_DOCUMENTO_P,P84006_NUMDOC_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPE'
||'RACION_P,P84006_CONCEPTO_P,P84006_ID_MOVIMIENTO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214900140414634253)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_MOVIMIENTO_INVERSION'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS SET',
'    	ANULADO = ''S'',',
'        USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'        FECHA_MODIFICACION = SYSDATE',
'    WHERE ID = :P84006_ID_MOVIMIENTO;',
'END;',
''))
,p_attribute_02=>'P84006_ID,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P,P84006_FECHA_DOCUMENTO_P,P84006_NUMDOC_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPE'
||'RACION_P,P84006_CONCEPTO_P,P84006_ID_MOVIMIENTO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214899191785634251)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_FORMATO_P,P84006_ID_MOVIMIENTO,P84006_CODIGO_MONEDA_P,P84006_TA'
||'SA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214899686966634252)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#FOS_MOVIMIENTO_BANCARIO_splitter'').splitter({collapsed:false,position:0});'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214900683046634253)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419155281241309389)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214901186389634254)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409222782429145665)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214901698740634254)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415180743487468783)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214902145561634255)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415297716094759382)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214902691676634255)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409225788622145695)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214903112738634256)
,p_event_id=>wwv_flow_imp.id(214898193730634248)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415178101418468756)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214996577878634411)
,p_name=>'MORA_GENERADO'
,p_event_sequence=>610
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(415297716094759382)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214997023747634412)
,p_event_id=>wwv_flow_imp.id(214996577878634411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'REGISTROS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    g_MostrarNumeroRegistrosIR(''MORA_GENERADO'');',
'    $(''#MORA_GENERADO_saved_reports'').hide();',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214997575774634415)
,p_event_id=>wwv_flow_imp.id(214996577878634411)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'REFRESH'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'    $(''.MORA_BTS .a-IRR-savedReports'').append(''<button class="a-Button a-IRR-button t-Button--noLabel t-Button--icon positionButtonReset  t-Button--small" type="button" id="buttonReset" title="Reset" onclick="functionResetMORA_BTS()" aria-label="Rese'
||'t"><span class="t-Icon fa fa-rotate-left" aria-hidden="true"></span></button>'');',
'} catch (error) {',
'  // Manejo del error',
'  console.error("Se ha producido un error:", error.message);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214997980821634416)
,p_name=>'CARGAR_DATO_DETALLE_PAGO'
,p_event_sequence=>620
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214849006930634154)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214998462345634417)
,p_event_id=>wwv_flow_imp.id(214997980821634416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=133:84008:&SESSION.:::84008:P84008_ID:'' || :P84006_ID,',
'    p_triggering_element => ''apex.jQuery(''''#ASIGNAR_RUBROS_COBRO'''')'' ) url ',
'into :P84006_URL',
'FROM DUAL;'))
,p_attribute_02=>'P84006_ID'
,p_attribute_03=>'P84006_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214998917644634418)
,p_event_id=>wwv_flow_imp.id(214997980821634416)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P84006_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214999310466634418)
,p_name=>'REFRESH_DETALLE_PAGOS'
,p_event_sequence=>630
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "84008" && this.data.estado == "1"'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214999895721634419)
,p_event_id=>wwv_flow_imp.id(214999310466634418)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419318689311790493)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214953690669634346)
,p_name=>'ASIGNAR_RUBROS_COBRO_LISTA'
,p_event_sequence=>640
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(419318689311790493)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214954162364634347)
,p_event_id=>wwv_flow_imp.id(214953690669634346)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'NUMERO_REGISTROS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'g_MostrarNumeroRegistrosIR(''ASIGNAR_RUBROS_COBRO'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215025795921634482)
,p_name=>'ASIGNAR_RUBROS_COBRO_OPCIONES'
,p_event_sequence=>650
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#ASIGNAR_RUBROS_COBRO td'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215026712159634483)
,p_event_id=>wwv_flow_imp.id(215025795921634482)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ID_RUBRO_LISTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215026283693634482)
,p_event_id=>wwv_flow_imp.id(215025795921634482)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MENU'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'ELIMINAR_DETALLE_FDU'
,p_attribute_02=>'SEP'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215027297155634484)
,p_event_id=>wwv_flow_imp.id(215025795921634482)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'ASIGNAR_COLOR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#ASIGNAR_RUBROS_COBRO'').find(''tr'').removeClass("selected");',
'$(this.triggeringElement).closest(''tr'')[0].classList.toggle("selected");'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215048800514634523)
,p_name=>'BORRAR_RUBRO_BOLETA'
,p_event_sequence=>660
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'BORRAR_RUBRO_BOLETA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215049399062634524)
,p_event_id=>wwv_flow_imp.id(215048800514634523)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CAMBIAR_ESTADO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_INTERES IS',
'        SELECT',
'            A.SEQ_ID SEQ_ID,',
'            A.C004 MES,',
'            A.C005 ANIO,',
'            A.C007 ESTADO',
'        FROM APEX_COLLECTIONS A',
'        WHERE A.COLLECTION_NAME = ''COLLECTION_DETALLE_PAGOS''',
'        AND A.C002 = ''INTERES''',
'        AND A.C003 = :P84006_ID_RUBRO_LISTA;',
'    ',
'    CURSOR C_CAPITAL(P_MES NUMBER, P_ANIO NUMBER) IS',
'        SELECT',
'            A.SEQ_ID SEQ_ID,',
'            A.C007 ESTADO',
'        FROM APEX_COLLECTIONS A',
'        WHERE A.COLLECTION_NAME = ''COLLECTION_DETALLE_PAGOS''',
'        AND A.C002 = ''CAPITAL''',
'        AND TO_NUMBER(A.C004) = P_MES',
'        AND TO_NUMBER(A.C005) = P_ANIO;',
'    ',
'    CURSOR C_MORA(P_MES NUMBER, P_ANIO NUMBER) IS',
'        SELECT',
'            A.SEQ_ID SEQ_ID,',
'            A.C007 ESTADO',
'        FROM APEX_COLLECTIONS A',
'        WHERE A.COLLECTION_NAME = ''COLLECTION_DETALLE_PAGOS''',
'        AND A.C002 = ''MORA''',
'        AND TO_NUMBER(A.C004) = P_MES',
'        AND TO_NUMBER(A.C005) = P_ANIO;',
'BEGIN',
'    FOR R_INTERES IN C_INTERES',
'    LOOP',
'        IF R_INTERES.ESTADO = 4 THEN',
'            APEX_COLLECTION.DELETE_MEMBER (',
'                p_collection_name => ''COLLECTION_DETALLE_PAGOS'',',
'                p_seq => R_INTERES.SEQ_ID',
'            );',
'        ELSE',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                p_collection_name => ''COLLECTION_DETALLE_PAGOS'',',
'                p_seq => R_INTERES.SEQ_ID,',
'                p_attr_number => 7,',
'                p_attr_value  => 3',
'            );',
'        END IF;',
'',
'        FOR R_CAPITAL IN C_CAPITAL(TO_NUMBER(R_INTERES.MES), TO_NUMBER(R_INTERES.ANIO))',
'        LOOP',
'            IF R_CAPITAL.ESTADO = 4 THEN',
'                APEX_COLLECTION.DELETE_MEMBER (',
'                    p_collection_name => ''COLLECTION_DETALLE_PAGOS'',',
'                    p_seq => R_CAPITAL.SEQ_ID',
'                );',
'            ELSE',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE_PAGOS'',',
'                    p_seq => R_CAPITAL.SEQ_ID,',
'                    p_attr_number => 7,',
'                    p_attr_value  => 3',
'                );',
'            END IF;',
'        END LOOP;',
'',
'        FOR R_MORA IN C_MORA(TO_NUMBER(R_INTERES.MES), TO_NUMBER(R_INTERES.ANIO))',
'        LOOP',
'            IF R_MORA.ESTADO = 4 THEN',
'                APEX_COLLECTION.DELETE_MEMBER (',
'                    p_collection_name => ''COLLECTION_DETALLE_PAGOS'',',
'                    p_seq => R_MORA.SEQ_ID',
'                );',
'            ELSE',
'                APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'                    p_collection_name => ''COLLECTION_DETALLE_PAGOS'',',
'                    p_seq => R_MORA.SEQ_ID,',
'                    p_attr_number => 7,',
'                    p_attr_value  => 3',
'                );',
'            END IF;',
'        END LOOP;',
'    END LOOP;',
'END;'))
,p_attribute_02=>'P84006_ID_RUBRO_LISTA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215049808744634533)
,p_event_id=>wwv_flow_imp.id(215048800514634523)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419318689311790493)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215027605166634484)
,p_name=>'VALIDAR_PAGO'
,p_event_sequence=>670
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(214852434302634160)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'validarCamposRequeridos($validar_movimiento)'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215028159393634485)
,p_event_id=>wwv_flow_imp.id(215027605166634484)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'6'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215029120608634486)
,p_event_id=>wwv_flow_imp.id(215027605166634484)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'VALIDAR_PAGOS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_MONTO_RESIDUAL NUMBER;',
'BEGIN',
'    :P84006_MONTO_RESIDUAL := ',
'        SAF.APX_FNC_CONVERSION_MONEDAS(NVL(:P84006_MONTO_ORIGEN_P, 0), :P84006_CODIGO_MONEDA_P, 1, :P84006_TASA_CAMBIO_P, NULL)',
'        - ',
'        NVL(SAF.APX_FNC_CONVERSION_MONEDAS(NVL(SAF.GET_FDU_VALOR_VALIDADO_BOLETA(:P84006_ID_MOVIMIENTO, :P84006_ID), 0), :P84006_CODIGO_MONEDA, 1, :P84006_TASA_CAMBIO, NULL), 0);',
'END;'))
,p_attribute_02=>'P84006_ID_MOVIMIENTO,P84006_ID,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN_P,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P'
,p_attribute_03=>'P84006_MONTO_RESIDUAL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215028612275634486)
,p_event_id=>wwv_flow_imp.id(215027605166634484)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215029644465634487)
,p_event_id=>wwv_flow_imp.id(215027605166634484)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'EXEC'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger("CARGAR_PAGO_VALIDADO");'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215030128284634488)
,p_event_id=>wwv_flow_imp.id(215027605166634484)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'EXEC'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger("CARGAR_PAGO_VALIDADO_INVERSION");'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84006_ES_PRESTAMO'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215030505114634488)
,p_name=>'CARGAR_PAGO_VALIDADO'
,p_event_sequence=>680
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P84006_MONTO_RESIDUAL'
,p_triggering_condition_type=>'GREATER_THAN_OR_EQUAL'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CARGAR_PAGO_VALIDADO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215033937135634495)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_MOVIMIENTO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            A.C001 ID,',
'            A.C002 RUBRO_COBRO,',
'            A.C003 ID_ASOCIACION,',
'            A.C004 MES,',
'            A.C005 ANIO,',
'            A.C006 ID_PAGO,',
'            A.C007 ESTADO',
'        FROM APEX_COLLECTIONS A',
'        WHERE A.COLLECTION_NAME = ''COLLECTION_DETALLE_PAGOS''',
'        AND A.C007 <> 1;',
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS SET',
'    	CODIGO_MONEDA = :P84006_CODIGO_MONEDA_P,',
'    	TASA_MONEDA = :P84006_TASA_CAMBIO_P,',
'    	MONTO_ORIGEN = :P84006_MONTO_ORIGEN_P,',
'    	MONTO_LOCAL = :P84006_MONTO_LOCAL_P,',
'    	FECHA_DOCUMENTO = :P84006_FECHA_DOCUMENTO_P,',
'    	NUMDOC = :P84006_NUMDOC_P,',
'    	CODMAE = :P84006_CODMAE_P,',
'    	TIPO_TRANSACCION = :P84006_TIPO_TRANSACCION_P,',
'    	SERIE = :P84006_SERIE_P,',
'    	NROSOLCHE = :P84006_NROSOLCHE_P,',
'    	ID_CUENTA = :P84006_ID_CUENTA_P,',
'    	CODIGO_OPERACION = :P84006_CODIGO_OPERACION_P,',
'    	CONCEPTO = :P84006_CONCEPTO_P,',
'        USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'        FECHA_MODIFICACION = SYSDATE,',
'        ANULADO = ''V''',
'    WHERE ID = :P84006_ID_MOVIMIENTO;',
'',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        IF R_DATOS.ESTADO = 4 THEN',
'            INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'            (',
'                ID_FDU_TRANSACCIONES_FINANCIERA,',
'            	RUBRO_COBRO,',
'            	ID_ASOCIACION,',
'            	MES,',
'            	ANIO,',
'                ID_PAGO,',
'            	USUARIO_GRABACION,',
'            	FECHA_MODIFICACION',
'            )',
'            VALUES',
'            (',
'                :P84006_ID_MOVIMIENTO,',
'                R_DATOS.RUBRO_COBRO,',
'                R_DATOS.ID_ASOCIACION,',
'                R_DATOS.MES,',
'                R_DATOS.ANIO,',
'                NULL,',
'                :GLOBAL_CODIGO_USUARIO,',
'                SYSDATE',
'            );',
'',
'            IF R_DATOS.RUBRO_COBRO = ''INTERES'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS SET',
'                    ESTADO = 3',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE SET',
'                    ESTADO = 3',
'                WHERE ID_INTERES_COBRADO = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''CAPITAL'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL SET',
'                    ESTADO = 3',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''MORA'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS SET',
'                    ESTADO = 3',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'        ELSIF R_DATOS.ESTADO = 3 THEN',
'            DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'                WHERE ID = R_DATOS.ID;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''INTERES'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS SET',
'                    ESTADO = 1',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE SET',
'                    ESTADO = 2',
'                WHERE ID_INTERES_COBRADO = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''CAPITAL'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL SET',
'                    ESTADO = 1',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'',
'            IF R_DATOS.RUBRO_COBRO = ''MORA'' THEN',
'                UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS SET',
'                    ESTADO = 1',
'                WHERE ID = R_DATOS.ID_ASOCIACION;',
'            END IF;',
'        END IF;',
'    END LOOP;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P,P84006_FECHA_DOCUMENTO_P,P84006_NUMDOC_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPE'
||'RACION_P,P84006_CONCEPTO_P,P84006_ID_MOVIMIENTO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215035934539634498)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'7'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215035477203634498)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'VALIDAR_PAGOS_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_INTERES_DIARIO IS',
'        SELECT',
'            MAX(A.FECHA_INTERES)',
'        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE A',
'        INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE B',
'        	ON B.ID_ASOCIACION = A.ID_INTERES_COBRADO',
'        	AND B.RUBRO_COBRO = ''INTERES''',
'        WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID;',
'    ',
'    CURSOR C_INTERES_COBRADOS(P_FECHA_INICIO DATE) IS',
'        SELECT',
'            A.ID',
'        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS A',
'        WHERE ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID',
'        AND TRUNC(LAST_DAY(TO_DATE(A.MES || ''/'' || A.ANIO,''MM/YYYY''))) >= TRUNC(LAST_DAY(P_FECHA_INICIO));',
'    ',
'    CURSOR C_CAPITAL(P_FECHA_INICIO DATE) IS',
'        SELECT',
'            A.ID',
'        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL A',
'        WHERE A.ID_FDU_TRANSACCIONES_FINANCIERA = :P84006_ID',
'        AND TRUNC(LAST_DAY(TO_DATE(A.MES || ''/'' || A.ANIO,''MM/YYYY''))) >= TRUNC(LAST_DAY(P_FECHA_INICIO));',
'',
'    CURSOR C_MORA(P_FECHA_INICIO DATE) IS',
'        SELECT',
'            A.ID',
'        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS A',
'        WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID',
'        AND TRUNC(LAST_DAY(TO_DATE(A.MES || ''/'' || A.ANIO,''MM/YYYY''))) >= TRUNC(LAST_DAY(P_FECHA_INICIO));',
'    ',
'    V_FECHA_INICIO DATE;',
'BEGIN',
'    OPEN C_INTERES_DIARIO;',
'        FETCH C_INTERES_DIARIO INTO V_FECHA_INICIO;',
'    CLOSE C_INTERES_DIARIO;',
'',
'    IF V_FECHA_INICIO IS NOT NULL THEN',
'        V_FECHA_INICIO := TRUNC(V_FECHA_INICIO) + 1;',
'',
'        DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE',
'            WHERE ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID',
'            AND TRUNC(FECHA_INTERES) >= TRUNC(V_FECHA_INICIO);',
'',
'        FOR R_INTERES_COBRADOS IN C_INTERES_COBRADOS(V_FECHA_INICIO)',
'        LOOP',
'            DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS',
'                WHERE ID = R_INTERES_COBRADOS.ID;',
'            ',
'            DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'                WHERE RUBRO_COBRO = ''INTERES''',
'                AND ID_ASOCIACION = R_INTERES_COBRADOS.ID;',
'        END LOOP;',
'',
'        FOR R_CAPITAL IN C_CAPITAL(V_FECHA_INICIO)',
'        LOOP',
'            UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL SET',
'                ESTADO = 1',
'            WHERE ID = R_CAPITAL.ID;',
'',
'            DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'                WHERE RUBRO_COBRO = ''CAPITAL''',
'                AND ID_ASOCIACION = R_CAPITAL.ID;',
'        END LOOP;',
'',
'        FOR R_MORA IN C_MORA(V_FECHA_INICIO)',
'        LOOP',
'            DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS',
'                WHERE ID = R_MORA.ID;',
'            ',
'            DELETE FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'                WHERE RUBRO_COBRO = ''MORA''',
'                AND ID_ASOCIACION = R_MORA.ID;',
'        END LOOP;',
'    END IF;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_ID_MOVIMIENTO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215036408551634499)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215037420899634501)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'VALIDAR_PAGOS_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_MONTO_BOLETA NUMBER;',
'    V_MONTO_PAGO NUMBER;',
'    V_RECIDUO NUMBER;',
'    V_MONTO_RECUPERADO NUMBER;',
'',
'    CURSOR C_CAPITAL IS',
'        SELECT',
'        	B.ID,',
'        	B.MONTO_ORIGEN',
'        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL B',
'        WHERE B.ID =',
'        (',
'        	SELECT',
'        		MAX(A.ID)',
'        	FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL A',
'        	WHERE A.ID_FDU_TRANSACCIONES_FINANCIERA = :P84006_ID',
'        	AND A.TIPO_PAGO = 1',
'            AND A.ESTADO <> 3',
'        	AND A.MONTO_ORIGEN > 0',
'        );',
'',
'BEGIN',
'    V_MONTO_PAGO := NVL(SAF.GET_FDU_VALOR_VALIDADO_BOLETA(:P84006_ID_MOVIMIENTO,:P84006_ID), 0);',
'    ',
'    V_MONTO_BOLETA := ',
'        SAF.APX_FNC_CONVERSION_MONEDAS',
'        (',
'            NVL(:P84006_MONTO_ORIGEN_P, 0),',
'            :P84006_CODIGO_MONEDA_P,',
'            :P84006_CODIGO_MONEDA,',
'            :P84006_TASA_CAMBIO_P,',
'            :P84006_TASA_CAMBIO',
'        );',
'    ',
'    IF (V_MONTO_BOLETA - V_MONTO_PAGO) > 0 THEN',
'        V_RECIDUO := (V_MONTO_BOLETA - V_MONTO_PAGO);',
'        ',
'        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL',
'        (',
'            ID_FDU_TRANSACCIONES_FINANCIERA,',
'        	CODIGO_MONEDA,',
'        	TASA_MONEDA,',
'        	MONTO_ORIGEN,',
'        	MONTO_LOCAL,',
'        	MES,',
'        	ANIO,',
'        	TIPO_PAGO,',
'        	USUARIO_GRABACION,',
'        	FECHA_GRABACION,',
'        	ESTADO',
'        )',
'        VALUES',
'        (',
'            :P84006_ID,',
'            :P84006_CODIGO_MONEDA,',
'            :P84006_TASA_CAMBIO,',
'            V_RECIDUO,',
'            SAF.APX_FNC_CONVERSION_MONEDAS',
'            (',
'                V_RECIDUO,',
'                :P84006_CODIGO_MONEDA,',
'                1,',
'                :P84006_TASA_CAMBIO,',
'                NULL',
'            ),',
'            TO_NUMBER(TO_CHAR(SYSDATE, ''MM'')),',
'            TO_CHAR(SYSDATE, ''YYYY''),',
'            2,',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE,',
'            3',
'        );',
'',
'        WHILE V_RECIDUO > 0',
'            LOOP',
'                FOR R_CAPITAL IN C_CAPITAL',
'                LOOP',
'                    IF (R_CAPITAL.MONTO_ORIGEN - V_RECIDUO) <= 0 THEN',
'                         UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL',
'                            SET MONTO_ORIGEN = 0',
'                            WHERE ID = R_CAPITAL.ID;',
'                    ELSE',
'                        UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL',
'                            SET MONTO_ORIGEN = (R_CAPITAL.MONTO_ORIGEN - V_RECIDUO)',
'                            WHERE ID = R_CAPITAL.ID;',
'                    END IF;',
'',
'                    V_RECIDUO := V_RECIDUO - R_CAPITAL.MONTO_ORIGEN;',
'                END LOOP;',
'            END LOOP;',
'    END IF;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_ID_MOVIMIENTO,P84006_MONTO_ORIGEN_P,P84006_CODIGO_MONEDA_P,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO_P,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_MONTO_LOCAL'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215036943209634500)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'VALIDAR_PAGOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_MONTO_BOLETA NUMBER;',
'    V_MONTO_PAGO NUMBER;',
'    V_RECIDUO NUMBER;',
'    V_MONTO_RECUPERADO NUMBER;',
'BEGIN',
'    SELECT',
'    	NVL(SUM(ROUND(',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			MONTO_ORIGEN,',
'    			CODIGO_MONEDA,',
'    			:P84006_CODIGO_MONEDA,',
'    			TASA_MONEDA,',
'    			:P84006_TASA_CAMBIO',
'    		),',
'    		2',
'    	)), 0)',
'        INTO',
'        V_MONTO_RECUPERADO',
'    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL',
'    WHERE ID_FDU_TRANSACCIONES_FINANCIERA = :P84006_ID',
'    AND ESTADO = 3;',
'',
'    IF ',
'        V_MONTO_RECUPERADO >= ROUND(:P84006_MONTO_ORIGEN, 0) THEN',
'        UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            MONTO_RECUPERADO_ORIGEN = :P84006_MONTO_ORIGEN,',
'        	MONTO_RECUPERADO_LOCAL = :P84006_MONTO_LOCAL,',
'        	FECHA_RECUPERACION_TOTAL = SYSDATE,',
'            ESTADO = ''CANCELADO''',
'        WHERE ID = :P84006_ID;',
'    ELSE    ',
'        UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            MONTO_RECUPERADO_ORIGEN = V_MONTO_RECUPERADO,',
'        	MONTO_RECUPERADO_LOCAL = SAF.APX_FNC_CONVERSION_MONEDAS',
'                                        (',
'                                            V_MONTO_RECUPERADO,',
'                                            :P84006_CODIGO_MONEDA,',
'                                            1,',
'                                            :P84006_TASA_CAMBIO,',
'                                            1',
'                                        ),',
'        	FECHA_RECUPERACION_TOTAL = NULL',
'        WHERE ID = :P84006_ID;',
'    END IF;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_ID_MOVIMIENTO,P84006_MONTO_ORIGEN_P,P84006_CODIGO_MONEDA_P,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO_P,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_MONTO_LOCAL,P84006_MONTO_RECUPERADO_ORIGEN'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215034488464634496)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_FORMATO_P,P84006_ID_MOVIMIENTO,P84006_CODIGO_MONEDA_P,P84006_TA'
||'SA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215037999257634503)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'EXEV'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger("CARGAR_REINTEGRO");'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215034986609634496)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#FOS_MOVIMIENTO_BANCARIO_splitter'').splitter({collapsed:false,position:0});'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215031034936634489)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419155281241309389)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215031576742634490)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409222782429145665)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215032026278634490)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415180743487468783)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215032553826634492)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415297716094759382)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215032950887634493)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409225788622145695)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215033404603634493)
,p_event_id=>wwv_flow_imp.id(215030505114634488)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415178101418468756)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215000216737634419)
,p_name=>'CARGAR_PAGO_VALIDADO_INVERSION'
,p_event_sequence=>690
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P84006_MONTO_RESIDUAL'
,p_triggering_condition_type=>'GREATER_THAN_OR_EQUAL'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CARGAR_PAGO_VALIDADO_INVERSION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215000714973634420)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_MOVIMIENTO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS SET',
'    	CODIGO_MONEDA = :P84006_CODIGO_MONEDA_P,',
'    	TASA_MONEDA = :P84006_TASA_CAMBIO_P,',
'    	MONTO_ORIGEN = :P84006_MONTO_ORIGEN_P,',
'    	MONTO_LOCAL = :P84006_MONTO_LOCAL_P,',
'    	FECHA_DOCUMENTO = :P84006_FECHA_DOCUMENTO_P,',
'    	NUMDOC = :P84006_NUMDOC_P,',
'    	CODMAE = :P84006_CODMAE_P,',
'    	TIPO_TRANSACCION = :P84006_TIPO_TRANSACCION_P,',
'    	SERIE = :P84006_SERIE_P,',
'    	NROSOLCHE = :P84006_NROSOLCHE_P,',
'    	ID_CUENTA = :P84006_ID_CUENTA_P,',
'    	CODIGO_OPERACION = :P84006_CODIGO_OPERACION_P,',
'    	CONCEPTO = :P84006_CONCEPTO_P,',
'        USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'        FECHA_MODIFICACION = SYSDATE,',
'        ANULADO = ''V''',
'    WHERE ID = :P84006_ID_MOVIMIENTO;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_CODIGO_MONEDA_P,P84006_TASA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P,P84006_FECHA_DOCUMENTO_P,P84006_NUMDOC_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPE'
||'RACION_P,P84006_CONCEPTO_P,P84006_ID_MOVIMIENTO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215001259832634421)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MENSAJE_ERROR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_ERROR'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'7'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215001726671634422)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ERROR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger(''MENSAJE_ERROR'');'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215002217152634423)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'VALIDAR_PAGOS_2.1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_MONTO_BOLETA NUMBER;',
'    V_MONTO_PAGO NUMBER;',
'    V_RECIDUO NUMBER;',
'    V_MONTO_RECUPERADO NUMBER;',
'BEGIN',
'    SELECT',
'    	NVL(SUM(ROUND(',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			MONTO_ORIGEN,',
'    			CODIGO_MONEDA,',
'    			:P84006_CODIGO_MONEDA,',
'    			TASA_MONEDA,',
'    			:P84006_TASA_CAMBIO',
'    		),',
'    		2',
'    	)), 0)',
'    INTO',
'        V_MONTO_RECUPERADO',
'    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS',
'    WHERE ID_FDU_TRANSACCIONES_FINANCIERAS = :P84006_ID',
'    AND ANULADO = ''V'';',
'',
'    IF ',
'        V_MONTO_RECUPERADO >= ROUND(:P84006_MONTO_ORIGEN, 0) THEN',
'        UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            MONTO_RECUPERADO_ORIGEN = :P84006_MONTO_ORIGEN,',
'        	MONTO_RECUPERADO_LOCAL = :P84006_MONTO_LOCAL,',
'        	FECHA_RECUPERACION_TOTAL = SYSDATE,',
'            ESTADO = ''CANCELADO''',
'        WHERE ID = :P84006_ID;',
'    ELSE    ',
'        UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            MONTO_RECUPERADO_ORIGEN = V_MONTO_RECUPERADO,',
'        	MONTO_RECUPERADO_LOCAL = SAF.APX_FNC_CONVERSION_MONEDAS',
'                                        (',
'                                            V_MONTO_RECUPERADO,',
'                                            :P84006_CODIGO_MONEDA,',
'                                            1,',
'                                            :P84006_TASA_CAMBIO,',
'                                            1',
'                                        ),',
'        	FECHA_RECUPERACION_TOTAL = NULL',
'        WHERE ID = :P84006_ID;',
'    END IF;',
'END;'))
,p_attribute_02=>'P84006_ID,P84006_ID_MOVIMIENTO,P84006_MONTO_ORIGEN_P,P84006_CODIGO_MONEDA_P,P84006_CODIGO_MONEDA,P84006_TASA_CAMBIO_P,P84006_TASA_CAMBIO,P84006_MONTO_ORIGEN,P84006_MONTO_LOCAL,P84006_MONTO_RECUPERADO_ORIGEN'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215002736801634424)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'LIMPIAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_FECHA_DOCUMENTO_P,P84006_CODMAE_P,P84006_TIPO_TRANSACCION_P,P84006_SERIE_P,P84006_NUMDOC_P,P84006_NROSOLCHE_P,P84006_ID_CUENTA_P,P84006_CODIGO_OPERACION_P,P84006_CONCEPTO_P,P84006_FORMATO_P,P84006_ID_MOVIMIENTO,P84006_CODIGO_MONEDA_P,P84006_TA'
||'SA_CAMBIO_P,P84006_MONTO_ORIGEN_P,P84006_MONTO_LOCAL_P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215006791339634429)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'EXEV'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.event.trigger("CARGAR_REINTEGRO");'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215003232143634424)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_FOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#FOS_MOVIMIENTO_BANCARIO_splitter'').splitter({collapsed:false,position:0});'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215003748160634425)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(419155281241309389)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215004260202634426)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409222782429145665)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215006292036634429)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415180743487468783)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215004795921634427)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415297716094759382)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215005266592634427)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(409225788622145695)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215005736417634428)
,p_event_id=>wwv_flow_imp.id(215000216737634419)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_LISTA'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(415178101418468756)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215039260503634504)
,p_name=>'CARGAR_REINTEGRO'
,p_event_sequence=>700
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CARGAR_REINTEGRO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215039756847634505)
,p_event_id=>wwv_flow_imp.id(215039260503634504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84006_MONTO_RECUPERADO_ORIGEN,P84006_MONTO_RECUPERADO_LOCAL,P84006_FECHA_RECUPERACION_TOTAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	ROUND(NVL(MONTO_RECUPERADO_ORIGEN, 0), 2),',
'    ROUND(NVL(MONTO_RECUPERADO_LOCAL, 0), 2),',
'	FECHA_RECUPERACION_TOTAL',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS ',
'WHERE ID = :P84006_ID'))
,p_attribute_07=>'P84006_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214886825019634229)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RECARGAR_MODAL_REVISION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ESTADO VARCHAR2(100);',
'BEGIN',
'    SELECT',
'        ESTADO',
'        INTO',
'        V_ESTADO',
'    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'    WHERE ID = :P84006_ID;',
'',
'    IF V_ESTADO = ''ENVIADO A REVISION'' THEN',
'        UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            ESTADO = ''REVISION''',
'        WHERE ID = :P84006_ID;',
'',
'        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'        (',
'            ID_FDU_TRANSACCIONES_FINANCIERAS,',
'            ESTADO,',
'            OBSERVACION,',
'            USUARIO_ACEPTACION,',
'            FECHA_ACEPTACION',
'        )',
'        VALUES',
'        (',
'            :P84006_ID,',
'            ''REVISION'',',
'            ''REVISION ACEPTADA'',',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        );',
'    ELSE',
'        NULL;',
'    END IF;',
'END; '))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error en la carga de informacion'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RECARGAR_MODAL_REVISION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Solicitud Aceptada'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214887235806634231)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RECARGAR_MODAL_APROBACION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ESTADO VARCHAR2(100);',
'BEGIN',
'    SELECT',
'        ESTADO',
'        INTO',
'        V_ESTADO',
'    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'    WHERE ID = :P84006_ID;',
'',
'    IF V_ESTADO = ''PENDIENTE APROBACION'' THEN',
'        UPDATE SAF.FDU_TRANSACCIONES_FINANCIERAS SET',
'            ESTADO = ''APROBACION''',
'        WHERE ID = :P84006_ID;',
'',
'        INSERT INTO SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG',
'        (',
'            ID_FDU_TRANSACCIONES_FINANCIERAS,',
'            ESTADO,',
'            OBSERVACION,',
'            USUARIO_ACEPTACION,',
'            FECHA_ACEPTACION',
'        )',
'        VALUES',
'        (',
'            :P84006_ID,',
'            ''APROBACION'',',
'            ''APROBACION ACEPTADA'',',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE',
'        );',
'    ELSE',
'        NULL;',
'    END IF;',
'END; '))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error en la carga de informacion'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RECARGAR_MODAL_APROBACION'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Solicitud Aceptada'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214886470185634225)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_ESTADO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ESTADO VARCHAR2(100);',
'BEGIN',
'    SELECT',
'        ESTADO,',
'        ES_PRESTAMO',
'        INTO',
'        V_ESTADO,',
'        :P84006_VALIDAR_ES_PRESTAMO',
'    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS',
'    WHERE ID = :P84006_ID;',
'',
'    :P84006_VALIDAR_ESTADO := V_ESTADO;',
'',
'    IF V_ESTADO = ''SOLICITUD'' THEN',
'        :P84006_ACCION_MODAL := ''MODIFICAR_SOLICITUD'';',
'    ELSIF V_ESTADO = ''ENVIADO A REVISION'' THEN',
'        :P84006_ACCION_MODAL := ''ACEPTAR_REVISION'';',
'    ELSIF V_ESTADO = ''REVISION'' THEN',
'        :P84006_ACCION_MODAL := ''REVISAR_SOLICITUD'';',
'    ELSIF V_ESTADO = ''PENDIENTE APROBACION'' THEN',
'        :P84006_ACCION_MODAL := ''ACEPTAR_APROBACION'';',
'    ELSIF V_ESTADO = ''APROBACION'' THEN',
'        :P84006_ACCION_MODAL := ''APROBAR_SOLICITUD'';',
'    ELSIF V_ESTADO = ''RECHAZADO'' THEN',
'        :P84006_ACCION_MODAL := ''RECHAZADO_SOLICITUD'';',
'     ELSIF (V_ESTADO = ''ACEPTADO'' OR V_ESTADO = ''CANCELADO'') THEN',
'        :P84006_ACCION_MODAL := ''INGRESO_SOLICITUD'';',
'    ELSE',
'        :P84006_ACCION_MODAL := ''FLUJO_INVALIDO'';',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>':P84006_ID IS NOT NULL AND :P84006_ACCION_MODAL != ''VER_REGISTRO'''
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214887699887634232)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'COLLECTIONS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'        	ID,',
'        	RUBRO_COBRO,',
'        	ID_ASOCIACION,',
'        	MES,',
'        	ANIO,',
'            ID_PAGO',
'        FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_DETALLE',
'        WHERE ID_FDU_TRANSACCIONES_FINANCIERA = :P84006_ID;',
'BEGIN',
'    --DETALLE_PAGOS',
'    if not apex_collection.collection_exists(''COLLECTION_DETALLE_PAGOS'') then',
'    	apex_collection.create_collection(''COLLECTION_DETALLE_PAGOS'');',
'    else',
'    	apex_collection.truncate_collection(''COLLECTION_DETALLE_PAGOS'');',
'    end if;',
'',
'    /*FOR R_DATOS IN C_DATOS',
'    LOOP',
'        APEX_COLLECTION.ADD_MEMBER(',
'            P_COLLECTION_NAME  => ''COLLECTION_DETALLE_PAGOS'',',
'            P_C001 => R_DATOS.ID,',
'            P_C002 => R_DATOS.RUBRO_COBRO,',
'            P_C003 => R_DATOS.ID_ASOCIACION,',
'            P_C004 => R_DATOS.MES,',
'            P_C005 => R_DATOS.ANIO,',
'            P_C006 => R_DATOS.ID_PAGO,',
'            P_C007 => 1',
'        );',
'    END LOOP;*/',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(214888078591634232)
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
