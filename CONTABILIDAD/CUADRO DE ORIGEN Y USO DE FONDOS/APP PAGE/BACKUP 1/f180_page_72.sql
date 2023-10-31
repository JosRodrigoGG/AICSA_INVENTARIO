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
--   Date and Time:   15:34 Wednesday September 27, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 72
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00072
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>72);
end;
/
prompt --application/pages/page_00072
begin
wwv_flow_imp_page.create_page(
 p_id=>72
,p_name=>'Procesar Pago a Proveedores'
,p_alias=>'PROCESAR-PAGO-A-PROVEEDORES'
,p_page_mode=>'MODAL'
,p_step_title=>'Procesar Pago a Proveedores'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'800'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'16'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230927104945'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(370942388998391970)
,p_plug_name=>'<b>Procesar</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(163964762233980830)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(423244393852317078)
,p_plug_name=>'<b>Procesar Pago a Proveedores</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(163964762233980830)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'<b>Recuerda</b> Que al finalizar de aplicar los pagos en la CXP puede presionar el boton <b>"PROCESAR PAGO A PROVEEDORES"</b> y el sistema enviara un ',
'registro al proceso de Presupuestos y relacionara los documentos que se aplicaron para que los mismos se aprueben y se paguen.',
'<br><br>',
'Una vez aplicado los registros <b>NO</b> podras volver a seleccionar estos para aplicar algo mas, asi que <b>asegurate</b> que cuando presiones el boton',
'estes seguro que esto es lo que deseas hacer',
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(144759865946912467)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(423244393852317078)
,p_button_name=>'GeneraPresupuesto'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(164036469561980945)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Genera Presupuesto'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(144760214583912467)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(423244393852317078)
,p_button_name=>'Procesar_Pago_a_Proveedores'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(164036542606980945)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Pago A Proveedores'
,p_button_position=>'CREATE'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(144758309018912464)
,p_name=>'P72_CODIGO_EMPRESA_CONSOLIDADORA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(370942388998391970)
,p_prompt=>'Empresa Consolidadora'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' Select trim(a.Codigo_Empresa_Consolidadora||'' - ''||c.NOMBRE_PERSONA) d, a.Codigo_Empresa_Consolidadora r',
'     from flujo_empresas_consolidadoras a, Gral_Empresas b, gral_personas_Table c',
'    where a.Codigo_Empresa_Consolidadora  = b.codigo_empresa',
'      and b.CODIGO_PERSONA  = c.codigo_persona',
'    group by trim(a.Codigo_Empresa_Consolidadora||'' - ''||c.NOMBRE_PERSONA), a.Codigo_Empresa_Consolidadora  '))
,p_lov_display_null=>'YES'
,p_cSize=>3000
,p_field_template=>wwv_flow_imp.id(164035261572980936)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(144758749356912465)
,p_name=>'P72_ID_FLUJO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(370942388998391970)
,p_prompt=>'Flujo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=''''readonly'''''
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(164035261572980936)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--indicatorAsterisk'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(144759151975912465)
,p_name=>'P72_EMPRESA_CONSOLIDADORA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(370942388998391970)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(144760602287912468)
,p_name=>'P72_ID_SEMANA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(423244393852317078)
,p_prompt=>'Aplicar en la Semana'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select ''[ ''||NO||'' ] " ''||descripcion||'' " Inicia El : [''||to_char(INICIO_SEMANA,''dd-mm-yyyy'')||',
'  									   ''] y Finaliza El : [''||to_char(FIN_SEMANA ,''dd-mm-yyyy'')||'']''||',
'  									   '' Fecha Limite : [''||to_char(fecha_limite, ''dd-mm-yyyy'')||'']'' d,',
'	     id_Semana r',
'  From PRS_DEFINICION_SEMANAS   ',
'  where trunc(INICIO_SEMANA) > trunc(add_months(sysdate,-2))',
'    and id_semana in (Select max(id_semana)',
'					         From PRS_DEFINICION_SEMANAS',
'					        where activa <> 1)		',
'  --and activa = 1',
'  order by INICIO_SEMANA desc'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(164033953080980933)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(144761460357912470)
,p_name=>'IdFlujo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P72_CODIGO_EMPRESA_CONSOLIDADORA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(144761903387912471)
,p_event_id=>wwv_flow_imp.id(144761460357912470)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        Select id ',
'        into :P72_ID_FLUJO',
'        From Flujo_Efectivo_Proceso',
'        where generado_el in (select Max(generado_el) from flujo_efectivo_proceso where codigo_empresa = :P72_CODIGO_EMPRESA_CONSOLIDADORA) ',
'          and codigo_empresa = :P72_CODIGO_EMPRESA_CONSOLIDADORA;',
''))
,p_attribute_02=>'P72_CODIGO_EMPRESA_CONSOLIDADORA'
,p_attribute_03=>'P72_ID_FLUJO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(144761045760912469)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pr_Aplicar_Pago_A_Proveedores'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'   cursor c_registros_procesados is',
'    Select count(*) Conteo',
'      From saf.Flujo_Efectivo_Historico',
'     where id = :P72_ID_FLUJO',
'       and empresa_consolidadora = :P72_CODIGO_EMPRESA_CONSOLIDADORA',
'       and procesado = ''S'';',
'   ',
'   l_encontro_registros_procesos number(10):=0;',
'begin',
'   open c_registros_procesados;',
'   fetch c_registros_procesados into l_encontro_registros_procesos;',
'   close c_registros_procesados;',
'',
'   --Raise_Application_Error(-20333,'' prueba ''||l_encontro_registros_procesos);',
'',
'   if :P72_CODIGO_EMPRESA_CONSOLIDADORA is null or :P72_ID_FLUJO is null Then',
'      Raise_Application_Error(-20333,'' No puede generar el flujo, hace falta informacion '');',
'   end if;',
'',
'   if nvl(l_encontro_registros_procesos,0) = 0 then',
'       update saf.Flujo_Efectivo_Historico',
'       set PROCESADO=''S'',',
'           usuario_proceso = :GLOBAL_CODIGO_USUARIO,',
'           Fecha_Proceso = sysdate',
'       where id=:P72_ID_FLUJO',
'         and empresa_consolidadora = :P72_CODIGO_EMPRESA_CONSOLIDADORA;',
'       Commit;',
'       saf.PR_INSERTA_PRESUPUESTO_SEMANAL(:P72_ID_SEMANA, :P72_ID_FLUJO,:P72_CODIGO_EMPRESA_CONSOLIDADORA);',
'',
'       SAF.Pr_Inserta_Presupuesto_Semanal_Anticipos(:P72_ID_SEMANA, :P72_ID_FLUJO,:P72_CODIGO_EMPRESA_CONSOLIDADORA);',
'',
'       SAF.Pr_Inserta_Prestamo_Semana(:P72_ID_SEMANA, :P72_ID_FLUJO,:P72_CODIGO_EMPRESA_CONSOLIDADORA);',
'',
'       SAF.Pr_Inserta_caja_chica_presupuesto(:P72_ID_SEMANA, :P72_ID_FLUJO,:P72_CODIGO_EMPRESA_CONSOLIDADORA);',
'',
'       SAF.Pr_Inserta_Viaticos(:P72_ID_SEMANA, :P72_ID_FLUJO,:P72_CODIGO_EMPRESA_CONSOLIDADORA);',
'       ',
'       SAF.Pr_Inserta_pagos_direccion_presupuesto(:P72_ID_SEMANA, :P72_ID_FLUJO,:P72_CODIGO_EMPRESA_CONSOLIDADORA);',
'',
'       SAF.Pr_Inserta_Tarjeta_Credito(:P72_ID_SEMANA, :P72_ID_FLUJO,:P72_CODIGO_EMPRESA_CONSOLIDADORA);',
'',
'        -- SAF.FLUJO_EFECTIVO_FDU_TRANSACCIONES_FINANCIERAS',
'        SAF.PR_INSERTA_TRANSACCIONES_FINANCIERAS(:P72_ID_SEMANA, :P72_ID_FLUJO, :P72_CODIGO_EMPRESA_CONSOLIDADORA);',
'        -- SAF.FLUJO_EFECTIVO_FDU_TRANSACCIONES_FINANCIERAS',
'',
'       commit;',
'',
'        BEGIN',
'            PR_CORREO_NOTIFICAR_FLUJO_EFECTIVO(:P72_ID_FLUJO,:P72_CODIGO_EMPRESA_CONSOLIDADORA);',
'        END;',
'   Else',
'       Raise_Application_Error(-20333,'' Existen registros aplicados previamente, por lo tanto ya no se pueden hacer modificaciones'');',
'   end if;',
'End;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Registros Aplicados'
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
