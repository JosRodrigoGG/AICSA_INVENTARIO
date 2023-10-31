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
--   Date and Time:   10:00 Tuesday October 31, 2023
--   Exported By:     RODRIGO.GARCIA@AICSACORP.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 84011
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84011
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84011);
end;
/
prompt --application/pages/page_84011
begin
wwv_flow_imp_page.create_page(
 p_id=>84011
,p_name=>'MODAL_VER_REGISTROS_DETALLE'
,p_alias=>'MODAL-VER-REGISTROS-DETALLE'
,p_page_mode=>'MODAL'
,p_step_title=>'MODAL_VER_REGISTROS_DETALLE'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#javascript/globalFunctions#MIN#.js',
'#WORKSPACE_FILES#crear-btns-modal.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const btns = [',
'    {',
'        textBtn: ''Reporte'',',
'        icon: ''fa-file-pdf-o'',',
'        idbtn: ''REPORTE'',',
'    },',
'    {',
'        textBtn: ''Cancelar'',',
'        icon: ''fa-remove'',',
'        idbtn: ''CANCELAR'',',
'    }',
']',
'',
'customButtonsModal(''MODAL_DETALLE_2'', btns);',
'',
'function verRegistroRegion2()',
'{',
'    $.event.trigger("ABRIR_MODAL_FDU");',
'}',
'',
'function verRegistro()',
'{',
'    if (apex.item("P84011_TIPO_MOVIMIENTO_T").value == ''E'') {',
'        $.event.trigger("ABRIR_MODAL_EGRESOS");',
'    } else {',
'        $.event.trigger("ABRIR_MODAL_INGRESOS");',
'    }',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#saf-cssnew.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#REPORTE_DETALLE_2 th#VALOR_VARIACION, #REPORTE_DETALLE_2 td[headers=VALOR_VARIACION],',
'#REPORTE_DETALLE_2 th#VALOR_EGRESO, #REPORTE_DETALLE_2 td[headers=VALOR_EGRESO],',
'#REPORTE_DETALLE_2 th#VALOR_INGRESO, #REPORTE_DETALLE_2 td[headers=VALOR_INGRESO],',
'#REPORTE_DETALLE_1 th#INGRESOS, #REPORTE_DETALLE_1 td[headers=INGRESOS],',
'#REPORTE_DETALLE_1 th#EGRESOS, #REPORTE_DETALLE_1 td[headers=EGRESOS],',
'#REPORTE_DETALLE_1 th#VARIACION, #REPORTE_DETALLE_1 td[headers=VARIACION]',
'{',
'    width: 150px !important;',
'    min-width: 150px !important;',
'    max-width: 150px !important;',
'}',
'',
'#REPORTE_DETALLE_2 th#CODIGO_PROYECTO, #REPORTE_DETALLE_2 td[headers=CODIGO_PROYECTO],',
'#REPORTE_DETALLE_2 th#FECHA_TRANSACCION, #REPORTE_DETALLE_2 td[headers=FECHA_TRANSACCION],',
'#REPORTE_DETALLE_2 th#CODIGO_CENTRO_COSTO, #REPORTE_DETALLE_2 td[headers=CODIGO_CENTRO_COSTO],',
'#REPORTE_DETALLE_1 th#CODIGO_EMPRESA, #REPORTE_DETALLE_1 td[headers=CODIGO_EMPRESA]',
'{',
'    width: 180px !important;',
'    min-width: 180px !important;',
'    max-width: 180px !important;',
'}',
'',
'#REPORTE_DETALLE_2 th#SERIE_DOCUMENTO, #REPORTE_DETALLE_2 td[headers=SERIE_DOCUMENTO],',
'#REPORTE_DETALLE_2 th#NUMERO_DOCUMENTO, #REPORTE_DETALLE_2 td[headers=NUMERO_DOCUMENTO]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'    max-width: 100px !important;',
'}',
'',
'#REPORTE_DETALLE_1 th#ID, #REPORTE_DETALLE_1 td[headers=ID]',
'{',
'    width: 80px !important;',
'    min-width: 80px !important;',
'    max-width: 80px !important;',
'}',
'',
'#REPORTE_DETALLE_1 th#FECHA_ACEPTACION, #REPORTE_DETALLE_1 td[headers=FECHA_ACEPTACION]',
'{',
'    width: 100px !important;',
'    min-width: 100px !important;',
'    max-width: 100px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'MODAL_DETALLE_2'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20231030155945'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(333913559178966621)
,p_plug_name=>'TITULO_REPORTE'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:rigth;">AICSA Corp</h4>',
'<h5 style="text-align:rigth;">Cuadro de Origen y Uso de Fondos</h5>',
'<h5 style="text-align:rigth;">&P84011_FECHA_TITULO.</h5>',
'<h5 style="text-align:rigth;">(Cifras Expresadas en &P84011_NOMBRE_MONEDA.)</h5>',
'<h5 style="text-align:rigth; margin-left: 20px;">&P84011_TITULO_TABLA.</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(664555200544521615)
,p_plug_name=>'REPORTE_DETALLE_1'
,p_region_name=>'REPORTE_DETALLE_1'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1025110645912851487)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DATOS AS',
'(',
'    SELECT',
'    	A.CODIGO_EMPRESA,',
'    	SAF.GET_FDU_NOMBRE_DESTINATARIO',
'    	(',
'    		A.ID_ASOCIACION,',
'    		A.CODIGO_EMPRESA,',
'    		A.TIPO_DESTINATARIO',
'    	) DESCRIPCION,',
'    	(',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			NVL(A.MONTO_RECUPERADO_ORIGEN, 0),',
'    			A.CODIGO_MONEDA,',
'    			:P84011_MONEDA,',
'    			A.TASA_CAMBIO,',
'    			NULL',
'    		)',
'    	) INGRESOS,',
'    	(',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			A.MONTO_ORIGEN,',
'    			A.CODIGO_MONEDA,',
'    			:P84011_MONEDA,',
'    			A.TASA_CAMBIO,',
'    			NULL',
'    		)',
'    	) EGRESOS,',
'    	(',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			NVL(A.MONTO_RECUPERADO_ORIGEN, 0),',
'    			A.CODIGO_MONEDA,',
'    			:P84011_MONEDA,',
'    			A.TASA_CAMBIO,',
'    			NULL',
'    		)',
'    		-',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			A.MONTO_ORIGEN,',
'    			A.CODIGO_MONEDA,',
'    			:P84011_MONEDA,',
'    			A.TASA_CAMBIO,',
'    			NULL',
'    		)',
'    	) VARIACION,',
'        A.ID,',
'        B.FECHA_ACEPTACION,',
'        A.OBSERVACIONES',
'    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A',
'    INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG B',
'    	ON B.ID_FDU_TRANSACCIONES_FINANCIERAS = A.ID',
'    	AND (B.ESTADO = ''ACEPTADO'' OR B.ESTADO= ''CANCELADO'')',
'    WHERE A.CODIGO_EMPRESA IN',
'    (',
'    	SELECT ',
'            REGEXP_SUBSTR(:P84011_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_EMPRESA',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84011_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'    )',
'    --AND EXTRACT(MONTH FROM B.FECHA_ACEPTACION) <= :P84011_MES',
'    --AND EXTRACT(YEAR FROM B.FECHA_ACEPTACION) <= :P84011_ANIO',
'    AND TRUNC(B.FECHA_ACEPTACION) BETWEEN TRUNC(TO_DATE(:P84011_FECHA_INICIO, ''DD/MM/YYYY'')) AND TRUNC(TO_DATE(:P84011_FECHA_FIN, ''DD/MM/YYYY''))',
'    AND A.TIPO_DESTINATARIO = :P84011_DESCRIPCION',
'    AND A.CODIGO_EMPRESA = :P84011_CODIGO_EMPRESA',
'    AND A.ES_PRESTAMO = :P84011_ES_PRESTAMO',
'    ORDER BY B.FECHA_ACEPTACION ASC',
'    --GROUP BY A.CODIGO_EMPRESA, A.ID_ASOCIACION, A.TIPO_DESTINATARIO',
')',
'SELECT',
'    CODIGO_EMPRESA,',
'    DESCRIPCION,',
'    (',
'        REPLACE(TO_CHAR(NVL(INGRESOS, 0), ''999G999G999G999G990D00''), '' '', '''')',
'    ) INGRESOS,',
'    (',
'        REPLACE(TO_CHAR(NVL(EGRESOS, 0), ''999G999G999G999G990D00''), '' '', '''')',
'    ) EGRESOS,',
'    (',
'        CASE',
'            WHEN NVL(VARIACION, 0) IS NOT NULL THEN',
'                CASE',
'                    WHEN NVL(VARIACION, 0) >= 0 THEN REPLACE(TO_CHAR(NVL(VARIACION, 0), ''999G999G999G999G990D00''), '' '', '''')',
'                    ELSE ''('' || REPLACE(TO_CHAR(NVL(ABS(VARIACION), 0), ''999G999G999G999G990D00''), '' '', '''') || '')''',
'                END',
'            ELSE NULL',
'        END',
'    ) VARIACION,',
'    (',
'        CASE',
'            WHEN NVL(VARIACION, 0) < 0 THEN ''color: red;''',
'            ELSE NULL',
'        END',
'    ) CLASE,',
'    NULL CLASE_2,',
'    ID,',
'    FECHA_ACEPTACION,',
'    OBSERVACIONES',
'FROM DATOS',
'UNION ALL',
'SELECT',
'    NULL CODIGO_EMPRESA,',
'    ''&emsp;&emsp;Sub Total'' DESCRIPCION,',
'    (',
'        REPLACE(TO_CHAR(NVL(SUM(INGRESOS), 0), ''999G999G999G999G990D00''), '' '', '''')',
'    ) INGRESOS,',
'    (',
'        REPLACE(TO_CHAR(NVL(SUM(EGRESOS), 0), ''999G999G999G999G990D00''), '' '', '''')',
'    ) EGRESOS,',
'    (',
'        CASE',
'            WHEN NVL(SUM(VARIACION), 0) IS NOT NULL THEN',
'                CASE',
'                    WHEN NVL(SUM(VARIACION), 0) >= 0 THEN REPLACE(TO_CHAR(NVL(SUM(VARIACION), 0), ''999G999G999G999G990D00''), '' '', '''')',
'                    ELSE ''('' || REPLACE(TO_CHAR(NVL(ABS(SUM(VARIACION)), 0), ''999G999G999G999G990D00''), '' '', '''') || '')''',
'                END',
'            ELSE NULL',
'        END',
'    ) VARIACION,',
'    (',
'        CASE',
'            WHEN NVL(SUM(VARIACION), 0) < 0 THEN ''color: red;''',
'            ELSE NULL',
'        END',
'    ) CLASE,',
'    ''font-weight: bold;'' CLASE_2,',
'    NULL ID,',
'    NULL FECHA_ACEPTACION,',
'    NULL OBSERVACIONES',
'FROM DATOS;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84011_MONEDA,P84011_VECTOR_EMPRESA,P84011_DESCRIPCION,P84011_CODIGO_EMPRESA,P84011_ES_PRESTAMO,P84011_FECHA_INICIO,P84011_FECHA_FIN'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P84011_DESCRIPCION'
,p_plug_display_when_cond2=>'SIN_GRUPO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'REPORTE_DETALLE_1'
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
 p_id=>wwv_flow_imp.id(665989538981479398)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>665989538981479398
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333767224913070710)
,p_db_column_name=>'CODIGO_EMPRESA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Codigo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_static_id=>'CODIGO_EMPRESA'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333767625198070712)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Acreedor'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE_2#">  ',
'    #DESCRIPCION#',
'</span>',
'',
'<input id="ID" type="hidden" value="#ID#"> '))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'DESCRIPCION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333768011960070713)
,p_db_column_name=>'INGRESOS'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>'Ingresos'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE_2#">  ',
'    #INGRESOS#',
'</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'INGRESOS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333768422612070713)
,p_db_column_name=>'EGRESOS'
,p_display_order=>40
,p_column_identifier=>'G'
,p_column_label=>'Egresos'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE_2#">  ',
'    #EGRESOS#',
'</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'EGRESOS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333768898782070714)
,p_db_column_name=>'VARIACION'
,p_display_order=>50
,p_column_identifier=>'H'
,p_column_label=>'Variacion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE# #CLASE_2#">  ',
'    #VARIACION#',
'</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'VARIACION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333769297946070715)
,p_db_column_name=>'CLASE'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333769635193070715)
,p_db_column_name=>'CLASE_2'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>'Clase 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333912970591966615)
,p_db_column_name=>'ID'
,p_display_order=>80
,p_column_identifier=>'K'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'ID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333913015108966616)
,p_db_column_name=>'FECHA_ACEPTACION'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'FECHA_ACEPTACION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333913121082966617)
,p_db_column_name=>'OBSERVACIONES'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Descripcion'
,p_column_type=>'STRING'
,p_static_id=>'OBSERVACIONES'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(667433842039580636)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3336714'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:DESCRIPCION:OBSERVACIONES:FECHA_ACEPTACION:INGRESOS:EGRESOS:VARIACION:'
,p_sort_column_1=>'FECHA_ACEPTACION'
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
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(664555320250521616)
,p_plug_name=>'REPORTE_DETALLE_2'
,p_region_name=>'REPORTE_DETALLE_2'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1025110645912851487)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH VALORES AS',
'(',
'    SELECT ',
'        A.CODIGO_EMPRESA,',
'        B.NUMERO_CUENTA,',
'        (SAF.APX_FNC_CONVERSION_MONEDAS',
'        (',
'            NVL(C.VALOR_ORIGEN, 0),',
'            NVL(C.CODIGO_MONEDA, 1),',
'            :P84010_MONEDA,',
'            NULL,',
'            NULL',
'        )) VALOR_EGRESO,',
'        --C.VALOR_ORIGEN VALOR_EGRESO,',
'        0 VALOR_INGRESO,',
'        A.CODIGO_CC CODIGO_CENTRO_COSTO,',
'        A.FECHA_TRANSACCION,',
'        A.SERIE_DOCUMENTO,',
'        A.NUMERO_DOCUMENTO,',
'        ''E'' TIPO_MOVIMIENTO,',
'        A.TIPO_TRANSACCION,',
'        A.CODIGO_PROVEEDOR,',
'        A.CORRE,',
'        NULL ROWID_VALOR',
'    FROM CXP_TRANSACCIONES A, EST_PROYECTOS B, CXP_RELACION_DOCUMENTOS C',
'    WHERE A.TIPO_TRANSACCION = 34',
'    AND C.TIPO_TRANSACCION_ABONO != 957',
'    AND A.CODIGO_CC = B.CODIGO_CC(+)',
'    AND A.TIPO_TRANSACCION = C.TIPO_TRANSACCION_CARGO(+)',
'    AND A.CODIGO_PROVEEDOR = C.CODIGO_PROVEEDOR(+)',
'    AND A.SERIE_DOCUMENTO  = C.SERIE_DOCUMENTO_CARGO(+)',
'    AND A.NUMERO_DOCUMENTO = C.NUMERO_DOCUMENTO_CARGO(+)',
'    --AND EXTRACT(MONTH FROM A.FECHA_TRANSACCION) >= :P84010_MES',
'    --AND EXTRACT(YEAR FROM A.FECHA_TRANSACCION) >= :P84010_ANIO',
'    AND TRUNC(A.FECHA_TRANSACCION) BETWEEN TRUNC(TO_DATE(:P84011_FECHA_INICIO, ''DD/MM/YYYY'')) AND TRUNC(TO_DATE(:P84011_FECHA_FIN, ''DD/MM/YYYY''))',
'    AND A.CODIGO_EMPRESA IN',
'    (',
'        SELECT ',
'            REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_EMPRESA',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'    )',
'    AND NVL(B.NUMERO_CUENTA, -1) IN',
'    (',
'        NVL(:P84010_NUMERO_CUENTA, -1)',
'    )',
'    AND SAF.GET_CENTRO_COSTO_PADRE(A.CODIGO_CC) IN',
'    (',
'        :P84011_CODIGO_CC',
'    )',
'    UNION ALL',
'    SELECT ',
'        E.CODIGO_EMPRESA, ',
'        G.NUMERO_CUENTA,',
'        0 VALOR_EGRESO,',
'        (SAF.APX_FNC_CONVERSION_MONEDAS',
'        (',
'            NVL(E.VALOR, 0),',
'            1,',
'            :P84010_MONEDA,',
'            NULL,',
'            NULL',
'        )) VALOR_INGRESO,',
'        F.CODIGO_CC CODIGO_CENTRO_COSTO,',
'        E.FEDOC,',
'        E.SERIE,',
'        E.NUMDOC,',
'        ''I'' TIPO_MOVIMIENTO,',
'        NULL TIPO_TRANSACCION,',
'        NULL CODIGO_PROVEEDOR,',
'        NULL CORRE,',
'        E.ROWID ROWID_VALOR',
'    FROM BCOMOVIG E, BCOMOVID F, EST_PROYECTOS G',
'    WHERE E.CODIGO_EMPRESA = F.CODIGO_EMPRESA',
'    AND E.CODMAE = F.CODMAE',
'    AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION',
'    AND E.SERIE = F.SERIE',
'    AND E.NUMDOC = F.NUMDOC',
'    AND F.CODIGO_CC = G.CODIGO_CC',
'    AND E.CODIGO_EMPRESA IN',
'    (',
'        SELECT ',
'            REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_EMPRESA',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'    )',
'    --AND EXTRACT(MONTH FROM E.FEDOC) <= :P84010_MES',
'    --AND EXTRACT(YEAR FROM E.FEDOC) <= :P84010_ANIO',
'    AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(:P84011_FECHA_INICIO, ''DD/MM/YYYY'')) AND TRUNC(TO_DATE(:P84011_FECHA_FIN, ''DD/MM/YYYY''))',
'    AND E.TIPO_TRANSACCION IN ',
'    (',
'        SELECT ',
'            TIPO_TRANSACCION',
'        FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM',
'        WHERE CODIGO_MODULO = 8',
'        AND CARGO_ABONO   = ''C''',
'        AND TIPO_TRANSACCION NOT IN (14)',
'    )',
'    AND NVL(G.NUMERO_CUENTA, -1) IN',
'    (',
'        NVL(:P84010_NUMERO_CUENTA, -1)',
'    )',
'    AND SAF.GET_CENTRO_COSTO_PADRE(F.CODIGO_CC) IN',
'    (',
'        :P84011_CODIGO_CC',
'    )',
')',
'SELECT',
'    NVL(SAF.FNC_GET_NOMBRE_CLIENTE(A.CODIGO_EMPRESA, A.NUMERO_CUENTA), A.CODIGO_EMPRESA || '' - Otros Registros'') DESCRIPCION, ',
'    (',
'        REPLACE(TO_CHAR(NVL((A.VALOR_INGRESO), 0), ''999G999G999G999G990D00''), '' '', '''')',
'    ) VALOR_INGRESO,',
'    (',
'        REPLACE(TO_CHAR(NVL((A.VALOR_EGRESO), 0), ''999G999G999G999G990D00''), '' '', '''')',
'    ) VALOR_EGRESO,',
'    (',
'        CASE',
'            WHEN NVL((A.VALOR_INGRESO), 0) - NVL((A.VALOR_EGRESO), 0) IS NOT NULL THEN',
'                CASE',
'                    WHEN (NVL((A.VALOR_INGRESO), 0) - NVL((A.VALOR_EGRESO), 0)) >= 0 THEN REPLACE(TO_CHAR((NVL((A.VALOR_INGRESO), 0) - NVL((A.VALOR_EGRESO), 0)), ''999G999G999G999G990D00''), '' '', '''')',
'                    ELSE ''('' || REPLACE(TO_CHAR(ABS((NVL((A.VALOR_INGRESO), 0) - NVL((A.VALOR_EGRESO), 0))), ''999G999G999G999G990D00''), '' '', '''') || '')''',
'                END',
'            ELSE NULL',
'        END',
'    ) VALOR_VARIACION,',
'    SAF.GET_CENTRO_COSTO_PADRE(A.CODIGO_CENTRO_COSTO) CODIGO_CC_PADRE,',
'    B.CODIGO_PROYECTO,',
'    B.DESCRIPCION DESCRIPCION_PROYECTO,',
'    (',
'        CASE',
'            WHEN NVL((A.VALOR_INGRESO), 0) - NVL((A.VALOR_EGRESO), 0) < 0 THEN ''color: red;''',
'            ELSE NULL',
'        END',
'    ) CLASE,',
'    NULL CLASE_2,',
'    FECHA_TRANSACCION,',
'    SERIE_DOCUMENTO,',
'    NUMERO_DOCUMENTO,',
'    CODIGO_CENTRO_COSTO,',
'    SAF.FNC_GET_CENTROCOSTOS(CODIGO_CENTRO_COSTO) NOMBRE_CC,',
'    TIPO_MOVIMIENTO,',
'    TIPO_TRANSACCION,',
'    CODIGO_PROVEEDOR,',
'    CORRE,',
'    A.CODIGO_EMPRESA,',
'    A.ROWID_VALOR',
'FROM VALORES A',
'LEFT JOIN SAF.EST_PROYECTOS B',
'    ON B.CODIGO_PROYECTO = SAF.GET_CENTRO_COSTO_PADRE(A.CODIGO_CENTRO_COSTO)',
'UNION ALL',
'SELECT',
'    ''&emsp;&emsp;Sub Total'' DESCRIPCION,',
'    (',
'        REPLACE(TO_CHAR(NVL(SUM(A.VALOR_INGRESO), 0), ''999G999G999G999G990D00''), '' '', '''')',
'    ) VALOR_INGRESO,',
'    (',
'        REPLACE(TO_CHAR(NVL(SUM(A.VALOR_EGRESO), 0), ''999G999G999G999G990D00''), '' '', '''')',
'    ) VALOR_EGRESO,',
'    (',
'        CASE',
'            WHEN NVL(SUM(A.VALOR_INGRESO), 0) - NVL(SUM(A.VALOR_EGRESO), 0) IS NOT NULL THEN',
'                CASE',
'                    WHEN (NVL(SUM(A.VALOR_INGRESO), 0) - NVL(SUM(A.VALOR_EGRESO), 0)) >= 0 THEN REPLACE(TO_CHAR((NVL(SUM(A.VALOR_INGRESO), 0) - NVL(SUM(A.VALOR_EGRESO), 0)), ''999G999G999G999G990D00''), '' '', '''')',
'                    ELSE ''('' || REPLACE(TO_CHAR(ABS((NVL(SUM(A.VALOR_INGRESO), 0) - NVL(SUM(A.VALOR_EGRESO), 0))), ''999G999G999G999G990D00''), '' '', '''') || '')''',
'                END',
'            ELSE NULL',
'        END',
'    ) VALOR_VARIACION,',
'    NULL CODIGO_CC_PADRE,',
'    NULL CODIGO_PROYECTO,',
'    NULL DESCRIPCION_PROYECTO,',
'    (',
'        CASE',
'            WHEN NVL(SUM(A.VALOR_INGRESO), 0) - NVL(SUM(A.VALOR_EGRESO), 0) < 0 THEN ''color: red;''',
'            ELSE NULL',
'        END',
'    ) CLASE,',
'    ''font-weight: bold;'' CLASE_2,',
'    NULL FECHA_TRANSACCION,',
'    NULL SERIE_DOCUMENTO,',
'    NULL NUMERO_DOCUMENTO,',
'    NULL CODIGO_CENTRO_COSTO,',
'    NULL NOMBRE_CC,',
'    NULL TIPO_MOVIMIENTO,',
'    NULL TIPO_TRANSACCION,',
'    NULL CODIGO_PROVEEDOR,',
'    NULL CORRE,',
'    NULL CODIGO_EMPRESA,',
'    NULL ROWID_VALOR',
'FROM VALORES A;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84011_MONEDA,P84011_VECTOR_EMPRESA,P84011_NUMERO_CUENTA,P84011_CODIGO_CC,P84011_FECHA_INICIO,P84011_FECHA_FIN'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P84011_DESCRIPCION'
,p_plug_display_when_cond2=>'SIN_GRUPO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'REPORTE_DETALLE_2'
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
 p_id=>wwv_flow_imp.id(665986448548479367)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>665986448548479367
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333770643013070724)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'&P84011_TITULO_TABLA.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE_2#">  ',
'    #DESCRIPCION#',
'</span>',
'',
'<input id="CODIGO_CC" type="hidden" value="#CODIGO_CC#">',
'',
'<input id="CODIGO_EMPRESA" type="hidden" value="#CODIGO_EMPRESA#">',
'<input id="TIPO_TRANSACCION" type="hidden" value="#TIPO_TRANSACCION#">',
'<input id="CORRE" type="hidden" value="#CORRE#">',
'<input id="SERIE_DOCUMENTO" type="hidden" value="#SERIE_DOCUMENTO#">',
'<input id="NUMERO_DOCUMENTO" type="hidden" value="#NUMERO_DOCUMENTO#">',
'<input id="TIPO_MOVIMIENTO" type="hidden" value="#TIPO_MOVIMIENTO#">',
'<input id="CODIGO_PROVEEDOR" type="hidden" value="#CODIGO_PROVEEDOR#">',
'<input id="ROWID_VALOR" type="hidden" value="#ROWID_VALOR#">'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'DESCRIPCION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333772227076070726)
,p_db_column_name=>'CODIGO_CC_PADRE'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Codigo Cc Padre'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333772632579070727)
,p_db_column_name=>'CODIGO_PROYECTO'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Codigo Proyecto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'CODIGO_PROYECTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333773059627070728)
,p_db_column_name=>'DESCRIPCION_PROYECTO'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Nombre Proyecto'
,p_column_type=>'STRING'
,p_static_id=>'DESCRIPCION_PROYECTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333773466293070728)
,p_db_column_name=>'VALOR_INGRESO'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>'Ingresos'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE_2#">  ',
'    #VALOR_INGRESO#',
'</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'VALOR_INGRESO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333773810070070729)
,p_db_column_name=>'VALOR_EGRESO'
,p_display_order=>120
,p_column_identifier=>'N'
,p_column_label=>'Egresos'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE_2#">  ',
'    #VALOR_EGRESO#',
'</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'VALOR_EGRESO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333774280869070729)
,p_db_column_name=>'VALOR_VARIACION'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Variacion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE# #CLASE_2#">  ',
'    #VALOR_VARIACION#',
'</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'VALOR_VARIACION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333774637878070730)
,p_db_column_name=>'CLASE'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333775015388070731)
,p_db_column_name=>'CLASE_2'
,p_display_order=>150
,p_column_identifier=>'Q'
,p_column_label=>'Clase 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332228822252408750)
,p_db_column_name=>'FECHA_TRANSACCION'
,p_display_order=>160
,p_column_identifier=>'R'
,p_column_label=>'Fecha Transaccion'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'FECHA_TRANSACCION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333911523693966601)
,p_db_column_name=>'SERIE_DOCUMENTO'
,p_display_order=>170
,p_column_identifier=>'S'
,p_column_label=>'Serie <br>Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_static_id=>'SERIE_DOCUMENTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333911609892966602)
,p_db_column_name=>'NUMERO_DOCUMENTO'
,p_display_order=>180
,p_column_identifier=>'T'
,p_column_label=>'Numero <br>Documento'
,p_column_type=>'NUMBER'
,p_static_id=>'NUMERO_DOCUMENTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333911716017966603)
,p_db_column_name=>'CODIGO_CENTRO_COSTO'
,p_display_order=>190
,p_column_identifier=>'U'
,p_column_label=>'Codigo <br> Centro Costo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'CODIGO_CENTRO_COSTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(333911842393966604)
,p_db_column_name=>'NOMBRE_CC'
,p_display_order=>200
,p_column_identifier=>'V'
,p_column_label=>'Nombre<br> Centro Costo'
,p_column_type=>'STRING'
,p_static_id=>'NOMBRE_CC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(343437914451356734)
,p_db_column_name=>'TIPO_MOVIMIENTO'
,p_display_order=>210
,p_column_identifier=>'W'
,p_column_label=>'Tipo Movimiento'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(343438037914356735)
,p_db_column_name=>'TIPO_TRANSACCION'
,p_display_order=>220
,p_column_identifier=>'X'
,p_column_label=>'Tipo Transaccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(343438197358356736)
,p_db_column_name=>'CODIGO_PROVEEDOR'
,p_display_order=>230
,p_column_identifier=>'Y'
,p_column_label=>'Codigo Proveedor'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(343438252839356737)
,p_db_column_name=>'CORRE'
,p_display_order=>240
,p_column_identifier=>'Z'
,p_column_label=>'Corre'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345458900678757908)
,p_db_column_name=>'CODIGO_EMPRESA'
,p_display_order=>250
,p_column_identifier=>'AA'
,p_column_label=>'Codigo Empresa'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345459417759757913)
,p_db_column_name=>'ROWID_VALOR'
,p_display_order=>260
,p_column_identifier=>'AB'
,p_column_label=>'Rowid Valor'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(665995248584491288)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3322328'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DESCRIPCION:CODIGO_PROYECTO:DESCRIPCION_PROYECTO:FECHA_TRANSACCION:SERIE_DOCUMENTO:NUMERO_DOCUMENTO:CODIGO_CENTRO_COSTO:NOMBRE_CC:VALOR_INGRESO:VALOR_EGRESO:VALOR_VARIACION:'
,p_sort_column_1=>'FECHA_TRANSACCION'
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
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(665987613337479379)
,p_plug_name=>'VARIABLES'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(333776134923070746)
,p_button_sequence=>50
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
 p_id=>wwv_flow_imp.id(333916392861966649)
,p_button_sequence=>60
,p_button_name=>'REPORTE'
,p_button_static_id=>'REPORTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'REPORTE'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333762904298070692)
,p_name=>'P84011_ID_REGISTRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333763396449070698)
,p_name=>'P84011_TIPO_RENGLON'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333763746638070699)
,p_name=>'P84011_ID_PADRE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333764161245070699)
,p_name=>'P84011_NUMERO_CUENTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333764561053070700)
,p_name=>'P84011_DESCRIPCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333764913695070700)
,p_name=>'P84011_MES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333765388618070701)
,p_name=>'P84011_ANIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333765714613070701)
,p_name=>'P84011_VECTOR_EMPRESA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333766137055070701)
,p_name=>'P84011_MONEDA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333766583804070702)
,p_name=>'P84011_TITULO_TABLA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333775747752070732)
,p_name=>'P84011_CODIGO_CC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333912876024966614)
,p_name=>'P84011_CODIGO_EMPRESA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333913650725966622)
,p_name=>'P84011_FECHA_TITULO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333913714946966623)
,p_name=>'P84011_NOMBRE_MONEDA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(336596107484278103)
,p_name=>'P84011_JASPER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(336596249629278104)
,p_name=>'P84011_AUTENTICATION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(336596456479278106)
,p_name=>'P84011_CODIGO_USUARIO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_item_default=>':GLOBAL_CODIGO_USUARIO'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(343436365203356718)
,p_name=>'P84011_ES_PRESTAMO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_item_default=>':GLOBAL_CODIGO_USUARIO'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(343436823518356723)
,p_name=>'P84011_ID_FDU'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(664555200544521615)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(343437629277356731)
,p_name=>'P84011_URL'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(343438318288356738)
,p_name=>'P84011_CODIGO_EMPRESA_T'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(664555320250521616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(343438448590356739)
,p_name=>'P84011_TIPO_TRANSACCION_T'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(664555320250521616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(343438530666356740)
,p_name=>'P84011_CORRE_T'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(664555320250521616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(343438640315356741)
,p_name=>'P84011_SERIE_DOCUMENTO_T'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(664555320250521616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(343438700133356742)
,p_name=>'P84011_NUMERO_DOCUMENTO_T'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(664555320250521616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345458258999757901)
,p_name=>'P84011_TIPO_MOVIMIENTO_T'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(664555320250521616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345458773947757906)
,p_name=>'P84011_CODIGO_PROVEEDOR_T'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(664555320250521616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(345459393207757912)
,p_name=>'P84011_ROWID_T_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(664555320250521616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(361102386412885711)
,p_name=>'P84011_FECHA_INICIO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(361102448070885712)
,p_name=>'P84011_FECHA_FIN'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(665987613337479379)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(333776979487070752)
,p_name=>'NOMBRE_MODAL'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333777460847070754)
,p_event_id=>wwv_flow_imp.id(333776979487070752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".MODAL_DETALLE_2 .ui-dialog-title").text(apex.item(''P84011_TITULO_TABLA'').getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(333778782120070755)
,p_name=>'CANCELAR'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(333776134923070746)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333779234660070755)
,p_event_id=>wwv_flow_imp.id(333778782120070755)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84010,estado:0});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(333911921828966605)
,p_name=>'DOBLE_ALTURA'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(664555320250521616)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333912099194966606)
,p_event_id=>wwv_flow_imp.id(333911921828966605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var divElement = document.getElementById("REPORTE_DETALLE_2_data_panel");',
'if (divElement) {',
'    var tableElement = divElement.querySelector("table");',
'    if (tableElement) {',
'        var tableId = tableElement.getAttribute("id");',
'    }',
'} ',
'var table = document.getElementById(tableId);',
'table.style.height = "55px";'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(333916494989966650)
,p_name=>'GENERAR_REPORTE'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(333916392861966649)
,p_condition_element=>'P84011_DESCRIPCION'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'SIN_GRUPO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(336595981489278101)
,p_event_id=>wwv_flow_imp.id(333916494989966650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_EMPRESAS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_EMPRESAS IS',
'        SELECT',
'            REGEXP_SUBSTR(:P84011_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS ID_EMPRESAS',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84011_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL;',
'BEGIN',
'    -- REPORTES_FINANCIEROS_CONFIGURACION',
'    DELETE FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'        WHERE TIPO_REPORTE = 93',
'        AND CONCEPTO = ''EMPRESASA REPORTE FDU''',
'        AND USUARIO_GRABACION = :GLOBAL_CODIGO_USUARIO;',
'',
'    FOR R_EMPRESAS IN C_EMPRESAS',
'    LOOP',
'        INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'        (',
'            TIPO_REPORTE,',
'            ID_ASOCIACION,',
'            ID_RENGLON_REPORTE,',
'            CONCEPTO,',
'            USUARIO_GRABACION,',
'            FECHA_GRABACION,',
'            EJERCICIO',
'        )',
'        VALUES',
'        (',
'            93,',
'            TO_NUMBER(R_EMPRESAS.ID_EMPRESAS),',
'            NULL,',
'            ''EMPRESASA REPORTE FDU'',',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE,',
'            NULL',
'        );',
'    END LOOP;',
'END;'))
,p_attribute_02=>'P84011_VECTOR_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(336596073845278102)
,p_event_id=>wwv_flow_imp.id(333916494989966650)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_EMPRESAS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_EMPRESAS IS',
'        SELECT',
'            REGEXP_SUBSTR(:P84011_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS ID_EMPRESAS',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84011_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL;',
'BEGIN',
'    -- REPORTES_FINANCIEROS_CONFIGURACION',
'    DELETE FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'        WHERE TIPO_REPORTE = 93',
'        AND CONCEPTO = ''EMPRESASA REPORTE FDU''',
'        AND USUARIO_GRABACION = :GLOBAL_CODIGO_USUARIO;',
'',
'    FOR R_EMPRESAS IN C_EMPRESAS',
'    LOOP',
'        INSERT INTO SAF.REPORTES_FINANCIEROS_CONFIGURACION',
'        (',
'            TIPO_REPORTE,',
'            ID_ASOCIACION,',
'            ID_RENGLON_REPORTE,',
'            CONCEPTO,',
'            USUARIO_GRABACION,',
'            FECHA_GRABACION,',
'            EJERCICIO',
'        )',
'        VALUES',
'        (',
'            93,',
'            TO_NUMBER(R_EMPRESAS.ID_EMPRESAS),',
'            NULL,',
'            ''EMPRESASA REPORTE FDU'',',
'            :GLOBAL_CODIGO_USUARIO,',
'            SYSDATE,',
'            NULL',
'        );',
'    END LOOP;',
'END;'))
,p_attribute_02=>'P84011_VECTOR_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(336596372441278105)
,p_event_id=>wwv_flow_imp.id(333916494989966650)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/REPORTE_CUADRO_ORIGEN_USO_FONDOS_DETALLE_3.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P84011_JASPER,:P84011_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P84011_JASPER,P84011_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(336596634396278108)
,p_event_id=>wwv_flow_imp.id(333916494989966650)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/REPORTE_CUADRO_ORIGEN_USO_FONDOS_DETALLE_4.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P84011_JASPER,:P84011_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P84011_JASPER,P84011_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(336596580619278107)
,p_event_id=>wwv_flow_imp.id(333916494989966650)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR ARCHIVOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P84011_JASPER" ).getValue() +',
'    "&P_VECTOR_EMPRESA="+ "TEMP" +',
'    "&P_FECHA_FIN=" + apex.item( "P84011_FECHA_FIN" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_FECHA_INICIO="+ apex.item( "P84011_FECHA_INICIO" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_MONEDA=" + apex.item( "P84011_MONEDA" ).getValue() +',
'    "&P_TITULO_MONEDA=" + "Cifras Expresadas en " + apex.item( "P84011_NOMBRE_MONEDA" ).getValue() +',
'    "&P_FECHA_TITULO=" + apex.item( "P84011_FECHA_TITULO" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P84011_CODIGO_USUARIO" ).getValue() +',
'    "&P_CODIGO_EMPRESA=" + apex.item( "P84011_CODIGO_EMPRESA" ).getValue() +',
'    "&P_DESCRIPCION=" + apex.item( "P84011_DESCRIPCION" ).getValue() +',
'    "&P_ES_PRESTAMO=" + apex.item( "P84011_ES_PRESTAMO" ).getValue() +',
'    apex.item( "P84011_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(336596755056278109)
,p_event_id=>wwv_flow_imp.id(333916494989966650)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR ARCHIVOS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P84011_JASPER" ).getValue() +',
'    "&P_VECTOR_EMPRESA="+ "TEMP" +',
'    "&P_FECHA_FIN=" + apex.item( "P84011_FECHA_FIN" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_FECHA_INICIO="+ apex.item( "P84011_FECHA_INICIO" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_MONEDA=" + apex.item( "P84011_MONEDA" ).getValue() +',
'    "&P_TITULO_MONEDA=" + "Cifras Expresadas en " + apex.item( "P84011_NOMBRE_MONEDA" ).getValue() +',
'    "&P_FECHA_TITULO=" + apex.item( "P84011_FECHA_TITULO" ).getValue() +',
'    "&P_NUMERO_CUENTA=" + apex.item( "P84011_NUMERO_CUENTA" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P84011_CODIGO_USUARIO" ).getValue() +',
'    "&P_CODIGO_CC=" + apex.item( "P84011_CODIGO_CC" ).getValue() +',
'    apex.item( "P84011_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(343436930523356724)
,p_name=>'VER_REGISTRO_1'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#REPORTE_DETALLE_1 td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343437773009356732)
,p_event_id=>wwv_flow_imp.id(343436930523356724)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'ID'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84011_ID_FDU'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ID]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343437056418356725)
,p_event_id=>wwv_flow_imp.id(343436930523356724)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'COLOR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REPORTE_DETALLE_1'').find(''tr'').removeClass("selected");',
'$(this.triggeringElement).closest(''tr'')[0].classList.toggle("selected");'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343437124532356726)
,p_event_id=>wwv_flow_imp.id(343436930523356724)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'VER_MENU'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'VER_REGISTRO_R2'
,p_attribute_02=>'SEP'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(343438886552356743)
,p_name=>'VER_REGISTRO_2'
,p_event_sequence=>60
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#REPORTE_DETALLE_2 td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO_MOVIMIENTO]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345458314007757902)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'TIPO_MOVIMIENTO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84011_TIPO_MOVIMIENTO_T'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO_MOVIMIENTO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343438914046356744)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CODIGO_EMPRESA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84011_CODIGO_EMPRESA_T'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=CODIGO_EMPRESA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345459567578757914)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'ROWID_VALOR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84011_ROWID_T_1'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=ROWID_VALOR]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345458822025757907)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CODIGO_PROVEEDOR'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84011_CODIGO_PROVEEDOR_T'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=CODIGO_PROVEEDOR]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343439269837356747)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'TIPO_TRANSACCION'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84011_TIPO_TRANSACCION_T'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=TIPO_TRANSACCION]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343439336941356748)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'CORRE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84011_CORRE_T'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=CORRE]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343439469201356749)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'SERIE_DOCUMENTO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84011_SERIE_DOCUMENTO_T'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=SERIE_DOCUMENTO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343439574634356750)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'NUMERO_DOCUMENTO'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84011_NUMERO_DOCUMENTO_T'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=NUMERO_DOCUMENTO]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343439010708356745)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'COLOR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REPORTE_DETALLE_2'').find(''tr'').removeClass("selected");',
'$(this.triggeringElement).closest(''tr'')[0].classList.toggle("selected");'))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84011_TIPO_MOVIMIENTO_T'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343439197793356746)
,p_event_id=>wwv_flow_imp.id(343438886552356743)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'VER_MENU'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'VER_REGISTRO'
,p_attribute_02=>'SEP'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P84011_TIPO_MOVIMIENTO_T'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(343437468973356729)
,p_name=>'ABRIR_MODAL_FDU'
,p_event_sequence=>70
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ABRIR_MODAL_FDU'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343437549134356730)
,p_event_id=>wwv_flow_imp.id(343437468973356729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=133:84006:&SESSION.:::84006:P84006_ACCION_MODAL,P84006_ID:VER_REGISTRO,'' || :P84011_ID_FDU,',
'    p_triggering_element => ''apex.jQuery(''''#LISTA'''')'' ) url ',
'into :P84011_URL',
'FROM DUAL;'))
,p_attribute_02=>'P84011_ID_FDU'
,p_attribute_03=>'P84011_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(343437879084356733)
,p_event_id=>wwv_flow_imp.id(343437468973356729)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P84011_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345458460866757903)
,p_name=>'ABRIR_MODAL_EGRESOS'
,p_event_sequence=>80
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ABRIR_MODAL_EGRESOS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345458516771757904)
,p_event_id=>wwv_flow_imp.id(345458460866757903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=130:66:&SESSION.:::66:P66_CODIGO_PROVEEDOR,P66_TIPO_TRANSACCION,P66_SERIE_DOCUMENTO,P66_NUMERO_DOCUMENTO,P66_CORRE,P66_CODIGO_EMPRESA:'' ',
'        || :P84011_CODIGO_PROVEEDOR_T || '','' || :P84011_TIPO_TRANSACCION_T || '','' || :P84011_SERIE_DOCUMENTO_T || '','' || :P84011_NUMERO_DOCUMENTO_T || '','' ||',
'        :P84011_CORRE_T || '','' || :P84011_CODIGO_EMPRESA_T,',
'    p_triggering_element => ''apex.jQuery(''''#LISTA'''')'' ) url ',
'into :P84011_URL',
'FROM DUAL;'))
,p_attribute_02=>'P84011_CODIGO_PROVEEDOR_T,P84011_TIPO_TRANSACCION_T,P84011_SERIE_DOCUMENTO_T,P84011_NUMERO_DOCUMENTO_T,P84011_CORRE_T,P84011_CODIGO_EMPRESA_T'
,p_attribute_03=>'P84011_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345458614922757905)
,p_event_id=>wwv_flow_imp.id(345458460866757903)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P84011_URL").getValue());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(345459045709757909)
,p_name=>'ABRIR_MODAL_INGRESOS'
,p_event_sequence=>90
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ABRIR_MODAL_INGRESOS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345459159876757910)
,p_event_id=>wwv_flow_imp.id(345459045709757909)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'URL'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url (',
'    p_url => ''f?p=115:84012:&SESSION.:::84012:P84012_ROWID,P84012_ES_MODIFICACION:'' ',
'        || :P84011_ROWID_T_1 || '',N'',',
'    p_triggering_element => ''apex.jQuery(''''#LISTA'''')'' ) url ',
'into :P84011_URL',
'FROM DUAL;'))
,p_attribute_02=>'P84011_ROWID_T_1'
,p_attribute_03=>'P84011_URL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(345459243507757911)
,p_event_id=>wwv_flow_imp.id(345459045709757909)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ABRIR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval(apex.item("P84011_URL").getValue());'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(333914041156966626)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR_DATOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT',
'        NOMBRE_MONEDA',
'        INTO ',
'        :P84011_NOMBRE_MONEDA',
'    FROM SAF.GRAL_MONEDAS',
'    WHERE CODIGO_MONEDA = :P84011_MONEDA;',
'',
'    /*:P84011_FECHA_TITULO := ''Al '' ',
'        || TO_CHAR(LAST_DAY(TO_DATE(''01/''||:P84011_MES||''/''||:P84011_ANIO,''DD/MM/YYYY'')), ''DD'')',
'        || '' de '' || TO_CHAR(TO_DATE(:P84011_MES, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' de '' || :P84011_ANIO;*/',
'',
'    CASE',
'        WHEN :P84011_ID_PADRE = 324 THEN :P84011_ES_PRESTAMO := ''N'';',
'        ELSE :P84011_ES_PRESTAMO := ''S'';',
'    END CASE;',
'END;'))
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
