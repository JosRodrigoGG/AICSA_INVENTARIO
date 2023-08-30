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
--     PAGE: 165
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00165
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>165);
end;
/
prompt --application/pages/page_00165
begin
wwv_flow_imp_page.create_page(
 p_id=>165
,p_name=>'ASOCIAR_VALORES_UNITARIOS_INTEGRO'
,p_alias=>'ASOCIAR-VALORES-UNITARIOS-INTEGRO'
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#crear-btns-modal.js',
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var btns = [',
'    /*{',
'        textBtn: ''Eliminar'',',
'        icon: ''fa-trash'',',
'        idbtn: ''ELIMINAR'',',
'        itemCondicional: ''P165_TIPO_REGISTRO'',',
'        condicional: ''2''',
'    },*/',
'    {',
'        textBtn: ''Guardar'',',
'        icon: ''fa-save'',',
'        idbtn: ''GUARDAR'',',
'    },',
'    {',
'        textBtn: ''Cancelar'',',
'        icon: ''fa-remove'',',
'        idbtn: ''CANCELAR'',',
'    }',
']',
'',
'customButtonsModal(''MODAL'', btns);'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'MODAL'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230823124039'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195732485376568518)
,p_plug_name=>'REGION'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195732593864568519)
,p_plug_name=>'ANIO_1'
,p_region_name=>'ANIO_1'
,p_parent_plug_id=>wwv_flow_imp.id(195732485376568518)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195733025851568524)
,p_plug_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(195732593864568519)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(198578737011872712)
,p_plug_display_sequence=>20
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195733165922568525)
,p_plug_name=>'Audit'
,p_parent_plug_id=>wwv_flow_imp.id(195732593864568519)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>40
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P165_ID_1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195732663370568520)
,p_plug_name=>'ANIO_2'
,p_region_name=>'ANIO_2'
,p_parent_plug_id=>wwv_flow_imp.id(195732485376568518)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195734080769568534)
,p_plug_name=>'Audit'
,p_parent_plug_id=>wwv_flow_imp.id(195732663370568520)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>20
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P165_ID_2'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195734534658568539)
,p_plug_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(195732663370568520)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(1114834737877253448)
,p_plug_display_sequence=>10
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(197234348020878819)
,p_button_sequence=>130
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
 p_id=>wwv_flow_imp.id(197234699315878822)
,p_button_sequence=>140
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(213170936756476143)
,p_button_sequence=>150
,p_button_name=>'ELIMINAR'
,p_button_static_id=>'ELIMINAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'ELIMINAR'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195732364382568517)
,p_name=>'P165_REGISTRO'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195732879465568522)
,p_name=>'P165_ID_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(195734534658568539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195732919968568523)
,p_name=>'P165_ID_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(195733025851568524)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195733220880568526)
,p_name=>'P165_USUARIO_GRABACION_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(195733165922568525)
,p_prompt=>'Creado Por'
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
 p_id=>wwv_flow_imp.id(195733340246568527)
,p_name=>'P165_USUARIO_MODIFICACION_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(195733165922568525)
,p_prompt=>'Modificado Por'
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
 p_id=>wwv_flow_imp.id(195733420509568528)
,p_name=>'P165_FECHA_GRABACION_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(195733165922568525)
,p_prompt=>'Fecha Creacion'
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
 p_id=>wwv_flow_imp.id(195733511993568529)
,p_name=>'P165_FECHA_MODIFICACION_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(195733165922568525)
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
 p_id=>wwv_flow_imp.id(195734104613568535)
,p_name=>'P165_USUARIO_GRABACION_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(195734080769568534)
,p_prompt=>'Creado Por'
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
 p_id=>wwv_flow_imp.id(195734271657568536)
,p_name=>'P165_FECHA_GRABACION_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(195734080769568534)
,p_prompt=>'Fecha Creacion'
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
 p_id=>wwv_flow_imp.id(195734369378568537)
,p_name=>'P165_USUARIO_MODIFICACION_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(195734080769568534)
,p_prompt=>'Modificado Por'
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
 p_id=>wwv_flow_imp.id(195734478908568538)
,p_name=>'P165_FECHA_MODIFICACION_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(195734080769568534)
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
 p_id=>wwv_flow_imp.id(195734634219568540)
,p_name=>'P165_ANIO'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195734729520568541)
,p_name=>'P165_ANIO_1'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195734872786568542)
,p_name=>'P165_MES_INICIO'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195734996213568543)
,p_name=>'P165_MES_FIN'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195735081711568544)
,p_name=>'P165_TIPO_REPORTE'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195735107328568545)
,p_name=>'P165_VALOR_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(195733025851568524)
,p_prompt=>'Valor'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195735245222568546)
,p_name=>'P165_VALOR_2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(195734534658568539)
,p_prompt=>'Valor'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195735372110568547)
,p_name=>'P165_MONEDA_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(195733025851568524)
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	NOMBRE_MONEDA,',
'	CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS;'))
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
 p_id=>wwv_flow_imp.id(195735484619568548)
,p_name=>'P165_MONEDA_2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(195734534658568539)
,p_prompt=>'Moneda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	NOMBRE_MONEDA,',
'	CODIGO_MONEDA',
'FROM SAF.GRAL_MONEDAS;'))
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
 p_id=>wwv_flow_imp.id(195735505819568549)
,p_name=>'P165_CAMBIO_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(195733025851568524)
,p_prompt=>'Tipo de Cambio'
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
 p_id=>wwv_flow_imp.id(195735611508568550)
,p_name=>'P165_CAMBIO_2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(195734534658568539)
,p_prompt=>'Tipo de Cambio'
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
 p_id=>wwv_flow_imp.id(202310186193953447)
,p_name=>'P165_EMPRESA'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213168179518476115)
,p_name=>'P165_CONCEPTO_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(195733025851568524)
,p_prompt=>'Concepto'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P165_TIPO_REPORTE'
,p_display_when2=>'5'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213168204028476116)
,p_name=>'P165_CONCEPTO_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(195734534658568539)
,p_prompt=>'Concepto'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P165_TIPO_REPORTE'
,p_display_when2=>'5'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(213169127192476125)
,p_name=>'P165_TIPO_REGISTRO'
,p_item_sequence=>100
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216558532490949605)
,p_name=>'P165_NUMERO_PRESTAMO_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(195733025851568524)
,p_prompt=>'Numero Prestamo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P165_TIPO_REPORTE'
,p_display_when2=>'5'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216558677628949606)
,p_name=>'P165_NUMERO_PRESTAMO_2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(195734534658568539)
,p_prompt=>'Numero Prestamo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P165_TIPO_REPORTE'
,p_display_when2=>'5'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216559040019949610)
,p_name=>'P165_COD_CTA'
,p_item_sequence=>110
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216559397856949613)
,p_name=>'P165_ELIMINAR_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(195733025851568524)
,p_prompt=>'Eliminar'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P165_TIPO_REPORTE = 5 AND',
':P165_ID_1 IS NOT NULL'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(99636457529244025)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'S'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(216559456872949614)
,p_name=>'P165_ELIMINAR_2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(195734534658568539)
,p_prompt=>'Eliminar'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P165_TIPO_REPORTE = 5 AND',
':P165_ID_2 IS NOT NULL'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(99636457529244025)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'S'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(197232509940878801)
,p_name=>'CARGAR_DATOS'
,p_event_sequence=>10
,p_condition_element=>'P165_TIPO_REPORTE'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'5'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197232880527878804)
,p_event_id=>wwv_flow_imp.id(197232509940878801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P165_USUARIO_GRABACION_1,P165_USUARIO_GRABACION_2,P165_USUARIO_MODIFICACION_2,P165_USUARIO_MODIFICACION_1,P165_FECHA_GRABACION_2,P165_FECHA_MODIFICACION_2,P165_FECHA_GRABACION_1,P165_FECHA_MODIFICACION_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197232645415878802)
,p_event_id=>wwv_flow_imp.id(197232509940878801)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'NOMBRES'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item(''P165_TIPO_REPORTE'').getValue() == ''1'') {',
'    apex.util.getTopApex().jQuery(".MODAL .ui-dialog-title").text(''Valores Balance de Situacion Financiera'');',
'} else if (apex.item(''P165_TIPO_REPORTE'').getValue() == ''2'') {',
'    apex.util.getTopApex().jQuery(".MODAL .ui-dialog-title").text(''Valores Balance de Estado de Resultado'');',
'} else if (apex.item(''P165_TIPO_REPORTE'').getValue() == ''5'') {',
'    apex.util.getTopApex().jQuery(".MODAL .ui-dialog-title").text(''Prestamos Bancarios'');',
'} else {',
'    apex.util.getTopApex().jQuery(".MODAL .ui-dialog-title").text(''Region'');',
'}',
'',
'document.getElementById(''ANIO_1_heading'').innerText = apex.item(''P165_ANIO'').getValue();',
'document.getElementById(''ANIO_2_heading'').innerText = apex.item(''P165_ANIO_1'').getValue();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213169267253476126)
,p_name=>'CARGAR_DATOS_5'
,p_event_sequence=>20
,p_condition_element=>'P165_TIPO_REPORTE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'5'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213169340545476127)
,p_event_id=>wwv_flow_imp.id(213169267253476126)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'DISABLE ITEMS'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P165_USUARIO_GRABACION_1,P165_USUARIO_GRABACION_2,P165_USUARIO_MODIFICACION_2,P165_USUARIO_MODIFICACION_1,P165_FECHA_GRABACION_2,P165_FECHA_MODIFICACION_2,P165_FECHA_GRABACION_1,P165_FECHA_MODIFICACION_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213169438559476128)
,p_event_id=>wwv_flow_imp.id(213169267253476126)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'NOMBRES'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.item(''P165_TIPO_REPORTE'').getValue() == ''1'') {',
'    apex.util.getTopApex().jQuery(".MODAL .ui-dialog-title").text(''Valores Balance de Situacion Financiera'');',
'} else if (apex.item(''P165_TIPO_REPORTE'').getValue() == ''2'') {',
'    apex.util.getTopApex().jQuery(".MODAL .ui-dialog-title").text(''Valores Balance de Estado de Resultado'');',
'} else if (apex.item(''P165_TIPO_REPORTE'').getValue() == ''5'') {',
'    apex.util.getTopApex().jQuery(".MODAL .ui-dialog-title").text(''Prestamos Bancarios'');',
'} else {',
'    apex.util.getTopApex().jQuery(".MODAL .ui-dialog-title").text(''Region'');',
'}',
'',
'document.getElementById(''ANIO_1_heading'').innerText = apex.item(''P165_ANIO'').getValue();',
'document.getElementById(''ANIO_2_heading'').innerText = apex.item(''P165_ANIO_1'').getValue();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216559693211949616)
,p_event_id=>wwv_flow_imp.id(213169267253476126)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'NUMERO_PRESTAMO_1'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P165_NUMERO_PRESTAMO_1'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P165_ID_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216559738272949617)
,p_event_id=>wwv_flow_imp.id(213169267253476126)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'NUMERO_PRESTAMO_2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P165_NUMERO_PRESTAMO_2'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P165_ID_2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(197234443412878820)
,p_name=>'CANCELAR'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(197234348020878819)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197234527656878821)
,p_event_id=>wwv_flow_imp.id(197234443412878820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR MODAL'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(197234788383878823)
,p_name=>'GUARDAR'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(197234699315878822)
,p_condition_element=>'P165_TIPO_REPORTE'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'5'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197233120617878807)
,p_event_id=>wwv_flow_imp.id(197234788383878823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P165_ID_1 IS NULL THEN',
'    INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO ',
'    (',
'    	ANIO,',
'    	MES_INICIO,',
'    	MES_FIN,',
'    	MONEDA_ORIGEN,',
'    	VALOR_CAMBIO,',
'    	VALOR,',
'    	TIPO_REPORTE,',
'    	ID_PLANTILLA_NOTA,',
'        CODIGO_EMPRESA,',
'    	USUARIO_GRABACION,',
'    	FECHA_GRABACION',
'    )',
'    VALUES',
'    (',
'        :P165_ANIO,',
'        :P165_MES_INICIO,',
'        :P165_MES_FIN,',
'        :P165_MONEDA_1,',
'        NVL(:P165_CAMBIO_1, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_1)),',
'        :P165_VALOR_1,',
'        :P165_TIPO_REPORTE,',
'        :P165_REGISTRO,',
'        :P165_EMPRESA,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'END IF;'))
,p_attribute_02=>'P165_ID_1,P165_ANIO,P165_MES_INICIO,P165_MES_FIN,P165_MONEDA_1,P165_CAMBIO_1,P165_VALOR_1,P165_TIPO_REPORTE,P165_REGISTRO,P165_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P165_MONEDA_1'').getValue() != '''' &&',
'//apex.item(''P165_CAMBIO_1'').getValue() != '''' &&',
'apex.item(''P165_VALOR_1'').getValue() != '''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197235165649878827)
,p_event_id=>wwv_flow_imp.id(197234788383878823)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P165_ID_1 IS NOT NULL THEN',
'    UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO SET',
'        MONEDA_ORIGEN = :P165_MONEDA_1,',
'        VALOR_CAMBIO = NVL(:P165_CAMBIO_1, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_1)),',
'        VALOR = :P165_VALOR_1,',
'        USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'        FECHA_MODIFICACION = SYSDATE',
'    WHERE ID = :P165_ID_1;',
'END IF;'))
,p_attribute_02=>'P165_ID_1,P165_ANIO,P165_MES_INICIO,P165_MES_FIN,P165_MONEDA_1,P165_CAMBIO_1,P165_VALOR_1,P165_TIPO_REPORTE,P165_REGISTRO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P165_MONEDA_1'').getValue() != '''' &&',
'//apex.item(''P165_CAMBIO_1'').getValue() != '''' &&',
'apex.item(''P165_VALOR_1'').getValue() != '''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197233287491878808)
,p_event_id=>wwv_flow_imp.id(197234788383878823)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P165_ID_2 IS NULL THEN',
'    INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO ',
'    (',
'    	ANIO,',
'    	MES_INICIO,',
'    	MES_FIN,',
'    	MONEDA_ORIGEN,',
'    	VALOR_CAMBIO,',
'    	VALOR,',
'    	TIPO_REPORTE,',
'    	ID_PLANTILLA_NOTA,',
'        CODIGO_EMPRESA,',
'    	USUARIO_GRABACION,',
'    	FECHA_GRABACION',
'    )',
'    VALUES',
'    (',
'        :P165_ANIO_1,',
'        :P165_MES_INICIO,',
'        :P165_MES_FIN,',
'        :P165_MONEDA_2,',
'        NVL(:P165_CAMBIO_2, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_2)),',
'        :P165_VALOR_2,',
'        :P165_TIPO_REPORTE,',
'        :P165_REGISTRO,',
'        :P165_EMPRESA,',
'        :GLOBAL_CODIGO_USUARIO,',
'        SYSDATE',
'    );',
'END IF;'))
,p_attribute_02=>'P165_ID_2,P165_ANIO_1,P165_MES_INICIO,P165_MES_FIN,P165_MONEDA_2,P165_CAMBIO_2,P165_VALOR_2,P165_TIPO_REPORTE,P165_REGISTRO,P165_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P165_MONEDA_2'').getValue() != '''' &&',
'//apex.item(''P165_CAMBIO_2'').getValue() != '''' &&',
'apex.item(''P165_VALOR_2'').getValue() != '''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197235247265878828)
,p_event_id=>wwv_flow_imp.id(197234788383878823)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P165_ID_2 IS NOT NULL THEN',
'    UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO SET',
'        MONEDA_ORIGEN = :P165_MONEDA_2,',
'        VALOR_CAMBIO = NVL(:P165_CAMBIO_2, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_2)),',
'        VALOR = :P165_VALOR_2,',
'        USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'        FECHA_MODIFICACION = SYSDATE',
'    WHERE ID = :P165_ID_2;',
'END IF;'))
,p_attribute_02=>'P165_ID_2,P165_ANIO_1,P165_MES_INICIO,P165_MES_FIN,P165_MONEDA_2,P165_CAMBIO_2,P165_VALOR_2,P165_TIPO_REPORTE,P165_REGISTRO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P165_MONEDA_2'').getValue() != '''' &&',
'//apex.item(''P165_CAMBIO_2'').getValue() != '''' &&',
'apex.item(''P165_VALOR_2'').getValue() != '''''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197234910483878825)
,p_event_id=>wwv_flow_imp.id(197234788383878823)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR MODAL'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213168354499476117)
,p_name=>'GUARDAR_5'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(197234699315878822)
,p_condition_element=>'P165_TIPO_REPORTE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'5'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213168407867476118)
,p_event_id=>wwv_flow_imp.id(213168354499476117)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS_1 IS',
'        SELECT',
'            COUNT(*)',
'        FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'        WHERE NUMERO_PRESTAMO = :P165_NUMERO_PRESTAMO_1',
'        AND CODIGO_EMPRESA = :P165_EMPRESA',
'        AND ANIO = :P165_ANIO',
'        AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'        AND ID_PLANTILLA_NOTA = :P165_REGISTRO',
'        AND MES_FIN = :P165_MES_FIN;',
'',
'    V_ID NUMBER;',
'BEGIN',
'    OPEN C_DATOS_1;',
'        FETCH C_DATOS_1 INTO V_ID;',
'    CLOSE C_DATOS_1;',
'',
'    IF :P165_ID_1 IS NULL AND :P165_TIPO_REGISTRO = ''1'' THEN',
'        IF :P165_CONCEPTO_1 IS NOT NULL',
'            AND :P165_MONEDA_1 IS NOT NULL',
'            AND :P165_VALOR_1 IS NOT NULL ',
'            AND :P165_NUMERO_PRESTAMO_1 IS NOT NULL THEN',
'            IF V_ID != 0 THEN',
'                UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO',
'                    SET CONCEPTO = :P165_CONCEPTO_1,',
'                    MONEDA_ORIGEN = :P165_MONEDA_1,',
'                    VALOR_CAMBIO = NVL(:P165_CAMBIO_1, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_1)),',
'                    VALOR = NVL(:P165_VALOR_1, 0),',
'                    USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'                    FECHA_MODIFICACION = SYSDATE',
'                WHERE NUMERO_PRESTAMO = :P165_NUMERO_PRESTAMO_1',
'                AND CODIGO_EMPRESA = :P165_EMPRESA',
'                AND ANIO = :P165_ANIO',
'                AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'                AND ID_PLANTILLA_NOTA = :P165_REGISTRO',
'                AND MES_FIN = :P165_MES_FIN; ',
'            ELSE',
'                INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO ',
'                    (',
'                    	ANIO,',
'                    	MES_INICIO,',
'                    	MES_FIN,',
'                    	MONEDA_ORIGEN,',
'                    	VALOR_CAMBIO,',
'                    	VALOR,',
'                        CONCEPTO,',
'                    	TIPO_REPORTE,',
'                    	ID_PLANTILLA_NOTA,',
'                        CODIGO_EMPRESA,',
'                        NUMERO_PRESTAMO,',
'                    	USUARIO_GRABACION,',
'                    	FECHA_GRABACION',
'                    )',
'                    VALUES',
'                    (',
'                        :P165_ANIO,',
'                        :P165_MES_INICIO,',
'                        :P165_MES_FIN,',
'                        :P165_MONEDA_1,',
'                        NVL(:P165_CAMBIO_1, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_1)),',
'                        NVL(:P165_VALOR_1, 0),',
'                        :P165_CONCEPTO_1,',
'                        :P165_TIPO_REPORTE,',
'                        :P165_REGISTRO,',
'                        :P165_EMPRESA,',
'                        :P165_NUMERO_PRESTAMO_1,',
'                        :GLOBAL_CODIGO_USUARIO,',
'                        SYSDATE',
'                    );',
'            END IF;',
'        END IF;',
'    END IF;',
'END;'))
,p_attribute_02=>'P165_ANIO,P165_MES_INICIO,P165_MES_FIN,P165_MONEDA_1,P165_CAMBIO_1,P165_VALOR_2,P165_CONCEPTO_1,P165_TIPO_REPORTE,P165_REGISTRO,P165_EMPRESA,P165_VALOR_1,P165_ANIO_1,P165_CAMBIO_2,P165_MONEDA_2,P165_CONCEPTO_2,P165_NUMERO_PRESTAMO_1,P165_NUMERO_PREST'
||'AMO_2'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216559591100949615)
,p_event_id=>wwv_flow_imp.id(213168354499476117)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_1'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS_1 IS',
'        SELECT',
'            COUNT(*)',
'        FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'        WHERE NUMERO_PRESTAMO = :P165_NUMERO_PRESTAMO_1',
'        AND CODIGO_EMPRESA = :P165_EMPRESA',
'        AND ANIO = :P165_ANIO',
'        AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'        AND ID_PLANTILLA_NOTA = :P165_REGISTRO',
'        AND MES_FIN = :P165_MES_FIN;',
'',
'    V_ID NUMBER;',
'BEGIN',
'    OPEN C_DATOS_1;',
'        FETCH C_DATOS_1 INTO V_ID;',
'    CLOSE C_DATOS_1;',
'',
'    IF NVL(:P165_ELIMINAR_1, ''N'') = ''N'' THEN',
'        IF:P165_ID_1 IS NOT NULL AND :P165_TIPO_REGISTRO = ''2'' THEN',
'            UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO',
'                SET CONCEPTO = :P165_CONCEPTO_1,',
'                MONEDA_ORIGEN = :P165_MONEDA_1,',
'                VALOR_CAMBIO = NVL(:P165_CAMBIO_1, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_1)),',
'                VALOR = NVL(:P165_VALOR_1, 0),',
'                USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'                FECHA_MODIFICACION = SYSDATE',
'            WHERE ID = :P165_ID_1; ',
'        END IF;',
'',
'        IF :P165_ID_1 IS NULL AND :P165_TIPO_REGISTRO = ''2'' THEN',
'            IF :P165_CONCEPTO_1 IS NOT NULL',
'                AND :P165_MONEDA_1 IS NOT NULL',
'                AND :P165_VALOR_1 IS NOT NULL ',
'                AND :P165_NUMERO_PRESTAMO_1 IS NOT NULL THEN',
'                INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO ',
'                (',
'                	ANIO,',
'                	MES_INICIO,',
'                	MES_FIN,',
'                	MONEDA_ORIGEN,',
'                	VALOR_CAMBIO,',
'                	VALOR,',
'                    CONCEPTO,',
'                	TIPO_REPORTE,',
'                	ID_PLANTILLA_NOTA,',
'                    CODIGO_EMPRESA,',
'                    NUMERO_PRESTAMO,',
'                	USUARIO_GRABACION,',
'                	FECHA_GRABACION',
'                )',
'                VALUES',
'                (',
'                    :P165_ANIO,',
'                    :P165_MES_INICIO,',
'                    :P165_MES_FIN,',
'                    :P165_MONEDA_1,',
'                    NVL(:P165_CAMBIO_1, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_1)),',
'                    NVL(:P165_VALOR_1, 0),',
'                    :P165_CONCEPTO_1,',
'                    :P165_TIPO_REPORTE,',
'                    :P165_REGISTRO,',
'                    :P165_EMPRESA,',
'                    :P165_NUMERO_PRESTAMO_1,',
'                    :GLOBAL_CODIGO_USUARIO,',
'                    SYSDATE',
'                );',
'            END IF;',
'        END IF;',
'    ELSE',
'        DELETE FROM SAF.REPORTES_FINANCIEROS_INTEGRO WHERE ID = :P165_ID_1;',
'    END IF;   ',
'END;'))
,p_attribute_02=>'P165_ANIO,P165_MES_INICIO,P165_MES_FIN,P165_MONEDA_1,P165_CAMBIO_1,P165_VALOR_2,P165_CONCEPTO_1,P165_TIPO_REPORTE,P165_REGISTRO,P165_EMPRESA,P165_VALOR_1,P165_ANIO_1,P165_CAMBIO_2,P165_MONEDA_2,P165_CONCEPTO_2,P165_NUMERO_PRESTAMO_1,P165_NUMERO_PREST'
||'AMO_2,P165_ELIMINAR_1,P165_ELIMINAR_2,P165_TIPO_REGISTRO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216558944377949609)
,p_event_id=>wwv_flow_imp.id(213168354499476117)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'GUARDAR_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS_2 IS',
'        SELECT',
'            COUNT(*)',
'        FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'        WHERE NUMERO_PRESTAMO = :P165_NUMERO_PRESTAMO_2',
'        AND CODIGO_EMPRESA = :P165_EMPRESA',
'        AND ANIO = :P165_ANIO_1',
'        AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'        AND ID_PLANTILLA_NOTA = :P165_REGISTRO',
'        AND MES_FIN = :P165_MES_FIN;',
'',
'    V_ID NUMBER;',
'BEGIN',
'    OPEN C_DATOS_2;',
'        FETCH C_DATOS_2 INTO V_ID;',
'    CLOSE C_DATOS_2;',
'',
'    IF :P165_ID_2 IS NULL AND :P165_TIPO_REGISTRO = ''1'' THEN',
'        IF :P165_CONCEPTO_2 IS NOT NULL',
'            AND :P165_MONEDA_2 IS NOT NULL',
'            AND :P165_VALOR_2 IS NOT NULL ',
'            AND :P165_NUMERO_PRESTAMO_2 IS NOT NULL THEN',
'            IF V_ID != 0 THEN',
'                UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO',
'                    SET CONCEPTO = :P165_CONCEPTO_2,',
'                    MONEDA_ORIGEN = :P165_MONEDA_2,',
'                    VALOR_CAMBIO = NVL(:P165_CAMBIO_2, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_2)),',
'                    VALOR = NVL(:P165_VALOR_2, 0),',
'                    USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'                    FECHA_MODIFICACION = SYSDATE',
'                WHERE NUMERO_PRESTAMO = :P165_NUMERO_PRESTAMO_2',
'                AND CODIGO_EMPRESA = :P165_EMPRESA',
'                AND ANIO = :P165_ANIO',
'                AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'                AND ID_PLANTILLA_NOTA = :P165_REGISTRO',
'                AND MES_FIN = :P165_MES_FIN; ',
'            ELSE',
'                INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO ',
'                    (',
'                    	ANIO,',
'                    	MES_INICIO,',
'                    	MES_FIN,',
'                    	MONEDA_ORIGEN,',
'                    	VALOR_CAMBIO,',
'                    	VALOR,',
'                        CONCEPTO,',
'                    	TIPO_REPORTE,',
'                    	ID_PLANTILLA_NOTA,',
'                        CODIGO_EMPRESA,',
'                        NUMERO_PRESTAMO,',
'                    	USUARIO_GRABACION,',
'                    	FECHA_GRABACION',
'                    )',
'                    VALUES',
'                    (',
'                        :P165_ANIO_1,',
'                        :P165_MES_INICIO,',
'                        :P165_MES_FIN,',
'                        :P165_MONEDA_2,',
'                        NVL(:P165_CAMBIO_2, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_2)),',
'                        NVL(:P165_VALOR_2, 0),',
'                        :P165_CONCEPTO_2,',
'                        :P165_TIPO_REPORTE,',
'                        :P165_REGISTRO,',
'                        :P165_EMPRESA,',
'                        :P165_NUMERO_PRESTAMO_2,',
'                        :GLOBAL_CODIGO_USUARIO,',
'                        SYSDATE',
'                    );',
'            END IF;',
'        END IF;',
'    END IF;',
'END;'))
,p_attribute_02=>'P165_ANIO,P165_MES_INICIO,P165_MES_FIN,P165_MONEDA_1,P165_CAMBIO_1,P165_VALOR_2,P165_CONCEPTO_1,P165_TIPO_REPORTE,P165_REGISTRO,P165_EMPRESA,P165_VALOR_1,P165_ANIO_1,P165_CAMBIO_2,P165_MONEDA_2,P165_CONCEPTO_2,P165_NUMERO_PRESTAMO_1,P165_NUMERO_PREST'
||'AMO_2'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(216559860520949618)
,p_event_id=>wwv_flow_imp.id(213168354499476117)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'UPDATE_2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS_1 IS',
'        SELECT',
'            COUNT(*)',
'        FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'        WHERE NUMERO_PRESTAMO = :P165_NUMERO_PRESTAMO_2',
'        AND CODIGO_EMPRESA = :P165_EMPRESA',
'        AND ANIO = :P165_ANIO_1',
'        AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'        AND ID_PLANTILLA_NOTA = :P165_REGISTRO',
'        AND MES_FIN = :P165_MES_FIN;',
'',
'    V_ID NUMBER;',
'BEGIN',
'    OPEN C_DATOS_1;',
'        FETCH C_DATOS_1 INTO V_ID;',
'    CLOSE C_DATOS_1;',
'',
'    IF NVL(:P165_ELIMINAR_2, ''N'') = ''N'' THEN',
'        IF:P165_ID_2 IS NOT NULL AND :P165_TIPO_REGISTRO = ''2'' THEN',
'            UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO',
'                SET CONCEPTO = :P165_CONCEPTO_2,',
'                MONEDA_ORIGEN = :P165_MONEDA_2,',
'                VALOR_CAMBIO = NVL(:P165_CAMBIO_2, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_2)),',
'                VALOR = NVL(:P165_VALOR_2, 0),',
'                USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'                FECHA_MODIFICACION = SYSDATE',
'            WHERE ID = :P165_ID_2; ',
'        END IF;',
'',
'        IF :P165_ID_2 IS NULL AND :P165_TIPO_REGISTRO = ''2'' THEN',
'            IF :P165_CONCEPTO_2 IS NOT NULL',
'                AND :P165_MONEDA_2 IS NOT NULL',
'                AND :P165_VALOR_2 IS NOT NULL ',
'                AND :P165_NUMERO_PRESTAMO_2 IS NOT NULL THEN',
'                INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO ',
'                (',
'                	ANIO,',
'                	MES_INICIO,',
'                	MES_FIN,',
'                	MONEDA_ORIGEN,',
'                	VALOR_CAMBIO,',
'                	VALOR,',
'                    CONCEPTO,',
'                	TIPO_REPORTE,',
'                	ID_PLANTILLA_NOTA,',
'                    CODIGO_EMPRESA,',
'                    NUMERO_PRESTAMO,',
'                	USUARIO_GRABACION,',
'                	FECHA_GRABACION',
'                )',
'                VALUES',
'                (',
'                    :P165_ANIO_1,',
'                    :P165_MES_INICIO,',
'                    :P165_MES_FIN,',
'                    :P165_MONEDA_2,',
'                    NVL(:P165_CAMBIO_2, SAF.FNC_GET_TIPO_CAMBIO(:P165_MONEDA_2)),',
'                    NVL(:P165_VALOR_2, 0),',
'                    :P165_CONCEPTO_2,',
'                    :P165_TIPO_REPORTE,',
'                    :P165_REGISTRO,',
'                    :P165_EMPRESA,',
'                    :P165_NUMERO_PRESTAMO_2,',
'                    :GLOBAL_CODIGO_USUARIO,',
'                    SYSDATE',
'                );',
'            END IF;',
'        END IF;',
'    ELSE',
'        DELETE FROM SAF.REPORTES_FINANCIEROS_INTEGRO WHERE ID = :P165_ID_2;',
'    END IF;   ',
'END;'))
,p_attribute_02=>'P165_NUMERO_PRESTAMO_2,P165_EMPRESA,P165_ANIO_1,P165_TIPO_REPORTE,P165_REGISTRO,P165_MES_FIN,P165_ELIMINAR_2,P165_ID_2,P165_TIPO_REGISTRO,P165_CONCEPTO_2,P165_MONEDA_2,P165_CAMBIO_2,P165_VALOR_2'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213168834564476122)
,p_event_id=>wwv_flow_imp.id(213168354499476117)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR MODAL'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(213171026683476144)
,p_name=>'ELIMINAR'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(213170936756476143)
,p_condition_element=>'P165_TIPO_REPORTE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'5'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213171307869476147)
,p_event_id=>wwv_flow_imp.id(213171026683476144)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ELIMINAR'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P165_ID_1 IS NOT NULL AND :P165_ID_2 IS NOT NULL THEN',
'    DELETE FROM SAF.REPORTES_FINANCIEROS_INTEGRO WHERE ID = :P165_ID_1;',
'    DELETE FROM SAF.REPORTES_FINANCIEROS_INTEGRO WHERE ID = :P165_ID_2;',
'END IF;'))
,p_attribute_02=>'P165_ID_2,P165_ID_1'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(213171478202476148)
,p_event_id=>wwv_flow_imp.id(213171026683476144)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR MODAL'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(197235092293878826)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_P1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ID_2 NUMBER;',
'BEGIN',
'    SELECT',
'        ID,',
'        CONCEPTO,',
'        MONEDA_ORIGEN,',
'        VALOR_CAMBIO,',
'        VALOR,',
'        NUMERO_PRESTAMO,',
'        SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'        FECHA_GRABACION,',
'        SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'        FECHA_MODIFICACION',
'        INTO',
'        :P165_ID_1,',
'        :P165_CONCEPTO_1,',
'        :P165_MONEDA_1,',
'        :P165_CAMBIO_1,',
'        :P165_VALOR_1,',
'        :P165_NUMERO_PRESTAMO_1,',
'        :P165_USUARIO_GRABACION_1,',
'        :P165_FECHA_GRABACION_1,',
'        :P165_USUARIO_MODIFICACION_1,',
'        :P165_FECHA_MODIFICACION_1',
'    FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'    WHERE NUMERO_PRESTAMO = :P165_COD_CTA',
'    AND CODIGO_EMPRESA = :P165_EMPRESA',
'    AND ID_PLANTILLA_NOTA = :P165_REGISTRO',
'    AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'    AND MES_FIN = :P165_MES_FIN',
'    AND MES_INICIO = 1',
'    AND ANIO = :P165_ANIO;',
'',
'    EXCEPTION ',
'       WHEN no_data_found THEN ',
'          NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P165_REGISTRO IS NOT NULL AND',
':P165_TIPO_REGISTRO = ''2'' AND',
':P165_TIPO_REPORTE = ''5'''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(216559234238949612)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_P2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_ID_2 NUMBER;',
'BEGIN',
'    SELECT',
'        ID,',
'        CONCEPTO,',
'        MONEDA_ORIGEN,',
'        VALOR_CAMBIO,',
'        VALOR,',
'        NUMERO_PRESTAMO,',
'        SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'        FECHA_GRABACION,',
'        SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'        FECHA_MODIFICACION',
'        INTO',
'        :P165_ID_2,',
'        :P165_CONCEPTO_2,',
'        :P165_MONEDA_2,',
'        :P165_CAMBIO_2,',
'        :P165_VALOR_2,',
'        :P165_NUMERO_PRESTAMO_2,',
'        :P165_USUARIO_GRABACION_2,',
'        :P165_FECHA_GRABACION_2,',
'        :P165_USUARIO_MODIFICACION_2,',
'        :P165_FECHA_MODIFICACION_2',
'    FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'    WHERE NUMERO_PRESTAMO = :P165_COD_CTA',
'    AND CODIGO_EMPRESA = :P165_EMPRESA',
'    AND ID_PLANTILLA_NOTA = :P165_REGISTRO',
'    AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'    AND MES_FIN = :P165_MES_FIN',
'    AND MES_INICIO = 1',
'    AND ANIO = :P165_ANIO_1;',
'',
'    EXCEPTION ',
'       WHEN no_data_found THEN ',
'          NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P165_REGISTRO IS NOT NULL AND',
':P165_TIPO_REGISTRO = ''2'' AND',
':P165_TIPO_REPORTE = ''5'''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(213170700177476141)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ID,',
'	MONEDA_ORIGEN,',
'	VALOR_CAMBIO,',
'	VALOR,',
'	SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'	FECHA_GRABACION,',
'	SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'	FECHA_MODIFICACION',
'    INTO',
'    :P165_ID_1,',
'    :P165_MONEDA_1,',
'    :P165_CAMBIO_1,',
'    :P165_VALOR_1,',
'    :P165_USUARIO_GRABACION_1,',
'    :P165_FECHA_GRABACION_1,',
'    :P165_USUARIO_MODIFICACION_1,',
'    :P165_FECHA_MODIFICACION_1',
'FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'WHERE ID_PLANTILLA_NOTA = :P165_REGISTRO',
'AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'AND MES_FIN = :P165_MES_FIN',
'AND MES_INICIO = :P165_MES_INICIO',
'AND ANIO = :P165_ANIO;',
'',
'EXCEPTION ',
'   WHEN no_data_found THEN ',
'      NULL;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P165_REGISTRO IS NOT NULL AND',
':P165_TIPO_REPORTE != ''5'''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(213170842064476142)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ID,',
'	MONEDA_ORIGEN,',
'	VALOR_CAMBIO,',
'	VALOR,',
'	SAF.FNC_GET_USUARIONOMBRE(USUARIO_GRABACION),',
'	FECHA_GRABACION,',
'	SAF.FNC_GET_USUARIONOMBRE(USUARIO_MODIFICACION),',
'	FECHA_MODIFICACION',
'    INTO',
'    :P165_ID_2,',
'    :P165_MONEDA_2,',
'    :P165_CAMBIO_2,',
'    :P165_VALOR_2,',
'    :P165_USUARIO_GRABACION_2,',
'    :P165_FECHA_GRABACION_2,',
'    :P165_USUARIO_MODIFICACION_2,',
'    :P165_FECHA_MODIFICACION_2',
'FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'WHERE ID_PLANTILLA_NOTA = :P165_REGISTRO',
'AND TIPO_REPORTE = :P165_TIPO_REPORTE',
'AND MES_FIN = :P165_MES_FIN',
'AND MES_INICIO = :P165_MES_INICIO',
'AND ANIO = :P165_ANIO_1;',
'',
'EXCEPTION ',
'   WHEN no_data_found THEN ',
'      NULL;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P165_REGISTRO IS NOT NULL AND',
':P165_TIPO_REPORTE != ''5'''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
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
