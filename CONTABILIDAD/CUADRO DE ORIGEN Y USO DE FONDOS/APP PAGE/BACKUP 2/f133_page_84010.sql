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
--     PAGE: 84010
--   Manifest End
--   Version:         22.2.5
--   Instance ID:     706408794592688
--

begin
null;
end;
/
prompt --application/pages/delete_84010
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>84010);
end;
/
prompt --application/pages/page_84010
begin
wwv_flow_imp_page.create_page(
 p_id=>84010
,p_name=>'MODAL_VER_REGISTROS'
,p_alias=>'MODAL-VER-REGISTROS'
,p_page_mode=>'MODAL'
,p_step_title=>'MODAL_VER_REGISTROS'
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
'customButtonsModal(''MODAL_DETALLE_1'', btns);',
'',
'function verRegistro()',
'{',
'    $.event.trigger(''ABRIR_MODAL'');',
'}',
'',
'function verRegistroRegion2()',
'{',
'    $.event.trigger(''ABRIR_MODAL_1'');',
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
'#REPORTE_DETALLE_2 th#CODIGO_CC_PADRE, #REPORTE_DETALLE_2 td[headers=CODIGO_CC_PADRE],',
'#REPORTE_DETALLE_1 th#CODIGO_EMPRESA, #REPORTE_DETALLE_1 td[headers=CODIGO_EMPRESA]',
'{',
'    width: 180px !important;',
'    min-width: 180px !important;',
'    max-width: 180px !important;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'MODAL_DETALLE_1'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_last_upd_yyyymmddhh24miss=>'20231030154531'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(330792711369450949)
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
'    	SUM(',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			NVL(A.MONTO_RECUPERADO_ORIGEN, 0),',
'    			A.CODIGO_MONEDA,',
'    			:P84010_MONEDA,',
'    			A.TASA_CAMBIO,',
'    			NULL',
'    		)',
'    	) INGRESOS,',
'    	SUM(',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			A.MONTO_ORIGEN,',
'    			A.CODIGO_MONEDA,',
'    			:P84010_MONEDA,',
'    			A.TASA_CAMBIO,',
'    			NULL',
'    		)',
'    	) EGRESOS,',
'    	SUM(',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			NVL(A.MONTO_RECUPERADO_ORIGEN, 0),',
'    			A.CODIGO_MONEDA,',
'    			:P84010_MONEDA,',
'    			A.TASA_CAMBIO,',
'    			NULL',
'    		)',
'    		-',
'    		SAF.APX_FNC_CONVERSION_MONEDAS',
'    		(',
'    			A.MONTO_ORIGEN,',
'    			A.CODIGO_MONEDA,',
'    			:P84010_MONEDA,',
'    			A.TASA_CAMBIO,',
'    			NULL',
'    		)',
'    	) VARIACION',
'    FROM SAF.FDU_TRANSACCIONES_FINANCIERAS A',
'    INNER JOIN SAF.FDU_TRANSACCIONES_FINANCIERAS_ESTADOS_LOG B',
'    	ON B.ID_FDU_TRANSACCIONES_FINANCIERAS = A.ID',
'    	AND (B.ESTADO = ''ACEPTADO'' OR B.ESTADO= ''CANCELADO'')',
'    WHERE A.CODIGO_EMPRESA IN',
'    (',
'    	SELECT ',
'            REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS CODIGO_EMPRESA',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL',
'    )',
'    --AND EXTRACT(MONTH FROM B.FECHA_ACEPTACION) <= :P84010_MES',
'    --AND EXTRACT(YEAR FROM B.FECHA_ACEPTACION) <= :P84010_ANIO',
'    AND TRUNC(B.FECHA_ACEPTACION) BETWEEN TRUNC(TO_DATE(:P84010_FECHA_INICIO, ''DD/MM/YYYY'')) AND TRUNC(TO_DATE(:P84010_FECHA_FIN, ''DD/MM/YYYY''))',
'    AND A.TIPO_DESTINATARIO = :P84010_DESCRIPCION',
'    AND A.ES_PRESTAMO = :P84010_ES_PRESTAMO',
'    GROUP BY A.CODIGO_EMPRESA, A.ID_ASOCIACION, A.TIPO_DESTINATARIO',
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
'    NULL CLASE_2',
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
'    ''font-weight: bold;'' CLASE_2',
'FROM DATOS;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84010_MONEDA,P84010_VECTOR_EMPRESA,P84010_DESCRIPCION,P84010_ES_PRESTAMO,P84010_FECHA_INICIO,P84010_FECHA_FIN'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P84010_DESCRIPCION'
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
 p_id=>wwv_flow_imp.id(332227049806408732)
,p_max_row_count=>'1000000'
,p_show_search_textbox=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>332227049806408732
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332227134081408733)
,p_db_column_name=>'CODIGO_EMPRESA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Codigo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'CODIGO_EMPRESA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332227287868408734)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Descripcion'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE_2#">  ',
'    #DESCRIPCION#',
'</span>',
'',
'<input id="CODIGO_EMPRESA" type="hidden" value="#CODIGO_EMPRESA#">'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'DESCRIPCION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332227674371408738)
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
 p_id=>wwv_flow_imp.id(332227754833408739)
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
 p_id=>wwv_flow_imp.id(332227827366408740)
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
 p_id=>wwv_flow_imp.id(332227961188408741)
,p_db_column_name=>'CLASE'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332228092703408742)
,p_db_column_name=>'CLASE_2'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>'Clase 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(333671352864509970)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3336714'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CODIGO_EMPRESA:DESCRIPCION:INGRESOS:EGRESOS:VARIACION:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(330792831075450950)
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
'        SUM(SAF.APX_FNC_CONVERSION_MONEDAS',
'        (',
'            NVL(C.VALOR_ORIGEN, 0),',
'            NVL(C.CODIGO_MONEDA, 1),',
'            :P84010_MONEDA,',
'            NULL,',
'            NULL',
'        )) VALOR_EGRESO,',
'        0 VALOR_INGRESO,',
'        A.CODIGO_CC CODIGO_CENTRO_COSTO',
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
'    AND TRUNC(A.FECHA_TRANSACCION) BETWEEN TRUNC(TO_DATE(:P84010_FECHA_INICIO, ''DD/MM/YYYY'')) AND TRUNC(TO_DATE(:P84010_FECHA_FIN, ''DD/MM/YYYY''))',
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
'    GROUP BY A.CODIGO_EMPRESA, B.NUMERO_CUENTA, A.CODIGO_CC',
'    UNION ALL',
'    SELECT ',
'        E.CODIGO_EMPRESA, ',
'        G.NUMERO_CUENTA,',
'        0 VALOR_EGRESO,',
'        SUM(SAF.APX_FNC_CONVERSION_MONEDAS',
'        (',
'            NVL(E.VALOR, 0),',
'            1,',
'            :P84010_MONEDA,',
'            NULL,',
'            NULL',
'        )) VALOR_INGRESO,',
'        F.CODIGO_CC CODIGO_CENTRO_COSTO',
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
'    AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(:P84010_FECHA_INICIO, ''DD/MM/YYYY'')) AND TRUNC(TO_DATE(:P84010_FECHA_FIN, ''DD/MM/YYYY''))',
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
'    GROUP BY E.CODIGO_EMPRESA, G.NUMERO_CUENTA, F.CODIGO_CC',
')',
'SELECT',
'    NVL(SAF.FNC_GET_NOMBRE_CLIENTE(A.CODIGO_EMPRESA, A.NUMERO_CUENTA), A.CODIGO_EMPRESA || '' - Otros Registros'') DESCRIPCION,',
'    --A.NUMERO_CUENTA, ',
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
'    --A.CODIGO_CENTRO_COSTO CODIGO_CC,',
'    SAF.GET_CENTRO_COSTO_PADRE(A.CODIGO_CENTRO_COSTO) CODIGO_CC_PADRE,',
'    --SAF.FNC_GET_CENTROCOSTOS(A.CODIGO_CENTRO_COSTO) NOMBRE_CC,',
'    B.CODIGO_PROYECTO,',
'    B.DESCRIPCION DESCRIPCION_PROYECTO,',
'    (',
'        CASE',
'            WHEN NVL(SUM(A.VALOR_INGRESO), 0) - NVL(SUM(A.VALOR_EGRESO), 0) < 0 THEN ''color: red;''',
'            ELSE NULL',
'        END',
'    ) CLASE,',
'    NULL CLASE_2',
'FROM VALORES A',
'LEFT JOIN SAF.EST_PROYECTOS B',
'    ON B.CODIGO_PROYECTO = SAF.GET_CENTRO_COSTO_PADRE(A.CODIGO_CENTRO_COSTO)',
'GROUP BY NVL(SAF.FNC_GET_NOMBRE_CLIENTE(A.CODIGO_EMPRESA, A.NUMERO_CUENTA), A.CODIGO_EMPRESA || '' - Otros Registros''), /*A.CODIGO_CENTRO_COSTO,*/',
'    /*SAF.FNC_GET_CENTROCOSTOS(A.CODIGO_CENTRO_COSTO),*/ B.CODIGO_PROYECTO, B.DESCRIPCION, SAF.GET_CENTRO_COSTO_PADRE(A.CODIGO_CENTRO_COSTO)',
'UNION ALL',
'SELECT',
'    ''&emsp;&emsp;Sub Total'' DESCRIPCION,',
'    --NULL NUMERO_CUENTA, ',
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
'    --NULL CODIGO_CC,',
'    NULL CODIGO_CC_PADRE,',
'    --NULL NOMBRE_CC,',
'    NULL CODIGO_PROYECTO,',
'    NULL DESCRIPCION_PROYECTO,',
'    (',
'        CASE',
'            WHEN NVL(SUM(A.VALOR_INGRESO), 0) - NVL(SUM(A.VALOR_EGRESO), 0) < 0 THEN ''color: red;''',
'            ELSE NULL',
'        END',
'    ) CLASE,',
'    ''font-weight: bold;'' CLASE_2',
'FROM VALORES A;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P84010_MONEDA,P84010_VECTOR_EMPRESA,P84010_NUMERO_CUENTA,P84010_FECHA_INICIO,P84010_FECHA_FIN'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P84010_DESCRIPCION'
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
 p_id=>wwv_flow_imp.id(332223959373408701)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'RODRIGO.GARCIA@AICSACORP.COM'
,p_internal_uid=>332223959373408701
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332224213474408704)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'&P84010_TITULO_TABLA.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="forSearch" style="padding:0px; display:inline-block; #CLASE_2#">  ',
'    #DESCRIPCION#',
'</span>',
'',
'<input id="CODIGO_CC" type="hidden" value="#CODIGO_CC_PADRE#">'))
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'DESCRIPCION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332225338827408715)
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
 p_id=>wwv_flow_imp.id(332225478372408716)
,p_db_column_name=>'DESCRIPCION_PROYECTO'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Nombre Proyecto'
,p_column_type=>'STRING'
,p_static_id=>'DESCRIPCION_PROYECTO'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332225553607408717)
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
 p_id=>wwv_flow_imp.id(332225680439408718)
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
 p_id=>wwv_flow_imp.id(332225719281408719)
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
 p_id=>wwv_flow_imp.id(332225852354408720)
,p_db_column_name=>'CLASE'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332226227357408724)
,p_db_column_name=>'CLASE_2'
,p_display_order=>150
,p_column_identifier=>'Q'
,p_column_label=>'Clase 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(332228709913408749)
,p_db_column_name=>'CODIGO_CC_PADRE'
,p_display_order=>160
,p_column_identifier=>'R'
,p_column_label=>'Centro Costo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'CODIGO_CC_PADRE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(332232759409420622)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3322328'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DESCRIPCION:CODIGO_CC_PADRE:CODIGO_PROYECTO:DESCRIPCION_PROYECTO:VALOR_INGRESO:VALOR_EGRESO:VALOR_VARIACION:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(332225124162408713)
,p_plug_name=>'VARIABLES'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(333913227728966618)
,p_plug_name=>'TITULO_REPORTE'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(99575797075243864)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h4 style="text-align:rigth;">AICSA Corp</h4>',
'<h5 style="text-align:rigth;">Cuadro de Origen y Uso de Fondos</h5>',
'<h5 style="text-align:rigth;">&P84010_FECHA_TITULO.</h5>',
'<h5 style="text-align:rigth;">(Cifras Expresadas en &P84010_NOMBRE_MONEDA.)</h5>',
'<h5 style="text-align:rigth; margin-left: 20px;">&P84010_TITULO_TABLA.</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(332226569328408727)
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
 p_id=>wwv_flow_imp.id(333914612232966632)
,p_button_sequence=>60
,p_button_name=>'REPORTE'
,p_button_static_id=>'REPORTE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(99637866577244052)
,p_button_image_alt=>'Reporte'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="display:none"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330791826631450940)
,p_name=>'P84010_ID_REGISTRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330791979016450941)
,p_name=>'P84010_TIPO_RENGLON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330792038043450942)
,p_name=>'P84010_ID_PADRE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330792107990450943)
,p_name=>'P84010_NUMERO_CUENTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330792221525450944)
,p_name=>'P84010_DESCRIPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330792385541450945)
,p_name=>'P84010_MES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330792420241450946)
,p_name=>'P84010_ANIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(330792561311450947)
,p_name=>'P84010_VECTOR_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(332224148352408703)
,p_name=>'P84010_MONEDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(332226094575408722)
,p_name=>'P84010_TITULO_TABLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(332228140700408743)
,p_name=>'P84010_CODIGO_CC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(330792831075450950)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333912736779966613)
,p_name=>'P84010_CODIGO_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(330792711369450949)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333913389778966619)
,p_name=>'P84010_NOMBRE_MONEDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333913464821966620)
,p_name=>'P84010_FECHA_TITULO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333915072821966636)
,p_name=>'P84010_CODIGO_USUARIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_item_default=>':GLOBAL_CODIGO_USUARIO'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333915269809966638)
,p_name=>'P84010_JASPER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_item_default=>':GLOBAL_CODIGO_USUARIO'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333915369299966639)
,p_name=>'P84010_AUTENTICATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_item_default=>':GLOBAL_CODIGO_USUARIO'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(343436231560356717)
,p_name=>'P84010_ES_PRESTAMO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_item_default=>':GLOBAL_CODIGO_USUARIO'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(361102199933885709)
,p_name=>'P84010_FECHA_INICIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_item_default=>':GLOBAL_CODIGO_USUARIO'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(361102261730885710)
,p_name=>'P84010_FECHA_FIN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(332225124162408713)
,p_item_default=>':GLOBAL_CODIGO_USUARIO'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(332226367545408725)
,p_name=>'NOMBRE_MODAL'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(332226455527408726)
,p_event_id=>wwv_flow_imp.id(332226367545408725)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'NOMBRE'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".MODAL_DETALLE_1 .ui-dialog-title").text(apex.item(''P84010_TITULO_TABLA'').getValue());'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(332226606623408728)
,p_name=>'CANCELAR'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(332226569328408727)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(332226742699408729)
,p_event_id=>wwv_flow_imp.id(332226606623408728)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CERRAR_MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true,{dialogPageId:84010,estado:0});'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(332226817320408730)
,p_name=>'VER_REGISTRO'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#REPORTE_DETALLE_2 td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=CODIGO_CC]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(332228373203408745)
,p_event_id=>wwv_flow_imp.id(332226817320408730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'COLOR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REPORTE_DETALLE_2 '').find(''tr'').removeClass("selected");',
'$(this.triggeringElement).closest(''tr'')[0].classList.toggle("selected");'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(332228403620408746)
,p_event_id=>wwv_flow_imp.id(332226817320408730)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CODIGO_CC'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84010_CODIGO_CC'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=CODIGO_CC]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(332226961284408731)
,p_event_id=>wwv_flow_imp.id(332226817320408730)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MENU_VER_REGISTRO'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'VER_REGISTRO'
,p_attribute_02=>'SEP'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(333912161997966607)
,p_name=>'VER_REGISTRO_REGION_1'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#REPORTE_DETALLE_1 td'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).closest(''tr'').find(''input[id=CODIGO_EMPRESA]'')[0] != undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333912219824966608)
,p_event_id=>wwv_flow_imp.id(333912161997966607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'COLOR'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REPORTE_DETALLE_2 '').find(''tr'').removeClass("selected");',
'$(this.triggeringElement).closest(''tr'')[0].classList.toggle("selected");'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333912380007966609)
,p_event_id=>wwv_flow_imp.id(333912161997966607)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CODIGO_EMPRESA'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P84010_CODIGO_EMPRESA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).closest(''tr'').find(''input[id=CODIGO_EMPRESA]'')[0].value'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333912452450966610)
,p_event_id=>wwv_flow_imp.id(333912161997966607)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'MENU_VER_REGISTRO'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_attribute_01=>'VER_REGISTRO_R2'
,p_attribute_02=>'SEP'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(332228541434408747)
,p_name=>'ABRIR_MODAL'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ABRIR_MODAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(332228635324408748)
,p_event_id=>wwv_flow_imp.id(332228541434408747)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let id_registro = apex.item(''P84010_ID_REGISTRO'').getValue();',
'let tipo_renglon = apex.item(''P84010_TIPO_RENGLON'').getValue();',
'let id_padre = apex.item(''P84010_ID_PADRE'').getValue();',
'let numero_cuenta = apex.item(''P84010_NUMERO_CUENTA'').getValue();',
'let descripcion = apex.item(''P84010_DESCRIPCION'').getValue();',
'let vector_empresa = apex.item(''P84010_VECTOR_EMPRESA'').getValue();',
'let moneda = apex.item(''P84010_MONEDA'').getValue();',
'let titulo_tabla = apex.item(''P84010_TITULO_TABLA'').getValue();',
'let codigo_cc = apex.item(''P84010_CODIGO_CC'').getValue();',
'let fecha_inicio = apex.item(''P84010_FECHA_INICIO'').getValue();',
'let fecha_fin = apex.item(''P84010_FECHA_FIN'').getValue();',
'let titulo_fecha = apex.item(''P84010_FECHA_TITULO'').getValue();',
'',
'var url = `f?p=&APP_ID.:84011:&APP_SESSION.::NO:84011:P84011_ID_REGISTRO,P84011_TIPO_RENGLON,P84011_ID_PADRE,P84011_NUMERO_CUENTA,P84011_DESCRIPCION,P84011_FECHA_INICIO,P84011_FECHA_FIN,P84011_VECTOR_EMPRESA,P84011_MONEDA,P84011_TITULO_TABLA,P84011_C'
||'ODIGO_CC,P84011_FECHA_TITULO:${id_registro},${tipo_renglon},${id_padre},${numero_cuenta},${descripcion},${fecha_inicio},${fecha_fin},${vector_empresa},${moneda},${titulo_tabla},${codigo_cc},${titulo_fecha}`;',
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
 p_id=>wwv_flow_imp.id(333912518294966611)
,p_name=>'ABRIR_MODAL_1'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ABRIR_MODAL_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333912614962966612)
,p_event_id=>wwv_flow_imp.id(333912518294966611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'MODAL'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let id_registro = apex.item(''P84010_ID_REGISTRO'').getValue();',
'let tipo_renglon = apex.item(''P84010_TIPO_RENGLON'').getValue();',
'let id_padre = apex.item(''P84010_ID_PADRE'').getValue();',
'let numero_cuenta = apex.item(''P84010_NUMERO_CUENTA'').getValue();',
'let descripcion = apex.item(''P84010_DESCRIPCION'').getValue();',
'let vector_empresa = apex.item(''P84010_VECTOR_EMPRESA'').getValue();',
'let moneda = apex.item(''P84010_MONEDA'').getValue();',
'let titulo_tabla = apex.item(''P84010_TITULO_TABLA'').getValue();',
'let codigo_cc = apex.item(''P84010_CODIGO_CC'').getValue();',
'let codigo_empresa = apex.item(''P84010_CODIGO_EMPRESA'').getValue();',
'let fecha_inicio = apex.item(''P84010_FECHA_INICIO'').getValue();',
'let fecha_fin  = apex.item(''P84010_FECHA_FIN'').getValue();',
'let titulo_fecha = apex.item(''P84010_FECHA_TITULO'').getValue();',
'',
'var url = `f?p=&APP_ID.:84011:&APP_SESSION.::NO:84011:P84011_ID_REGISTRO,P84011_TIPO_RENGLON,P84011_ID_PADRE,P84011_NUMERO_CUENTA,P84011_DESCRIPCION,P84011_FECHA_INICIO,P84011_FECHA_FIN,P84011_VECTOR_EMPRESA,P84011_MONEDA,P84011_TITULO_TABLA,P84011_C'
||'ODIGO_CC,P84011_CODIGO_EMPRESA,P84011_FECHA_TITULO:${id_registro},${tipo_renglon},${id_padre},${numero_cuenta},${descripcion},${fecha_inicio},${fecha_fin},${vector_empresa},${moneda},${titulo_tabla},${codigo_cc},${codigo_empresa},${titulo_fecha}`;',
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
 p_id=>wwv_flow_imp.id(333914742623966633)
,p_name=>'GENERAR_REPORTE'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(333914612232966632)
,p_condition_element=>'P84010_DESCRIPCION'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'SIN_GRUPO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333914818591966634)
,p_event_id=>wwv_flow_imp.id(333914742623966633)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_EMPRESAS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_EMPRESAS IS',
'        SELECT',
'            REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS ID_EMPRESAS',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL;',
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
,p_attribute_02=>'P84010_VECTOR_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333916069669966646)
,p_event_id=>wwv_flow_imp.id(333914742623966633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_EMPRESAS'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C_EMPRESAS IS',
'        SELECT',
'            REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) AS ID_EMPRESAS',
'        FROM ',
'            dual CONNECT BY REGEXP_SUBSTR(:P84010_VECTOR_EMPRESA, ''[^\|]+'', 1, level) IS NOT NULL;',
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
,p_attribute_02=>'P84010_VECTOR_EMPRESA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333916113173966647)
,p_event_id=>wwv_flow_imp.id(333914742623966633)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/REPORTE_CUADRO_ORIGEN_USO_FONDOS_DETALLE_2.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P84010_JASPER,:P84010_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P84010_JASPER,P84010_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333915150617966637)
,p_event_id=>wwv_flow_imp.id(333914742623966633)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'CARGAR_JASPER'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PCK_GRAL.FNC_PARAMETROS(''URL JASPER SERVER 02'') || ''Saf3_0/Contabilidad/REPORTE_CUADRO_ORIGEN_USO_FONDOS_DETALLE_1.pdf?'',',
'    PCK_GRAL.FNC_PARAMETROS(''JASPER AUTENTICACION'') ',
'INTO :P84010_JASPER,:P84010_AUTENTICATION',
'FROM DUAL;'))
,p_attribute_03=>'P84010_JASPER,P84010_AUTENTICATION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333916262994966648)
,p_event_id=>wwv_flow_imp.id(333914742623966633)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P84010_JASPER" ).getValue() +',
'    "&P_VECTOR_EMPRESA="+ "TEMP" +',
'    "&P_FECHA_INICIO=" + apex.item( "P84010_FECHA_INICIO" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_FECHA_FIN="+ apex.item( "P84010_FECHA_FIN" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_MONEDA=" + apex.item( "P84010_MONEDA" ).getValue() +',
'    "&P_TITULO_MONEDA=" + "Cifras Expresadas en " + apex.item( "P84010_NOMBRE_MONEDA" ).getValue() +',
'    "&P_FECHA_TITULO=" + apex.item( "P84010_FECHA_TITULO" ).getValue() +',
'    "&P_DESCRIPCION=" + apex.item( "P84010_DESCRIPCION" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P84010_CODIGO_USUARIO" ).getValue() +',
'    "&P_ES_PRESTAMO=" + apex.item( "P84010_ES_PRESTAMO" ).getValue() +',
'    apex.item( "P84010_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333915427905966640)
,p_event_id=>wwv_flow_imp.id(333914742623966633)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'DESCARGAR_ARCHIVO'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function(){',
'    var contenido = ',
'    apex.item( "P84010_JASPER" ).getValue() +',
'    "&P_VECTOR_EMPRESA="+ "TEMP" +',
'    "&P_FECHA_INICIO=" + apex.item( "P84010_FECHA_INICIO" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_FECHA_FIN="+ apex.item( "P84010_FECHA_FIN" ).getValue().replaceAll(''/'',''-'') +',
'    "&P_MONEDA=" + apex.item( "P84010_MONEDA" ).getValue() +',
'    "&P_TITULO_MONEDA=" + "Cifras Expresadas en " + apex.item( "P84010_NOMBRE_MONEDA" ).getValue() +',
'    "&P_FECHA_TITULO=" + apex.item( "P84010_FECHA_TITULO" ).getValue() +',
'    "&P_NUMERO_CUENTA=" + apex.item( "P84010_NUMERO_CUENTA" ).getValue() +',
'    "&P_CODIGO_USUARIO=" + apex.item( "P84010_CODIGO_USUARIO" ).getValue() +',
'    apex.item( "P84010_AUTENTICATION" ).getValue() +"";',
'',
'    javascript:window.open(contenido);',
'}, 1000);'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(332226192289408723)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NOMBRE_TITULOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT',
'        NOMBRE',
'    INTO',
'        :P84010_TITULO_TABLA',
'    FROM SAF.PLANTILLA_ASIGNACION_NOTAS',
'    WHERE ID = :P84010_ID_PADRE',
'    AND TIPO_REPORTE = 7;',
'',
'    SELECT',
'        NOMBRE_MONEDA',
'        INTO ',
'        :P84010_NOMBRE_MONEDA',
'    FROM SAF.GRAL_MONEDAS',
'    WHERE CODIGO_MONEDA = :P84010_MONEDA;',
'    ',
'    /*:P84010_FECHA_TITULO := ''Al ''',
'        || TO_CHAR(LAST_DAY(TO_DATE(''01/''||:P84010_MES||''/''||:P84010_ANIO,''DD/MM/YYYY'')), ''DD'')',
'        || '' de '' || TO_CHAR(TO_DATE(:P84010_MES, ''MM''), ''Month'', ''nls_date_language=spanish'') || '' de '' || :P84010_ANIO;*/',
'    CASE',
'        WHEN :P84010_ID_PADRE = 324 THEN :P84010_ES_PRESTAMO := ''N'';',
'        ELSE :P84010_ES_PRESTAMO := ''S'';',
'    END CASE;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(332228207285408744)
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
