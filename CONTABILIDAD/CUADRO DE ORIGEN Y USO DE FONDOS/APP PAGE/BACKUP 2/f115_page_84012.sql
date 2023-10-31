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
,p_default_application_id=>115
,p_default_id_offset=>0
,p_default_owner=>'SAF'
);
end;
/
 
prompt APPLICATION 115 - Modulo de Bancos
--
-- Application Export:
--   Application:     115
--   Name:            Modulo de Bancos
--   Date and Time:   10:01 Tuesday October 31, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 84012
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84012
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84012);
end;
/
prompt --application/pages/page_84012
begin
wwv_flow_imp_page.create_page(
 p_id=>84012
,p_name=>'MODAL_INGRESO_DE_MOVIMIENTOS_NUEVO'
,p_alias=>'MODAL-INGRESO-DE-MOVIMIENTOS-NUEVO'
,p_page_mode=>'MODAL'
,p_step_title=>'Movimientos Bancarios'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'let anulacion = ''hola'';',
'',
'window.addEventListener("beforeunload", function (event) {',
'  event.preventDefault();',
'  console.log(''me'');',
'});',
'',
'',
'',
'',
'',
'/*let filaBotones = document.getElementById(''historicoButton'').parentNode;',
'filaBotones.style = "display: flex;flex-direction: row-reverse;";*/',
'',
'',
'',
'const desactivarSelectElement = (divId) => {',
'    let elemento = document.getElementById(divId+"_CONTAINER");',
'    let elementoSelect = document.getElementById(divId);',
'    elemento.style.opacity = "1";',
'    elemento.style.pointerEvents = "none";',
'',
'    //select.style.opacity = "0.6";',
'    elementoSelect.style.backgroundColor = ''#f7f7f7'';',
'}',
'',
'const esVacio = (item) => {',
'    return '''' == apex.item(item).value',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let arridItems = [''P84012_NOMBRE_MONEDA'', ''P84012_IMPRIMIR''];',
'read_only_item_any_type(arridItems);'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Header-controls',
'{',
'    display: block!important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20231030151823'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(916079792332211172)
,p_plug_name=>'Ingreso de Movimientos'
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(24241000299467310)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       CODIGO_EMPRESA,',
'       CODMAE,',
'       TIPO_TRANSACCION,',
'       SERIE,',
'       NUMDOC,',
'       CODOPERA,',
'       TASAC,',
'       NROSOLCHE,',
'       LIBRO,',
'       FEDOC,',
'       CODIGO_CC,',
'       CODIGO_GASTO,',
'       ESTIMACION,',
'       COMPROBANTE,',
'       BENEFICIARIO,',
'       CONCEPTO,',
'       VOPERA,',
'       VALOR,',
'       FENTREGA,',
'       FPAGADO,',
'       FANULA,',
'       ORIGEN,',
'       NEGOCIABLE,',
'       FECHA_GRABACION,',
'       USUARIO_GRABACION,',
'       FECHA_MODIFICACION,',
'       USUARIO_MODIFICACION,',
'       USUAIMPRE,',
'       FIMPRE,',
'       CODIGO_OPERACION,',
'       CODIGO_DIVISION,',
'       NUMDOC_REF,',
'       CODIGO_ESTATUS,',
'       CODIGO_PROVEEDOR,',
'       USUARIO_CONCILIACION,',
'       ES_ANTICIPO_X_LIQUIDAR,',
'       ANTICIPO_X_LIQUIDAR,',
'SISTEMA,',
'id_prestamo_bancario,',
'ID_CUENTA',
'  from BCOMOVIG'))
,p_is_editable=>true
,p_edit_operations=>'i:u'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(861395002059038777)
,p_plug_name=>'Detalles Escritos'
,p_parent_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(24239198772467308)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.rowid,',
'       ''*'' permite_modificar,',
'       ''fa fa-check'' ICON_CLASS,',
'       a.CODIGO_EMPRESA,',
'       a.CODMAE,',
'       a.TIPO_TRANSACCION,',
'       a.SERIE,',
'       a.NUMDOC,',
'       a.CODIGO_CC,',
'       a.codigo_cc||''-''||d.descripcion_cc descripcion_cc,',
'       a.CODET,',
'       a.VALOR,',
'       a.FECHA_GRABACION,',
'       a.USUARIO_GRABACION,',
'       a.FECHA_MODIFICACION,',
'       a.USUARIO_MODIFICACION,',
'       a.NROESTIMA,',
'       a.CODIGO_GASTO,',
'       a.codigo_gasto||''-''||e.descripcion dtipo_ie,',
'       a.CONIVA,',
'       a.TIPO_PLANILLA,',
'       a.NRO_PLANILLA,',
'       a.COD_EMPLEADO,',
'       a.CODIGO_EMPRESA_D,',
'       a.CODIGO_OPERACION_D,',
'       a.CODIGO_DIVISION,',
'       a.codigo_division||''-''||c.descripcion descripcion_division,',
'       a.CANTIDAD,',
'       a.TIPO,',
'       a.codigo_empresa_d||''-''||GlobalFunc.Fnc_Empresas(a.CODIGO_EMPRESA_D)NEMPRESA,',
'       a.codigo_empresa_d||''-''||GlobalFunc.Fnc_Empresas(a.CODIGO_EMPRESA_D)NEMPRESADISPLAY,',
'       a.codigo_operacion_d||''-''||Contabilidad.fnc_NOperacion(nvl(a.CODIGO_EMPRESA_D,:GLOBAL_EMPRESA),a.CODIGO_OPERACION_D)Doperacion,',
'       Fnc_Get_NOMBREIDP(a.Tipo)Descripcion_TIPO_IDP,a.tipotransaccion,a.seriefac,a.numfac',
'from BCOMOVID a,Gral_EMPRESAS_DIVISION b,Gral_Divisiones c,Gral_Centros_Costos d,gral_gastos e',
'where a.codigo_empresa_d = b.codigo_empresa',
'and a.codigo_division = b.codigo_division',
'and b.Codigo_Division = c.Codigo_Division',
'and a.codigo_cc = d.codigo_cc',
'and a.codigo_gasto = e.codigo_gasto',
'and a.codigo_empresa = :GLOBAL_EMPRESA',
'and a.codmae = :P84012_CODMAE',
'and a.tipo_transaccion = :P84012_TIPO_TRANSACCION',
'and a.serie = :P84012_SERIE',
'and numdoc = :P84012_NUMDOC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84012_CODMAE,P84012_TIPO_TRANSACCION,P84012_SERIE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P84012_ROWID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detalles Escritos'
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
 p_id=>wwv_flow_imp.id(861395159875038778)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'CESAR.JUAREZ@AICSACORP.COM'
,p_internal_uid=>861395159875038778
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345669182635058188)
,p_db_column_name=>'CODIGO_GASTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tipo IE'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345669576390058189)
,p_db_column_name=>'DOPERACION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Operacion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345669964829058189)
,p_db_column_name=>'PERMITE_MODIFICAR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Permite Modificar'
,p_column_link=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:90:P90_ROWID:#SEQ_ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_column_type=>'STRING'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from dual',
'where :P84012_ADMINISTRADOR_BCOMOVIG_BCOMOVID = ''S'';'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345670352962058190)
,p_db_column_name=>'NEMPRESA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Empresa'
,p_column_link=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:43::'
,p_column_linktext=>'#NEMPRESA#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_column_type=>'STRING'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_display_condition=>'P84012_ROWID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345683142535058205)
,p_db_column_name=>'NEMPRESADISPLAY'
,p_display_order=>80
,p_column_identifier=>'AZ'
,p_column_label=>'Empresa'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345670721186058190)
,p_db_column_name=>'DESCRIPCION_CC'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Centro Costo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345671107930058191)
,p_db_column_name=>'DESCRIPCION_DIVISION'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Division'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345671501532058191)
,p_db_column_name=>'DTIPO_IE'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Tipo IE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345671985159058192)
,p_db_column_name=>'CODIGO_CC'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Centro Costo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345672387767058192)
,p_db_column_name=>'DESCRIPCION_TIPO_IDP'
,p_display_order=>130
,p_column_identifier=>'P'
,p_column_label=>'Tipo Comb.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345672775573058192)
,p_db_column_name=>'SERIE'
,p_display_order=>140
,p_column_identifier=>'T'
,p_column_label=>'Serie'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345673193226058193)
,p_db_column_name=>'CONIVA'
,p_display_order=>150
,p_column_identifier=>'W'
,p_column_label=>'Coniva'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345673528421058193)
,p_db_column_name=>'TIPO_PLANILLA'
,p_display_order=>160
,p_column_identifier=>'X'
,p_column_label=>'Tipo Planilla'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345673981253058194)
,p_db_column_name=>'COD_EMPLEADO'
,p_display_order=>170
,p_column_identifier=>'Z'
,p_column_label=>'Cod Empleado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345674385633058194)
,p_db_column_name=>'ICON_CLASS'
,p_display_order=>180
,p_column_identifier=>'AB'
,p_column_label=>'Icon Class'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345674781700058195)
,p_db_column_name=>'SERIEFAC'
,p_display_order=>190
,p_column_identifier=>'AD'
,p_column_label=>'Serie Factura'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345675136092058195)
,p_db_column_name=>'ROWID'
,p_display_order=>200
,p_column_identifier=>'AF'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345675515520058196)
,p_db_column_name=>'CODIGO_EMPRESA'
,p_display_order=>210
,p_column_identifier=>'AG'
,p_column_label=>'Codigo Empresa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345675991224058196)
,p_db_column_name=>'CODMAE'
,p_display_order=>220
,p_column_identifier=>'AH'
,p_column_label=>'Codmae'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345676380642058196)
,p_db_column_name=>'TIPO_TRANSACCION'
,p_display_order=>230
,p_column_identifier=>'AI'
,p_column_label=>'Tipo Transaccion'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345676772188058197)
,p_db_column_name=>'NUMDOC'
,p_display_order=>240
,p_column_identifier=>'AJ'
,p_column_label=>'Numdoc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345677165637058197)
,p_db_column_name=>'CODET'
,p_display_order=>250
,p_column_identifier=>'AK'
,p_column_label=>'Codet'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345677569152058198)
,p_db_column_name=>'VALOR'
,p_display_order=>260
,p_column_identifier=>'AL'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345677956295058198)
,p_db_column_name=>'FECHA_GRABACION'
,p_display_order=>270
,p_column_identifier=>'AM'
,p_column_label=>'Fecha Grabacion'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345678350060058199)
,p_db_column_name=>'USUARIO_GRABACION'
,p_display_order=>280
,p_column_identifier=>'AN'
,p_column_label=>'Usuario Grabacion'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345678711566058199)
,p_db_column_name=>'FECHA_MODIFICACION'
,p_display_order=>290
,p_column_identifier=>'AO'
,p_column_label=>'Fecha Modificacion'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345679113460058200)
,p_db_column_name=>'USUARIO_MODIFICACION'
,p_display_order=>300
,p_column_identifier=>'AP'
,p_column_label=>'Usuario Modificacion'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345679542710058200)
,p_db_column_name=>'NROESTIMA'
,p_display_order=>310
,p_column_identifier=>'AQ'
,p_column_label=>'Nroestima'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345679989976058201)
,p_db_column_name=>'NRO_PLANILLA'
,p_display_order=>320
,p_column_identifier=>'AR'
,p_column_label=>'Nro Planilla'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345680338708058201)
,p_db_column_name=>'CODIGO_EMPRESA_D'
,p_display_order=>330
,p_column_identifier=>'AS'
,p_column_label=>'Codigo Empresa D'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345680700452058202)
,p_db_column_name=>'CODIGO_OPERACION_D'
,p_display_order=>340
,p_column_identifier=>'AT'
,p_column_label=>'Codigo Operacion D'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345681183057058202)
,p_db_column_name=>'CODIGO_DIVISION'
,p_display_order=>350
,p_column_identifier=>'AU'
,p_column_label=>'Codigo Division'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345681539317058203)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>360
,p_column_identifier=>'AV'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345681947352058203)
,p_db_column_name=>'TIPO'
,p_display_order=>370
,p_column_identifier=>'AW'
,p_column_label=>'Tipo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345682316418058204)
,p_db_column_name=>'TIPOTRANSACCION'
,p_display_order=>380
,p_column_identifier=>'AX'
,p_column_label=>'Tipotransaccion'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345682712344058204)
,p_db_column_name=>'NUMFAC'
,p_display_order=>390
,p_column_identifier=>'AY'
,p_column_label=>'Numfac'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(861675180446527857)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1594632'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DOPERACION:NEMPRESADISPLAY:DESCRIPCION_CC:DESCRIPCION_DIVISION:DTIPO_IE:DESCRIPCION_TIPO_IDP:SERIE:SERIEFAC:VALOR:'
,p_sum_columns_on_break=>'VALOR'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(865572522845643170)
,p_plug_name=>'Detalles Solche'
,p_region_name=>'regionSolche'
,p_parent_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(24239198772467308)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'  FECHA,',
'  codigo_cc, ',
'  Codigo_Gasto, ',
'  Tipo, ',
'  tipo_transaccion, ',
'  numero, ',
'  serie, ',
'  sum(valor) valor, ',
'  sum(cantidad) Cantidad ',
'From ',
'  bcosoldoc ',
'Where ',
'  nrosolche = :P84012_NROSOLCHE ',
'  And Nvl(',
'    Globalfunc.Fnc_TiposTrs_Comodines(Tipo_Transaccion, ''ES CARGO''), ',
'    ''N''',
'  ) = ''S'' --And tipo_transaccion <> 7',
'  --HAVING sum(valor) = :P84012_VALOR',
'  AND numero NOT IN (',
'       SELECT ',
'      NUMFAC ',
'    FROM ',
'      BCOMOVIG b1, BCOMOVID b2',
'    WHERE ',
'          b2.CODIGO_EMPRESA = b1.CODIGO_EMPRESA  ',
'      AND b2.CODMAE = b1.CODMAE  ',
'      AND b2.TIPO_TRANSACCION = b1.TIPO_TRANSACCION ',
'      AND b2.NUMDOC = b1.NUMDOC  ',
'      AND b2.SERIE = b2.SERIE ',
'      AND b1.NROSOLCHE = :P84012_NROSOLCHE',
'  ) ',
'Group By ',
'  FECHA,',
'  codigo_cc, ',
'  Codigo_Gasto, ',
'  Tipo, ',
'  tipo_transaccion, ',
'  numero, ',
'  serie;',
' ',
' ',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84012_NROSOLCHE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P84012_ROWID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detalles Solche'
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
 p_id=>wwv_flow_imp.id(865572648961643171)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se encontr\00F3 detalle. Agregar manual')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'CESAR.JUAREZ@AICSACORP.COM'
,p_internal_uid=>865572648961643171
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345641984734058133)
,p_db_column_name=>'CODIGO_GASTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tipo IE'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345642379901058134)
,p_db_column_name=>'CODIGO_CC'
,p_display_order=>80
,p_column_identifier=>'B'
,p_column_label=>'Centro Costo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345645193560058138)
,p_db_column_name=>'FECHA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345643159515058135)
,p_db_column_name=>'TIPO_TRANSACCION'
,p_display_order=>100
,p_column_identifier=>'D'
,p_column_label=>'Tipo Transaccion'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345642781639058134)
,p_db_column_name=>'SERIE'
,p_display_order=>110
,p_column_identifier=>'C'
,p_column_label=>'Serie'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345644737527058137)
,p_db_column_name=>'NUMERO'
,p_display_order=>120
,p_column_identifier=>'H'
,p_column_label=>unistr('N\00FAmero documento')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345643902294058136)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>130
,p_column_identifier=>'F'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345643544682058135)
,p_db_column_name=>'VALOR'
,p_display_order=>140
,p_column_identifier=>'E'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345644358882058137)
,p_db_column_name=>'TIPO'
,p_display_order=>160
,p_column_identifier=>'G'
,p_column_label=>'Tipo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(865583649784664130)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1633716'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FECHA:TIPO_TRANSACCION:TIPO:SERIE:NUMERO:CANTIDAD:VALOR:'
,p_sum_columns_on_break=>'VALOR'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(915605251596755097)
,p_plug_name=>'Audit'
,p_parent_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(24224042097467280)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(916469492292775152)
,p_plug_name=>'Detalles'
,p_region_name=>'region_detalles'
,p_parent_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(24239198772467308)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    a.SEQ_ID,',
'    ''*'' permite_modificar,',
'    ''fa fa-check'' ICON_CLASS,',
'    a.c010 CODIGO_EMPRESA,--CODIGO_EMPRESA,',
'    a.c011 CODMAE,--CODMAE,',
'    a.c012 TIPO_TRANSACCION,--TIPO_TRANSACCION,',
'    a.c013 SERIE,--SERIE,',
'    a.c014 NUMDOC,--NUMDOC,',
'    a.c004 CODIGO_CC,--CODIGO_CC,',
'    a.c004 ||''-''|| d.descripcion_cc descripcion_cc,    ',
'    a.c015 CODET,--CODET,',
'    a.c009 VALOR,--VALOR,',
'    a.c005 NROESTIMA,--NROESTIMA,',
'    a.c006 CODIGO_GASTO,--CODIGO_GASTO,',
'    a.c006||''-''||e.descripcion dtipo_ie,--CODIGO_GASTO,',
'    a.c016 CONIVA,--CONIVA,',
'    a.c017 TIPO_PLANILLA,--TIPO_PLANILLA,',
'    a.c018 NRO_PLANILLA,--NRO_PLANILLA,',
'    a.c019 COD_EMPLEADO,--COD_EMPLEADO',
'    a.c001 CODIGO_EMPRESA_D,--CODIGO_EMPRESA_D,',
'    a.c002 CODIGO_OPERACION_D,--CODIGO_OPERACION_D,',
'    a.c003 CODIGO_DIVISION,--CODIGO_DIVISION,',
'    a.c003||''-''||c.descripcion descripcion_division,--CODIGO_DIVISION,',
'    a.c007 CANTIDAD,--CANTIDAD,',
'    a.c008 TIPO,--TIPO,',
'    a.c001 ||''-''||GlobalFunc.Fnc_Empresas(a.c001) NEMPRESA,',
'    a.c002 ||''-''||Contabilidad.fnc_NOperacion(nvl(a.c001,:GLOBAL_EMPRESA),a.c002)Doperacion,',
'    Fnc_Get_NOMBREIDP(a.c008)Descripcion_TIPO_IDP,',
'    a.c020 tipotransaccion,',
'    a.c021 seriefac,',
'    a.c022 numfac',
'    --a.tipotransaccion,',
'    --a.seriefac,',
'    --a.numfac',
'FROM ',
'    APEX_COLLECTIONS a,',
'    Gral_EMPRESAS_DIVISION b,',
'    Gral_Divisiones c,',
'    Gral_Centros_Costos d,',
'    gral_gastos e',
'WHERE ',
'    a.c001 = b.codigo_empresa',
'    AND a.c003 = b.codigo_division',
'    AND b.Codigo_Division = c.Codigo_Division',
'    AND a.c004 = d.codigo_cc',
'    AND a.c006 = e.codigo_gasto',
'    AND a.COLLECTION_NAME = ''DETALLES_COLLECTION'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P84012_ROWID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detalles'
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
 p_id=>wwv_flow_imp.id(916469585688775153)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'HUGO.BARRIENTOS'
,p_internal_uid=>916469585688775153
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345651261239058158)
,p_db_column_name=>'CODIGO_EMPRESA'
,p_display_order=>10
,p_column_identifier=>'BG'
,p_column_label=>'Codigo Empresa'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345653652132058162)
,p_db_column_name=>'CODIGO_EMPRESA_D'
,p_display_order=>20
,p_column_identifier=>'BM'
,p_column_label=>'Empresa'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345654058584058163)
,p_db_column_name=>'CODIGO_OPERACION_D'
,p_display_order=>30
,p_column_identifier=>'BN'
,p_column_label=>'Operacion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345655294376058164)
,p_db_column_name=>'CODIGO_GASTO'
,p_display_order=>40
,p_column_identifier=>'BQ'
,p_column_label=>'Tipo IE'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345660437286058173)
,p_db_column_name=>'DOPERACION'
,p_display_order=>50
,p_column_identifier=>'CD'
,p_column_label=>'Operacion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345650455301058157)
,p_db_column_name=>'PERMITE_MODIFICAR'
,p_display_order=>60
,p_column_identifier=>'BE'
,p_column_label=>'Permite Modificar'
,p_column_link=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:90:P90_ROWID:#SEQ_ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_column_type=>'STRING'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from dual',
'where :P84012_ADMINISTRADOR_BCOMOVIG_BCOMOVID = ''S'';'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345660091635058172)
,p_db_column_name=>'NEMPRESA'
,p_display_order=>70
,p_column_identifier=>'CC'
,p_column_label=>'Empresa'
,p_column_link=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:108:P108_SEQ_ID:#SEQ_ID#'
,p_column_linktext=>'#NEMPRESA#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345658829285058170)
,p_db_column_name=>'DESCRIPCION_CC'
,p_display_order=>80
,p_column_identifier=>'BZ'
,p_column_label=>'Centro Costo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345659671122058171)
,p_db_column_name=>'DESCRIPCION_DIVISION'
,p_display_order=>90
,p_column_identifier=>'CB'
,p_column_label=>'Division'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345659295293058171)
,p_db_column_name=>'DTIPO_IE'
,p_display_order=>100
,p_column_identifier=>'CA'
,p_column_label=>'Tipo IE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345654428190058163)
,p_db_column_name=>'CODIGO_DIVISION'
,p_display_order=>110
,p_column_identifier=>'BO'
,p_column_label=>'Division'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345653215697058161)
,p_db_column_name=>'CODIGO_CC'
,p_display_order=>120
,p_column_identifier=>'BL'
,p_column_label=>'Centro Costo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345654869532058164)
,p_db_column_name=>'NROESTIMA'
,p_display_order=>130
,p_column_identifier=>'BP'
,p_column_label=>'# Estimacion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345655687003058165)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>140
,p_column_identifier=>'BR'
,p_column_label=>'Cantidad Gal.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345656083618058166)
,p_db_column_name=>'TIPO'
,p_display_order=>150
,p_column_identifier=>'BS'
,p_column_label=>'Tipo Comb.'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345660802322058173)
,p_db_column_name=>'DESCRIPCION_TIPO_IDP'
,p_display_order=>160
,p_column_identifier=>'CE'
,p_column_label=>'Tipo Comb.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345656432470058166)
,p_db_column_name=>'VALOR'
,p_display_order=>170
,p_column_identifier=>'BT'
,p_column_label=>'Valor'
,p_column_type=>'STRING'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345651632765058159)
,p_db_column_name=>'CODMAE'
,p_display_order=>180
,p_column_identifier=>'BH'
,p_column_label=>'Codmae'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345652088402058160)
,p_db_column_name=>'TIPO_TRANSACCION'
,p_display_order=>190
,p_column_identifier=>'BI'
,p_column_label=>'Tipo Transaccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345652476707058160)
,p_db_column_name=>'SERIE'
,p_display_order=>200
,p_column_identifier=>'BJ'
,p_column_label=>'Serie'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345652874457058161)
,p_db_column_name=>'NUMDOC'
,p_display_order=>210
,p_column_identifier=>'BK'
,p_column_label=>'Numdoc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345656897129058167)
,p_db_column_name=>'CODET'
,p_display_order=>220
,p_column_identifier=>'BU'
,p_column_label=>'Codet'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345657204592058168)
,p_db_column_name=>'CONIVA'
,p_display_order=>230
,p_column_identifier=>'BV'
,p_column_label=>'Coniva'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345657653154058168)
,p_db_column_name=>'TIPO_PLANILLA'
,p_display_order=>240
,p_column_identifier=>'BW'
,p_column_label=>'Tipo Planilla'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345658034229058169)
,p_db_column_name=>'NRO_PLANILLA'
,p_display_order=>250
,p_column_identifier=>'BX'
,p_column_label=>'Nro Planilla'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345658449542058170)
,p_db_column_name=>'COD_EMPLEADO'
,p_display_order=>260
,p_column_identifier=>'BY'
,p_column_label=>'Cod Empleado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345650019371058156)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>270
,p_column_identifier=>'AK'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345650877451058158)
,p_db_column_name=>'ICON_CLASS'
,p_display_order=>280
,p_column_identifier=>'BF'
,p_column_label=>'Icon Class'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345661290316058174)
,p_db_column_name=>'TIPOTRANSACCION'
,p_display_order=>290
,p_column_identifier=>'CF'
,p_column_label=>'Tipotransaccion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345661639462058175)
,p_db_column_name=>'SERIEFAC'
,p_display_order=>300
,p_column_identifier=>'CG'
,p_column_label=>'Serie Factura'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345662039909058175)
,p_db_column_name=>'NUMFAC'
,p_display_order=>310
,p_column_identifier=>'CH'
,p_column_label=>'Numero Factura'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(916505588095859890)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'601506'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NEMPRESA:DOPERACION:DESCRIPCION_DIVISION:DESCRIPCION_CC:NROESTIMA:DTIPO_IE:DESCRIPCION_TIPO_IDP:CANTIDAD:SERIEFAC:NUMFAC:VALOR:'
,p_sum_columns_on_break=>'VALOR'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(917011022218799996)
,p_plug_name=>'Referencias'
,p_parent_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(24224042097467280)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345604114749058042)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'POLIZA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(24303100195467488)
,p_button_image_alt=>'Poliza'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345604576677058044)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'CARGA_DETALLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(24303100195467488)
,p_button_image_alt=>'Carga Detalle'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345683850879058215)
,p_button_sequence=>10
,p_button_name=>'CrearNuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch:t-Button--gapRight:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(24303100195467488)
,p_button_image_alt=>'Crear nuevo movimiento'
,p_button_redirect_url=>'f?p=&APP_ID.:84012:&SESSION.::&DEBUG.:84012::'
,p_button_condition_type=>'NEVER'
,p_grid_new_row=>'Y'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345604971619058044)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'Documentos_SOLCHE'
,p_button_static_id=>'solcheButton'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Ver Doctos.Solicitud'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:44:P44_NROSOLCHE:&P84012_NROSOLCHE.'
,p_button_condition=>'P84012_NROSOLCHE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-search-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345605312087058046)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'Historico_Impresiones'
,p_button_static_id=>'historicoButton'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Historico Impresiones'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:45:P45_CODIGO_EMPRESA,P45_CODMAE,P45_NUMDOC,P45_SERIE,P45_TIPO_TRANSACCION:&P84012_CODIGO_EMPRESA.,&P84012_CODMAE.,&P84012_NUMDOC.,&P84012_SERIE.,&P84012_TIPO_TRANSACCION.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345605784898058047)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'Genera_Poliza'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Genera Poliza'
,p_button_position=>'BOTTOM'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345606154155058047)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'Ver_Traslados'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Ver Traslados '
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:62:P62_COD_EMPRESA,P62_CODMAE,P62_NUMDOC,P62_SERIE,P62_EJERCICIO:&P84012_CODIGO_EMPRESA.,&P84012_CODMAE.,&P84012_NUMDOC.,&P84012_SERIE.,&P84012_EJERCICIO.'
,p_icon_css_classes=>'fa-list-ol'
,p_button_cattributes=>'style="width:200px;"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345606971319058049)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'AnulacionMovimiento'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Anula Movimiento'
,p_button_position=>'BOTTOM'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-variable'
,p_button_cattributes=>'style="width:200px;"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345607796649058050)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Crear'
,p_button_position=>'BOTTOM'
,p_button_condition=>'P84012_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_button_cattributes=>'style="width:200px;"'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345606510458058048)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Guardar Cambios'
,p_button_position=>'CHANGE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345607357120058050)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Regresar'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-undo-arrow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345608136068058051)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Borrar'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P84012_ROWID'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-times'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345662788343058177)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(916469492292775152)
,p_button_name=>'Ingresa_Documento'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ingresa Documento'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1',
'From Con_History_Tras',
'Where cod_empresa     = :GLOBAL_EMPRESA',
'And numdoc      = :P84012_NUMDOC',
'And codmae      = :P84012_CODMAE',
'And serie       = :P84012_SERIE',
'fetch first row only',
';'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-window-plus'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345608512761058051)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_button_name=>'Anula_movimiento'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(24303254052467489)
,p_button_image_alt=>'Anula Movimiento'
,p_button_position=>'TOP'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-variable'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(345729898919058289)
,p_branch_name=>'Go_84012'
,p_branch_action=>'f?p=&APP_ID.:84012:&SESSION.::&DEBUG.:84012:P84012_ROWID:&P84012_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345608968838058060)
,p_name=>'P84012_FEDOC'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Fecha'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'FEDOC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>50
,p_cMaxlength=>255
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345609360652058067)
,p_name=>'P84012_ANIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345609778101058068)
,p_name=>'P84012_MES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345610131102058068)
,p_name=>'P84012_DIA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345610519797058069)
,p_name=>'P84012_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_source=>'ROWID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345610917007058069)
,p_name=>'P84012_NUMDOC_REF'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_source=>'NUMDOC_REF'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345611319778058070)
,p_name=>'P84012_FECHA_MODULO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345611786736058070)
,p_name=>'P84012_EJERCICIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345612123188058071)
,p_name=>'P84012_CODIGO_EMPRESA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'(:GLOBAL_EMPRESA)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'CODIGO_EMPRESA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345612502901058071)
,p_name=>'P84012_CODMAE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'# Maestro Bancos'
,p_source=>'CODMAE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  CODMAE||''-''||nrocta||''-''||NOMCTA,CODMAE',
'FROM BCOMAESTRO',
'WHERE CODIGO_EMPRESA = :GLOBAL_EMPRESA',
'And FCancel is null',
'ORDER BY CODMAE'))
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345612980717058073)
,p_name=>'P84012_CODBCO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345613376202058074)
,p_name=>'P84012_NOMBRE_BANCO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345613786342058074)
,p_name=>'P84012_NOMBRE_MONEDA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345614186676058075)
,p_name=>'P84012_TASAC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'1'
,p_prompt=>'Tipo Cambio'
,p_source=>'TASAC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'0'
,p_attribute_02=>'9999999'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345614528990058076)
,p_name=>'P84012_NROCTA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345614964175058076)
,p_name=>'P84012_NOMBRE_CUENTA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345615302365058077)
,p_name=>'P84012_CODOPERA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'888'
,p_source=>'CODOPERA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345615738744058077)
,p_name=>'P84012_TPVOUCHER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345616177486058078)
,p_name=>'P84012_CHEQUERA'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345616569785058078)
,p_name=>'P84012_TIPO_TRANSACCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Tipo Transaccion'
,p_source=>'TIPO_TRANSACCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TIPO_TRANSACCION||''-''||NOMBRE_TRANSACCION Nombre,tipo_transaccion Tipo',
'FROM GRAL_TIPOS_TRANSAC_MODULOS',
'Where Codigo_Modulo = 8',
'and tipo_transaccion not in (958, 959, 931, 14, 15) ',
'ORDER BY TIPO_TRANSACCION, NOMBRE_TRANSACCION;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345616960879058079)
,p_name=>'P84012_SERIE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Serie'
,p_source=>'SERIE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct SERIE ',
'FROM SAF.BCOSERIE ',
'WHERE CODIGO_EMPRESA=:GLOBAL_EMPRESA',
'and TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'and CODMAE = :P84012_CODMAE'))
,p_lov_cascade_parent_items=>'P84012_TIPO_TRANSACCION,P84012_CODMAE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>3
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345617353509058081)
,p_name=>'P84012_NUMDOC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'# Documento'
,p_source=>'NUMDOC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345617746504058081)
,p_name=>'P84012_NES_NEGOCIABLE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345618144730058082)
,p_name=>'P84012_FORMATO'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345618542052058082)
,p_name=>'P84012_NDOC'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345618973073058083)
,p_name=>'P84012_NROSOLCHE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'# Solche'
,p_source=>'NROSOLCHE'
,p_source_type=>'REGION_SOURCE_COLUMN'
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
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345619265549058084)
,p_name=>'P84012_COMPROBANTE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'O'
,p_source=>'COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345619673623058084)
,p_name=>'P84012_CORRELATIVO'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345620014292058085)
,p_name=>'P84012_CODIGO_DIVISION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'101'
,p_prompt=>'Division'
,p_source=>'CODIGO_DIVISION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select b.codigo_division||''-''||b.Descripcion, b.Codigo_Division',
'  From Gral_eMPRESAS_DIVISION A, Gral_Divisiones b',
' Where a.Codigo_Division = b.Codigo_Division',
'   And a.Codigo_Empresa = :GLOBAL_EMPRESA',
'   And b.permite_movtos = ''S'''))
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345620440325058085)
,p_name=>'P84012_ID_CUENTA_AGRUPADOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Agrupador Contable'
,p_source=>'ID_CUENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'SELECT DESCRIPCION,ID_CUENTA FROM BCOCONCILIACION_CUENTAS'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(345620894955058086)
,p_name=>'P84012_CODIGO_OPERACION'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Operacion Contable'
,p_source=>'CODIGO_OPERACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Codigo_Operacion || '' - '' || Descripcion d, Codigo_Operacion R',
'  from con_enc_param_polizas',
' Where Codigo_Empresa = :P84012_CODIGO_EMPRESA',
'   and codigo_operacion  in (Select codigo_operacion',
'  from OPERACION_CONTABLE_TIPOSTRS oct ',
'where CODIGO_EMPRESA = :P84012_CODIGO_EMPRESA',
'and TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'   )',
'   And Estado <> ''INACTIVO''',
' Order by Codigo_Operacion',
' '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P84012_TIPO_TRANSACCION,P84012_CODIGO_EMPRESA'
,p_ajax_items_to_submit=>'P84012_TIPO_TRANSACCION,P84012_CODIGO_EMPRESA'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345621295400058088)
,p_name=>'P84012_LIBRO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'1'
,p_source=>'LIBRO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345621687842058088)
,p_name=>'P84012_CONCEPTO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Concepto'
,p_source=>'CONCEPTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2048
,p_cHeight=>3
,p_tag_attributes=>'style="text-transform:uppercase"'
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345622056177058089)
,p_name=>'P84012_CODIGO_PROVEEDOR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'# Proveedor'
,p_source=>'CODIGO_PROVEEDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.Codigo_Proveedor||''-''||nvl(b.razon_social,b.Nombre_Persona) info, a.Codigo_Proveedor',
'  From Cxp_Proveedores a, Gral_Personas_Table b',
'where GlobalFunc.Fnc_Estatus_PermiteMovtos(12, a.codigo_estado) = ''S''',
'  And a.Codigo_Persona = b.Codigo_Persona',
' Order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345622460890058090)
,p_name=>'P84012_BENEFICIARIO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Beneficiario'
,p_source=>'BENEFICIARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_attribute_06=>'UPPER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345622854630058090)
,p_name=>'P84012_ES_ANTICIPO_X_LIQUIDAR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'N'
,p_source=>'ES_ANTICIPO_X_LIQUIDAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345623266249058091)
,p_name=>'P84012_ANTICIPO_X_LIQUIDAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'# Anticipo X Liquidar'
,p_source=>'ANTICIPO_X_LIQUIDAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345623678209058091)
,p_name=>'P84012_CODIGO_MONEDA'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345624080509058092)
,p_name=>'P84012_SIMBOLO_MONEDA'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345624448838058092)
,p_name=>'P84012_ADMINISTRADOR_BCOMOVIG_BCOMOVID'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345624839017058095)
,p_name=>'P84012_IMPRIMIR'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345625235107058095)
,p_name=>'P84012_NEGOCIABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'N'
,p_prompt=>'Es Negociable ?'
,p_source=>'NEGOCIABLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:margin-top-lg'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'S'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345625674703058096)
,p_name=>'P84012_VALOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Valor Documento'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'VALOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24302211260467479)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345626092094058096)
,p_name=>'P84012_VOPERA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Valor Operacion'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'VOPERA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345626473879058097)
,p_name=>'P84012_ID_PRESTAMO_BANCARIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'# Prestamo Bancario'
,p_source=>'ID_PRESTAMO_BANCARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.CODIGO_EMPRESA||'' - ''||d.nombre_persona|| '' MONTO  ''||b.Nombre_Moneda||'' . ''||trim(to_char(a.Monto_Origen, ''999,999,999,999.99''))|| '' # PRESTAMO ''||',
'            a.Numero_Prestamo||'' Del ''||to_char(finicia,''dd-mm-yyyy'')||'' Al ''||to_char(ffinaliza,''dd-mm-yyyy'') d',
'          ,id r',
'  from CXC_PRESTAMOS_BANCARIOS a, gral_monedas b, Gral_Empresas c, Gral_Personas_Table d',
' where a.codigo_moneda = b.codigo_moneda',
'     and a.Codigo_Empresa = c.Codigo_Empresa',
'     and c.codigo_persona = d.codigo_persona',
'     And nvl(a.Estado, ''S'') = ''S''',
'     And a.Codigo_Empresa = :Global_empresa',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345626834290058097)
,p_name=>'P84012_ORIGEN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'8'
,p_source=>'ORIGEN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345627268065058098)
,p_name=>'P84012_CODIGO_CC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_source=>'CODIGO_CC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345627677960058098)
,p_name=>'P84012_CODIGO_GASTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_source=>'CODIGO_GASTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345628024003058099)
,p_name=>'P84012_ESTIMACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_source=>'ESTIMACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345628464340058099)
,p_name=>'P84012_CODIGO_ESTATUS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_source=>'CODIGO_ESTATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345628838262058100)
,p_name=>'P84012_USUARIO_CONCILIACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_source=>'USUARIO_CONCILIACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345629222695058101)
,p_name=>'P84012_SISTEMA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'APEX'
,p_source=>'SISTEMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345629683318058101)
,p_name=>'P84012_CARGO_ABONO'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345630091428058102)
,p_name=>'P84012_C_A'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345630472797058102)
,p_name=>'P84012_COMENTARIO2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345630805737058103)
,p_name=>'P84012_CUENTA_SOLCHE_DOCS'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345646194434058149)
,p_name=>'P84012_FECHA_GRABACION'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(915605251596755097)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>'select SYSDATE from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Grabacion'
,p_format_mask=>'dd-mm-yyyy hh24:mi:ss'
,p_source=>'FECHA_GRABACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(24302032287467477)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345646513606058150)
,p_name=>'P84012_NUSUARIO_GRABACION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(915605251596755097)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(24302032287467477)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345646983341058150)
,p_name=>'P84012_USUARIO_GRABACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(915605251596755097)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_item_default=>':GLOBAL_CODIGO_USUARIO'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'USUARIO_GRABACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345647383148058151)
,p_name=>'P84012_FECHA_MODIFICACION'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(915605251596755097)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Fecha Modificacion'
,p_format_mask=>'dd-mm-yyyy hh24:mi:ss'
,p_source=>'FECHA_MODIFICACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(24302032287467477)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345647712820058152)
,p_name=>'P84012_NUSUARIO_MODIFICACION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(915605251596755097)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(24302032287467477)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345648101523058152)
,p_name=>'P84012_USUARIO_MODIFICACION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(915605251596755097)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_source=>'USUARIO_MODIFICACION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345663460192058178)
,p_name=>'P84012_CORRELATIVOTRASLADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_prompt=>'# Traslado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345663812682058179)
,p_name=>'P84012_FENTREGA'
,p_source_data_type=>'DATE'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Fecha Entrega'
,p_format_mask=>'dd-mm-yyyy'
,p_source=>'FENTREGA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=''''readonly'''''
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345664238619058180)
,p_name=>'P84012_FPAGADO'
,p_source_data_type=>'DATE'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Fecha Pagado'
,p_format_mask=>'dd-mm-yyyy'
,p_source=>'FPAGADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345664698731058180)
,p_name=>'P84012_FANULA'
,p_source_data_type=>'DATE'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Fecha Anulacion'
,p_format_mask=>'dd-mm-yyyy'
,p_source=>'FANULA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345665013277058181)
,p_name=>'P84012_FIMPRE'
,p_source_data_type=>'DATE'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Hora Impresion'
,p_format_mask=>'dd-mm-yyyy HH24:MI'
,p_source=>'FIMPRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=''''readonly'''''
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345665438077058181)
,p_name=>'P84012_USUAIMPRE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_item_source_plug_id=>wwv_flow_imp.id(916079792332211172)
,p_prompt=>'Impreso por'
,p_source=>'USUAIMPRE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345665808275058182)
,p_name=>'P84012_NUSUARIOIMPRE'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_prompt=>'Nombre usuario imprimio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345666218055058182)
,p_name=>'P84012_BASE_ISR'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_prompt=>'Base Isr'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=''''readonly'''''
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345666664238058183)
,p_name=>'P84012_RETENCION'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_prompt=>'% Retencion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345667084513058183)
,p_name=>'P84012_POLIZA'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(917011022218799996)
,p_prompt=>'# Poliza'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(24301911579467477)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345684204396058217)
,p_name=>'P84012_ES_MODIFICACION'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345684680966058217)
,p_name=>'P84012_ABRE_MODAL'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345685027578058218)
,p_name=>'P84012_MOTIVO_ANULACION'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345685418719058218)
,p_name=>'P84012_POLIZA_A_ANULAR'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345728842121058286)
,p_name=>'Set_Numero_Documento'
,p_event_sequence=>1
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_SERIE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345729327902058287)
,p_event_id=>wwv_flow_imp.id(345728842121058286)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'    cursor c_correlativo is',
'       SELECT PROXIMO ',
'         FROM BCOSERIE',
'        WHERE CODIGO_EMPRESA   = :GLOBAL_EMPRESA',
'          AND CODMAE 		  = :P84012_CODMAE',
'          AND TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'          AND SERIE 		      = :P84012_SERIE;',
'    VNUMDOC BCOSERIE.PROXIMO%TYPE;',
' Begin',
'    if :P84012_TIPO_TRANSACCION = 10 then',
'        open c_correlativo;',
'        fetch c_correlativo into vnumdoc;',
'        close c_correlativo;',
'',
'        :P84012_NUMDOC := VNUMDOC;',
'   End if;',
' End;'))
,p_attribute_02=>'P84012_SERIE,P84012_TIPO_TRANSACCION,GLOBAL_EMPRESA,P84012_CODMAE'
,p_attribute_03=>'P84012_NUMDOC'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345693003472058235)
,p_name=>'Valores de CODMAE'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_CODMAE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345693583964058237)
,p_event_id=>wwv_flow_imp.id(345693003472058235)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_NOMBRE_BANCO,P84012_NROCTA,P84012_NOMBRE_CUENTA,P84012_CODBCO,P84012_LIBRO,P84012_CODIGO_MONEDA,P84012_SIMBOLO_MONEDA,P84012_NOMBRE_MONEDA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NOMBRE_BANCO, nrocta, nomcta, c.codbco, c.libro, ',
'c.codigo_moneda, d.simbolo_moneda, d.nombre_moneda',
'FROM BCOBANCOS B, bcomaestro c, Gral_monedas d',
'WHERE b.CODBCO = c.CODBCO',
'and c.codigo_moneda = d.codigo_moneda',
'and c.codigo_empresa  = :GLOBAL_EMPRESA',
'and c.codmae = :P84012_CODMAE',
'and c.FCancel is null;'))
,p_attribute_07=>'GLOBAL_EMPRESA,P84012_CODMAE'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345694091968058237)
,p_event_id=>wwv_flow_imp.id(345693003472058235)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_TASAC'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'Pck_Bancos.Fnc_Tc_Promedio(:GLOBAL_EMPRESA,:P84012_CODMAE)',
'FROM DUAL',
''))
,p_attribute_07=>':GLOBAL_EMPRESA,:P84012_CODMAE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345694508332058238)
,p_event_id=>wwv_flow_imp.id(345693003472058235)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_CODIGO_DIVISION'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'     Cursor CTienedivision Is',
'       Select Count(*)',
'         From Gral_Empresas_Division',
'        Where Codigo_Empresa = :GLOBAL_EMPRESA;',
'     VDebeTener     Number:=0;',
'     VCodigoDivision Gral_Empresas_Division.codigo_division%TYPE;',
'Begin',
'     Open CtieneDivision;',
'     Fetch CtieneDivision Into VDebeTener;',
'     Close CtieneDivision;',
'     ',
'     If VDebeTener > 0 Then',
'        VCodigoDivision := 101;',
'     Else',
'        VCodigoDivision := null;     	',
'	 End If;',
'     return(VCodigoDivision);',
'End;'))
,p_attribute_07=>'GLOBAL_EMPRESA'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345695026371058239)
,p_event_id=>wwv_flow_imp.id(345693003472058235)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'apex.region(''regionSolche'').refresh();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345695401853058240)
,p_name=>'Valores de CODOPERACION'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_CODOPERA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345695919987058240)
,p_event_id=>wwv_flow_imp.id(345695401853058240)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_TIPO_TRANSACCION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT tipo_transaccion ',
'FROM GRAL_TIPOS_TRANSAC_MODULOS',
'WHERE Codoperacion = :P84012_CODOPERA',
'AND codigo_modulo = 8;'))
,p_attribute_07=>'P84012_CODOPERA'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345696456950058241)
,p_event_id=>wwv_flow_imp.id(345695401853058240)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_IMPRIMIR'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct imprimir',
'FROM GRAL_TIPOS_TRANSAC_MODULOS',
'WHERE Codoperacion = :P84012_CODOPERA',
'AND codigo_modulo = 8;'))
,p_attribute_07=>'P84012_CODOPERA'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345696944027058241)
,p_event_id=>wwv_flow_imp.id(345695401853058240)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_CHEQUERA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct chequera',
'FROM GRAL_TIPOS_TRANSAC_MODULOS',
'WHERE Codoperacion = :P84012_CODOPERA',
'AND codigo_modulo = 8;'))
,p_attribute_07=>'P84012_CODOPERA'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345697438994058242)
,p_event_id=>wwv_flow_imp.id(345695401853058240)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_TPVOUCHER'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT tpvoucher',
'FROM bcooperag',
'WHERE codigo_empresa = :GLOBAL_EMPRESA',
'AND codopera = :P84012_CODOPERA; '))
,p_attribute_07=>'GLOBAL_EMPRESA,P84012_CODOPERA'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345697876583058243)
,p_name=>'Valores Tipo Transaccion'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_TIPO_TRANSACCION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345698333769058243)
,p_event_id=>wwv_flow_imp.id(345697876583058243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_TASAC'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'    Cursor CDatos is    ',
'        SELECT c.codigo_moneda',
'        FROM BCOBANCOS b, BCOMAESTRO c, GRAL_MONEDAS d',
'        WHERE b.CODBCO = c.CODBCO',
'        and c.codigo_moneda = d.codigo_moneda',
'        and c.codigo_empresa  = :GLOBAL_EMPRESA',
'        and c.codmae = :P84012_CODMAE',
'        and c.FCancel is null;',
'    VTASAC  number;',
'    VMONEDA number;',
'Begin',
'    Open CDatos;',
'    Fetch CDatos into VMONEDA;',
'    Close CDatos;',
'',
'    If VMONEDA > 1 then',
'        Select nvl(decode(Nvl(Pck_Bancos.Fnc_Tc_Promedio(:GLOBAL_EMPRESA,:P84012_CODMAE),GlobalFunc.Fnc_Tasasc(2)),0,1,',
'        Nvl(Pck_Bancos.Fnc_Tc_Promedio(:GLOBAL_EMPRESA,:P84012_CODMAE),GlobalFunc.Fnc_Tasasc(2))),1) into VTASAC',
'        from dual;',
'        return(VTASAC);',
'    Else     ',
'        VTASAC := 1;',
'        return(VTASAC);        ',
'    End if;',
'End;'))
,p_attribute_07=>'GLOBAL_EMPRESA,P84012_CODMAE'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345698822871058244)
,p_event_id=>wwv_flow_imp.id(345697876583058243)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_IMPRIMIR,P84012_CHEQUERA'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT imprimir, chequera',
'FROM GRAL_TIPOS_TRANSAC_MODULOS',
'WHERE tipo_transaccion = :P84012_TIPO_TRANSACCION',
'AND codigo_modulo = 8;'))
,p_attribute_07=>'P84012_TIPO_TRANSACCION'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345699349768058245)
,p_event_id=>wwv_flow_imp.id(345697876583058243)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'apex.region(''regionSolche'').refresh();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345699793758058245)
,p_name=>'Valores Serie'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_SERIE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345700209492058246)
,p_event_id=>wwv_flow_imp.id(345699793758058245)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_FORMATO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT FORMATO',
'FROM BCOSERIE',
'WHERE CODIGO_EMPRESA 	 = :GLOBAL_EMPRESA',
'AND CODmae 		 = :P84012_CODMAE',
'AND TIPO_TRANSACCION     = :P84012_TIPO_TRANSACCION',
'AND SERIE 		 = :P84012_SERIE;'))
,p_attribute_07=>'GLOBAL_EMPRESA,P84012_CODMAE,P84012_TIPO_TRANSACCION,P84012_SERIE'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345700768635058247)
,p_event_id=>wwv_flow_imp.id(345699793758058245)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_NUMDOC_3'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'    VNUMDOC BCOSERIE.PROXIMO%TYPE;',
'Begin',
'    SELECT PROXIMO into VNUMDOC',
'    FROM BCOSERIE',
'    WHERE CODIGO_EMPRESA 	= :GLOBAL_EMPRESA',
'    AND CODMAE 		        = :P84012_CODMAE',
'    AND TIPO_TRANSACCION    = :P84012_TIPO_TRANSACCION',
'    AND SERIE 		        = :P84012_SERIE;',
'',
'    If :P84012_NUMDOC is null then',
'        :P84012_NUMDOC := nvl(VNUMDOC,:P84012_NDOC);',
'    End if;',
'    ',
'    Exception when no_data_found then',
'    :P84012_NUMDOC := :P84012_NDOC;',
'End;'))
,p_attribute_07=>'GLOBAL_EMPRESA,P84012_CODMAE,P84012_TIPO_TRANSACCION,P84012_SERIE'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345701293413058248)
,p_event_id=>wwv_flow_imp.id(345699793758058245)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_NUMDOC_3'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :P84012_NDOC from dual',
'where :P84012_NUMDOC is null;'))
,p_attribute_07=>'P84012_NUMDOC_3,P84012_NDOC'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345701643143058248)
,p_name=>'Valida NumDoc'
,p_event_sequence=>49
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_SERIE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345702196881058249)
,p_event_id=>wwv_flow_imp.id(345701643143058248)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    APX_PR_BCO_BCOMOVIG_VALIDANUMDOC(:GLOBAL_EMPRESA,:P84012_CODMAE,:P84012_TIPO_TRANSACCION,:P84012_SERIE,:P84012_NUMDOC);',
'End;'))
,p_attribute_02=>'GLOBAL_EMPRESA,P84012_CODMAE,P84012_TIPO_TRANSACCION,P84012_SERIE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345702512000058250)
,p_name=>'Valor Negociable'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_NEGOCIABLE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345703080506058250)
,p_event_id=>wwv_flow_imp.id(345702512000058250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_NES_NEGOCIABLE'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P84012_NEGOCIABLE = ''S'' Then',
'	:P84012_NES_NEGOCIABLE := ''NEGOCIABLE'';',
'Else',
'	:P84012_NES_NEGOCIABLE := ''NO NEGOCIABLE'';',
'End If;',
''))
,p_attribute_07=>'P84012_NEGOCIABLE'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345703482748058251)
,p_name=>'Valor NROSOLCHE'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_NROSOLCHE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345703933769058252)
,p_event_id=>wwv_flow_imp.id(345703482748058251)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(865572522845643170)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P84012_NROSOLCHE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345704479543058254)
,p_event_id=>wwv_flow_imp.id(345703482748058251)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'  vestatus       number;',
'  vcodmae        number;',
'  vempresa       number;',
'  vcodigo_moneda number;',
'',
'  Cursor CDatos Is',
'    select codigo_cc,',
'           --((Monto-APX_FNC_BCO_SALDO_BCOMOVIG_SOLCHE(codigo_empresa,nrosolche))-APX_FNC_BCO_MONTO_RETENCION_SOLCHE(a.nrosolche,a.codigo_empresa))monto,',
'           (Monto-APX_FNC_BCO_SALDO_BCOMOVIG_SOLCHE(codigo_empresa,nrosolche))monto,',
'           codigo_gasto,',
'           concepto,',
'           codigo_empresa,',
'           nombre_persona,',
'           estatus,',
'           codmae,',
'           (Monto-APX_FNC_BCO_SALDO_BCOMOVIG_SOLCHE(codigo_empresa,nrosolche))monto,',
'           Codigo_Division,',
'           Codigo_Moneda, ',
'           a.es_anticipo_x_Liquidar, ',
'           a.Anticipo_x_Liquidar,',
'           Codigo_Proveedor,',
'           --((Monto-APX_FNC_BCO_SALDO_BCOMOVIG_SOLCHE(codigo_empresa,nrosolche))-APX_FNC_BCO_MONTO_RETENCION_SOLCHE(a.nrosolche,a.codigo_empresa))monto,',
'           (Monto-APX_FNC_BCO_SALDO_BCOMOVIG_SOLCHE(codigo_empresa,nrosolche))monto,',
'           decode (a.beneficiario,'''',FNCPRS_NOMBRE_PROVEEDOR(a.Codigo_proveedor),a.beneficiario) Beneficiario',
'      from bcosolche a, gral_personas b',
'      where b.codigo_persona = a.codigo_persona',
'      and a.codigo_empresa = :GLOBAL_EMPRESA',
'      and a.nrosolche = :P84012_NROSOLCHE;',
'  ',
'  VEncontro  Number := 0;',
'  VTc        Number := GlobalFunc.Fnc_Tasasc(:P84012_CODIGO_MONEDA);',
'  VEncontroD Number := 0;',
'  VBeneficiario BCOSOLCHE.beneficiario%TYPE;',
'',
'begin',
'',
' 	If :P84012_NROSOLCHE is not null then',
'            Open CDatos;',
'            Fetch CDatos Into  :P84012_codigo_cc,',
'                            :P84012_valor,',
'                            :P84012_codigo_gasto,',
'                            :P84012_concepto,',
'                            vempresa,',
'                            :P84012_beneficiario,',
'                            vestatus,',
'                            vcodmae,',
'                            :P84012_vopera,',
'                            :P84012_Codigo_Division,',
'                            Vcodigo_Moneda, ',
'                            :P84012_es_anticipo_x_Liquidar, ',
'                            :P84012_anticipo_x_liquidar,',
'                            :P84012_codigo_proveedor,',
'                            --:P84012_TASAC,',
'                            :P84012_VALOR,',
'                            VBeneficiario;',
'            Close CDatos;',
'       ',
'        If Nvl(:P84012_TASAC, 0) <= 0 Then',
'        :P84012_TASAC := Nvl(Pck_Bancos.Fnc_Tc_Promedio(:GLOBAL_EMPRESA,:P84012_CODMAE),VTC);',
'            If :P84012_TASAC is null then',
'                :P84012_TASAC := VTC;',
'            End if;',
'        End If;',
'',
'        :P84012_VOPERA := Nvl(REPLACE(:P84012_VALOR,'',''), 0) * round(Nvl(:P84012_TASAC,1),5);',
'',
'    /*    ',
'        if Nvl(:P84012_TASAC, 0) <= 0 Then',
'        :P84012_TASAC := Nvl(VTc, 0);',
'        End If;',
'    */  ',
'        if :P84012_NROSOLCHE is not null then',
'        ',
'    --      :P84012_BENEFICIARIO2 := :P84012_BENEFICIARIO;',
'      if :P84012_CODIGO_PROVEEDOR != 0 Then',
'        :P84012_BENEFICIARIO := VBeneficiario;',
'      end if;',
'        ',
'/* 04/12/2020',
'    --      If :P84012_CODIGO_MONEDA <> 1 Then',
'    --        :P84012_VOPERA := Nvl(:P84012_Valor, 0) * Nvl(:P84012_TASAC, 1);',
'    --      Else',
'    --        :P84012_VOPERA := :P84012_VALOR;',
'    --      End If;',
'*/        ',
'        if vcodigo_moneda <> :P84012_CODIGO_MONEDA then',
'            Raise_Application_Error(-20333,'' BCOMOVIG - EL SOLCHE TIENE UN CODIGO DE MONEDA DIFERENTE!!'');',
'        elsif vempresa <> :GLOBAL_EMPRESA then',
'            Raise_Application_Error(-20333,'' BCOMOVIG - EL SOLCHE TIENE UN CODIGO DE EMPRESA DIFERENTE!!'');',
'        end if;',
'',
' ',
'        ',
'        end if;',
'    Else',
'        :P84012_BENEFICIARIO :=null;',
'    END IF;',
'',
'end;'))
,p_attribute_02=>'P84012_NROSOLCHE,P84012_TASAC'
,p_attribute_03=>'P84012_CODIGO_CC,P84012_VALOR,P84012_CODIGO_GASTO,P84012_CONCEPTO,P84012_BENEFICIARIO,P84012_VOPERA,P4  1_CODIGO_DIVISION,P84012_ES_ANTICIPO_X_LIQUIDAR,P84012_ANTICIPO_X_LIQUIDAR,P84012_CODIGO_PROVEEDOR'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345704951455058255)
,p_event_id=>wwv_flow_imp.id(345703482748058251)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'apex.region(''regionSolche'').refresh();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345705474057058255)
,p_event_id=>wwv_flow_imp.id(345703482748058251)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(865572522845643170)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345705994923058256)
,p_event_id=>wwv_flow_imp.id(345703482748058251)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'Select ',
'  COUNT(*) INTO :P84012_CUENTA_SOLCHE_DOCS',
'From ',
'  bcosoldoc ',
'Where ',
'  nrosolche = :P84012_NROSOLCHE ',
'  And Nvl(',
'    Globalfunc.Fnc_TiposTrs_Comodines(Tipo_Transaccion, ''ES CARGO''), ',
'    ''N''',
'  ) = ''S'' --And tipo_transaccion <> 7',
'  --HAVING sum(valor) = :P84012_VALOR',
'  AND numero NOT IN (',
'       SELECT ',
'      NUMFAC ',
'    FROM ',
'      BCOMOVIG b1, BCOMOVID b2',
'    WHERE ',
'          b2.CODIGO_EMPRESA = b1.CODIGO_EMPRESA  ',
'      AND b2.CODMAE = b1.CODMAE  ',
'      AND b2.TIPO_TRANSACCION = b1.TIPO_TRANSACCION ',
'      AND b2.NUMDOC = b1.NUMDOC  ',
'      AND b2.SERIE = b2.SERIE ',
'      AND b1.NROSOLCHE = :P84012_NROSOLCHE',
'  );',
'END;',
' ',
' '))
,p_attribute_02=>'P84012_NROSOLCHE'
,p_attribute_03=>'P84012_CUENTA_SOLCHE_DOCS'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345706408957058257)
,p_event_id=>wwv_flow_imp.id(345703482748058251)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(865572522845643170)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84012_CUENTA_SOLCHE_DOCS'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345706938880058257)
,p_event_id=>wwv_flow_imp.id(345703482748058251)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(916469492292775152)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P84012_CUENTA_SOLCHE_DOCS'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345707407767058258)
,p_event_id=>wwv_flow_imp.id(345703482748058251)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(865572522845643170)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P84012_CUENTA_SOLCHE_DOCS'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345707989291058258)
,p_event_id=>wwv_flow_imp.id(345703482748058251)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(916469492292775152)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84012_CUENTA_SOLCHE_DOCS'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345708397531058259)
,p_name=>'Valores Libro'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_LIBRO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345708827046058259)
,p_event_id=>wwv_flow_imp.id(345708397531058259)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_EJERCICIO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select APX_FNC_BCOMOVIG_TRAE_EJERCICIO(:GLOBAL_EMPRESA,:P84012_FEDOC) from dual'
,p_attribute_07=>'GLOBAL_EMPRESA,P84012_FEDOC'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345709231902058260)
,p_name=>'Advertencia de Anulacion'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(345608512761058051)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345709728187058261)
,p_event_id=>wwv_flow_imp.id(345709231902058260)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Esta seguro de proceder con la ANULACION DEL MOVIMIENTO ????'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345710270772058261)
,p_event_id=>wwv_flow_imp.id(345709231902058260)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345710615139058262)
,p_name=>'poliza'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(345604114749058042)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345711135112058262)
,p_event_id=>wwv_flow_imp.id(345710615139058262)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'sEGURO QUE DESE PROCEDER ????'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345711665207058263)
,p_event_id=>wwv_flow_imp.id(345710615139058262)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*      Raise_Application_Error(-20333,''global ''||:GLOBAL_EMPRESA||'' codmae ''',
'      ||:P84012_CODMAE||'' tipo transa ''||:P84012_TIPO_TRANSACCION||'' serie ''||:P84012_SERIE',
'      ||'' numdoc ''||:P84012_NUMDOC||'' nrosolche ''||:P84012_NROSOLCHE||'' fedoc ''||:P84012_FEDOC',
'      ||'' ejercicio ''||:P84012_EJERCICIO||'' libro ''||:P84012_LIBRO',
'      || '' poliza ''||:P84012_POLIZA||'' correlativo ''||:P84012_CORRELATIVOTRASLADO);',
'      */',
'bEGIN',
'       :P84012_POLIZA := APX_FNC_BCO_BCOMOVIG_VERIFICA_POLIZA(:GLOBAL_EMPRESA,',
'                                                        :P84012_CODMAE,',
'                                                        :P84012_TIPO_TRANSACCION,',
'                                                        :P84012_SERIE,',
'                                                        :P84012_NUMDOC, ',
'                                                        :P84012_NROSOLCHE, ',
'                                                        :P84012_FEDOC,',
'                                                        :P84012_EJERCICIO,',
'                                                        :P84012_LIBRO,',
'                                                        :P84012_POLIZA,	',
'                                                        :P84012_CORRELATIVOTRASLADO);',
'                                                        COMMIT;',
'                                                       ',
'       :P84012_CORRELATIVOTRASLADO := APX_FNC_BCO_BCOMOVIG_VERIFICA_CORRELATIVOTRASLADO (:GLOBAL_EMPRESA,',
'                                                        :P84012_CODMAE,',
'                                                        :P84012_TIPO_TRANSACCION,',
'                                                        :P84012_SERIE,',
'                                                        :P84012_NUMDOC, ',
'                                                        :P84012_NROSOLCHE, ',
'                                                        :P84012_FEDOC,',
'                                                        :P84012_EJERCICIO,',
'                                                        :P84012_LIBRO,',
'                                                        :P84012_POLIZA,	',
'                                                        :P84012_CORRELATIVOTRASLADO);',
'                                                        COMMIT;',
'eND;'))
,p_attribute_02=>'P84012_TIPO_TRANSACCION,P84012_CODMAE,P84012_SERIE,P84012_NROSOLCHE,P84012_FEDOC,P84012_EJERCICIO,P84012_LIBRO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345712103872058264)
,p_event_id=>wwv_flow_imp.id(345710615139058262)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345712555872058264)
,p_name=>'Beneficiario'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_CODIGO_PROVEEDOR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345713015452058265)
,p_event_id=>wwv_flow_imp.id(345712555872058264)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_BENEFICIARIO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(b.razon_social,b.Nombre_Persona)',
'From Cxp_Proveedores a, Gral_Personas_Table b',
'where GlobalFunc.Fnc_Estatus_PermiteMovtos(12, a.codigo_estado) = ''S''',
'And a.Codigo_Persona = b.Codigo_Persona',
'And a.Codigo_Proveedor = :P84012_CODIGO_PROVEEDOR',
'And :P84012_BENEFICIARIO is null;'))
,p_attribute_07=>'P84012_CODIGO_PROVEEDOR'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P84012_BENEFICIARIO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345713492235058265)
,p_name=>'Valor Operacion'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_VALOR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345713900402058267)
,p_event_id=>wwv_flow_imp.id(345713492235058265)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_VOPERA'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'REPLACE((:P84012_VALOR),'','')*(:P84012_TASAC)'
,p_attribute_07=>'P84012_VALOR,P84012_TASAC'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345714365459058268)
,p_name=>'copia valor al item NUMDOC_REF'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_NUMDOC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345714860314058268)
,p_event_id=>wwv_flow_imp.id(345714365459058268)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_NDOC'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'(:P84012_NUMDOC)'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345715282219058269)
,p_name=>'CodigoOperacion'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_TIPO_TRANSACCION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345715713261058269)
,p_event_id=>wwv_flow_imp.id(345715282219058269)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_CODIGO_OPERACION'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  codoperacion',
'FROM GRAL_TIPOS_TRANSAC_MODULOS',
'Where Codigo_Modulo = 8',
'and tipo_transaccion = :P84012_TIPO_TRANSACCION'))
,p_attribute_07=>'P84012_TIPO_TRANSACCION'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345716126412058270)
,p_name=>'llamarModal'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(345662788343058177)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345716683373058271)
,p_event_id=>wwv_flow_imp.id(345716126412058270)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let items = {',
'    "P42_CODMAE":apex.item(''P84012_CODMAE'').getValue(),',
'    "P42_TIPO_TRANSACCION":apex.item(''P84012_TIPO_TRANSACCION'').getValue(),',
'    "P42_SERIE":apex.item(''P84012_SERIE'').getValue(),',
'    "P42_NUMDOC":apex.item(''P84012_NUMDOC'').getValue(),',
'    "P42_CODIGO_OPERACION_D":apex.item(''P84012_CODIGO_OPERACION'').getValue(),',
'    "P42_CODIGO_EMPRESA_D":apex.item(''P84012_CODIGO_EMPRESA'').getValue(),',
'    "P42_CODIGO_DIVISION":apex.item(''P84012_CODIGO_DIVISION'').getValue(),',
'    "P42_CODIGO_EMPRESA":apex.item(''P84012_CODIGO_EMPRESA'').getValue(),',
'    "P42_VALOR_TOTAL":apex.item(''P84012_VALOR'').getValue().replaceAll('','',''''),',
'    "P42_TIPO_CAMBIO":apex.item(''P84012_TASAC'').getValue(),',
'}',
'var app = 115;',
'var pag = 42;',
'',
'//var url = `f?p=${app}:${pag}:&APP_SESSION.::NO:116:P116_EJERCICIO,P116_CODIGO_EMPRESA,P116_USUARIO_GRABACIO:${x1},${x2},${x3}`;',
'var url = `f?p=${app}:${pag}:&APP_SESSION.::NO:${pag}:${Object.keys(items).toString()}:${Object.values(items).toString()}`;',
'console.log(url);',
'apex.server.process("PREPARE_URL", {',
'x01: url',
'  }, {',
'  success: function(pData) {',
'   if (pData.success === true) {',
'     apex.navigation.redirect(pData.url);',
'   } else {',
'     console.log("FALSE");',
'   }',
' },',
'error: function(request, status, error) {',
'console.log("status---" + status + " error----" + error);',
'  }',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345717096961058271)
,p_name=>'New'
,p_event_sequence=>170
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345717595954058272)
,p_event_id=>wwv_flow_imp.id(345717096961058271)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P84012_ROWID'').value == '''') apex.region(''region_detalles'').refresh();',
'try{',
'    let valor = Number(document.getElementsByClassName(''a-IRR-aggregate-value'')[0].innerText);',
'    apex.item(''P84012_SUBTOTAL'').setValue(apex.item(''P84012_SUBTOTAL'').value + valor);',
'}catch{',
'    ',
'};'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345718005981058272)
,p_event_id=>wwv_flow_imp.id(345717096961058271)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Actualizar'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(916079792332211172)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345718408505058273)
,p_name=>'validarCambios'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(916079792332211172)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345718964267058273)
,p_event_id=>wwv_flow_imp.id(345718408505058273)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P84012_ROWID'').value == ''''){',
'    if(  ',
'            esVacio(''P84012_CODMAE'') ||',
'            esVacio(''P84012_TIPO_TRANSACCION'') ||',
'            esVacio(''P84012_SERIE'') ||',
'            esVacio(''P84012_NUMDOC'') ||',
'            esVacio(''P84012_CODIGO_OPERACION'') ||',
'            esVacio(''P84012_CODIGO_EMPRESA'') ||',
'            esVacio(''P84012_CODIGO_DIVISION'') ||',
'            esVacio(''P84012_CODIGO_EMPRESA'')',
'    ){',
'        apex.region(''region_detalles'').widget().hide();',
'    }else{',
'        apex.region(''region_detalles'').widget().show();',
'    }',
'}'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345719340592058274)
,p_name=>'Cambio Valor'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_NUMDOC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345719808827058274)
,p_event_id=>wwv_flow_imp.id(345719340592058274)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'apex.region(''regionSolche'').refresh();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345720217483058275)
,p_name=>'Refresh'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_SERIE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345720705107058275)
,p_event_id=>wwv_flow_imp.id(345720217483058275)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'apex.region(''regionSolche'').refresh();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345721108674058276)
,p_name=>'Limpieza Items'
,p_event_sequence=>210
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345721653761058277)
,p_event_id=>wwv_flow_imp.id(345721108674058276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Limpiar Conteo Doc Solches'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_CUENTA_SOLCHE_DOCS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345722069748058277)
,p_name=>'RecalcularValorOperacion'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_TASAC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345722576294058278)
,p_event_id=>wwv_flow_imp.id(345722069748058277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_VOPERA'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'REPLACE((:P84012_VALOR),'','')*(:P84012_TASAC)'
,p_attribute_07=>'P84012_VALOR,P84012_TASAC'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345722954954058278)
,p_name=>'AbrirModal'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_ABRE_MODAL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345723440589058279)
,p_event_id=>wwv_flow_imp.id(345722954954058278)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let items = {}',
'var app = 115;',
'var pag = 109;',
'',
'//var url = `f?p=${app}:${pag}:&APP_SESSION.::NO:116:P116_EJERCICIO,P116_CODIGO_EMPRESA,P116_USUARIO_GRABACIO:${x1},${x2},${x3}`;',
'var url = `f?p=${app}:${pag}:&APP_SESSION.::NO:${pag}:${Object.keys(items).toString()}:${Object.values(items).toString()}`;',
'console.log(url);',
'apex.server.process("PREPARE_URL", {',
'x01: url',
'  }, {',
'  success: function(pData) {',
'   if (pData.success === true) {',
'     apex.navigation.redirect(pData.url);',
'   } else {',
'     console.log("FALSE");',
'   }',
' },',
'error: function(request, status, error) {',
'console.log("status---" + status + " error----" + error);',
'  }',
'});'))
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84012_ABRE_MODAL'
,p_client_condition_expression=>'S'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345723886768058279)
,p_name=>'Obtener Motivo Poliza'
,p_event_sequence=>240
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345724355282058280)
,p_event_id=>wwv_flow_imp.id(345723886768058279)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_MOTIVO_ANULACION'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P109_MOTIVO'
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345724754780058280)
,p_name=>'ConcluirAnulacion'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_MOTIVO_ANULACION'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'apex.item(''P84012_MOTIVO_ANULACION'').value != '''' && apex.item(''P84012_POLIZA_A_ANULAR'').value != '''''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_da_event_comment=>'Termina el proceso de anulacion del movimiento'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345725250210058282)
,p_event_id=>wwv_flow_imp.id(345724754780058280)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Server-side code Anulacion'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    VMaxCorrelativo NUMBER := 0;',
'    vpoliza NUMBER := 0;',
'    VMes NVARCHAR2(2) := '''';',
'BEGIN',
'    SAF.APX_PR_ANULACION_BANCOS(:P84012_CODIGO_EMPRESA,:P84012_SERIE,:P84012_TIPO_TRANSACCION,:P84012_CODMAE,:P84012_NUMDOC);',
'    vpoliza := SAF.FNC_CON_CREA_CONTRAPARTIDA_CON_HISTORY_TRAS(:P84012_POLIZA_A_ANULAR,:P84012_MOTIVO_ANULACION);',
'    select Nvl(Max(Correlativo),0) + 1 into vmaxcorrelativo From Con_History_Tras;',
'    ',
'    SELECT TO_CHAR(TO_DATE(:P84012_FEDOC,''DD/MM/YYYY''),''MM'') INTO VMES FROM DUAL;',
'',
'',
'  ',
'    Insert Into ',
'     	Con_History_Tras(',
'     		cod_empresa, ',
'     		transac, ',
'     		correlativo, ',
'     		ejercicio,',
'     		codmae, ',
'     		serie, ',
'     		numdoc, ',
'     		solche, ',
'     		tipo_transac,',
'     		usuario_grabacion,',
'     		fecha_grabacion,',
'     		Nro_Poliza,',
'     		mes,',
'     		libro,',
'     		cod_tipol',
'     		)',
'     Values(',
'     	:P84012_CODIGO_EMPRESA, ',
'     	''O'', ',
'     	vmaxcorrelativo, ',
'     	:P84012_EJERCICIO, ',
'     	:P84012_CODMAE,',
'     	:P84012_SERIE, ',
'     	:P84012_NUMDOC, ',
'     	:P84012_NROSOLCHE, ',
'     	:P84012_TIPO_TRANSACCION,',
'        1, ',
'        Sysdate,',
'        vpoliza, ',
'        TO_CHAR(SYSDATE, ''mm''), ',
'        :P84012_LIBRO, ',
'        nvl(GlobalFunc.Fnc_ComodinxTipo(:P84012_TIPO_TRANSACCION, ''TIPO POLIZA''),22)',
'       );',
'',
'END;',
'',
'',
''))
,p_attribute_02=>'P84012_CODIGO_EMPRESA,P84012_SERIE,P84012_TIPO_TRANSACCION,P84012_CODMAE,P84012_POLIZA_A_ANULAR,P84012_MOTIVO_ANULACION,P84012_EJERCICIO,P84012_NROSOLCHE,P84012_FEDOC,P84012_LIBRO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345725712271058283)
,p_event_id=>wwv_flow_imp.id(345724754780058280)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let app = 115;',
'let page = 84012;',
'let items = {',
'    "P84012_ROWID" : apex.item(''P84012_ROWID'').getValue()',
'    ',
'};',
'',
'var url = `f?p=${app}:${page}:&APP_SESSION.::NO:${page}:${Object.keys(items).toString()}:${Object.values(items).toString()}`;',
'console.log(url);',
'apex.server.process("PREPARE_URL", {',
'x01: url',
'  }, {',
'  success: function(pData) {',
'   if (pData.success === true) {',
'     apex.navigation.redirect(pData.url);',
'   } else {',
'     console.log("FALSE");',
'   }',
' },',
'error: function(request, status, error) {',
'console.log("status---" + status + " error----" + error);',
'  }',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345726139369058283)
,p_name=>'AnularMovimiento'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(345606971319058049)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345726614318058284)
,p_event_id=>wwv_flow_imp.id(345726139369058283)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ABRE_MODAL  NVARCHAR2(1) := ''N'';',
'BEGIN',
'    IF :P84012_FECHA_MODULO <> :P84012_FEDOC THEN',
'      Raise_Application_Error(-20333,'' EL DOCUMENTO NO PUEDE SER ANULADO EN ESTA PANTALLA YA QUE LA FECHA DEL MODULO ES DIFERENTE!! ''||:P84012_FECHA_MODULO);',
'    ELSE',
'',
'        Select p.ID into :P84012_POLIZA_A_ANULAR',
'        From Con_History_Tras h, con_polizas p',
'        Where ',
'        h.cod_empresa = p.codigo_empresa',
'        AND p.EJERCICIO = h.EJERCICIO',
'        AND p.LIBRO = h.LIBRO',
'        AND p.COD_TIPOL = h.COD_TIPOL',
'        AND p.mes = h.MES',
'        AND p.NRO_POLIZA = h.NRO_POLIZA',
'        AND h.cod_empresa = :P84012_CODIGO_EMPRESA',
'        And numdoc      = :P84012_NUMDOC',
'        And codmae      = :P84012_CODMAE',
'        AND serie       = :P84012_SERIE',
'        order by p.fecha_grabacion desc',
'        fetch first row only;',
'        --Raise_Application_Error(-20333,'' EL ID DE LA POLIZA A ANULAR ES ''||:P84012_POLIZA_A_ANULAR);',
'        V_ABRE_MODAL := ''S'';',
'       --SAF.APX_PR_ANULACION_BANCOS(:P84012_CODIGO_EMPRESA,:P84012_SERIE,:P84012_TIPO_TRANSACCION,:P84012_CODMAE,:P84012_NUMDOC);',
'       -- SAF.PR_CON_CREA_CONTRAPARTIDA(V_id_poliza);',
'    END IF;',
'    SELECT V_ABRE_MODAL INTO :P84012_ABRE_MODAL FROM DUAL;',
'    ',
'    exception',
'        when no_data_found then',
'               raise;',
'        when others then ',
'                raise;    ',
'END;',
'',
'',
''))
,p_attribute_02=>'P84012_FECHA_MODULO,P84012_FEDOC,P84012_CODIGO_EMPRESA,P84012_CODMAE,P84012_SERIE,P84012_ABRE_MODAL,P84012_POLIZA_A_ANULAR'
,p_attribute_03=>'P84012_ABRE_MODAL,P84012_POLIZA_A_ANULAR'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345727015902058284)
,p_name=>'CambiarCocepto'
,p_event_sequence=>270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_ID_CUENTA_AGRUPADOR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345727567305058285)
,p_event_id=>wwv_flow_imp.id(345727015902058284)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84012_CONCEPTO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT UPPER(CONCEPTO ) ',
'FROM BCOCONCILIACION_CUENTAS ',
'WHERE ID_CUENTA = :P84012_ID_CUENTA_AGRUPADOR'))
,p_attribute_07=>'P84012_ID_CUENTA_AGRUPADOR'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345727917099058285)
,p_name=>'New_1'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84012_CODIGO_MONEDA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345728434771058286)
,p_event_id=>wwv_flow_imp.id(345727917099058285)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'console.log(apex.item(''P84012_CODIGO_MONEDA'').value)'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345689868286058229)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidaExistaSolche'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P84012_TIPO_TRANSACCION = 10 and :P84012_NROSOLCHE is null then',
'   Raise_Application_Error(-20333,''DEBE INGRESAR UNA SOLICITUD DE PAGO VALIDA'');',
'END IF;',
'',
'if :P84012_TIPO_TRANSACCION in (958, 959, 931) then',
'  Raise_Application_Error(-20333,''No puede usar este tipo de transaccion en este modulo'');',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(345607796649058050)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345691095842058230)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anula Movimiento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_id_poliza CON_POLIZAS.ID%TYPE;',
'    V_ABRE_MODAL  NVARCHAR2(1) := ''N'';',
'BEGIN',
'    IF :P84012_FECHA_MODULO <> :P84012_FEDOC THEN',
'      Raise_Application_Error(-20333,'' EL DOCUMENTO NO PUEDE SER ANULADO EN ESTA PANTALLA YA QUE LA FECHA DEL MODULO ES DIFERENTE!! ''||:P84012_FECHA_MODULO);',
'    ELSE',
'',
'        Select p.ID into V_id_poliza',
'        From Con_History_Tras h, con_polizas p',
'        Where ',
'        h.cod_empresa = p.codigo_empresa',
'        AND p.EJERCICIO = h.EJERCICIO',
'        AND p.LIBRO = h.LIBRO',
'        AND p.COD_TIPOL = h.COD_TIPOL',
'        AND p.mes = h.MES',
'        AND p.NRO_POLIZA = h.NRO_POLIZA',
'        AND h.cod_empresa = :P84012_CODIGO_EMPRESA',
'        And numdoc      = :P84012_NUMDOC',
'        And codmae      = :P84012_CODMAE',
'        AND serie       = :P84012_SERIE',
'        order by p.fecha_grabacion desc',
'        fetch first row only;',
'        --Raise_Application_Error(-20333,'' EL ID DE LA POLIZA A ANULAR ES ''||V_id_poliza);',
'        V_ABRE_MODAL := ''S'';',
'       --SAF.APX_PR_ANULACION_BANCOS(:P84012_CODIGO_EMPRESA,:P84012_SERIE,:P84012_TIPO_TRANSACCION,:P84012_CODMAE,:P84012_NUMDOC);',
'       -- SAF.PR_CON_CREA_CONTRAPARTIDA(V_id_poliza);',
'    END IF;',
'    SELECT V_ABRE_MODAL INTO :P84012_ABRE_MODAL FROM DUAL;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345687495967058225)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida Valores Operacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'    TVALOR number(14,6):=0;',
'Begin',
'    select sum(a.valor) into TVALOR',
'    from bcomovid a',
'    where a.codigo_empresa  = :GLOBAL_EMPRESA',
'    and a.codmae            = :P84012_CODMAE',
'    and a.tipo_transaccion  = :P84012_TIPO_TRANSACCION',
'    and a.serie             = :P84012_SERIE',
'    and a.numdoc            = :P84012_NUMDOC;',
'',
unistr('    -- Se est\00E1 usando la colecci\00F3n'),
'    IF :P84012_NROSOLCHE IS NULL THEN',
'        SELECT',
'            SUM(c009) * :P84012_TASAC  INTO TVALOR',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''DETALLES_COLLECTION'';',
'    ELSE',
'        IF :P84012_CUENTA_SOLCHE_DOCS = ''0'' THEN',
unistr('            -- Se est\00E1 usando la colecci\00F3n'),
'            SELECT',
'                SUM(c009) * :P84012_TASAC INTO TVALOR',
'            FROM APEX_COLLECTIONS',
'            WHERE COLLECTION_NAME = ''DETALLES_COLLECTION'';            ',
'        ELSE',
'            -- Se consulta la base de datos ',
'            SELECT ROUND(SUM(VALOR ),2)  INTO TVALOR',
'            FROM (',
'            Select ',
'              FECHA,',
'              codigo_cc, ',
'              Codigo_Gasto, ',
'              Tipo, ',
'              tipo_transaccion, ',
'              numero, ',
'              serie, ',
'              sum(valor) valor, ',
'              sum(cantidad) Cantidad ',
'            From ',
'              bcosoldoc ',
'            Where ',
'              nrosolche = :P84012_NROSOLCHE ',
'              And Nvl(',
'                Globalfunc.Fnc_TiposTrs_Comodines(Tipo_Transaccion, ''ES CARGO''), ',
'                ''N''',
'              ) = ''S'' --And tipo_transaccion <> 7',
'              --HAVING sum(valor) = :P84012_VALOR',
'              AND numero NOT IN (',
'                   SELECT ',
'                  NUMFAC ',
'                FROM ',
'                  BCOMOVIG b1, BCOMOVID b2',
'                WHERE ',
'                      b2.CODIGO_EMPRESA = b1.CODIGO_EMPRESA  ',
'                  AND b2.CODMAE = b1.CODMAE  ',
'                  AND b2.TIPO_TRANSACCION = b1.TIPO_TRANSACCION ',
'                  AND b2.NUMDOC = b1.NUMDOC  ',
'                  AND b2.SERIE = b2.SERIE ',
'                  AND b1.NROSOLCHE = :P84012_NROSOLCHE',
'              ) ',
'            Group By ',
'              FECHA,',
'              codigo_cc, ',
'              Codigo_Gasto, ',
'              Tipo, ',
'              tipo_transaccion, ',
'              numero, ',
'              serie',
'            );',
'        END IF;',
'    END IF;',
'',
'    if nvl(round(REPLACE(:P84012_VOPERA,'',''),2),0) <> nvl(round(TVALOR,2),0) Then',
'        Raise_Application_Error(-20333,'' BCOMOVIG - LOS VALORES NO CUADRAN - VALOR : ''||nvl(round(REPLACE(:P84012_VOPERA,'',''),2),0)||'' DETALLE DE LA TRANSACCION : ''||nvl(round(TVALOR,2),0));',
'    End If;    ',
'    ',
'    Exception when no_data_found then',
'    Raise_Application_Error(-20333,'' BCOMOVIG - NO EXISTEN DETALLES DE LA TRANSACCION '');',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(345607796649058050)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345686292671058222)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida Fecha Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'  vbcosaldos        bcosaldos%rowtype;',
'  panio1            number(4);',
'  pmes1             number(2);',
'  pdia              number(2);',
'  pfinmes           date;',
'  x                 number;',
'  FUltimoCierre     Date:= Trunc(Pck_Bancos.fnc_existesaldobancosf(:GLOBAL_EMPRESA,:P84012_CODMAE));',
'  VFTrabajo         Date:= Pck_Gral.Fnc_FechaTrabajo(:GLOBAL_EMPRESA, 8, ''H'');',
'  VCodigo_Usuario   Gral_Usuarios.Codigo_Usuario%TYPE;',
'Begin',
' VCodigo_Usuario :=  Pck_Gral.fnc_trae_no_usuario(NVL(V(''APP_USER''),user));',
' IF  :P84012_FEDOC is not null THEN',
'      x := APX_FNC_BCOMOVIG_VPOLIZA(:GLOBAL_EMPRESA, :P84012_EJERCICIO,8,:P84012_LIBRO,:P84012_TIPO_TRANSACCION,:P84012_FEDOC);',
'      IF x = 0 then',
'          Raise_Application_Error(-20333,'' BCOMOVIG - NO SE PUEDE VERIFICAR LA FECHA!!'');',
'      END IF;',
'',
'      IF to_date(:P84012_FEDOC) < to_date(:P84012_FECHA_MODULO) THEN',
'   	     If nvl(instr(Pck_Gral.Fnc_Parametros(''ADMIN_CXC''), VCodigo_Usuario),0) <= 0  THEN',
'             Raise_Application_Error(-20333,'' BCOMOVIG - ADVERTENCIA : LA FECHA NO PUEDE SER MENOR A LA CONFIGURADA EN EL MODULO DE BANCOS'');',
'         end if;',
'      END IF;    ',
'',
'         pdia       := :P84012_DIA;',
'         panio1     := :P84012_ANIO;  ',
'         pmes1      := :P84012_MES;   ',
'         pfinmes    := fnc_fmes(''F'', pmes1, panio1);    --fecha fin de mes, mes actual',
'',
'      IF to_date(:P84012_FEDOC) < to_date(:P84012_FECHA_MODULO) then',
'       	if nvl(instr(Pck_Gral.Fnc_Parametros(''ADMIN_CXC''), VCodigo_Usuario),0) <= 0  THEN',
'            Raise_Application_Error(-20333,'' BCOMOVIG - RECUERDE QUE YA TIENE ''||pdia||'' DIAS QUE NO HA HECHO EL CIERRE DE FIN DE MES!!'');',
'        end if;',
'      END IF;',
'',
' END IF;',
'End;',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(345607796649058050)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345640851754058122)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(916079792332211172)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Ingreso de Movimientos'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(345607796649058050)
,p_process_success_message=>'# DOCUMENTO &P84012_NUMDOC.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345689411631058227)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Detalles'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Inserta en BCOMOVID ',
'DECLARE',
'        CURSOR CDetalles IS',
'        SELECT',
'            SEQ_ID,',
'            c001 C_CODIGO_EMPRESA_D,',
'            c002 C_CODIGO_OPERACION_D,',
'            c003 C_CODIGO_DIVISION,',
'            c004 C_CODIGO_CC,',
'            c005 C_NROESTIMA,',
'            c006 C_CODIGO_GASTO,',
'            c007 C_CANTIDAD,',
'            c008 C_TIPO,',
'            c009 C_VALOR,',
'            c010 C_CODIGO_EMPRESA,',
'            c011 C_CODMAE,',
'            c012 C_TIPO_TRANSACCION,',
'            c013 C_SERIE,',
'            c014 C_NUMDOC,',
'            c015 C_CODET,',
'            c016 C_CONIVA,',
'            c017 C_TIPO_PLANILLA,',
'            c018 C_NRO_PLANILLA,',
'            c019 C_COD_EMPLEADO',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''DETALLES_COLLECTION'';',
'',
'',
'        Cursor CDatos Is',
'            Select codigo_cc, Codigo_Gasto,Tipo,',
'            tipo_transaccion,numero,serie, ',
'            sum(valor) valor,',
'            sum(cantidad) Cantidad',
'            From bcosoldoc',
'            Where nrosolche in (select nrosolche ',
'                                  from bcomovig ',
'                                 where codigo_empresa = :global_empresa ',
'                                   and numdoc=:P84012_NUMDOC ',
'                                   and serie=:P84012_SERIE ',
'                                   and codmae = :P84012_CODMAE ',
'                                   and tipo_transaccion = :P84012_TIPO_TRANSACCION)/*= :P84012_NROSOLCHE*/',
'               And Nvl(Globalfunc.Fnc_TiposTrs_Comodines(Tipo_Transaccion, ''ES CARGO''),''N'') = ''S''',
'               --And tipo_transaccion <> 7',
'            Group By codigo_cc, Codigo_Gasto,Tipo,tipo_transaccion,numero,serie;        ',
'',
'            vestima number;',
'',
'BEGIN',
'',
'',
'If :P84012_NROSOLCHE is not null then',
'',
'    Begin',
'',
'       vestima := 1;',
'        ',
'        For i in CDatos Loop',
'            Insert into BCOMOVID',
'            (CODIGO_EMPRESA,CODMAE,TIPO_TRANSACCION,SERIE,NUMDOC,CODIGO_CC,CODET,',
'            FECHA_GRABACION,USUARIO_GRABACION,',
'            NROESTIMA,CODIGO_GASTO,CONIVA,',
'            --TIPO_PLANILLA,NRO_PLANILLA,COD_EMPLEADO,',
'            CODIGO_EMPRESA_D,CODIGO_OPERACION_D,CODIGO_DIVISION,CANTIDAD,TIPO,VALOR,SISTEMA,',
'            TIPOTRANSACCION,SERIEFAC,NUMFAC)',
'            values',
'            (:P84012_CODIGO_EMPRESA,:P84012_CODMAE,:P84012_TIPO_TRANSACCION,:P84012_SERIE,:P84012_NUMDOC,i.codigo_cc,0,',
'            sysdate,0,',
'            vestima,i.codigo_gasto,''S'',',
'            :P84012_CODIGO_EMPRESA,:P84012_CODIGO_OPERACION,:P84012_CODIGO_DIVISION,i.cantidad,i.tipo,',
'            round(i.valor*:P84012_TASAC,2),''APEX'',i.tipo_transaccion,i.serie,i.numero);',
'            vestima := vestima+1;',
'        End loop;',
'            commit;',
'    End;',
'ELSE',
unistr('            -------------- Validaci\00F3n para cuando el solche es nulo'),
'',
'',
'    BEGIN',
'        vestima := 1;',
'        FOR vDetalle IN CDetalles LOOP',
'            ',
'            INSERT INTO BCOMOVID',
'            (',
'                CODIGO_EMPRESA,',
'                CODMAE,',
'                TIPO_TRANSACCION,',
'                SERIE,',
'                NUMDOC,',
'                CODIGO_CC,',
'                CODET,',
'                FECHA_GRABACION,',
'                USUARIO_GRABACION,',
'                NROESTIMA,',
'                CODIGO_GASTO,',
'                CONIVA,',
'                --TIPO_PLANILLA,NRO_PLANILLA,COD_EMPLEADO,',
'                CODIGO_EMPRESA_D,',
'                CODIGO_OPERACION_D,',
'                CODIGO_DIVISION,',
'                CANTIDAD,',
'                TIPO,',
'                VALOR,',
'                SISTEMA,',
'                TIPOTRANSACCION,',
'                SERIEFAC',
'                --,NUMFAC',
'            )VALUES(',
'                :P84012_CODIGO_EMPRESA,',
'                :P84012_CODMAE,',
'                :P84012_TIPO_TRANSACCION,',
'                :P84012_SERIE,',
'                :P84012_NUMDOC,',
'                vDetalle.C_CODIGO_CC,',
'                0,',
'                sysdate,',
'                0,',
'                vestima,',
'                vDetalle.C_CODIGO_GASTO, ',
'                ''S'',',
'                :P84012_CODIGO_EMPRESA,',
'                :P84012_CODIGO_OPERACION,',
'                :P84012_CODIGO_DIVISION,',
'                vDetalle.C_CANTIDAD,',
'                vDetalle.C_TIPO,',
'                round( vDetalle.C_VALOR *:P84012_TASAC,2),',
'                ''APEX'',',
'                vDetalle.C_TIPO_TRANSACCION,',
'                vDetalle.C_SERIE',
'                --,i.numero',
'            );',
'            vestima := vestima+1;        ',
'        END LOOP;',
'        commit;',
'    END;',
'End if;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(345607796649058050)
,p_process_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345691400110058230)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Detalles_TEST'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Inserta en BCOMOVID ',
'DECLARE',
'        CURSOR CDetalles IS',
'        SELECT',
'            SEQ_ID,',
'            c001 C_CODIGO_EMPRESA_D,',
'            c002 C_CODIGO_OPERACION_D,',
'            c003 C_CODIGO_DIVISION,',
'            c004 C_CODIGO_CC,',
'            c005 C_NROESTIMA,',
'            c006 C_CODIGO_GASTO,',
'            c007 C_CANTIDAD,',
'            c008 C_TIPO,',
'            c009 C_VALOR,',
'            c010 C_CODIGO_EMPRESA,',
'            c011 C_CODMAE,',
'            c012 C_TIPO_TRANSACCION,',
'            c013 C_SERIE,',
'            c014 C_NUMDOC,',
'            c015 C_CODET,',
'            c016 C_CONIVA,',
'            c017 C_TIPO_PLANILLA,',
'            c018 C_NRO_PLANILLA,',
'            c019 C_COD_EMPLEADO',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''DETALLES_COLLECTION'';',
'',
'',
'        Cursor CDatos Is',
'            Select ',
'              codigo_cc, ',
'              Codigo_Gasto, ',
'              Tipo, ',
'              tipo_transaccion, ',
'              numero, ',
'              serie, ',
'              sum(valor) valor, ',
'              sum(cantidad) Cantidad ',
'            From ',
'              bcosoldoc ',
'            Where ',
'              nrosolche = :P84012_NROSOLCHE',
'              /*= :P84012_NROSOLCHE*/',
'              And Nvl(',
'                Globalfunc.Fnc_TiposTrs_Comodines(Tipo_Transaccion, ''ES CARGO''), ',
'                ''N''',
'              ) = ''S'' --And tipo_transaccion <> 7',
'              AND numero NOT IN (',
'                   SELECT ',
'                  NUMFAC ',
'                FROM ',
'                  BCOMOVIG b1, BCOMOVID b2',
'                WHERE ',
'                      b2.CODIGO_EMPRESA = b1.CODIGO_EMPRESA  ',
'                  AND b2.CODMAE = b1.CODMAE  ',
'                  AND b2.TIPO_TRANSACCION = b1.TIPO_TRANSACCION ',
'                  AND b2.NUMDOC = b1.NUMDOC  ',
'                  AND b2.SERIE = b2.SERIE ',
'                  AND b1.NROSOLCHE = :P84012_NROSOLCHE',
'              ) ',
'            Group By ',
'              codigo_cc, ',
'              Codigo_Gasto, ',
'              Tipo, ',
'              tipo_transaccion, ',
'              numero, ',
'              serie;      ',
'',
'            vestima number;',
'',
'BEGIN',
'',
'',
'If :P84012_NROSOLCHE is not null AND TO_NUMBER(NVL(:P84012_CUENTA_SOLCHE_DOCS,0)) > 0 THEN',
'',
'    Begin',
'',
'       vestima := 1;',
'        ',
'        For i in CDatos Loop',
'            Insert into BCOMOVID',
'            (CODIGO_EMPRESA,CODMAE,TIPO_TRANSACCION,SERIE,NUMDOC,CODIGO_CC,CODET,',
'            FECHA_GRABACION,USUARIO_GRABACION,',
'            NROESTIMA,CODIGO_GASTO,CONIVA,',
'            --TIPO_PLANILLA,NRO_PLANILLA,COD_EMPLEADO,',
'            CODIGO_EMPRESA_D,CODIGO_OPERACION_D,CODIGO_DIVISION,CANTIDAD,TIPO,VALOR,SISTEMA,',
'            TIPOTRANSACCION,SERIEFAC,NUMFAC)',
'            values',
'            (:P84012_CODIGO_EMPRESA,:P84012_CODMAE,:P84012_TIPO_TRANSACCION,:P84012_SERIE,:P84012_NUMDOC,i.codigo_cc,0,',
'            sysdate,1,',
'            vestima,i.codigo_gasto,''S'',',
'            :P84012_CODIGO_EMPRESA,:P84012_CODIGO_OPERACION,:P84012_CODIGO_DIVISION,i.cantidad,i.tipo,',
'            round(i.valor*:P84012_TASAC,2),''APEX'',i.tipo_transaccion,i.serie,i.numero);',
'            vestima := vestima+1;',
'        End loop;',
'            --commit;',
'    End;',
'ELSE',
unistr('            -------------- Validaci\00F3n para cuando el solche es nulo'),
'',
'',
'    BEGIN',
'        vestima := 1;',
'        FOR vDetalle IN CDetalles LOOP',
'            ',
'            INSERT INTO BCOMOVID',
'            (',
'                CODIGO_EMPRESA,',
'                CODMAE,',
'                TIPO_TRANSACCION,',
'                SERIE,',
'                NUMDOC,',
'                CODIGO_CC,',
'                CODET,',
'                FECHA_GRABACION,',
'                USUARIO_GRABACION,',
'                NROESTIMA,',
'                CODIGO_GASTO,',
'                CONIVA,',
'                --TIPO_PLANILLA,NRO_PLANILLA,COD_EMPLEADO,',
'                CODIGO_EMPRESA_D,',
'                CODIGO_OPERACION_D,',
'                CODIGO_DIVISION,',
'                CANTIDAD,',
'                TIPO,',
'                VALOR,',
'                SISTEMA,',
'                TIPOTRANSACCION,',
'                SERIEFAC',
'                --,NUMFAC',
'            )VALUES(',
'                :P84012_CODIGO_EMPRESA,',
'                :P84012_CODMAE,',
'                :P84012_TIPO_TRANSACCION,',
'                :P84012_SERIE,',
'                :P84012_NUMDOC,',
'                vDetalle.C_CODIGO_CC,',
'                0,',
'                sysdate,',
'                1,',
'                vestima,',
'                vDetalle.C_CODIGO_GASTO, ',
'                ''S'',',
'                :P84012_CODIGO_EMPRESA,',
'                :P84012_CODIGO_OPERACION,',
'                :P84012_CODIGO_DIVISION,',
'                vDetalle.C_CANTIDAD,',
'                vDetalle.C_TIPO,',
'                round( vDetalle.C_VALOR *:P84012_TASAC,2),',
'                ''APEX'',',
'                vDetalle.C_TIPO_TRANSACCION,',
'                vDetalle.C_SERIE',
'                --,i.numero',
'            );',
'            vestima := vestima+1;        ',
'        END LOOP;',
'        --commit;',
'    END;',
'End if;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(345607796649058050)
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345686642850058223)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualiza Banco Serie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     Pck_Bancos.Actualiza_BcoSerie(:P84012_CODIGO_EMPRESA,:P84012_CODMAE,:P84012_TIPO_TRANSACCION,:P84012_SERIE);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(345607796649058050)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345687069754058223)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Genera Poliza'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR CEMPRESAS_RELACION IS',
'        SELECT',
'            CODIGO_EMPRESA_RELACION',
'        FROM',
'            GRAL_EMPRESAS_RELACION',
'        WHERE',
'            CODIGO_EMPRESA = :GLOBAL_EMPRESA;',
'    CURSOR CENCONTRODETALLE IS',
'        SELECT',
'            COUNT(*)',
'        FROM',
'            BCOMOVID',
'        WHERE',
'            CODIGO_EMPRESA = :GLOBAL_EMPRESA',
'            AND CODMAE = :P84012_CODMAE',
'            AND TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'            AND SERIE = :P84012_SERIE',
'            AND NUMDOC = :P84012_NUMDOC;',
'    VVALIDASOLCHE       GRAL_TIPOS_TRANSAC_COMODIN.VALOR%TYPE:=GLOBALFUNC.FNC_COMODINXTIPO(:P84012_TIPO_TRANSACCION, ''VALIDA SOLCHE'');',
'    VENCONTRO           NUMBER:=1;',
'    VGENERO2            NUMBER:=0;',
'    VCARGOABONO         GRAL_TIPOS_TRANSAC_MODULOS.CARGO_ABONO%TYPE:=NULL;',
'    VNUMEROCHEQUE       BCOMOVIG.NUMDOC%TYPE:=0;',
'    VGENERO             NUMBER:=0;',
'    VEMPRESAREL         GRAL_EMPRESAS_RELACION.CODIGO_EMPRESA_RELACION%TYPE:=NULL;',
'    VNUMEROSOLCHE_D     NUMBER:=0;',
'    VFECHAGENERA        DATE:=TO_DATE(PCK_GRAL.FNC_PARAMETROS(''FECHA GENERA BANCOS''), ''dd-mm-yyyy'');',
'    VGENERASALDOSBANCOS GRAL_PARAMETROS.VALOR%TYPE:=PCK_GRAL.FNC_PARAMETROS(''GENERA SALDOS BANCOS'');',
'    VENCONTROBCOMOVIGP  NUMBER(10):=0;',
'BEGIN',
'    DECLARE',
'        TVALOR NUMBER(14, 6):=0;',
'    BEGIN',
'        SELECT',
'            SUM(A.VALOR) INTO TVALOR',
'        FROM',
'            BCOMOVID A',
'        WHERE',
'            A.CODIGO_EMPRESA = :GLOBAL_EMPRESA',
'            AND A.CODMAE = :P84012_CODMAE',
'            AND A.TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'            AND A.SERIE = :P84012_SERIE',
'            AND A.NUMDOC = :P84012_NUMDOC;',
'        IF NVL(ROUND(REPLACE(:P84012_VOPERA, '',''), 2), 0) <> NVL(ROUND(TVALOR, 2), 0) AND ABS( NVL(ROUND(REPLACE(:P84012_VOPERA, '',''), 2), 0) - NVL(ROUND(TVALOR, 2), 0) ) > 0.01 THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - LOS VALORES NO CUADRAN [POLIZA] - VALOR: ''',
'                                            ||NVL(ROUND(REPLACE(:P84012_VOPERA, '',''), 2), 0)',
'                                              ||'' DETALLE DE LA TRANSACCION : ''',
'                                              ||NVL(ROUND(TVALOR, 2), 0));',
'        END IF;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - NO EXISTEN DETALLES DE LA TRANSACCION '');',
'    END;',
'    DECLARE',
'        CURSOR CDATOS IS',
'            SELECT',
'                COUNT(*)',
'            FROM',
'                BCOMOVID',
'            WHERE',
'                CODIGO_EMPRESA = :GLOBAL_EMPRESA',
'                AND CODMAE = :P84012_CODMAE',
'                AND TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'                AND SERIE = :P84012_SERIE',
'                AND NUMDOC = :P84012_NUMDOC;',
'        VENCONTRO NUMBER:=0;',
'    BEGIN',
'        OPEN CDATOS;',
'        FETCH CDATOS INTO VENCONTRO;',
'        CLOSE CDATOS;',
'        IF VENCONTRO <= 0 THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El registro que desea contabilizar le hace falta detalle'');',
'        END IF;',
'    END;',
'    IF (:P84012_ORIGEN NOT IN (8, 11)) THEN',
'        RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El movimiento no corresponde a uno hecho en bancos'');',
'    ELSE',
'        IF :P84012_CODIGO_OPERACION IS NULL THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - Si desea generar la poliza automaticamente debe ingresar un CODIGO OPERACION CONTABLE valido'');',
'        END IF;',
'    END IF;',
'    IF FNC_GET_EJERCICIOACTIVO(:GLOBAL_EMPRESA, :P84012_FEDOC) <= 0 THEN',
'        RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El documento corresponde a un ejercicio que aun NO esta habilitado, Revise Ambas Empresas (Fin-FIS)'');',
'    END IF;',
' --Si en el detalle del movimiento esta vacio el sistema no generara partida Contable',
'    IF VFECHAGENERA > :P84012_FEDOC THEN',
'        IF NVL(INSTR(PCK_GRAL.FNC_PARAMETROS(''ADMIN_CXC''), USER), 0) <= 0 THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - No puede generar cheque para este movimiento porque la fecha no corresponde al inicio de generacion automatica ''',
'                                            ||VFECHAGENERA);',
'        END IF;',
'    END IF;',
'    IF NVL(:P84012_NROSOLCHE, 0) > 0 THEN',
'        OPEN CENCONTRODETALLE;',
'        FETCH CENCONTRODETALLE INTO VENCONTRO;',
'        IF CENCONTRODETALLE%NOTFOUND THEN',
'            VENCONTRO := 0;',
'        END IF;',
'        CLOSE CENCONTRODETALLE;',
'    END IF;',
'    IF VENCONTRO <= 0 THEN',
'        RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El registro que desea generar no tiene ingresada la integracion'');',
'    ELSE',
'        IF NVL(:P84012_POLIZA, 0) = 0 THEN',
'            IF :P84012_CODIGO_MONEDA = 1 THEN',
'                IF GLOBALFUNC.FNC_CARGOABONO(:P84012_TIPO_TRANSACCION) = ''A'' AND NVL(:P84012_NROSOLCHE, 0) = 0 THEN',
'                    IF :P84012_ORIGEN = 8 AND VVALIDASOLCHE = ''S'' THEN',
'                        RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El movimiento no tiene una solicitud de CHEQUES Valida'');',
'                    END IF;',
'                END IF;',
'            END IF;',
'            BEGIN',
' --PROCEDIMIENTO PARA ASIGNAR ID_INTERFASE --JJCALO',
'                DECLARE',
'                    VAR_ID_INTERFASE NUMBER;',
'                BEGIN',
'                    SELECT',
'                        SAF.SEQ_CON_INTERFASE.NEXTVAL INTO VAR_ID_INTERFASE',
'                    FROM',
'                        DUAL;',
'                    :P84012_POLIZA := NULL;',
' --AQUI SE GENERA LA POLIZA',
'                    :P84012_POLIZA := APX_FNC_BCO_BCOMOVIG_VERIFICA_POLIZA(:GLOBAL_EMPRESA, :P84012_CODMAE, :P84012_TIPO_TRANSACCION, :P84012_SERIE, :P84012_NUMDOC, :P84012_NROSOLCHE, :P84012_FEDOC, :P84012_EJERCICIO, :P84012_LIBRO, :P84012_POLIZA, :'
||'P84012_CORRELATIVOTRASLADO, VAR_ID_INTERFASE);',
'                    :P84012_CORRELATIVOTRASLADO := APX_FNC_BCO_BCOMOVIG_VERIFICA_CORRELATIVOTRASLADO (:GLOBAL_EMPRESA, :P84012_CODMAE, :P84012_TIPO_TRANSACCION, :P84012_SERIE, :P84012_NUMDOC, :P84012_NROSOLCHE, :P84012_FEDOC, :P84012_EJERCICIO, :P840'
||'12_LIBRO, :P84012_POLIZA, :P84012_CORRELATIVOTRASLADO, VAR_ID_INTERFASE);',
' --JJCALO Las dos funciones anteriores pueden generar poliza. Si se crea la poliza en alguna de las dos actualizamos el movimiento de banco con el id_interfase utilizado',
'                END;',
' --TERMINA PROCEDIMIENTO PARA ASIGNAR ID_INTERFASE --JJCALO',
'                OPEN CEMPRESAS_RELACION;',
'                FETCH CEMPRESAS_RELACION INTO VEMPRESAREL;',
'                CLOSE CEMPRESAS_RELACION;',
' --* Proceso para traslado de Informacion a la Empresa RELACIONADA',
'                IF NVL(VEMPRESAREL, 0) <> 0 THEN',
'                    IF NVL(VVALIDASOLCHE, ''N'') = ''S'' AND NVL(:P84012_NROSOLCHE, 0) <= 0 THEN',
'                        IF :P84012_ORIGEN = 8 THEN',
'                            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - Debe Ingresar una solicitud de Cheques'');',
'                        END IF;',
'                    END IF;',
'                    IF NVL(VVALIDASOLCHE, ''N'') = ''S'' THEN',
'                        IF :P84012_NROSOLCHE IS NOT NULL THEN',
'                            NULL;',
'                        END IF;',
'                    ELSIF NVL(VVALIDASOLCHE, ''N'') = ''N'' THEN',
'                        VNUMEROSOLCHE_D := 0;',
'                        IF NVL(GLOBALFUNC.FNC_COMODINXTIPO(:P84012_TIPO_TRANSACCION, ''MISMO_DOCUMENTO_SOLCHE''), ''N'') = ''S'' THEN',
'                            VNUMEROCHEQUE := :P84012_NUMDOC;',
'                        END IF;',
'                    END IF;',
'                    IF :P84012_NROSOLCHE IS NOT NULL THEN',
'                        UPDATE BCOSOLCHE',
'                        SET',
'                            CODMAE = :P84012_CODMAE,',
'                            TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION,',
'                            SERIE = :P84012_SERIE,',
'                            NRO_CHEQUE = :P84012_NUMDOC,',
'                            FPAGO = :P84012_FEDOC,',
'                            USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'                            FECHA_MODIFICACION = SYSDATE,',
'                            ESTATUS = 10, --Documento en Revision,',
'                            SISTEMA = ''APEX''',
'                        WHERE',
'                            NROSOLCHE = :P84012_NROSOLCHE;',
'                    END IF;',
' --',
'                    IF :P84012_CODIGO_MONEDA > 0 THEN',
'                        VCARGOABONO := GLOBALFUNC.FNC_CARGOABONO(:P84012_TIPO_TRANSACCION);',
'                        IF VCARGOABONO = ''C'' THEN',
'                            VCARGOABONO := ''D'';',
'                        ELSIF VCARGOABONO = ''A'' THEN',
'                            VCARGOABONO := ''H'';',
'                        ELSE',
'                            VCARGOABONO := NULL;',
'                        END IF;',
'                        IF VCARGOABONO IN (''D'', ''H'') THEN',
'                            IF :P84012_CODIGO_MONEDA <> 1 THEN',
'                                COMMIT;',
'                            END IF;',
'                            IF :P84012_CODIGO_MONEDA <> 1 THEN',
'                                VGENERO2 := PCK_BANCOS.FNC_ACTUALIZAPROMEDIOTC(:GLOBAL_EMPRESA, :P84012_CODMAE, REPLACE(:P84012_VALOR, '',''), :P84012_TASAC);',
'                            END IF;',
'                        ELSE',
'                            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El tipo de transaccion no tiene la caracteristica de [C]argo o [A]bono SE SALDRA SIN ACTUALIZAR'');',
'                        END IF;',
'                    END IF;',
'                    COMMIT;',
'                END IF;',
'            END;',
'        ELSE',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - Ya tiene asignada una poliza'');',
'        END IF;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(345607796649058050)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345692659608058234)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InsertaCXP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P84012_CODIGO_PROVEEDOR IS NOT NULL THEN',
'    PR_INSERTA_CXP(',
'            :GLOBAL_EMPRESA, ',
'        :P84012_NROSOLCHE, ',
'        :P84012_CODIGO_PROVEEDOR, ',
'        :P84012_BENEFICIARIO, ',
'        :P84012_TIPO_TRANSACCION, ',
'        :P84012_TASAC, ',
'        REPLACE(:P84012_VALOR, '',''), ',
'        :P84012_SERIE, ',
'        :P84012_NUMDOC, ',
'        :P84012_CODIGO_OPERACION, ',
'        :P84012_FEDOC, ',
'        :P84012_CODIGO_MONEDA, ',
'        UPPER(:P84012_CONCEPTO), ',
'        :P84012_CODIGO_DIVISION);',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(345607796649058050)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345692245957058232)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Genera Poliza_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR CEMPRESAS_RELACION IS',
'        SELECT',
'            CODIGO_EMPRESA_RELACION',
'        FROM',
'            GRAL_EMPRESAS_RELACION',
'        WHERE',
'            CODIGO_EMPRESA = :GLOBAL_EMPRESA;',
'    CURSOR CENCONTRODETALLE IS',
'        SELECT',
'            COUNT(*)',
'        FROM',
'            BCOMOVID',
'        WHERE',
'            CODIGO_EMPRESA = :GLOBAL_EMPRESA',
'            AND CODMAE = :P84012_CODMAE',
'            AND TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'            AND SERIE = :P84012_SERIE',
'            AND NUMDOC = :P84012_NUMDOC;',
'    VVALIDASOLCHE       GRAL_TIPOS_TRANSAC_COMODIN.VALOR%TYPE:=GLOBALFUNC.FNC_COMODINXTIPO(:P84012_TIPO_TRANSACCION, ''VALIDA SOLCHE'');',
'    VENCONTRO           NUMBER:=1;',
'    VGENERO2            NUMBER:=0;',
'    VCARGOABONO         GRAL_TIPOS_TRANSAC_MODULOS.CARGO_ABONO%TYPE:=NULL;',
'    VNUMEROCHEQUE       BCOMOVIG.NUMDOC%TYPE:=0;',
'    VGENERO             NUMBER:=0;',
'    VEMPRESAREL         GRAL_EMPRESAS_RELACION.CODIGO_EMPRESA_RELACION%TYPE:=NULL;',
'    VNUMEROSOLCHE_D     NUMBER:=0;',
'    VFECHAGENERA        DATE:=TO_DATE(PCK_GRAL.FNC_PARAMETROS(''FECHA GENERA BANCOS''), ''dd-mm-yyyy'');',
'    VGENERASALDOSBANCOS GRAL_PARAMETROS.VALOR%TYPE:=PCK_GRAL.FNC_PARAMETROS(''GENERA SALDOS BANCOS'');',
'    VENCONTROBCOMOVIGP  NUMBER(10):=0;',
'BEGIN',
'    DECLARE',
'        TVALOR NUMBER(14, 6):=0;',
'    BEGIN',
'        SELECT',
'            SUM(A.VALOR) INTO TVALOR',
'        FROM',
'            BCOMOVID A',
'        WHERE',
'            A.CODIGO_EMPRESA = :GLOBAL_EMPRESA',
'            AND A.CODMAE = :P84012_CODMAE',
'            AND A.TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'            AND A.SERIE = :P84012_SERIE',
'            AND A.NUMDOC = :P84012_NUMDOC;',
'        IF NVL(ROUND(REPLACE(:P84012_VOPERA, '',''), 2), 0) <> NVL(ROUND(TVALOR, 2), 0) AND ABS( NVL(ROUND(REPLACE(:P84012_VOPERA, '',''), 2), 0) - NVL(ROUND(TVALOR, 2), 0) ) > 0.01 THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - LOS VALORES NO CUADRAN [POLIZA] - VALOR: ''',
'                                            ||NVL(ROUND(REPLACE(:P84012_VOPERA, '',''), 2), 0)',
'                                              ||'' DETALLE DE LA TRANSACCION : ''',
'                                              ||NVL(ROUND(TVALOR, 2), 0));',
'        END IF;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - NO EXISTEN DETALLES DE LA TRANSACCION '');',
'    END;',
'    DECLARE',
'        CURSOR CDATOS IS',
'            SELECT',
'                COUNT(*)',
'            FROM',
'                BCOMOVID',
'            WHERE',
'                CODIGO_EMPRESA = :GLOBAL_EMPRESA',
'                AND CODMAE = :P84012_CODMAE',
'                AND TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'                AND SERIE = :P84012_SERIE',
'                AND NUMDOC = :P84012_NUMDOC;',
'        VENCONTRO NUMBER:=0;',
'    BEGIN',
'        OPEN CDATOS;',
'        FETCH CDATOS INTO VENCONTRO;',
'        CLOSE CDATOS;',
'        IF VENCONTRO <= 0 THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El registro que desea contabilizar le hace falta detalle'');',
'        END IF;',
'    END;',
'    IF (:P84012_ORIGEN NOT IN (8, 11)) THEN',
'        RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El movimiento no corresponde a uno hecho en bancos'');',
'    ELSE',
'        IF :P84012_CODIGO_OPERACION IS NULL THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - Si desea generar la poliza automaticamente debe ingresar un CODIGO OPERACION CONTABLE valido'');',
'        END IF;',
'    END IF;',
'    IF FNC_GET_EJERCICIOACTIVO(:GLOBAL_EMPRESA, :P84012_FEDOC) <= 0 THEN',
'        RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El documento corresponde a un ejercicio que aun NO esta habilitado, Revise Ambas Empresas (Fin-FIS)'');',
'    END IF;',
' --Si en el detalle del movimiento esta vacio el sistema no generara partida Contable',
'    IF VFECHAGENERA > :P84012_FEDOC THEN',
'        IF NVL(INSTR(PCK_GRAL.FNC_PARAMETROS(''ADMIN_CXC''), USER), 0) <= 0 THEN',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - No puede generar cheque para este movimiento porque la fecha no corresponde al inicio de generacion automatica ''',
'                                            ||VFECHAGENERA);',
'        END IF;',
'    END IF;',
'    IF NVL(:P84012_NROSOLCHE, 0) > 0 THEN',
'        OPEN CENCONTRODETALLE;',
'        FETCH CENCONTRODETALLE INTO VENCONTRO;',
'        IF CENCONTRODETALLE%NOTFOUND THEN',
'            VENCONTRO := 0;',
'        END IF;',
'        CLOSE CENCONTRODETALLE;',
'    END IF;',
'    IF VENCONTRO <= 0 THEN',
'        RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El registro que desea generar no tiene ingresada la integracion'');',
'    ELSE',
'        IF NVL(:P84012_POLIZA, 0) = 0 THEN',
'            IF :P84012_CODIGO_MONEDA = 1 THEN',
'                IF GLOBALFUNC.FNC_CARGOABONO(:P84012_TIPO_TRANSACCION) = ''A'' AND NVL(:P84012_NROSOLCHE, 0) = 0 THEN',
'                    IF :P84012_ORIGEN = 8 AND VVALIDASOLCHE = ''S'' THEN',
'                        RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El movimiento no tiene una solicitud de CHEQUES Valida'');',
'                    END IF;',
'                END IF;',
'            END IF;',
'            BEGIN',
' --PROCEDIMIENTO PARA ASIGNAR ID_INTERFASE --JJCALO',
'                DECLARE',
'                    VAR_ID_INTERFASE NUMBER;',
'                BEGIN',
'                    SELECT',
'                        SAF.SEQ_CON_INTERFASE.NEXTVAL INTO VAR_ID_INTERFASE',
'                    FROM',
'                        DUAL;',
'                    :P84012_POLIZA := NULL;',
' --AQUI SE GENERA LA POLIZA',
'                    :P84012_POLIZA := APX_FNC_BCO_BCOMOVIG_VERIFICA_POLIZA(:GLOBAL_EMPRESA, :P84012_CODMAE, :P84012_TIPO_TRANSACCION, :P84012_SERIE, :P84012_NUMDOC, :P84012_NROSOLCHE, :P84012_FEDOC, :P84012_EJERCICIO, :P84012_LIBRO, :P84012_POLIZA, :'
||'P84012_CORRELATIVOTRASLADO, VAR_ID_INTERFASE);',
'                    :P84012_CORRELATIVOTRASLADO := APX_FNC_BCO_BCOMOVIG_VERIFICA_CORRELATIVOTRASLADO (:GLOBAL_EMPRESA, :P84012_CODMAE, :P84012_TIPO_TRANSACCION, :P84012_SERIE, :P84012_NUMDOC, :P84012_NROSOLCHE, :P84012_FEDOC, :P84012_EJERCICIO, :P840'
||'12_LIBRO, :P84012_POLIZA, :P84012_CORRELATIVOTRASLADO, VAR_ID_INTERFASE);',
' --JJCALO Las dos funciones anteriores pueden generar poliza. Si se crea la poliza en alguna de las dos actualizamos el movimiento de banco con el id_interfase utilizado',
'                END;',
' --TERMINA PROCEDIMIENTO PARA ASIGNAR ID_INTERFASE --JJCALO',
'                OPEN CEMPRESAS_RELACION;',
'                FETCH CEMPRESAS_RELACION INTO VEMPRESAREL;',
'                CLOSE CEMPRESAS_RELACION;',
' --* Proceso para traslado de Informacion a la Empresa RELACIONADA',
'                IF NVL(VEMPRESAREL, 0) <> 0 THEN',
'                    IF NVL(VVALIDASOLCHE, ''N'') = ''S'' AND NVL(:P84012_NROSOLCHE, 0) <= 0 THEN',
'                        IF :P84012_ORIGEN = 8 THEN',
'                            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - Debe Ingresar una solicitud de Cheques'');',
'                        END IF;',
'                    END IF;',
'                    IF NVL(VVALIDASOLCHE, ''N'') = ''S'' THEN',
'                        IF :P84012_NROSOLCHE IS NOT NULL THEN',
'                            NULL;',
'                        END IF;',
'                    ELSIF NVL(VVALIDASOLCHE, ''N'') = ''N'' THEN',
'                        VNUMEROSOLCHE_D := 0;',
'                        IF NVL(GLOBALFUNC.FNC_COMODINXTIPO(:P84012_TIPO_TRANSACCION, ''MISMO_DOCUMENTO_SOLCHE''), ''N'') = ''S'' THEN',
'                            VNUMEROCHEQUE := :P84012_NUMDOC;',
'                        END IF;',
'                    END IF;',
'                    IF :P84012_NROSOLCHE IS NOT NULL THEN',
'                        UPDATE BCOSOLCHE',
'                        SET',
'                            CODMAE = :P84012_CODMAE,',
'                            TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION,',
'                            SERIE = :P84012_SERIE,',
'                            NRO_CHEQUE = :P84012_NUMDOC,',
'                            FPAGO = :P84012_FEDOC,',
'                            USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'                            FECHA_MODIFICACION = SYSDATE,',
'                            ESTATUS = 10, --Documento en Revision,',
'                            SISTEMA = ''APEX''',
'                        WHERE',
'                            NROSOLCHE = :P84012_NROSOLCHE;',
'                    END IF;',
' --',
'                    IF :P84012_CODIGO_MONEDA > 0 THEN',
'                        VCARGOABONO := GLOBALFUNC.FNC_CARGOABONO(:P84012_TIPO_TRANSACCION);',
'                        IF VCARGOABONO = ''C'' THEN',
'                            VCARGOABONO := ''D'';',
'                        ELSIF VCARGOABONO = ''A'' THEN',
'                            VCARGOABONO := ''H'';',
'                        ELSE',
'                            VCARGOABONO := NULL;',
'                        END IF;',
'                        IF VCARGOABONO IN (''D'', ''H'') THEN',
'                            IF :P84012_CODIGO_MONEDA <> 1 THEN',
'                                COMMIT;',
'                            END IF;',
'                            IF :P84012_CODIGO_MONEDA <> 1 THEN',
'                                VGENERO2 := PCK_BANCOS.FNC_ACTUALIZAPROMEDIOTC(:GLOBAL_EMPRESA, :P84012_CODMAE, REPLACE(:P84012_VALOR, '',''), :P84012_TASAC);',
'                            END IF;',
'                        ELSE',
'                            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - El tipo de transaccion no tiene la caracteristica de [C]argo o [A]bono SE SALDRA SIN ACTUALIZAR'');',
'                        END IF;',
'                    END IF;',
'                    COMMIT;',
'                END IF;',
'            END;',
'        ELSE',
'            RAISE_APPLICATION_ERROR(-20333, '' BCOMOVIG - Ya tiene asignada una poliza'');',
'        END IF;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345641206608058123)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(916079792332211172)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Ingreso de Movimientos'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345685883482058221)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    select  globalfunc.fnc_nusuario(:P84012_USUARIO_GRABACION) NUSUARIO_GRABACION,',
'        globalfunc.fnc_nusuario(:P84012_USUARIO_MODIFICACION) NUSUARIO_MODIFICACION,',
'        Pck_Gral.Fnc_fecha_bancos(:GLOBAL_EMPRESA)',
'    into',
'        :P84012_NUSUARIO_GRABACION,:P84012_NUSUARIO_MODIFICACION,:P84012_FECHA_MODULO',
'    from dual;',
'End;',
'',
'Begin',
'    select ''S'' into :P84012_ADMINISTRADOR_BCOMOVIG_BCOMOVID',
'    from GRAL_USUARIOS_ROLES',
'    where codigo_usuario = Pck_Gral.fnc_trae_no_usuario(:APP_USER)',
'    and codigo_role = 1066;',
'    exception when no_data_found then ',
'    null;',
'End;',
'',
'--------------------------------------------------------',
'Declare',
'  Cursor CDatosPoliza Is',
'     select Distinct(a.nro_poliza)',
'       from con_polizasd a, BcoMovig b',
'      Where a.Codigo_Empresa = b.Codigo_empresa',
'        And a.tdorigen =  b.tipo_transaccion ',
'        And a.sorigen  =  b.serie',
'        And a.dorigen  =  b.numdoc ',
'        And a.codigo_empresa = :P84012_CODIGO_EMPRESA',
'        And a.ejercicio      = :P84012_EJERCICIO',
'        And a.libro          = :P84012_LIBRO',
'        And b.numdoc         = :P84012_NUMDOC',
'        And a.ctamae         = :P84012_CODMAE',
'        And b.CodMae         = :P84012_CODMAE',
'--        And a.Codigo_Modulo  = 8',
'        And a.TdOrigen       = :P84012_TIPO_TRANSACCION',
'        And a.Sorigen        = :P84012_SERIE',
'        And a.DOrigen        = :P84012_NUMDOC',
'        And a.mes            = to_char(:P84012_FEDOC,''MM'');',
'',
'    Cursor CDatosMovig Is',
'         SELECT formato',
'           FROM BCOSERIE',
'          WHERE CODIGO_EMPRESA   = :P84012_CODIGO_EMPRESA',
'            AND CODmae           = :P84012_CODMAE',
'            AND TIPO_TRANSACCION = :P84012_TIPO_TRANSACCION',
'            AND SERIE            = :P84012_SERIE;',
'',
'    Cursor CDAtosPersona Is',
'       SELECT NOMBRE_PERSONA, nrocta, nomcta, c.codbco, c.Codigo_Moneda',
'            FROM GRAL_PERSONAS A, BCOBANCOS B, bcomaestro c',
'           WHERE b.CODBCO = c.CODBCO',
'             AND A.CODIGO_PERSONA = B.CODIGO_PERSONA',
'             and c.codigo_empresa = :P84012_CODIGO_EMPRESA',
'             and c.codmae         = :P84012_CODMAE;',
'',
'  Cursor CTiposTrs Is',
'     SELECT cargo_abono, imprimir, chequera',
'       FROM GRAL_TIPOS_TRANSAC_MODULOS',
'      WHERE TIPO_TRANSACCION  = :P84012_TIPO_TRANSACCION',
'        AND CODIGO_MODULO     = 8;',
'',
'  Cursor CDatosOperag Is',
'          SELECT tpvoucher',
'            FROM bcooperag',
'           WHERE codigo_empresa   = :P84012_CODIGO_EMPRESA',
'             AND codopera         = :P84012_CODOPERA;',
'',
'  nombre varchar2(150);',
'Begin',
'',
'   :P84012_NUSUARIOIMPRE := GlobalFunc.Fnc_Usuarios(:p84012_USUAIMPRE);',
'   ',
'   Open CDatosMovig;',
'   Fetch CDatosMovig INTO :P84012_FORMATO;',
'   Close CDatosMovig;',
'',
'   Open CDatosPersona;',
'   Fetch CDatosPersona Into :P84012_NOMBRE_BANCO,:P84012_NROCTA,:P84012_NOMBRE_CUENTA,:P84012_CODBCO,:P84012_CODIGO_MONEDA;',
'   Close CDatosPersona;',
'',
'   Open CTiposTrs;',
'   Fetch CTiposTrs INTO :P84012_C_A, :P84012_IMPRIMIR, :P84012_CHEQUERA;',
'   Close CTiposTrs;',
'',
'   IF :P84012_CODOPERA IS NOT NULL THEN',
'      Open CDatosOperag;',
'      Fetch CDatosOperag INTO :P84012_TPVOUCHER;',
'      Close CDatosOperag;',
'   END IF;',
'',
'   --:P84012_EJERCICIO := APX_FNC_BCOMOVIG_TRAE_EJERCICIO(:P84012_CODIGO_EMPRESA,:P84012_FEDOC);',
'   ',
'   Open CDatosPoliza;',
'   Fetch CDatosPoliza Into :P84012_POLIZA;',
'   If CDatosPoliza%NotFound Then',
'      :P84012_POLIZA :=Null;',
'   End If;',
'   Close CDatosPoliza;',
'',
'',
'   if :P84012_FANULA is not null then',
'      if :P84012_USUARIO_MODIFICACION is not null then',
'         select nombre_persona into nombre',
'         from gral_personas a, gral_usuarios b',
'         where a.codigo_persona   = b.codigo_persona',
'         and b.codigo_usuario     = :P84012_USUARIO_MODIFICACION;',
'      end if;',
'        :P84012_COMENTARIO2 := ''*** DOCUMENTO ANULADO POR ''||nombre||'' ***'';         ',
'   end if;',
'End;',
'',
':P84012_NOMBRE_MONEDA    := GlobalFunc.Fnc_Monedas(:P84012_CODIGO_MONEDA);',
':P84012_SIMBOLO_MONEDA   := Pck_gral.Fnc_SimboloMoneda(:P84012_CODIGO_MONEDA);',
':P84012_CARGO_ABONO 	  := gLOBALfUNC.Fnc_CargoAbono(:P84012_TIPO_TRANSACCION);',
'',
''))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345688267954058226)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga_Correlativo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P84012_CORRELATIVO is null then',
'    Begin',
'       Select correlativo Into :P84012_CORRELATIVO',
'         From Con_History_Tras',
'        Where cod_empresa = :P84012_CODIGO_EMPRESA',
'          And numdoc      = :P84012_NUMDOC',
'          And codmae      = :P84012_CODMAE',
'          And serie       = :P84012_SERIE',
'          And transac     = ''O'';',
'       Exception',
'        When others Then',
'         :P84012_CORRELATIVO := 0;',
'    End;',
'End if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345688631457058227)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Fecha Docto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'If :P84012_FEDOC is null then',
'    Begin',
'        select Pck_Gral.Fnc_fecha_bancos(:GLOBAL_EMPRESA)',
'        into :P84012_FEDOC',
'        from dual;',
'    End;',
'End if;   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345687872209058226)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga_ejercicio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P84012_EJERCICIO is null then',
'    :P84012_EJERCICIO   := APX_FNC_BCO_BCOMOVIG_TRAE_EJERCICIO(:P84012_CODIGO_EMPRESA,to_date(:P84012_FEDOC,''DD/MM/YYYY''));',
'End if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345689009235058227)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anio_mes_dia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'  panio1            number(4);',
'  pmes1             number(2);',
'  pdia              number(2);',
'  pfinmes           date;',
'Begin',
'         panio1  := to_number(to_char(to_date(:P84012_FECHA_MODULO),''YYYY''));  ',
'         pmes1   := to_number(to_char(to_date(:P84012_FECHA_MODULO),''MM''));   ',
'         pdia    := to_number(to_char(to_date(:P84012_FECHA_MODULO),''DD'')); ',
'         ',
'         :P84012_ANIO   := panio1;',
'         :P84012_MES    := pmes1;',
'         :P84012_DIA    := pdia;',
'End;',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345690688241058229)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CreateCollection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- CREACION DE COLLECTION',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''DETALLES_COLLECTION'') THEN',
'    APEX_COLLECTION.CREATE_COLLECTION(''DETALLES_COLLECTION'');',
'ELSE',
'    APEX_COLLECTION.TRUNCATE_COLLECTION(''DETALLES_COLLECTION'');',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345691852099058231)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Mayorizar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR CAnulacion IS',
'        Select p.CODIGO_EMPRESA,',
'                p.EJERCICIO,',
'                P.LIBRO,',
'                P.COD_TIPOL,',
'                P.NRO_POLIZA,',
'                P.MES',
'    FROM CON_HISTORY_TRAS h',
'    INNER JOIN CON_POLIZAS p',
'    ON',
'	h.NRO_POLIZA = p.NRO_POLIZA ',
'    AND h.LIBRO = p.LIBRO',
'    AND h.COD_TIPOL = p.COD_TIPOL ',
'    AND h.EJERCICIO  = p.EJERCICIO',
'    AND h.COD_EMPRESA = p.CODIGO_EMPRESA ',
'    AND p.MES = h.MES',
'    WHERE h.COD_EMPRESA = :P84012_CODIGO_EMPRESA',
'    AND h.CODMAE = :P84012_CODMAE',
'    AND h.SERIE = :P84012_SERIE',
'    AND h.NUMDOC = :P84012_NUMDOC',
'    AND p.EJERCICIO = :P84012_EJERCICIO',
'    AND p.UMAYOR IS NULL;',
'BEGIN',
'    FOR registro IN CAnulacion LOOP',
'        --Raise_Application_Error(-20333,'' prueba ''||registro.CODIGO_EMPRESA||registro.ejercicio||registro.libro||registro.cod_tipol||registro.nro_poliza||registro.mes);',
'        PR_PROCESAR_POLIZA_TEST(registro.CODIGO_EMPRESA,registro.ejercicio,registro.libro,registro.cod_tipol,registro.nro_poliza,registro.mes);',
'        saf.Pr_Trasladar_Contabilidad_a_Fiscal_TEST(registro.CODIGO_EMPRESA,registro.ejercicio,registro.libro,registro.cod_tipol,registro.mes,registro.nro_poliza);',
'        SAF.mayorizar_polizas_revisadas_test(registro.CODIGO_EMPRESA,registro.ejercicio,registro.libro,registro.cod_tipol,registro.nro_poliza,registro.mes);',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(345690215786058229)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREPARE_URL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   result varchar2(32767);',
'begin',
'   result:=apex_util.prepare_url(apex_application.g_x01);',
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
