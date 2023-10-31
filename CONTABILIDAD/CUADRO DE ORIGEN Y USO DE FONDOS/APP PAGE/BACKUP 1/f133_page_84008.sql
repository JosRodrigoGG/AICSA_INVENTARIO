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
--     PAGE: 84008
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84008
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84008);
end;
/
prompt --application/pages/page_84008
begin
wwv_flow_imp_page.create_page(
 p_id=>84008
,p_name=>'CARGA_PAGOS_RUBRO'
,p_alias=>'CARGA-PAGOS-RUBRO'
,p_page_mode=>'MODAL'
,p_step_title=>'CARGA_PAGOS_RUBRO'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_FILES#crear-btns-modal.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const $btns = [',
'    {',
'        textBtn: ''Guardar'',',
'        icon: ''fa-save'',',
'        idbtn: ''GUARDAR''',
'    },',
'    {',
'        textBtn: ''Cancelar'',',
'        icon: ''fa-remove'',',
'        idbtn: ''CANCELAR'',',
'    }',
'];',
'',
'customButtonsModal(''MODAL_CARGA_PAGOS_RUBRO'', $btns);'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'400'
,p_dialog_max_width=>'400'
,p_dialog_css_classes=>'MODAL_CARGA_PAGOS_RUBRO'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230927175457'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(215123592737639920)
,p_button_sequence=>30
,p_button_name=>'CANCELAR'
,p_button_static_id=>'CANCELAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'Cancelar'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(215123183943639919)
,p_button_sequence=>40
,p_button_name=>'GUARDAR'
,p_button_static_id=>'GUARDAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'Guardar'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(215123961078639920)
,p_name=>'P84008_PAGOS_ASOCIADOS'
,p_item_sequence=>10
,p_prompt=>'Pagos Asociados'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
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
'	) DESCRIPCION,',
'    A.ID',
'FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS A',
'INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS B',
'	ON B.ID = A.ID_FDU_TRANSACCIONES_FINANCIERAS',
'LEFT JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL C',
'	ON C.ID_FDU_TRANSACCIONES_FINANCIERA = A.ID_FDU_TRANSACCIONES_FINANCIERAS',
'	AND C.MES = A.MES',
'	AND C.ANIO = A.ANIO',
'	AND C.ESTADO != 3',
'LEFT JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS D',
'	ON D.ID_FDU_TRANSACCIONES_FINANCIERAS = A.ID_FDU_TRANSACCIONES_FINANCIERAS',
'	AND D.MES = A.MES',
'	AND D.ANIO = A.ANIO',
'	AND D.ESTADO != 3',
'	AND D.MONTO_ORIGEN > 0',
'INNER JOIN SAF.GRAL_MONEDAS E',
'	ON B.CODIGO_MONEDA = E.CODIGO_MONEDA',
'WHERE A.ID_FDU_TRANSACCIONES_FINANCIERAS = :P84008_ID',
'AND A.ESTADO != 3',
'AND A.ID NOT IN ',
'(',
'    SELECT',
'        A.C003 ID_ASOCIACION',
'    FROM APEX_COLLECTIONS A',
'    WHERE A.COLLECTION_NAME = ''COLLECTION_DETALLE_PAGOS''',
'    AND A.C007 <> 3',
'    AND A.C002 = ''INTERES''',
');'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P84008_ID'
,p_ajax_items_to_submit=>'P84008_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(215124360357639921)
,p_name=>'P84008_ID'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215126156245639927)
,p_name=>'CANCELAR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(215123592737639920)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215126672314639927)
,p_event_id=>wwv_flow_imp.id(215126156245639927)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84008,estado:0});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(215124796963639922)
,p_name=>'GUARDAR_REGISTRO'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(215123183943639919)
,p_condition_element=>'P84008_PAGOS_ASOCIADOS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215125751784639925)
,p_event_id=>wwv_flow_imp.id(215124796963639922)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATO'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ID NUMBER;',
'    V_MES NUMBER;',
'    V_ANIO VARCHAR2(6);',
'BEGIN',
'    SELECT',
'        MES,',
'        ANIO,',
'        ID_FDU_TRANSACCIONES_FINANCIERAS',
'    INTO',
'        V_MES,',
'        V_ANIO,',
'        V_ID',
'    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS',
'    WHERE ID = :P84008_PAGOS_ASOCIADOS;',
'',
'    DECLARE',
'        CURSOR C_DATOS IS',
'            SELECT',
'                ID',
'            FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_COBRADOS',
'            WHERE ID_FDU_TRANSACCIONES_FINANCIERAS = V_ID',
'            AND MES = V_MES',
'            AND ANIO = V_ANIO',
'            AND ESTADO != 3;',
'    BEGIN',
'        FOR R_DATOS IN C_DATOS',
'        LOOP',
'            APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''COLLECTION_DETALLE_PAGOS'',',
'                p_c001 => NULL,',
'                p_c002 => ''INTERES'',',
'                p_c003 => R_DATOS.ID,',
'                p_c004 => V_MES,',
'                p_c005 => V_ANIO,',
'                p_c006 => NULL,',
'                p_c007 => 4',
'            );',
'        END LOOP;',
'    END;',
'',
'    DECLARE',
'        CURSOR C_DATOS IS',
'            SELECT',
'                ID',
'            FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_PAGOS_CAPITAL',
'            WHERE ID_FDU_TRANSACCIONES_FINANCIERA = V_ID',
'            AND MES = V_MES',
'            AND ANIO = V_ANIO',
'            AND ESTADO != 3;',
'    BEGIN',
'        FOR R_DATOS IN C_DATOS',
'        LOOP',
'            APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''COLLECTION_DETALLE_PAGOS'',',
'                p_c001 => NULL,',
'                p_c002 => ''CAPITAL'',',
'                p_c003 => R_DATOS.ID,',
'                p_c004 => V_MES,',
'                p_c005 => V_ANIO,',
'                p_c006 => NULL,',
'                p_c007 => 4',
'            );',
'        END LOOP;',
'    END;',
'',
'    DECLARE',
'        CURSOR C_DATOS IS',
'            SELECT',
'                ID',
'            FROM SAF.FDU_TRANSACCIONES_FINANCIERAS_MORAS',
'            WHERE ID_FDU_TRANSACCIONES_FINANCIERAS = V_ID',
'            AND MES = V_MES',
'            AND ANIO = V_ANIO',
'            AND ESTADO != 3;',
'    BEGIN',
'        FOR R_DATOS IN C_DATOS',
'        LOOP',
'            APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''COLLECTION_DETALLE_PAGOS'',',
'                p_c001 => NULL,',
'                p_c002 => ''MORA'',',
'                p_c003 => R_DATOS.ID,',
'                p_c004 => V_MES,',
'                p_c005 => V_ANIO,',
'                p_c006 => NULL,',
'                p_c007 => 4',
'            );',
'        END LOOP;',
'    END;',
'END;'))
,p_attribute_02=>'P84008_PAGOS_ASOCIADOS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(215125206941639924)
,p_event_id=>wwv_flow_imp.id(215124796963639922)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84008,estado:1});'
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
