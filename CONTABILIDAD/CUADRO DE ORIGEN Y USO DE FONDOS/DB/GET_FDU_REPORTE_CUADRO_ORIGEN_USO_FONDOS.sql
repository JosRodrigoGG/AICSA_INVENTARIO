CREATE OR REPLACE FUNCTION SAF.GET_FDU_REPORTE_CUADRO_ORIGEN_USO_FONDOS
(
	P_EMPRESAS VARCHAR2,
    P_MES_FIN NUMBER,
    P_ANIO NUMBER DEFAULT EXTRACT(YEAR FROM SYSDATE),
    P_MONEDA NUMBER DEFAULT 1
)
RETURN FDU_T_CUADRO_ORIGEN_USO_FONDO AS
	V_FDU_T_CUADRO_ORIGEN_USO_FONDO FDU_T_CUADRO_ORIGEN_USO_FONDO := FDU_T_CUADRO_ORIGEN_USO_FONDO();

    CURSOR C_ESTRUCTURA_TITULO IS
        SELECT
            A.ID,
            NULL ID_PADRE,
            (A.NOMBRE) AS NOMBRE,
            1 ORDEN,
            'TITULO_RENGLON' AS TIPO
        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A
        WHERE A.TIPO_REPORTE = 7;
    
    CURSOR C_ESTRUCTURA_SUB_TOTAL IS
        SELECT
            NULL ID,
            A.ID ID_PADRE,
            ('Sub Total') AS NOMBRE,
            2 ORDEN,
            'SUB_TOTAL_RENGLON' AS TIPO
        FROM SAF.PLANTILLA_ASIGNACION_NOTAS A
        WHERE A.TIPO_REPORTE = 7;

    CURSOR C_INGRESOS(V_MONEDA NUMBER, V_MES_FIN NUMBER, V_ANIO NUMBER, V_EMPRESAS VARCHAR2) IS
        SELECT 
            A.CODIGO_EMPRESA,
            B.NUMERO_CUENTA,
            SUM(SAF.APX_FNC_CONVERSION_MONEDAS
            (
                NVL(C.VALOR_ORIGEN, 0),
                NVL(C.CODIGO_MONEDA, 1),
                V_MONEDA,
                NULL,
                NULL
            )) VALOR
        FROM CXP_TRANSACCIONES A, EST_PROYECTOS B, CXP_RELACION_DOCUMENTOS C
        WHERE A.TIPO_TRANSACCION = 34
        AND A.CODIGO_CC = B.CODIGO_CC(+)
        AND A.TIPO_TRANSACCION = C.TIPO_TRANSACCION_CARGO(+)
        AND A.CODIGO_PROVEEDOR = C.CODIGO_PROVEEDOR(+)
        AND A.SERIE_DOCUMENTO  = C.SERIE_DOCUMENTO_CARGO(+)
        AND A.NUMERO_DOCUMENTO = C.NUMERO_DOCUMENTO_CARGO(+)
        AND EXTRACT(MONTH FROM A.FECHA_TRANSACCION) >= V_MES_FIN
        AND EXTRACT(YEAR FROM A.FECHA_TRANSACCION) >= V_ANIO
        AND A.CODIGO_EMPRESA IN
        (
            SELECT 
                REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) AS CODIGO_EMPRESA
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^\:]+', 1, level) IS NOT NULL
        )
        GROUP BY A.CODIGO_EMPRESA, B.NUMERO_CUENTA;
BEGIN
    FOR R_TEMP IN C_ESTRUCTURA_TITULO
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            NULL,
            R_TEMP.NOMBRE,
            NULL,
            NULL,
            NULL,
            R_TEMP.TIPO,
            'font-weight: bold; text-decoration: underline;',
            1,
            R_TEMP.ID,
            R_TEMP.ID_PADRE
        );
    END LOOP;

    FOR R_TEMP IN C_ESTRUCTURA_SUB_TOTAL
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            NULL,
            '&emsp;&emsp;' || R_TEMP.NOMBRE,
            NULL,
            NULL,
            NULL,
            R_TEMP.TIPO,
            'font-weight: bold;',
            3,
            R_TEMP.ID,
            R_TEMP.ID_PADRE
        );
    END LOOP;

    FOR R_TEMP IN C_INGRESOS(P_MONEDA, P_MES_FIN, P_ANIO, P_EMPRESAS)
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            R_TEMP.CODIGO_EMPRESA,
            R_TEMP.NUMERO_CUENTA,
            NVL(SAF.FNC_GET_NOMBRE_CLIENTE(R_TEMP.CODIGO_EMPRESA, R_TEMP.NUMERO_CUENTA), R_TEMP.CODIGO_EMPRESA || ' - Otros Registros'),
            0,
            R_TEMP.VALOR,
            0,
            'DETALLE',
            NULL,
            2,
            NULL,
            327
        );
    END LOOP;

    RETURN V_FDU_T_CUADRO_ORIGEN_USO_FONDO;
END GET_FDU_REPORTE_CUADRO_ORIGEN_USO_FONDOS;