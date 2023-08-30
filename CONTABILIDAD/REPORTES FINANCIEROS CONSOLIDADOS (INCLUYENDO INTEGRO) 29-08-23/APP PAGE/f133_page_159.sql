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
--     PAGE: 159
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_00159
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>159);
end;
/
prompt --application/pages/page_00159
begin
wwv_flow_imp_page.create_page(
 p_id=>159
,p_name=>'SUBIR_PLANTILLA_FINANCIERO_INTEGRO'
,p_alias=>'SUBIR-PLANTILLA-FINANCIERO-INTEGRO'
,p_page_mode=>'MODAL'
,p_step_title=>'Plantilla Reporte Financiero'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_css_classes=>'MODAL'
,p_protection_level=>'C'
,p_page_component_map=>'16'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20230818161448'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(197236256004878838)
,p_plug_name=>'Subir Plantilla'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P159_FILE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(197237045609878846)
,p_plug_name=>'Subir Plantilla'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P159_FILE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(197237395022878849)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(197237045609878846)
,p_button_name=>'CARGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'Cargar'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197236567034878841)
,p_name=>'P159_FILE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(197236256004878838)
,p_prompt=>'Archivo'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_12=>'DROPZONE_BLOCK'
,p_attribute_14=>'Supported formats XLSX'
,p_attribute_15=>'5000'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197237103017878847)
,p_name=>'P159_FILE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(197237045609878846)
,p_prompt=>'Nombre Archivo'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(199319001214353400)
,p_name=>'P159_TIPO_REPORTE'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(199586196100486919)
,p_name=>'P159_XLSX_WORKSHEET'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(197237045609878846)
,p_prompt=>'XLSX Worksheet'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.sheet_display_name,',
'       p.sheet_file_name',
'  from apex_application_temp_files f,',
'       table( apex_data_parser.get_xlsx_worksheets( p_content => f.blob_content ) ) p',
' where f.name = :P159_FILE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_sheet_count number;',
'begin',
'    select count(*)',
'      into l_sheet_count',
'      from apex_application_temp_files f,',
'           table( apex_data_parser.get_xlsx_worksheets( p_content => f.blob_content ) ) p',
'     where f.name = :P159_FILE;',
'    ',
'     -- display if the XSLX file contains multiple worksheets',
'    return ( l_sheet_count > 1 );',
'exception',
'    when others then ',
'        return false;',
'end;'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202310228153953448)
,p_name=>'P159_EMPRESA'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(202310398951953449)
,p_name=>'P159_EMPRESA_NOMBRE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(197237045609878846)
,p_prompt=>'Empresa'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(99636986383244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(234950185608795716)
,p_name=>'P159_SECCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(197237045609878846)
,p_prompt=>'Seccion'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'	(CODIGO_SECCION || '' - '' || NOMBRE_SECCION) NOMBRE,',
'	CODIGO_SECCION',
'FROM SAF.GRAL_SECCIONES ',
'WHERE CODIGO_DIVISION IS NOT NULL',
'ORDER BY CODIGO_SECCION ASC;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
,p_display_when=>'P159_TIPO_REPORTE'
,p_display_when2=>'6'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(234950403851795719)
,p_name=>'P159_ELIMINACIONES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(197237045609878846)
,p_prompt=>'Eliminaciones'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_display_when=>'P159_TIPO_REPORTE'
,p_display_when2=>'6'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'S'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(197237251723878848)
,p_computation_sequence=>10
,p_computation_item=>'P159_FILE_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    filename',
'from apex_application_temp_files ',
'where name = :P159_FILE'))
,p_compute_when=>'P159_FILE'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(206937993646982104)
,p_computation_sequence=>20
,p_computation_item=>'P159_EMPRESA_NOMBRE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'SELECT SAF.FN_NOMBRE_EMPRESA(:P159_EMPRESA) FROM DUAL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(197236637946878842)
,p_validation_name=>'Is valid file type'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if apex_data_parser.assert_file_type(',
'       p_file_name => :P159_FILE,',
'       p_file_type => apex_data_parser.c_file_type_xlsx )',
'then',
'    return true;',
'else',
'    :P159_FILE := null;',
'    return false;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Invalid file type. Supported file types XLSX.'
,p_associated_item=>wwv_flow_imp.id(197236567034878841)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(197236708277878843)
,p_name=>'Upload a File'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P159_FILE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197236866791878844)
,p_event_id=>wwv_flow_imp.id(197236708277878843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(199586220754486920)
,p_name=>'Submit worksheet on change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P159_XLSX_WORKSHEET'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(199586350599486921)
,p_event_id=>wwv_flow_imp.id(199586220754486920)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(197236902429878845)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_ARCHIVO_R1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c_data IS',
'        SELECT ',
'            p.line_number, ',
'            p.col001,',
'            p.col002, ',
'            p.col003,',
'            p.col004, ',
'            p.col005, ',
'            p.col006, ',
'            p.col007, ',
'            p.col008,',
'            p.col009',
'        FROM apex_application_temp_files f, ',
'            TABLE( apex_data_parser.parse(',
'                        p_content          => f.blob_content,',
'                        p_file_name        => f.filename,',
'                        p_xlsx_sheet_name  => CASE WHEN :P159_XLSX_WORKSHEET IS NOT NULL THEN :P159_XLSX_WORKSHEET END,',
'                        p_add_headers_row  => ''Y'',',
'                        p_file_charset     => ''AL32UTF8'',',
'                        p_max_rows         => 100000 ) ) p',
'        WHERE f.name = :P159_FILE;',
'BEGIN',
'    IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''ARCHIVO_COLLECTION'') THEN',
'        APEX_COLLECTION.CREATE_COLLECTION(''ARCHIVO_COLLECTION'');',
'    ELSE',
'        APEX_COLLECTION.TRUNCATE_COLLECTION(''ARCHIVO_COLLECTION'');',
'    END IF;',
'',
'    FOR cd IN c_data LOOP',
'        IF cd.line_number > 1  THEN',
'            APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''ARCHIVO_COLLECTION'',',
'                p_c001 => cd.col001,',
'                p_c002 => cd.col002,',
'                p_c003 => cd.col003,',
'                p_c004 => cd.col004,',
'                p_c005 => cd.col005,',
'                p_c006 => cd.col006,',
'                p_c007 => cd.col007, ',
'                p_c008 => cd.col008,',
'                p_c009 => cd.col009',
'            );',
'        END IF;',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P159_XLSX_WORKSHEET IS NOT NULL AND',
':P159_TIPO_REPORTE = 1 AND',
':P159_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202305598126953401)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_DB_R1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            C001 TIPO,',
'            C002 AGRUPADOR,',
'            C003 RENGLON,',
'            C004 MES_INICIO,',
'            C005 MES_FIN,',
'            C006 ANIO,',
'            C007 MONEDA,',
'            C008 CAMBIO,',
'            C009 VALOR',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''ARCHIVO_COLLECTION''',
'        AND C001 IS NOT NULL',
'        AND C002 IS NOT NULL',
'        AND C003 IS NOT NULL',
'        AND C004 IS NOT NULL',
'        AND C005 IS NOT NULL',
'        AND C006 IS NOT NULL',
'        AND C007 IS NOT NULL',
'        AND C008 IS NOT NULL',
'        AND C009 IS NOT NULL;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_ID_NOTA IS',
'                SELECT',
'                	ID',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS',
'                WHERE TIPO_REPORTE = TO_NUMBER(:P159_TIPO_REPORTE)',
'                AND REPLACE(ORDEN_1, '' '', '''') = R_DATOS.TIPO',
'                AND REPLACE(ORDEN_2, '' '', '''') = R_DATOS.AGRUPADOR',
'                AND ID = TO_NUMBER(R_DATOS.RENGLON);',
'            ',
'            CURSOR C_ID_MONEDA IS',
'                SELECT',
'                    CODIGO_MONEDA',
'                FROM SAF.GRAL_MONEDAS',
'                WHERE NOMBRE_MONEDA = R_DATOS.MONEDA;',
'            ',
'            V_ID_NOTA NUMBER;',
'            V_ID_MONEDA NUMBER;',
'            V_MES_INICIO NUMBER;',
'            V_MES_FIN NUMBER;',
'        BEGIN',
'            OPEN C_ID_NOTA;',
'                FETCH C_ID_NOTA INTO V_ID_NOTA;',
'            CLOSE C_ID_NOTA;',
'',
'            OPEN C_ID_MONEDA;',
'                FETCH C_ID_MONEDA INTO V_ID_MONEDA;',
'            CLOSE C_ID_MONEDA;',
'',
'            SELECT',
'                CASE ',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''ENERO'' THEN 1',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''FEBRERO'' THEN 2',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''MARZO'' THEN 3',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''ABRIL'' THEN 4',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''MAYO'' THEN 5',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''JUNIO'' THEN 6',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''JULIO'' THEN 7',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''AGOSTO'' THEN 8',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''SEPTIEMBRE'' THEN 9',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''OCTUBRE'' THEN 10',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''NOVIEMBRE'' THEN 11',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''DICIEMBRE'' THEN 12',
'                    ELSE NULL',
'                END',
'                INTO V_MES_INICIO',
'            FROM DUAL;',
'',
'            SELECT',
'                CASE ',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''ENERO'' THEN 1',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''FEBRERO'' THEN 2',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''MARZO'' THEN 3',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''ABRIL'' THEN 4',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''MAYO'' THEN 5',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''JUNIO'' THEN 6',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''JULIO'' THEN 7',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''AGOSTO'' THEN 8',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''SEPTIEMBRE'' THEN 9',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''OCTUBRE'' THEN 10',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''NOVIEMBRE'' THEN 11',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''DICIEMBRE'' THEN 12',
'                    ELSE NULL',
'                END',
'                INTO V_MES_FIN',
'            FROM DUAL;',
'',
'            IF V_ID_NOTA IS NOT NULL THEN',
'                DELETE FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'                WHERE ANIO =  R_DATOS.ANIO',
'                AND MES_INICIO = V_MES_INICIO',
'                AND MES_FIN = V_MES_FIN',
'                AND TIPO_REPORTE = :P159_TIPO_REPORTE',
'                AND ID_PLANTILLA_NOTA = V_ID_NOTA',
'                AND CODIGO_EMPRESA = :P159_EMPRESA;',
'',
'                INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO',
'                (',
'                    ANIO,',
'                    MES_INICIO,',
'                    MES_FIN,',
'                    MONEDA_ORIGEN,',
'                    VALOR_CAMBIO,',
'                    VALOR,',
'                    TIPO_REPORTE,',
'                    ID_PLANTILLA_NOTA,',
'                    CODIGO_EMPRESA,',
'                    USUARIO_GRABACION,',
'                    FECHA_GRABACION',
'                )',
'                VALUES',
'                (',
'                    R_DATOS.ANIO,',
'                    V_MES_INICIO,',
'                    V_MES_FIN,',
'                    NVL(V_ID_MONEDA, 1),',
'                    R_DATOS.CAMBIO,',
'                    R_DATOS.VALOR,',
'                    :P159_TIPO_REPORTE,',
'                    V_ID_NOTA,',
'                    :P159_EMPRESA,',
'                    :GLOBAL_CODIGO_USUARIO,',
'                    SYSDATE',
'                );',
'            END IF;',
'        END;',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P159_XLSX_WORKSHEET IS NOT NULL AND',
':P159_TIPO_REPORTE = 1 AND',
':P159_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202308241761953428)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_ARCHIVO_R2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c_data IS',
'        SELECT ',
'            p.line_number, ',
'            p.col001,',
'            p.col002, ',
'            p.col003,',
'            p.col004, ',
'            p.col005, ',
'            p.col006, ',
'            p.col007, ',
'            p.col008',
'        FROM apex_application_temp_files f, ',
'            TABLE( apex_data_parser.parse(',
'                        p_content          => f.blob_content,',
'                        p_file_name        => f.filename,',
'                        p_xlsx_sheet_name  => CASE WHEN :P159_XLSX_WORKSHEET IS NOT NULL THEN :P159_XLSX_WORKSHEET END,',
'                        p_add_headers_row  => ''Y'',',
'                        p_file_charset     => ''AL32UTF8'',',
'                        p_max_rows         => 100000 ) ) p',
'        WHERE f.name = :P159_FILE;',
'BEGIN',
'    IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''ARCHIVO_COLLECTION'') THEN',
'        APEX_COLLECTION.CREATE_COLLECTION(''ARCHIVO_COLLECTION'');',
'    ELSE',
'        APEX_COLLECTION.TRUNCATE_COLLECTION(''ARCHIVO_COLLECTION'');',
'    END IF;',
'',
'    FOR cd IN c_data LOOP',
'        IF cd.line_number > 1  THEN',
'            APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''ARCHIVO_COLLECTION'',',
'                p_c001 => cd.col001,',
'                p_c002 => cd.col002,',
'                p_c003 => cd.col003,',
'                p_c004 => cd.col004,',
'                p_c005 => cd.col005,',
'                p_c006 => cd.col006,',
'                p_c007 => cd.col007, ',
'                p_c008 => cd.col008',
'            );',
'        END IF;',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P159_XLSX_WORKSHEET IS NOT NULL AND',
':P159_TIPO_REPORTE = 2 AND',
':P159_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(202308367832953429)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_DB_R2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            C001 TIPO,',
'            C002 RENGLON,',
'            C003 MES_INICIO,',
'            C004 MES_FIN,',
'            C005 ANIO,',
'            C006 MONEDA,',
'            C007 CAMBIO,',
'            C008 VALOR',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''ARCHIVO_COLLECTION''',
'        AND C001 IS NOT NULL',
'        AND C002 IS NOT NULL',
'        AND C003 IS NOT NULL',
'        AND C004 IS NOT NULL',
'        AND C005 IS NOT NULL',
'        AND C006 IS NOT NULL',
'        AND C007 IS NOT NULL',
'        AND C008 IS NOT NULL;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_ID_NOTA IS',
'                SELECT',
'                	ID',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS',
'                WHERE TIPO_REPORTE = TO_NUMBER(:P159_TIPO_REPORTE)',
'                AND REPLACE(ORDEN_1, '' '', '''') = R_DATOS.TIPO',
'                AND ID = R_DATOS.RENGLON;',
'            ',
'            CURSOR C_ID_MONEDA IS',
'                SELECT',
'                    CODIGO_MONEDA',
'                FROM SAF.GRAL_MONEDAS',
'                WHERE NOMBRE_MONEDA = R_DATOS.MONEDA;',
'            ',
'            V_ID_NOTA NUMBER;',
'            V_ID_MONEDA NUMBER;',
'            V_MES_INICIO NUMBER;',
'            V_MES_FIN NUMBER;',
'        BEGIN',
'            OPEN C_ID_NOTA;',
'                FETCH C_ID_NOTA INTO V_ID_NOTA;',
'            CLOSE C_ID_NOTA;',
'',
'            OPEN C_ID_MONEDA;',
'                FETCH C_ID_MONEDA INTO V_ID_MONEDA;',
'            CLOSE C_ID_MONEDA;',
'',
'            SELECT',
'                CASE ',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''ENERO'' THEN 1',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''FEBRERO'' THEN 2',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''MARZO'' THEN 3',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''ABRIL'' THEN 4',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''MAYO'' THEN 5',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''JUNIO'' THEN 6',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''JULIO'' THEN 7',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''AGOSTO'' THEN 8',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''SEPTIEMBRE'' THEN 9',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''OCTUBRE'' THEN 10',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''NOVIEMBRE'' THEN 11',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''DICIEMBRE'' THEN 12',
'                    ELSE NULL',
'                END',
'                INTO V_MES_INICIO',
'            FROM DUAL;',
'',
'            SELECT',
'                CASE ',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''ENERO'' THEN 1',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''FEBRERO'' THEN 2',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''MARZO'' THEN 3',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''ABRIL'' THEN 4',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''MAYO'' THEN 5',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''JUNIO'' THEN 6',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''JULIO'' THEN 7',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''AGOSTO'' THEN 8',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''SEPTIEMBRE'' THEN 9',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''OCTUBRE'' THEN 10',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''NOVIEMBRE'' THEN 11',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''DICIEMBRE'' THEN 12',
'                    ELSE NULL',
'                END',
'                INTO V_MES_FIN',
'            FROM DUAL;',
'',
'            IF V_ID_NOTA IS NOT NULL THEN',
'                DELETE FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'                WHERE ANIO =  R_DATOS.ANIO',
'                AND MES_INICIO = V_MES_INICIO',
'                AND MES_FIN = V_MES_FIN',
'                AND TIPO_REPORTE = :P159_TIPO_REPORTE',
'                AND ID_PLANTILLA_NOTA = V_ID_NOTA',
'                AND CODIGO_EMPRESA = :P159_EMPRESA;',
'',
'                INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO',
'                (',
'                    ANIO,',
'                    MES_INICIO,',
'                    MES_FIN,',
'                    MONEDA_ORIGEN,',
'                    VALOR_CAMBIO,',
'                    VALOR,',
'                    TIPO_REPORTE,',
'                    ID_PLANTILLA_NOTA,',
'                    CODIGO_EMPRESA,',
'                    USUARIO_GRABACION,',
'                    FECHA_GRABACION',
'                )',
'                VALUES',
'                (',
'                    R_DATOS.ANIO,',
'                    V_MES_INICIO,',
'                    V_MES_FIN,',
'                    NVL(V_ID_MONEDA, 1),',
'                    R_DATOS.CAMBIO,',
'                    R_DATOS.VALOR,',
'                    :P159_TIPO_REPORTE,',
'                    V_ID_NOTA,',
'                    :P159_EMPRESA,',
'                    :GLOBAL_CODIGO_USUARIO,',
'                    SYSDATE',
'                );',
'            END IF;',
'        END;',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P159_XLSX_WORKSHEET IS NOT NULL AND',
':P159_TIPO_REPORTE = 2 AND',
':P159_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(216558383676949603)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_ARCHIVO_R3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c_data IS',
'        SELECT ',
'            p.line_number, ',
'            p.col001,',
'            p.col002, ',
'            p.col003,',
'            p.col004, ',
'            p.col005, ',
'            p.col006, ',
'            p.col007, ',
'            p.col008,',
'            p.col009,',
'            p.col010',
'        FROM apex_application_temp_files f, ',
'            TABLE( apex_data_parser.parse(',
'                        p_content          => f.blob_content,',
'                        p_file_name        => f.filename,',
'                        p_xlsx_sheet_name  => CASE WHEN :P159_XLSX_WORKSHEET IS NOT NULL THEN :P159_XLSX_WORKSHEET END,',
'                        p_add_headers_row  => ''Y'',',
'                        p_file_charset     => ''AL32UTF8'',',
'                        p_max_rows         => 100000 ) ) p',
'        WHERE f.name = :P159_FILE;',
'BEGIN',
'    IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''ARCHIVO_COLLECTION'') THEN',
'        APEX_COLLECTION.CREATE_COLLECTION(''ARCHIVO_COLLECTION'');',
'    ELSE',
'        APEX_COLLECTION.TRUNCATE_COLLECTION(''ARCHIVO_COLLECTION'');',
'    END IF;',
'',
'    FOR cd IN c_data LOOP',
'        IF cd.line_number > 1  THEN',
'            APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''ARCHIVO_COLLECTION'',',
'                p_c001 => cd.col001,',
'                p_c002 => cd.col002,',
'                p_c003 => cd.col003,',
'                p_c004 => cd.col004,',
'                p_c005 => cd.col005,',
'                p_c006 => cd.col006,',
'                p_c007 => cd.col007, ',
'                p_c008 => cd.col008,',
'                p_c009 => cd.col009,',
'                p_c010 => cd.col010',
'            );',
'        END IF;',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P159_XLSX_WORKSHEET IS NOT NULL AND',
':P159_TIPO_REPORTE = 5 AND',
':P159_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(216558417898949604)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_DB_R3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            C001 TIPO,',
'            C002 RENGLON,',
'            C003 MES_INICIO,',
'            C004 MES_FIN,',
'            C005 ANIO_1,',
'            C006 MONEDA,',
'            C007 CAMBIO,',
'            C008 VALOR_1,',
'            C009 NUMERO_PRESTAMO,',
'            C010 CONCEPTO',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''ARCHIVO_COLLECTION''',
'        AND C001 IS NOT NULL',
'        AND C002 IS NOT NULL',
'        AND C003 IS NOT NULL',
'        AND C004 IS NOT NULL',
'        AND C005 IS NOT NULL',
'        AND C006 IS NOT NULL',
'        AND C007 IS NOT NULL',
'        AND C008 IS NOT NULL',
'        AND C009 IS NOT NULL',
'        AND C010 IS NOT NULL;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_ID_NOTA IS',
'                SELECT',
'                	ID',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS',
'                WHERE TIPO_REPORTE = TO_NUMBER(:P159_TIPO_REPORTE)',
'                AND REPLACE(ORDEN_1, '' '', '''') = R_DATOS.TIPO',
'                AND ID = R_DATOS.RENGLON;',
'            ',
'            CURSOR C_ID_MONEDA IS',
'                SELECT',
'                    CODIGO_MONEDA',
'                FROM SAF.GRAL_MONEDAS',
'                WHERE NOMBRE_MONEDA = R_DATOS.MONEDA;',
'            ',
'            V_ID_NOTA NUMBER;',
'            V_ID_MONEDA NUMBER;',
'            V_MES_INICIO NUMBER;',
'            V_MES_FIN NUMBER;',
'        BEGIN',
'            OPEN C_ID_NOTA;',
'                FETCH C_ID_NOTA INTO V_ID_NOTA;',
'            CLOSE C_ID_NOTA;',
'',
'            OPEN C_ID_MONEDA;',
'                FETCH C_ID_MONEDA INTO V_ID_MONEDA;',
'            CLOSE C_ID_MONEDA;',
'',
'            SELECT',
'                CASE ',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''ENERO'' THEN 1',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''FEBRERO'' THEN 2',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''MARZO'' THEN 3',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''ABRIL'' THEN 4',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''MAYO'' THEN 5',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''JUNIO'' THEN 6',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''JULIO'' THEN 7',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''AGOSTO'' THEN 8',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''SEPTIEMBRE'' THEN 9',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''OCTUBRE'' THEN 10',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''NOVIEMBRE'' THEN 11',
'                    WHEN UPPER(R_DATOS.MES_INICIO) = ''DICIEMBRE'' THEN 12',
'                    ELSE NULL',
'                END',
'                INTO V_MES_INICIO',
'            FROM DUAL;',
'',
'            SELECT',
'                CASE ',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''ENERO'' THEN 1',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''FEBRERO'' THEN 2',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''MARZO'' THEN 3',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''ABRIL'' THEN 4',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''MAYO'' THEN 5',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''JUNIO'' THEN 6',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''JULIO'' THEN 7',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''AGOSTO'' THEN 8',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''SEPTIEMBRE'' THEN 9',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''OCTUBRE'' THEN 10',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''NOVIEMBRE'' THEN 11',
'                    WHEN UPPER(R_DATOS.MES_FIN) = ''DICIEMBRE'' THEN 12',
'                    ELSE NULL',
'                END',
'                INTO V_MES_FIN',
'            FROM DUAL;',
'',
'            IF V_ID_NOTA IS NOT NULL THEN',
'                DECLARE',
'                    CURSOR C_DATO IS',
'                        SELECT',
'                            COUNT(*)',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'                        WHERE ANIO = R_DATOS.ANIO_1',
'                        AND MES_INICIO = V_MES_INICIO',
'                        AND MES_FIN = V_MES_FIN',
'                        AND TIPO_REPORTE = :P159_TIPO_REPORTE',
'                        AND ID_PLANTILLA_NOTA = V_ID_NOTA',
'                        AND CODIGO_EMPRESA = :P159_EMPRESA',
'                        AND NUMERO_PRESTAMO = R_DATOS.NUMERO_PRESTAMO;',
'                    V_ID NUMBER;',
'                BEGIN',
'                    OPEN C_DATO;',
'                        FETCH C_DATO INTO V_ID;',
'                    CLOSE C_DATO;',
'',
'                    IF V_ID != 0 THEN',
'                        UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO SET ',
'                            MONEDA_ORIGEN = V_ID_MONEDA,',
'                            VALOR_CAMBIO = R_DATOS.CAMBIO,',
'                            VALOR = R_DATOS.VALOR_1,',
'                            CONCEPTO = R_DATOS.CONCEPTO,',
'                            USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'                            FECHA_MODIFICACION = SYSDATE',
'                        WHERE ANIO = R_DATOS.ANIO_1',
'                        AND MES_INICIO = V_MES_INICIO',
'                        AND MES_FIN = V_MES_FIN',
'                        AND TIPO_REPORTE = :P159_TIPO_REPORTE',
'                        AND ID_PLANTILLA_NOTA = V_ID_NOTA',
'                        AND CODIGO_EMPRESA = :P159_EMPRESA',
'                        AND NUMERO_PRESTAMO = R_DATOS.NUMERO_PRESTAMO;',
'                    ELSE',
'                        INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO',
'                        (',
'                            ANIO,',
'                            MES_INICIO,',
'                            MES_FIN,',
'                            MONEDA_ORIGEN,',
'                            VALOR_CAMBIO,',
'                            VALOR,',
'                            TIPO_REPORTE,',
'                            ID_PLANTILLA_NOTA,',
'                            USUARIO_GRABACION,',
'                            FECHA_GRABACION,',
'                            CODIGO_EMPRESA,',
'                            CONCEPTO,',
'                            NUMERO_PRESTAMO',
'                        )',
'                        VALUES',
'                        (',
'                            R_DATOS.ANIO_1,',
'                            1,',
'                            V_MES_FIN,',
'                            V_ID_MONEDA,',
'                            R_DATOS.CAMBIO,',
'                            R_DATOS.VALOR_1,',
'                            :P159_TIPO_REPORTE,',
'                            V_ID_NOTA,',
'                            :GLOBAL_CODIGO_USUARIO,',
'                            SYSDATE,',
'                            :P159_EMPRESA,',
'                            R_DATOS.CONCEPTO,',
'                            R_DATOS.NUMERO_PRESTAMO',
'                        );',
'                    END IF;',
'                END;',
'            END IF;',
'        END;',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P159_XLSX_WORKSHEET IS NOT NULL AND',
':P159_TIPO_REPORTE = 5 AND',
':P159_EMPRESA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
end;
/
begin
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(234950292362795717)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_ARCHIVO_R6'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c_data IS',
'        SELECT ',
'            p.line_number, ',
'            p.col001,',
'            p.col002, ',
'            p.col003,',
'            p.col004, ',
'            p.col005, ',
'            p.col006, ',
'            p.col007',
'        FROM apex_application_temp_files f, ',
'            TABLE( apex_data_parser.parse(',
'                        p_content          => f.blob_content,',
'                        p_file_name        => f.filename,',
'                        p_xlsx_sheet_name  => CASE WHEN :P159_XLSX_WORKSHEET IS NOT NULL THEN :P159_XLSX_WORKSHEET END,',
'                        p_add_headers_row  => ''Y'',',
'                        p_file_charset     => ''AL32UTF8'',',
'                        p_max_rows         => 100000 ) ) p',
'        WHERE f.name = :P159_FILE;',
'BEGIN',
'    IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''ARCHIVO_COLLECTION'') THEN',
'        APEX_COLLECTION.CREATE_COLLECTION(''ARCHIVO_COLLECTION'');',
'    ELSE',
'        APEX_COLLECTION.TRUNCATE_COLLECTION(''ARCHIVO_COLLECTION'');',
'    END IF;',
'',
'    FOR cd IN c_data LOOP',
'        IF cd.line_number > 1  THEN',
'            APEX_COLLECTION.ADD_MEMBER(',
'                p_collection_name => ''ARCHIVO_COLLECTION'',',
'                p_c001 => cd.col001,',
'                p_c002 => cd.col002,',
'                p_c003 => cd.col003,',
'                p_c004 => cd.col004,',
'                p_c005 => cd.col005,',
'                p_c006 => cd.col006,',
'                p_c007 => cd.col007',
'            );',
'        END IF;',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P159_XLSX_WORKSHEET IS NOT NULL AND',
':P159_TIPO_REPORTE = 6 AND',
':P159_SECCION IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(234950350789795718)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_DB_R6'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            C001 TIPO,',
'            C002 RENGLON,',
'            C003 MES,',
'            C004 ANIO,',
'            C005 MONEDA,',
'            C006 CAMBIO,',
'            C007 VALOR',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''ARCHIVO_COLLECTION''',
'        AND C001 IS NOT NULL',
'        AND C002 IS NOT NULL',
'        AND C003 IS NOT NULL',
'        AND C004 IS NOT NULL',
'        AND C005 IS NOT NULL',
'        AND C006 IS NOT NULL',
'        AND C007 IS NOT NULL;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_ID_NOTA IS',
'                SELECT',
'                	ID',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS',
'                WHERE TIPO_REPORTE = TO_NUMBER(:P159_TIPO_REPORTE)',
'                --AND REPLACE(ORDEN_1, '' '', '''') = R_DATOS.TIPO',
'                AND ID = R_DATOS.RENGLON;',
'            ',
'            CURSOR C_ID_MONEDA IS',
'                SELECT',
'                    CODIGO_MONEDA',
'                FROM SAF.GRAL_MONEDAS',
'                WHERE NOMBRE_MONEDA = R_DATOS.MONEDA;',
'            ',
'            V_ID_NOTA NUMBER;',
'            V_ID_MONEDA NUMBER;',
'            V_MES NUMBER;',
'        BEGIN',
'            OPEN C_ID_NOTA;',
'                FETCH C_ID_NOTA INTO V_ID_NOTA;',
'            CLOSE C_ID_NOTA;',
'',
'            OPEN C_ID_MONEDA;',
'                FETCH C_ID_MONEDA INTO V_ID_MONEDA;',
'            CLOSE C_ID_MONEDA;',
'',
'            SELECT',
'                CASE ',
'                    WHEN UPPER(R_DATOS.MES) = ''ENERO'' THEN 1',
'                    WHEN UPPER(R_DATOS.MES) = ''FEBRERO'' THEN 2',
'                    WHEN UPPER(R_DATOS.MES) = ''MARZO'' THEN 3',
'                    WHEN UPPER(R_DATOS.MES) = ''ABRIL'' THEN 4',
'                    WHEN UPPER(R_DATOS.MES) = ''MAYO'' THEN 5',
'                    WHEN UPPER(R_DATOS.MES) = ''JUNIO'' THEN 6',
'                    WHEN UPPER(R_DATOS.MES) = ''JULIO'' THEN 7',
'                    WHEN UPPER(R_DATOS.MES) = ''AGOSTO'' THEN 8',
'                    WHEN UPPER(R_DATOS.MES) = ''SEPTIEMBRE'' THEN 9',
'                    WHEN UPPER(R_DATOS.MES) = ''OCTUBRE'' THEN 10',
'                    WHEN UPPER(R_DATOS.MES) = ''NOVIEMBRE'' THEN 11',
'                    WHEN UPPER(R_DATOS.MES) = ''DICIEMBRE'' THEN 12',
'                    ELSE NULL',
'                END',
'                INTO V_MES',
'            FROM DUAL;',
'',
'            IF V_ID_NOTA IS NOT NULL THEN',
'                DECLARE',
'                    CURSOR C_DATO IS',
'                        SELECT',
'                            COUNT(*)',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'                        WHERE ANIO = R_DATOS.ANIO',
'                        AND MES_INICIO = 1',
'                        AND MES_FIN = V_MES',
'                        AND TIPO_REPORTE = :P159_TIPO_REPORTE',
'                        AND ID_PLANTILLA_NOTA = V_ID_NOTA',
'                        AND CODIGO_EMPRESA = :P159_SECCION',
'                        AND CONCEPTO IS NULL;',
'                    V_ID NUMBER;',
'                BEGIN',
'                    OPEN C_DATO;',
'                        FETCH C_DATO INTO V_ID;',
'                    CLOSE C_DATO;',
'',
'                    IF V_ID != 0 THEN',
'                        UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO SET ',
'                            MONEDA_ORIGEN = V_ID_MONEDA,',
'                            VALOR_CAMBIO = R_DATOS.CAMBIO,',
'                            VALOR = R_DATOS.VALOR,',
'                            USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'                            FECHA_MODIFICACION = SYSDATE',
'                        WHERE ANIO = R_DATOS.ANIO',
'                        AND MES_INICIO = 1',
'                        AND MES_FIN = V_MES',
'                        AND TIPO_REPORTE = :P159_TIPO_REPORTE',
'                        AND ID_PLANTILLA_NOTA = V_ID_NOTA',
'                        AND CODIGO_EMPRESA = :P159_SECCION',
'                        AND CONCEPTO IS NULL;',
'                    ELSE',
'                        INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO',
'                        (',
'                            ANIO,',
'                            MES_INICIO,',
'                            MES_FIN,',
'                            MONEDA_ORIGEN,',
'                            VALOR_CAMBIO,',
'                            VALOR,',
'                            TIPO_REPORTE,',
'                            ID_PLANTILLA_NOTA,',
'                            USUARIO_GRABACION,',
'                            FECHA_GRABACION,',
'                            CODIGO_EMPRESA',
'                        )',
'                        VALUES',
'                        (',
'                            R_DATOS.ANIO,',
'                            1,',
'                            V_MES,',
'                            V_ID_MONEDA,',
'                            R_DATOS.CAMBIO,',
'                            R_DATOS.VALOR,',
'                            :P159_TIPO_REPORTE,',
'                            V_ID_NOTA,',
'                            :GLOBAL_CODIGO_USUARIO,',
'                            SYSDATE,',
'                            :P159_SECCION',
'                        );',
'                    END IF;',
'                END;',
'            END IF;',
'        END;',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P159_XLSX_WORKSHEET IS NOT NULL AND',
':P159_TIPO_REPORTE = 6 AND',
':P159_SECCION IS NOT NULL AND',
':P159_ELIMINACIONES = ''N'''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(234950586527795720)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS_DB_R6_ELIMINACION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_DATOS IS',
'        SELECT',
'            C001 TIPO,',
'            C002 RENGLON,',
'            C003 MES,',
'            C004 ANIO,',
'            C005 MONEDA,',
'            C006 CAMBIO,',
'            C007 VALOR',
'        FROM APEX_COLLECTIONS',
'        WHERE COLLECTION_NAME = ''ARCHIVO_COLLECTION''',
'        AND C001 IS NOT NULL',
'        AND C002 IS NOT NULL',
'        AND C003 IS NOT NULL',
'        AND C004 IS NOT NULL',
'        AND C005 IS NOT NULL',
'        AND C006 IS NOT NULL',
'        AND C007 IS NOT NULL;',
'BEGIN',
'    FOR R_DATOS IN C_DATOS',
'    LOOP',
'        DECLARE',
'            CURSOR C_ID_NOTA IS',
'                SELECT',
'                	ID',
'                FROM SAF.PLANTILLA_ASIGNACION_NOTAS',
'                WHERE TIPO_REPORTE = TO_NUMBER(:P159_TIPO_REPORTE)',
'                AND ID = TO_NUMBER(R_DATOS.RENGLON);',
'            ',
'            CURSOR C_ID_MONEDA IS',
'                SELECT',
'                    CODIGO_MONEDA',
'                FROM SAF.GRAL_MONEDAS',
'                WHERE NOMBRE_MONEDA = R_DATOS.MONEDA;',
'            ',
'            V_ID_NOTA NUMBER;',
'            V_ID_MONEDA NUMBER;',
'            V_MES NUMBER;',
'        BEGIN',
'            OPEN C_ID_NOTA;',
'                FETCH C_ID_NOTA INTO V_ID_NOTA;',
'            CLOSE C_ID_NOTA;',
'',
'            OPEN C_ID_MONEDA;',
'                FETCH C_ID_MONEDA INTO V_ID_MONEDA;',
'            CLOSE C_ID_MONEDA;',
'',
'            SELECT',
'                CASE ',
'                    WHEN UPPER(R_DATOS.MES) = ''ENERO'' THEN 1',
'                    WHEN UPPER(R_DATOS.MES) = ''FEBRERO'' THEN 2',
'                    WHEN UPPER(R_DATOS.MES) = ''MARZO'' THEN 3',
'                    WHEN UPPER(R_DATOS.MES) = ''ABRIL'' THEN 4',
'                    WHEN UPPER(R_DATOS.MES) = ''MAYO'' THEN 5',
'                    WHEN UPPER(R_DATOS.MES) = ''JUNIO'' THEN 6',
'                    WHEN UPPER(R_DATOS.MES) = ''JULIO'' THEN 7',
'                    WHEN UPPER(R_DATOS.MES) = ''AGOSTO'' THEN 8',
'                    WHEN UPPER(R_DATOS.MES) = ''SEPTIEMBRE'' THEN 9',
'                    WHEN UPPER(R_DATOS.MES) = ''OCTUBRE'' THEN 10',
'                    WHEN UPPER(R_DATOS.MES) = ''NOVIEMBRE'' THEN 11',
'                    WHEN UPPER(R_DATOS.MES) = ''DICIEMBRE'' THEN 12',
'                    ELSE NULL',
'                END',
'                INTO V_MES',
'            FROM DUAL;',
'',
'            IF V_ID_NOTA IS NOT NULL THEN',
'                DECLARE',
'                    CURSOR C_DATO IS',
'                        SELECT',
'                            COUNT(*)',
'                        FROM SAF.REPORTES_FINANCIEROS_INTEGRO',
'                        WHERE ANIO = R_DATOS.ANIO',
'                        AND MES_INICIO = 1',
'                        AND MES_FIN = V_MES',
'                        AND TIPO_REPORTE = :P159_TIPO_REPORTE',
'                        AND ID_PLANTILLA_NOTA = V_ID_NOTA',
'                        AND CODIGO_EMPRESA = :P159_SECCION',
'                        AND CONCEPTO = ''ELIMINACION'';',
'                    V_ID NUMBER;',
'                BEGIN',
'                    OPEN C_DATO;',
'                        FETCH C_DATO INTO V_ID;',
'                    CLOSE C_DATO;',
'',
'                    IF V_ID != 0 THEN',
'                        UPDATE SAF.REPORTES_FINANCIEROS_INTEGRO SET ',
'                            MONEDA_ORIGEN = V_ID_MONEDA,',
'                            VALOR_CAMBIO = R_DATOS.CAMBIO,',
'                            VALOR = R_DATOS.VALOR,',
'                            USUARIO_MODIFICACION = :GLOBAL_CODIGO_USUARIO,',
'                            FECHA_MODIFICACION = SYSDATE',
'                        WHERE ANIO = R_DATOS.ANIO',
'                        AND MES_INICIO = 1',
'                        AND MES_FIN = V_MES',
'                        AND TIPO_REPORTE = :P159_TIPO_REPORTE',
'                        AND ID_PLANTILLA_NOTA = V_ID_NOTA',
'                        AND CODIGO_EMPRESA = :P159_SECCION',
'                        AND CONCEPTO = ''ELIMINACION'';',
'                    ELSE',
'                        INSERT INTO SAF.REPORTES_FINANCIEROS_INTEGRO',
'                        (',
'                            ANIO,',
'                            MES_INICIO,',
'                            MES_FIN,',
'                            MONEDA_ORIGEN,',
'                            VALOR_CAMBIO,',
'                            VALOR,',
'                            TIPO_REPORTE,',
'                            ID_PLANTILLA_NOTA,',
'                            USUARIO_GRABACION,',
'                            FECHA_GRABACION,',
'                            CODIGO_EMPRESA,',
'                            CONCEPTO',
'                        )',
'                        VALUES',
'                        (',
'                            R_DATOS.ANIO,',
'                            1,',
'                            V_MES,',
'                            V_ID_MONEDA,',
'                            R_DATOS.CAMBIO,',
'                            R_DATOS.VALOR,',
'                            :P159_TIPO_REPORTE,',
'                            V_ID_NOTA,',
'                            :GLOBAL_CODIGO_USUARIO,',
'                            SYSDATE,',
'                            :P159_SECCION,',
'                            ''ELIMINACION''',
'                        );',
'                    END IF;',
'                END;',
'            END IF;',
'        END;',
'    END LOOP;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P159_XLSX_WORKSHEET IS NOT NULL AND',
':P159_TIPO_REPORTE = 6 AND',
':P159_SECCION IS NOT NULL AND',
':P159_ELIMINACIONES = ''S'''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(197237447822878850)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'CERRAR_MODAL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(197237395022878849)
,p_process_when=>'P159_XLSX_WORKSHEET'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
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
