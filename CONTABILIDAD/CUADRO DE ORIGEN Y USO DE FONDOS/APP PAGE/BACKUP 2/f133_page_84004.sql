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
--   Date and Time:   09:59 Tuesday October 31, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 84004
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84004
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84004);
end;
/
prompt --application/pages/page_84004
begin
wwv_flow_imp_page.create_page(
 p_id=>84004
,p_name=>'PLANTILLA_CUADRO_ORIGEN_FONDOS'
,p_alias=>'PLANTILLA-CUADRO-ORIGEN-FONDOS'
,p_step_title=>'PLANTILLA_CUADRO_ORIGEN_FONDOS'
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
'}',
'',
'function verRegistro()',
'{',
'    $.event.trigger(''VER_REGISTROS_MODAL'');',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#REPORTE th#INGRESOS, #REPORTE td[headers=INGRESOS],',
'#REPORTE th#EGRESOS, #REPORTE td[headers=EGRESOS],',
'#REPORTE th#VARIACION, #REPORTE td[headers=VARIACION]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20231030153050'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1912074118286420994)
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
 p_id=>wwv_flow_imp.id(2117115442922826158)
,p_plug_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_name=>'BALANCE_SITUACION_FINANCIERA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84004_EMPRESA IS NOT NULL AND',
':P84004_MONEDA IS NOT NULL'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1943167275066029229)
,p_plug_name=>'TITULO_REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(2117115442922826158)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody:margin-left-md'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:rigth;">AICSA Corp</h4>',
'<h5 style="text-align:rigth;">Cuadro de Origen y Uso de Fondos</h5>',
'<h5 style="text-align:rigth;">&P84004_FECHA_TITULO.</h5>',
'<h5 style="text-align:rigth;">(Cifras Expresadas en &P84004_NOMBRE_MONEDA.)</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2117115695276826160)
,p_plug_name=>'ACTIVO'
,p_parent_plug_id=>wwv_flow_imp.id(2117115442922826158)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>20
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2117116557564826169)
,p_plug_name=>'REPORTE'
,p_region_name=>'REPORTE'
,p_parent_plug_id=>wwv_flow_imp.id(2117115695276826160)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1114852796068253464)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	ID,',
'    CLASE,',
'    ORDEN,',
'    ID_PADRE,',
'    CODIGO_EMPRESA,',
'    NUMERO_CUENTA,',
'    DESCRIPCION,',
'    (',
'        REPLACE(TO_CHAR(INGRESOS, ''999G999G999G999G990D00''), '' '', '''')',
'    ) INGRESOS,',
'    (',
'        REPLACE(TO_CHAR(EGRESOS, ''999G999G999G999G990D00''), '' '', '''')',
'    ) EGRESOS,',
'    (',
'        CASE',
'            WHEN VARIACION IS NOT NULL THEN',
'                CASE',
'                    WHEN VARIACION >= 0 THEN REPLACE(TO_CHAR(VARIACION, ''999G999G999G999G990D00''), '' '', '''')',
'                    ELSE ''('' || REPLACE(TO_CHAR(ABS(VARIACION), ''999G999G999G999G990D00''), '' '', '''') || '')''',
'                END',
'            ELSE NULL',
'        END',
'    ) VARIACION,',
'    TIPO_RENGLON,',
'    (',
'        CASE',
'            WHEN VARIACION < 0 THEN ''color: red;''',
'            ELSE NULL',
'        END',
'    ) CLASE_NEGATIVO',
'FROM TABLE',
'(',
'	SAF.GET_FDU_REPORTE_CUADRO_ORIGEN_USO_FONDOS',
'	(',
'		P_EMPRESAS => :P84004_VECTOR_EMPRESA,',
'	    P_FECHA_INICIO => :P84004_FECHA_INICIAL,',
'        P_FECHA_FIN => :P84004_FECHA_FINAL,',
'	    P_MONEDA => :P84004_MONEDA',
'	)',
'	',
')',
'START WITH ID_PADRE IS NULL ',
'CONNECT BY PRIOR ID = ID_PADRE',
'ORDER SIBLINGS BY ORDEN, NUMERO_CUENTA;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84004_VECTOR_EMPRESA,P84004_MONEDA,P84004_FECHA_INICIAL,P84004_FECHA_FINAL'
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
 p_id=>wwv_flow_imp.id(2117116657959826170)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>2117116657959826170
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(264457565242341149)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(264460387538341154)
,p_db_column_name=>'CLASE'
,p_display_order=>110
,p_column_identifier=>'W'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(250266304659485638)
,p_db_column_name=>'ORDEN'
,p_display_order=>150
,p_column_identifier=>'AA'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(250266862634485643)
,p_db_column_name=>'ID_PADRE'
,p_display_order=>200
,p_column_identifier=>'AF'
,p_column_label=>'Id Padre'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(330788095387450902)
,p_db_column_name=>'CODIGO_EMPRESA'
,p_display_order=>210
,p_column_identifier=>'AQ'
,p_column_label=>'Codigo Empresa'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(330788170140450903)
,p_db_column_name=>'NUMERO_CUENTA'
,p_display_order=>220
,p_column_identifier=>'AR'
,p_column_label=>'Numero Cuenta'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(330788207864450904)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>230
,p_column_identifier=>'AS'
,p_column_label=>'Descripcion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE#">  ',
'    #DESCRIPCION#',
'</span>',
'',
'<input id="TIPO_RENGLON" type="hidden" value="#TIPO_RENGLON#">',
'<input id="ID" type="hidden" value="#ID#">',
'<input id="ID_PADRE" type="hidden" value="#ID_PADRE#">',
'<input id="NUMERO_CUENTA" type="hidden" value="#NUMERO_CUENTA#">',
'<input id="DESCRIPCION" type="hidden" value="#DESCRIPCION#">'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'DESCRIPCION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(330788662956450908)
,p_db_column_name=>'TIPO_RENGLON'
,p_display_order=>270
,p_column_identifier=>'AW'
,p_column_label=>'Tipo Renglon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(330788728861450909)
,p_db_column_name=>'INGRESOS'
,p_display_order=>280
,p_column_identifier=>'AX'
,p_column_label=>'Ingresos'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE#">  ',
'    #INGRESOS#',
'</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'INGRESOS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(330788824810450910)
,p_db_column_name=>'EGRESOS'
,p_display_order=>290
,p_column_identifier=>'AY'
,p_column_label=>'Egresos'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE#">  ',
'    #EGRESOS#',
'</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'EGRESOS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(330788943618450911)
,p_db_column_name=>'VARIACION'
,p_display_order=>300
,p_column_identifier=>'AZ'
,p_column_label=>'Variacion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE# #CLASE_NEGATIVO#">  ',
'    #VARIACION#',
'</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'VARIACION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(330789036561450912)
,p_db_column_name=>'CLASE_NEGATIVO'
,p_display_order=>310
,p_column_identifier=>'BA'
,p_column_label=>'Clase Negativo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2117708938704144405)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'1834497'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'DESCRIPCION:INGRESOS:EGRESOS:VARIACION:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(264446911660341099)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(1912074118286420994)
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
 p_id=>wwv_flow_imp.id(264447320823341101)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_button_name=>'REPORTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(99637924649244052)
,p_button_image_alt=>'Reporte'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84004_EMPRESA IS NOT NULL AND',
':P84004_MONEDA IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_button_cattributes=>'style="margin-top:30px";'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(264496102321341220)
,p_branch_name=>'CARGAR_DATOS'
,p_branch_action=>'f?p=&APP_ID.:84004:&SESSION.::&DEBUG.:84004:P84004_FECHA_INICIAL,P84004_FECHA_FINAL,P84004_MONEDA,P84004_EMPRESA,P84004_VECTOR_EMPRESA:&P84004_FECHA_INICIAL.,&P84004_FECHA_FINAL.,&P84004_MONEDA.,&P84004_EMPRESA.,&P84004_VECTOR_EMPRESA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'CARGAR_DATOS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264447744525341111)
,p_name=>'P84004_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
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
'    SELECT ',
'        CODIGO_EMPRESA||'' - ''||NVL(NOMBRE_PERSONA,RAZON_SOCIAL) NOMBRE, ',
'        CODIGO_EMPRESA',
'    FROM GRAL_PERSONAS_TABLE E, GRAL_EMPRESAS P',
'    WHERE E.CODIGO_PERSONA = P.CODIGO_PERSONA',
'    AND P.CODIGO_ESTADO IN ',
'    (',
'        SELECT ',
'            CODIGO_ESTATUS',
'        FROM GRAL_ESTATUS_MODULOS',
'        WHERE CODIGO_MODULO = 1',
'        AND PERMITE_MOVTOS = ''S''',
'    )    ',
'    AND P.CODIGO_EMPRESA > 99',
'    ORDER BY P.CODIGO_EMPRESA',
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
 p_id=>wwv_flow_imp.id(264448182932341115)
,p_name=>'P84004_MES_INICIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264449745383341117)
,p_name=>'P84004_MONEDA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
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
 p_id=>wwv_flow_imp.id(264450133030341119)
,p_name=>'P84004_ANIO_MENOS_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264450544687341119)
,p_name=>'P84004_NOMBRE_TITULO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264450978903341120)
,p_name=>'P84004_FECHA_TITULO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264451323110341120)
,p_name=>'P84004_NOMBRE_MONEDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264451770585341121)
,p_name=>'P84004_SIMBOLO_MONEDA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264452178912341121)
,p_name=>'P84004_VECTOR_EMPRESA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264453526293341130)
,p_name=>'P84004_ID_REGISTRO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2117115442922826158)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264453943156341130)
,p_name=>'P84004_TIPO_RENGLON'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2117115442922826158)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264467849250341186)
,p_name=>'P84004_JASPER'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264468102734341187)
,p_name=>'P84004_AUTENTICATION'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264468528426341188)
,p_name=>'P84004_DIA_FIN'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264468932474341188)
,p_name=>'P84004_CODIGO_USUARIO'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(264469333279341189)
,p_name=>'P84004_PERMISOS'
,p_item_sequence=>70
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330790080249450922)
,p_name=>'P84004_ID_PADRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2117115442922826158)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330790182872450923)
,p_name=>'P84004_NUMERO_CUENTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2117115442922826158)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330791519187450937)
,p_name=>'P84004_DESCRIPCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(2117115442922826158)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330792613201450948)
,p_name=>'P84004_EMPRESAS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(2117115442922826158)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(361101687465885704)
,p_name=>'P84004_FECHA_INICIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_item_default=>'TRUNC(TO_DATE(''01/01/2020'', ''DD/MM/YYYY''))'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha Inicial'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'ITEM'
,p_attribute_05=>'P84004_STATIC_FECHA_INICIAL'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(361101887604885706)
,p_name=>'P84004_STATIC_FECHA_INICIAL'
,p_item_sequence=>80
,p_item_default=>'TRUNC(TO_DATE(''01/01/2020'', ''DD/MM/YYYY''))'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(361101933589885707)
,p_name=>'P84004_STATIC_FECHA_FINAL'
,p_item_sequence=>90
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(361102078429885708)
,p_name=>'P84004_FECHA_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1912074118286420994)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Fecha Final'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(99637075642244038)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'ITEM'
,p_attribute_08=>'P84004_STATIC_FECHA_FINAL'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(264482347987341208)
,p_name=>'GENERAR_DATOS'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(264446911660341099)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P84004_EMPRESA'').getValue() != '''' &&',
'apex.item(''P84004_MONEDA'').getValue() != '''''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(264482841785341209)
,p_event_id=>wwv_flow_imp.id(264482347987341208)
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
'            REGEXP_SUBSTR(:P84004_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84004_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
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
'            REGEXP_SUBSTR(:P84004_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84004_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
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
'    :P84004_VECTOR_EMPRESA := V_VECTOR;',
'END;'))
,p_attribute_02=>'P84004_EMPRESA'
,p_attribute_03=>'P84004_VECTOR_EMPRESA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(264483351532341209)
,p_event_id=>wwv_flow_imp.id(264482347987341208)
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
 p_id=>wwv_flow_imp.id(264483858077341209)
,p_event_id=>wwv_flow_imp.id(264482347987341208)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_DATOS'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CARGAR_DATOS'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(264486034453341211)
,p_name=>'MODIFICAR_RENGLON'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_condition_element=>'P84004_PERMISOS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'MODIFICAR_RENGLON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(264486505917341211)
,p_event_id=>wwv_flow_imp.id(264486034453341211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nota = apex.item(''P84004_ID_REGISTRO'').getValue();',
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
 p_id=>wwv_flow_imp.id(330789302258450915)
,p_name=>'VER_REGISTROS'
,p_event_sequence=>160
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#REPORTE td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO_RENGLON]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(332224790445408709)
,p_event_id=>wwv_flow_imp.id(330789302258450915)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'COLOR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REPORTE'').find(''tr'').removeClass("selected");',
'$(this.triggeringElement).closest(''tr'')[0].classList.toggle("selected");'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(330789501363450917)
,p_event_id=>wwv_flow_imp.id(330789302258450915)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'TPO_RENGLON'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84004_TIPO_RENGLON'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO_RENGLON]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(330789610898450918)
,p_event_id=>wwv_flow_imp.id(330789302258450915)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ID_REGISTRO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84004_ID_REGISTRO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(330790236045450924)
,p_event_id=>wwv_flow_imp.id(330789302258450915)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'ID_PADRE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84004_ID_PADRE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID_PADRE]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(330790339709450925)
,p_event_id=>wwv_flow_imp.id(330789302258450915)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'NUMERO_CUENTA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84004_NUMERO_CUENTA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=NUMERO_CUENTA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(330791637676450938)
,p_event_id=>wwv_flow_imp.id(330789302258450915)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'DESCRIPCION'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84004_DESCRIPCION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=DESCRIPCION]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(330789441593450916)
,p_event_id=>wwv_flow_imp.id(330789302258450915)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'MENU_VER_REGISTRO'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'VER_REGISTRO'
,p_attribute_02=>'SEP'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84004_TIPO_RENGLON'
,p_client_condition_expression=>'DETALLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(330789720115450919)
,p_event_id=>wwv_flow_imp.id(330789302258450915)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'MENU_MODIFICAR_RENGLON'
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
'            return true;',
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
'    }',
'};'))
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84004_TIPO_RENGLON'
,p_client_condition_expression=>'TITULO_RENGLON'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(330789838151450920)
,p_name=>'REFRESH'
,p_event_sequence=>170
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(330789936403450921)
,p_event_id=>wwv_flow_imp.id(330789838151450920)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'REPORTE'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2117116557564826169)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(330790406271450926)
,p_name=>'VER_REGISTROS_MODAL'
,p_event_sequence=>180
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'VER_REGISTROS_MODAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(330790672286450928)
,p_event_id=>wwv_flow_imp.id(330790406271450926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let id_registro = apex.item(''P84004_ID_REGISTRO'').getValue();',
'let tipo_renglon = apex.item(''P84004_TIPO_RENGLON'').getValue();',
'let id_padre = apex.item(''P84004_ID_PADRE'').getValue();',
'let numero_cuenta = apex.item(''P84004_NUMERO_CUENTA'').getValue();',
'let descripcion = apex.item(''P84004_DESCRIPCION'').getValue();',
'let vector_empresa = apex.item(''P84004_EMPRESAS'').getValue();',
'let moneda = apex.item(''P84004_MONEDA'').getValue();',
'let fecha_inicio = apex.item(''P84004_FECHA_INICIAL'').getValue();',
'let fecha_fin = apex.item(''P84004_FECHA_FINAL'').getValue();',
'let titulo_fecha = apex.item(''P84004_FECHA_TITULO'').getValue();',
'',
'let vector = [''EMPRESA'',''PROVEEDOR'',''CLIENTE'',''PROYECTO''];',
'',
'if (vector.indexOf(descripcion) === -1) {',
'    descripcion = ''SIN_GRUPO''',
'}',
'',
'var url = `f?p=&APP_ID.:84010:&APP_SESSION.::NO:84010:P84010_ID_REGISTRO,P84010_TIPO_RENGLON,P84010_ID_PADRE,P84010_NUMERO_CUENTA,P84010_DESCRIPCION,P84010_FECHA_INICIO,P84010_FECHA_FIN,P84010_VECTOR_EMPRESA,P84010_MONEDA,P84010_FECHA_TITULO:${id_reg'
||'istro},${tipo_renglon},${id_padre},${numero_cuenta},${descripcion},${fecha_inicio},${fecha_fin},${vector_empresa},${moneda},${titulo_fecha}`;',
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
'    console.log("status---" + status + " error----" + error);',
'}',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(333914192132966627)
,p_name=>'IMPRIMIR_REPORTE'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(264447320823341101)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333914265821966628)
,p_event_id=>wwv_flow_imp.id(333914192132966627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_EMPRESAS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- REPORTES_FINANCIEROS_CONFIGURACION',
'DELETE FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'    WHERE TIPO_REPORTE = 93',
'    AND CONCEPTO = ''EMPRESASA REPORTE FDU''',
'    AND USUARIO_GRABACION = :GLOBAL_CODIGO_USUARIO;',
'',
'INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'(',
'    TIPO_REPORTE,',
'    ID_ASOCIACION,',
'    ID_RENGLON_REPORTE,',
'    CONCEPTO,',
'    USUARIO_GRABACION,',
'    FECHA_GRABACION,',
'    EJERCICIO',
')',
'SELECT',
'    93 TIPO_REPORTE,',
'    REGEXP_SUBSTR(:P84004_VECTOR_EMPRESA, ''[^\:]+'', 1, level) AS ID_ASOCIACION,',
'    NULL,',
'    ''EMPRESASA REPORTE FDU'' CONCEPTO,',
'    :GLOBAL_CODIGO_USUARIO,',
'    SYSDATE,',
'    NULL',
'FROM ',
'    dual CONNECT BY REGEXP_SUBSTR(:P84004_VECTOR_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL;'))
,p_attribute_02=>'P84004_VECTOR_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333914330143966629)
,p_event_id=>wwv_flow_imp.id(333914192132966627)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/REPORTE_CUADRO_ORIGEN_USO_FONDOS.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P84004_JASPER,:P84004_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P84004_JASPER,P84004_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333914496546966630)
,p_event_id=>wwv_flow_imp.id(333914192132966627)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P84004_JASPER" ).getValue() +',
'    "&P_VECTOR_EMPRESA="+ apex.item( "P84004_VECTOR_EMPRESA" ).getValue() +',
'    "&P_FECHA_INICIO=" + apex.item( "P84004_FECHA_INICIAL" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_FECHA_FIN="+ apex.item( "P84004_FECHA_FINAL" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_MONEDA=" + apex.item( "P84004_MONEDA" ).getValue() +',
'    "&P_TITULO_MONEDA=" + "Cifras Expresadas en " + apex.item( "P84004_NOMBRE_MONEDA" ).getValue() +',
'    "&P_FECHA_TITULO=" + apex.item( "P84004_FECHA_TITULO" ).getValue() +',
'    apex.item( "P84004_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(264470190569341192)
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
 p_id=>wwv_flow_imp.id(264472922320341197)
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
'    :P84004_PERMISOS := 0;',
'    --:P84004_EMPRESA := 0;',
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
'                :P84004_PERMISOS := 1;',
'            END IF;',
'        END;',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(264469749452341191)
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
'            REGEXP_SUBSTR(:P84004_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84004_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
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
'            REGEXP_SUBSTR(:P84004_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84004_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
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
'    :P84004_VECTOR_EMPRESA := V_VECTOR;',
'    :P84004_EMPRESAS := REPLACE(V_VECTOR,'':'',''|'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84004_EMPRESA IS NOT NULL AND',
':P84004_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(264472561730341196)
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
'        SELECT ',
'            REGEXP_SUBSTR(:P84004_VECTOR_EMPRESA, ''[^\:]+'', 1, level) AS CODIGO_DIVISION',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84004_VECTOR_EMPRESA, ''[^\:]+'', 1, level) IS NOT NULL',
'        ); ',
'    ',
'    V_CONTADOR NUMBER := 0;',
'BEGIN',
'    OPEN C_VECTOR;',
'        FETCH C_VECTOR INTO V_CONTADOR;',
'    CLOSE C_VECTOR;',
'',
'    IF V_CONTADOR = 1 THEN',
'        :P84004_NOMBRE_TITULO := SAF.FN_NOMBRE_EMPRESA(:P84004_VECTOR_EMPRESA);',
'    ELSE',
'        :P84004_NOMBRE_TITULO := ''AICSA CORP.'';',
'    END IF;',
'',
'    SELECT',
'        NOMBRE_MONEDA',
'        INTO ',
'        :P84004_NOMBRE_MONEDA',
'    FROM SAF.GRAL_MONEDAS',
'    WHERE CODIGO_MONEDA = :P84004_MONEDA;',
'',
'    /*:P84004_ANIO_MENOS_1:= TO_NUMBER(:P84004_ANIO) - 1;',
'',
'    :P84004_FECHA_TITULO := ''Al '' ',
'        || TO_CHAR(LAST_DAY(TO_DATE(''01/''||:P84004_MES_FINAL||''/''||:P84004_ANIO_MENOS_1,''DD/MM/YYYY'')), ''DD'')',
'        || '' de '' || TO_CHAR(TO_DATE(:P84004_MES_FINAL, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' de '' || :P84004_ANIO;',
'',
'    :P84004_DIA_FIN := TO_CHAR(LAST_DAY(TO_DATE(TO_CHAR(:P84004_MES_FINAL) || ''/'' || 2023, ''MM/YYYY'')), ''DD'');*/',
'',
'    :P84004_FECHA_TITULO := ''Del '' || EXTRACT (DAY FROM TO_DATE(:P84004_FECHA_INICIAL, ''DD/MM/YYYY'')) || '' de ''',
'        || TO_CHAR(TO_DATE(:P84004_FECHA_INICIAL, ''DD/MM/YYYY''), ''Month'', ''nls_date_language=spanish'') || '' del ''',
'        || EXTRACT (YEAR FROM TO_DATE(:P84004_FECHA_INICIAL, ''DD/MM/YYYY'')) || '' al ''',
'        || EXTRACT (DAY FROM TO_DATE(:P84004_FECHA_FINAL, ''DD/MM/YYYY'')) || '' de ''',
'        || TO_CHAR(TO_DATE(:P84004_FECHA_FINAL, ''DD/MM/YYYY''), ''Month'', ''nls_date_language=spanish'') || '' del ''',
'        || EXTRACT (YEAR FROM TO_DATE(:P84004_FECHA_FINAL, ''DD/MM/YYYY''));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P84004_EMPRESA IS NOT NULL AND',
':P84004_MONEDA IS NOT NULL'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(264471734307341195)
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
