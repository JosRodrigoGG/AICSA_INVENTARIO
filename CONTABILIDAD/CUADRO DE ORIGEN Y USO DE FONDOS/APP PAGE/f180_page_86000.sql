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
,p_default_application_id=>180
,p_default_id_offset=>0
,p_default_owner=>'SAF'
);
end;
/
 
prompt APPLICATION 180 - Dashboard Dirección
--
-- Application Export:
--   Application:     180
--   Name:            Dashboard Dirección
--   Date and Time:   15:33 Wednesday September 27, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 86000
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_86000
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>86000);
end;
/
prompt --application/pages/page_86000
begin
wwv_flow_imp_page.create_page(
 p_id=>86000
,p_name=>'Egresos - Flujo de efectivo'
,p_alias=>'EGRESOS-FLUJO-DE-EFECTIVO'
,p_page_mode=>'MODAL'
,p_step_title=>'Egresos - Flujo de efectivo'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'MODAL_EGRESOS'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230926175402'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(180999707861534339)
,p_plug_name=>'Listado de egresos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(163962841018980827)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select orden, tipo, sum(MONTO_USD$) MONTO_USD$, sum(monto_qtz) monto_qtz ',
'        ,case when tipo = ''CXP Materiales'' then',
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''N'', ''N'',''N'', ''N'', ''QTZ'') * -1',
'        when tipo = ''CXP Servicios'' then',
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''N'', ''S'',''N'', ''N'', ''QTZ'') * -1',
'        when tipo = ''CXP Proveedores Mayores'' then',
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''S'', ''N'',''N'', ''N'', ''QTZ'')* -1',
'				 when tipo = ''Anticipos x Liquidar'' then',
'         FNC_GET_ANT_X_LIQ_PAGO_APLICADO(:P86000_ID_FLUJO, :P86000_EMPRESA_CONSOLIDADORA , ''QTZ'')* -1',
'				 when tipo = ''Cajas Chicas'' then',
'         fnc_get_flujo_cajas_chicas_pago_aplicado(:P86000_ID_FLUJO, :P86000_EMPRESA_CONSOLIDADORA ,''QTZ'')* -1',
'        when tipo = ''Subcontratistas'' then',
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''N'', ''S'',''S'', ''N'', ''QTZ'')* -1',
unistr('        when tipo = ''Viaticos, Depreciaci\00F3n y Combustible'' then'),
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''N'', ''N'',''N'', ''S'', ''QTZ'')* -1',
'        when tipo = ''Tarjeta Credito'' then',
'            NVL(FNC_GET_TARJETA_CREDITO_PAGO_APLICADO(:P86000_ID_FLUJO, :P86000_EMPRESA_CONSOLIDADORA, 1), 0)',
'         --fnc_get_flujo_pretamos_pago_aplicado(:P86000_ID_FLUJO,:P86000_EMPRESA_CONSOLIDADORA,''QTZ'') * -1 ',
unistr('         when tipo = ''Pr\00E9stamos'' then'),
'         fnc_get_flujo_prestamos_pago_aplicado(:P86000_ID_FLUJO,:P86000_EMPRESA_CONSOLIDADORA,''QTZ'') * -1',
unistr('         when tipo = ''Pagos Solicitados por Direcci\00F3n'' then'),
'         fnc_get_flujo_solicitudes_direccion_pago_aplicado(:P86000_ID_FLUJO,:P86000_EMPRESA_CONSOLIDADORA, ''QTZ'')* -1',
'         when tipo = ''Solicitud de Viaticos'' then',
'        NVL(FNC_GET_FLUJO_SOLICITUD_VTC_APLICADO(:P86000_EMPRESA_CONSOLIDADORA,:P86000_ID_FLUJO, 1),0)* -1',
'         when tipo = ''Empresas relacionadas'' then',
'         fnc_get_flujo_monto_aplicado_cxp_intercompany(:P86000_ID_FLUJO, ''QTZ'')* -1',
'        else',
'         sum(monto_qtz)',
'        end Aplicado_QTZ',
'        ,case when tipo = ''CXP Materiales'' then',
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''N'', ''N'',''N'', ''N'', ''USD'')* -1',
'        when tipo = ''CXP Servicios'' then',
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''N'', ''S'',''N'', ''N'', ''USD'')* -1',
'        when tipo = ''CXP Proveedores Mayores'' then',
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''S'', ''N'',''N'', ''N'', ''USD'')* -1',
'				 when tipo = ''Anticipos x Liquidar'' then',
'         FNC_GET_ANT_X_LIQ_PAGO_APLICADO(:P86000_ID_FLUJO, :P86000_EMPRESA_CONSOLIDADORA , ''USD'')* -1',
'				 when tipo = ''Cajas Chicas'' then',
'         fnc_get_flujo_cajas_chicas_pago_aplicado(:P86000_ID_FLUJO, :P86000_EMPRESA_CONSOLIDADORA ,''USD'')* -1',
'        when tipo = ''Subcontratistas'' then',
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''N'', ''S'',''S'', ''N'', ''USD'')* -1',
unistr('        when tipo = ''Viaticos, Depreciaci\00F3n y Combustible'' then'),
'         fnc_get_flujo_monto_aplicado_cxp(:P86000_ID_FLUJO, ''N'', ''N'',''N'', ''S'', ''USD'')* -1',
'        when tipo = ''Tarjeta Credito'' then',
'            NVL(FNC_GET_TARJETA_CREDITO_PAGO_APLICADO(:P86000_ID_FLUJO, :P86000_EMPRESA_CONSOLIDADORA, 2), 0)',
'        --fnc_get_flujo_pretamos_pago_aplicado(:P86000_ID_FLUJO,:P86000_EMPRESA_CONSOLIDADORA,''USD'') * -1',
unistr('        when tipo = ''Pr\00E9stamos'' then'),
'        fnc_get_flujo_prestamos_pago_aplicado(:P86000_ID_FLUJO,:P86000_EMPRESA_CONSOLIDADORA,''USD'') * -1',
unistr('         when tipo = ''Pagos Solicitados por Direcci\00F3n'' then'),
'         fnc_get_flujo_solicitudes_direccion_pago_aplicado(:P86000_ID_FLUJO,:P86000_EMPRESA_CONSOLIDADORA, ''USD'')* -1',
'         when tipo = ''Solicitud de Viaticos'' then',
'        NVL(FNC_GET_FLUJO_SOLICITUD_VTC_APLICADO(:P86000_EMPRESA_CONSOLIDADORA,:P86000_ID_FLUJO, 1),0)* -1',
'        ',
'         when tipo = ''Empresas relacionadas'' then',
'         fnc_get_flujo_monto_aplicado_cxp_intercompany(:P86000_ID_FLUJO, ''USD'')* -1',
'        else',
'         sum(monto_usd$)',
'        end Aplicado_USD',
'        ,case when orden = 1 then',
'            ''f?p=&APP_ID.:57:&APP_SESSION.::no:57:P57_EMPRESA_CONSOLIDADORA,P57_ID_FLUJO:''||:P86000_EMPRESA_CONSOLIDADORA||'',''||:P86000_ID_FLUJO',
'        when orden = 2 then',
'            ''f?p=&APP_ID.:86004:&APP_SESSION.::no:86004:P86004_ID_FLUJO,P86004_EMPRESA_CONSOLIDADORA,P86004_ORDEN:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA||'',''||ORDEN',
'            --''f?p=&APP_ID.:60:&APP_SESSION.::no:60:P60_ID_FLUJO,P60_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 3 then',
'            ''f?p=&APP_ID.:86004:&APP_SESSION.::no:86004:P86004_ID_FLUJO,P86004_EMPRESA_CONSOLIDADORA,P86004_ORDEN:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA||'',''||ORDEN',
'            --''f?p=&APP_ID.:61:&APP_SESSION.::no:61:P61_ID_FLUJO:''||:P86000_ID_FLUJO',
'        when orden = 4 then --62',
'            --''f?p=&APP_ID.:76:&APP_SESSION.::no:76:P76_ID_FLUJO,P76_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'            ''f?p=&APP_ID.:86004:&APP_SESSION.::no:86004:P86004_ID_FLUJO,P86004_EMPRESA_CONSOLIDADORA,P86004_ORDEN:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA||'',''||ORDEN',
'        when orden = 5 then',
'            ''f?p=&APP_ID.:80:&APP_SESSION.::no:80:P80_ID_FLUJO,P80_EMPRESA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 6 then',
'            ''f?p=&APP_ID.:64:&APP_SESSION.::no:64:P64_ID_FLUJO,P64_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 7 then',
'            ''f?p=&APP_ID.:66:&APP_SESSION.::no:66:P66_ID_FLUJO,P66_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 8 then --IGSS',
'            --''f?p=&APP_ID.:67:&APP_SESSION.::no:67:P67_ID_FLUJO,P67_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'            ''f?p=&APP_ID.:85:&APP_SESSION.::no:85:P85_ID_FLUJO,P85_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 9 then',
'            ''f?p=&APP_ID.:68:&APP_SESSION.::no:68:P68_ID_FLUJO,P68_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 10 then',
'            ''f?p=&APP_ID.:130:&APP_SESSION.::no:130:P130_ID_FLUJO,P130_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 11 then -- Impuestos',
'            ''f?p=&APP_ID.:89:&APP_SESSION.::no:89:P89_ID_FLUJO,P89_EJERCICIO,P89_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P1_EJERCICIO_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'            --''f?p=&APP_ID.:70:&APP_SESSION.::no:70:P70_ID_FLUJO,P70_EJERCICIO,P70_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P1_EJERCICIO_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'            --apex_util.prepare_url(p_url => ''f?p='' || :APP_ID || '':13:'' ||:APP_SESSION ||''::no:13:P13_CODIGO_MONEDA,P13_MONEDA,P13_INTERCOMPANY:''||codigo_moneda||'',''||moneda||'',S'') card_link',
'        when orden = 12 then',
'            --''f?p=&APP_ID.:90:&APP_SESSION.::no:90:P90_ID_FLUJO,P90_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'            ''f?p=&APP_ID.:86004:&APP_SESSION.::no:86004:P86004_ID_FLUJO,P86004_EMPRESA_CONSOLIDADORA,P86004_ORDEN:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA||'',''||ORDEN',
'        when orden = 14 then',
'            ''f?p=&APP_ID.:91:&APP_SESSION.::no:91:P91_ID_FLUJO,P91_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 15 then -- PRESTAMOS',
'            ''f?p=&APP_ID.:121:&APP_SESSION.::no:121:P121_ID_FLUJO,P121_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA       ',
'        when orden = 16 then -- Impuestos',
'            ''f?p=&APP_ID.:88:&APP_SESSION.::no:88:P88_ID_FLUJO,P88_CODIGO_EMPRESA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'         when orden = 13 then',
'            ''f?p=&APP_ID.:123:&APP_SESSION.::no:123:P123_ID_FLUJO,P123_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 17 then',
'            ''f?p=&APP_ID.:124:&APP_SESSION.::no:124:P124_ID_FLUJO,P124_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        when orden = 18 then',
'            ''f?p=&APP_ID.:86004:&APP_SESSION.::no:86004:P86004_ID_FLUJO,P86004_EMPRESA_CONSOLIDADORA,P86004_ORDEN:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA||'',''||ORDEN',
'            --''f?p=&APP_ID.:60:&APP_SESSION.::no:60:P60_ID_FLUJO,P60_EMPRESA_CONSOLIDADORA:''||:P86000_ID_FLUJO||'',''||:P86000_EMPRESA_CONSOLIDADORA',
'        WHEN ORDEN = 19 THEN',
'            ''f?p=&APP_ID.:84009:&APP_SESSION.::no:84009:P84009_ID_EMPRESA,P84009_ID_FLUJO:'' || :P86000_EMPRESA_CONSOLIDADORA || '','' || :P86000_ID_FLUJO',
'        else',
'            null',
'        end url',
'        /*case when orden = 1 then',
'            apex_util.prepare_url(p_url => ''f?p='' || :APP_ID || '':57:'' ||:APP_SESSION ||''::no:57::'') ',
'        end card_link*/',
' From Flujo_Efectivo_Historico',
' where id = :P86000_ID_FLUJO',
'   and empresa_consolidadora = :P86000_EMPRESA_CONSOLIDADORA',
'   and orden not in (1)',
'  group by  orden, tipo',
' order by orden',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P86000_ID_FLUJO,P86000_EMPRESA_CONSOLIDADORA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Listado de egresos'
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
 p_id=>wwv_flow_imp.id(180999805869534340)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JONATHAN.AZURDIA@AICSACORP.COM'
,p_internal_uid=>180999805869534340
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(180999964532534341)
,p_db_column_name=>'ORDEN'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181000058218534342)
,p_db_column_name=>'TIPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo'
,p_column_link=>'#URL#'
,p_column_linktext=>'#TIPO#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181000127195534343)
,p_db_column_name=>'MONTO_USD$'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Monto Usd$'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181000208183534344)
,p_db_column_name=>'MONTO_QTZ'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Monto Qtz'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181000324758534345)
,p_db_column_name=>'APLICADO_QTZ'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Aplicado Qtz'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181000414884534346)
,p_db_column_name=>'APLICADO_USD'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Aplicado Usd'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188637710500139223)
,p_db_column_name=>'URL'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Url'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(185934127210748979)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1859342'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ORDEN:TIPO:MONTO_USD$:MONTO_QTZ:APLICADO_USD:APLICADO_QTZ'
,p_sum_columns_on_break=>'MONTO_USD$:MONTO_QTZ:APLICADO_USD:APLICADO_QTZ'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(180999492908534336)
,p_name=>'P86000_ID_FLUJO'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(180999567723534337)
,p_name=>'P86000_EMPRESA_CONSOLIDADORA'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186736840887467205)
,p_name=>'P86000_NOMBRE_EMPRESA'
,p_item_sequence=>30
,p_item_default=>'select FNC_GET_EMPRESAS(:P86000_EMPRESA_CONSOLIDADORA) from dual;'
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(186736537674467202)
,p_name=>'Titulo dinamico'
,p_event_sequence=>10
,p_condition_element=>'P86000_NOMBRE_EMPRESA'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(186736767324467204)
,p_event_id=>wwv_flow_imp.id(186736537674467202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nombre = apex.item(''P86000_NOMBRE_EMPRESA'').getValue();',
'apex.util.getTopApex().jQuery(".MODAL_EGRESOS .ui-dialog-title").text("Egresos - Flujo de efectivo - " + nombre);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(188637526354139221)
,p_name=>'Actualizar resumen corporativo'
,p_event_sequence=>20
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(188637628193139222)
,p_event_id=>wwv_flow_imp.id(188637526354139221)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(180999707861534339)
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
