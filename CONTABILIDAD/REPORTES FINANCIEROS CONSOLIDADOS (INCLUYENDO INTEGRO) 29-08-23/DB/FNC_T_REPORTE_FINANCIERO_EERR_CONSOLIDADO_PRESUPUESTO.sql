CREATE OR REPLACE FUNCTION SAF.FNC_T_REPORTE_FINANCIERO_EERR_CONSOLIDADO_PRESUPUESTO
(
	V_MES_INICIO NUMBER DEFAULT 1,
	V_MES_FIN NUMBER,
	V_ANIO NUMBER DEFAULT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')),
	V_MONEDA NUMBER DEFAULT 1,
	V_VERSION NUMBER DEFAULT 2020
)
RETURN T_REPORTE_FINANCIERO_EERR_CXU AS
    V_T_REPORTE_FINANCIERO_EERR_CXU T_REPORTE_FINANCIERO_EERR_CXU := T_REPORTE_FINANCIERO_EERR_CXU();
    
    CURSOR C_DATOS IS
        WITH DIVISIONES_TABLE AS
        (
            SELECT
                DISTINCT
                B.CODIGO_DIVISION
            FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A
            INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION
            WHERE A.TIPO_REPORTE IN (50,51,52)
        ), MESES_TABLE AS 
        (
            SELECT LEVEL AS NUMERO
            FROM DUAL
            CONNECT BY LEVEL <= GREATEST(V_MES_FIN, 14)
        ), DIVISIONES_REPORTE_50 AS
        (
            SELECT
                DISTINCT
                B.CODIGO_DIVISION
            FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A
            INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION
            WHERE A.TIPO_REPORTE = 50
        ), DIVISIONES_REPORTE_51 AS
        (
            SELECT
                DISTINCT
                B.CODIGO_DIVISION
            FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A
            INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION
            WHERE A.TIPO_REPORTE = 51
        ), DIVISIONES_REPORTE_52 AS
        (
            SELECT
                DISTINCT
                B.CODIGO_DIVISION
            FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A
            INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION
            WHERE A.TIPO_REPORTE = 52
        ), DIVISIONES_REPORTE_53 AS
        (
            SELECT
                DISTINCT
                B.CODIGO_DIVISION
            FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION A
            INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.ID_ASOCIACION
            WHERE A.TIPO_REPORTE = 53
        ), ESTRUCTURA AS
        (
            SELECT
                ROWNUM ID,
                NOMBRE,
                CLASE,
                ID_REGISTRO
            FROM
            (
                SELECT 
                    NOMBRE,
                    NULL CLASE,
                    ID ID_REGISTRO
                FROM SAF.PLANTILLA_ASIGNACION_NOTAS
                WHERE TIPO_REPORTE = 6
                AND ORDEN_1 = 'MargenBruto'
                UNION ALL
                SELECT
                    'Margen Bruto',
                    'font-weight: bold;',
                    NULL
                FROM DUAL
                UNION ALL
                SELECT 
                    NOMBRE,
                    NULL CLASE,
                    ID
                FROM SAF.PLANTILLA_ASIGNACION_NOTAS
                WHERE TIPO_REPORTE = 6
                AND ORDEN_1 = 'ResultadosEnOperacion'
                UNION ALL
                SELECT
                    'Resultados En Operacion',
                    'font-weight: bold;',
                    NULL
                FROM DUAL
                UNION ALL
                SELECT 
                    NOMBRE,
                    NULL CLASE,
                    ID
                FROM SAF.PLANTILLA_ASIGNACION_NOTAS
                WHERE TIPO_REPORTE = 6
                AND ORDEN_1 = 'Resultado'
                UNION ALL
                SELECT
                    'Resultado',
                    'font-weight: bold;',
                    NULL
                FROM DUAL
                UNION ALL
                SELECT 
                    NOMBRE,
                    NULL CLASE,
                    ID
                FROM SAF.PLANTILLA_ASIGNACION_NOTAS
                WHERE TIPO_REPORTE = 6
                AND ORDEN_1 = 'EBITDA'
                UNION ALL
                SELECT
                    'EBITDA',
                    'font-weight: bold;',
                    NULL
                FROM DUAL
                UNION ALL
                SELECT 
                    NOMBRE,
                    NULL CLASE,
                    ID
                FROM SAF.PLANTILLA_ASIGNACION_NOTAS
                WHERE TIPO_REPORTE = 6
                AND ORDEN_1 = 'ResultadosAntesOtrosIngresosGastos'
                UNION ALL
                SELECT
                    'Resultados Antes de Otros Ingresos y Gastos',
                    'font-weight: bold;',
                    NULL
                FROM DUAL
                UNION ALL
                SELECT 
                    NOMBRE,
                    NULL CLASE,
                    ID
                FROM SAF.PLANTILLA_ASIGNACION_NOTAS
                WHERE TIPO_REPORTE = 6
                AND ORDEN_1 = 'ResultadosAntesImpuestos'
                UNION ALL
                SELECT
                    'Resultados Antes de Impuestos',
                    'font-weight: bold;',
                    NULL
                FROM DUAL
            )
        ), VALORES AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                A.CLASE,
                E.MES,
                E.CODIGO_DIVISION,
                NVL(SUM((
                    CASE
                        WHEN A.ID NOT IN (3, 5, 7, 10, 12, 16) THEN
                            SAF.CON_CARDINALIDAD_CTA_VALOR(E.COD_CTA, D.VERSION, E.DB_HB, SAF.APX_FNC_CONVERSION_MONEDAS(NVL(E.VALOR, 0), 1, V_MONEDA, 1, NULL))
                        ELSE
                            0
                    END
                )), 0) AS VALOR,
                E.EJERCICIO ANIO
            FROM ESTRUCTURA A
            LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON
                B.ID_PLANTILLA = A.ID_REGISTRO AND
                B.VERSION = V_VERSION
            LEFT JOIN SAF.CON_PLANTILLA_NOTAS C ON
                C.ID = B.ID_NOTA
            LEFT JOIN SAF.CON_DETALLE_PLANTILLA_NOTAS D ON
                D.ID_PLANTILLA = C.ID AND
                D.VERSION = B.VERSION AND
                D.ES_AGRUPADOR = 'N'
            LEFT JOIN SAF.CON_POLIZASD E ON
                E.COD_CTA = D.COD_CTA AND
                E.CODIGO_GASTO = D.CODIGO_GASTO AND
                E.COD_TIPOL != 30 AND
                E.EJERCICIO BETWEEN (V_ANIO - 1) AND V_ANIO AND
                E.MES BETWEEN V_MES_INICIO AND V_MES_FIN AND
                E.CODIGO_EMPRESA > 99
            WHERE E.CODIGO_DIVISION IN (SELECT CODIGO_DIVISION FROM DIVISIONES_TABLE)
            AND E.CODIGO_DIVISION  NOT IN (SELECT CODIGO_DIVISION FROM DIVISIONES_REPORTE_52)
            GROUP BY A.ID, A.NOMBRE, A.CLASE, E.MES, E.CODIGO_DIVISION, E.EJERCICIO
            UNION ALL
            SELECT
                A.ID,
                A.NOMBRE,
                A.CLASE,
                B.MES_FIN MES,
                C.CODIGO_DIVISION,
                NVL(SUM((
                    CASE
                        WHEN A.ID NOT IN (3, 5, 7, 10, 12, 16) THEN
                            SAF.APX_FNC_CONVERSION_MONEDAS(NVL(B.VALOR, 0), B.MONEDA_ORIGEN, V_MONEDA, B.VALOR_CAMBIO, NULL)
                        ELSE
                            0
                    END
                )), 0) AS VALOR,
                B.ANIO ANIO
            FROM ESTRUCTURA A
            LEFT JOIN SAF.REPORTES_FINANCIEROS_INTEGRO B 
                ON B.ID_PLANTILLA_NOTA = A.ID_REGISTRO 
                AND B.TIPO_REPORTE = 6
                AND B.MES_FIN BETWEEN V_MES_INICIO AND V_MES_FIN
                AND B.ANIO BETWEEN (TO_NUMBER(V_ANIO) - 1) AND V_ANIO
                AND B.CONCEPTO IS NULL
            LEFT JOIN SAF.GRAL_SECCIONES C
                ON C.CODIGO_SECCION = B.CODIGO_EMPRESA
            WHERE C.CODIGO_DIVISION IN
            (
                SELECT CODIGO_DIVISION FROM DIVISIONES_REPORTE_52
            )
            GROUP BY A.ID, A.NOMBRE, A.CLASE, B.MES_FIN, C.CODIGO_DIVISION, B.ANIO
        ), OTROS_INGRESOS_GASTOS AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                A.CLASE,
                E.MES,
                E.CODIGO_DIVISION,
                SUM((
                    CASE
                        WHEN A.ID NOT IN (3, 5, 7, 10, 12, 16) THEN
                            SAF.CON_CARDINALIDAD_CTA_VALOR(E.COD_CTA, D.VERSION, E.DB_HB, SAF.APX_FNC_CONVERSION_MONEDAS(NVL(E.VALOR, 0), 1, V_MONEDA, 1, NULL))
                        ELSE
                            0
                    END
                )) AS VALOR,
                E.EJERCICIO ANIO
            FROM ESTRUCTURA A
            LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON
                B.ID_PLANTILLA = A.ID_REGISTRO AND
                B.VERSION = V_VERSION
            LEFT JOIN SAF.CON_PLANTILLA_NOTAS C ON
                C.ID = B.ID_NOTA
            LEFT JOIN SAF.CON_DETALLE_PLANTILLA_NOTAS D ON
                D.ID_PLANTILLA = C.ID AND
                D.VERSION = B.VERSION AND
                D.ES_AGRUPADOR = 'N'
            LEFT JOIN SAF.CON_POLIZASD E ON
                E.COD_CTA = D.COD_CTA AND
                E.CODIGO_GASTO = D.CODIGO_GASTO AND
                E.COD_TIPOL != 30 AND
                E.EJERCICIO BETWEEN (V_ANIO - 1) AND V_ANIO AND
                E.MES BETWEEN V_MES_INICIO AND V_MES_FIN AND
                E.CODIGO_EMPRESA > 99
            WHERE E.CODIGO_DIVISION IN (SELECT CODIGO_DIVISION FROM DIVISIONES_REPORTE_53)
            GROUP BY A.ID, A.NOMBRE, A.CLASE, E.MES, E.CODIGO_DIVISION, E.EJERCICIO
            UNION ALL
            SELECT
                A.ID,
                A.NOMBRE,
                A.CLASE,
                B.MES_FIN MES,
                C.CODIGO_DIVISION,
                NVL(SUM((
                    CASE
                        WHEN A.ID NOT IN (3, 5, 7, 10, 12, 16) THEN
                            SAF.APX_FNC_CONVERSION_MONEDAS(NVL(B.VALOR, 0), B.MONEDA_ORIGEN, V_MONEDA, B.VALOR_CAMBIO, NULL)
                        ELSE
                            0
                    END
                )), 0) AS VALOR,
                B.ANIO ANIO
            FROM ESTRUCTURA A
            LEFT JOIN SAF.REPORTES_FINANCIEROS_INTEGRO B 
                ON B.ID_PLANTILLA_NOTA = A.ID_REGISTRO 
                AND B.TIPO_REPORTE = 6
                AND B.MES_FIN BETWEEN V_MES_INICIO AND V_MES_FIN
                AND B.ANIO BETWEEN (V_ANIO - 1) AND V_ANIO
                AND B.CONCEPTO IS NULL
            LEFT JOIN SAF.GRAL_SECCIONES C
                ON C.CODIGO_SECCION = B.CODIGO_EMPRESA
            WHERE C.CODIGO_DIVISION IN
            (
                SELECT CODIGO_DIVISION FROM DIVISIONES_REPORTE_53
            )
            GROUP BY A.ID, A.NOMBRE, A.CLASE, B.MES_FIN, C.CODIGO_DIVISION, B.ANIO
        ), ELIMINACIONES AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                A.CLASE,
                E.MES,
                E.CODIGO_DIVISION,
                NVL(SUM((
                    CASE
                        WHEN A.ID NOT IN (3, 5, 7, 10, 12, 16) THEN
                            SAF.CON_CARDINALIDAD_CTA_VALOR(E.COD_CTA, D.VERSION, E.DB_HB, SAF.APX_FNC_CONVERSION_MONEDAS(NVL(E.VALOR, 0), 1, V_MONEDA, 1, NULL))
                        ELSE
                            0
                    END
                )), 0) AS VALOR,
                E.EJERCICIO ANIO
            FROM ESTRUCTURA A
            LEFT JOIN SAF.ASOCIACION_PLANTILLA_NOTA_VERSION B ON
                B.ID_PLANTILLA = A.ID_REGISTRO AND
                B.VERSION = V_VERSION
            LEFT JOIN SAF.CON_PLANTILLA_NOTAS C ON
                C.ID = B.ID_NOTA
            LEFT JOIN SAF.CON_DETALLE_PLANTILLA_NOTAS D ON
                D.ID_PLANTILLA = C.ID AND
                D.VERSION = B.VERSION AND
                D.ES_AGRUPADOR = 'N'
            LEFT JOIN SAF.CON_POLIZASD E ON
                E.COD_CTA = D.COD_CTA AND
                E.CODIGO_GASTO = D.CODIGO_GASTO AND
                E.COD_TIPOL != 30 AND
                E.EJERCICIO BETWEEN (V_ANIO - 1) AND V_ANIO AND
                E.MES BETWEEN V_MES_INICIO AND V_MES_FIN AND
                E.CODIGO_EMPRESA > 99
            WHERE E.LIBRO = 5
            GROUP BY A.ID, A.NOMBRE, A.CLASE, E.MES, E.CODIGO_DIVISION, E.EJERCICIO
            UNION ALL
            SELECT
                A.ID,
                A.NOMBRE,
                A.CLASE,
                B.MES_FIN MES,
                C.CODIGO_DIVISION,
                NVL(SUM((
                    CASE
                        WHEN A.ID NOT IN (3, 5, 7, 10, 12, 16) THEN
                            SAF.APX_FNC_CONVERSION_MONEDAS(NVL(B.VALOR, 0), B.MONEDA_ORIGEN, V_MONEDA, B.VALOR_CAMBIO, NULL)
                        ELSE
                            0
                    END
                )), 0) AS VALOR,
                B.ANIO ANIO
            FROM ESTRUCTURA A
            LEFT JOIN SAF.REPORTES_FINANCIEROS_INTEGRO B 
                ON B.ID_PLANTILLA_NOTA = A.ID_REGISTRO 
                AND B.TIPO_REPORTE = 6
                AND B.MES_FIN BETWEEN V_MES_INICIO AND V_MES_FIN
                AND B.ANIO BETWEEN (V_ANIO - 1) AND V_ANIO
            LEFT JOIN SAF.GRAL_SECCIONES C
                ON C.CODIGO_SECCION = B.CODIGO_EMPRESA
            WHERE B.CONCEPTO = 'ELIMINACION'
            GROUP BY A.ID, A.NOMBRE, A.CLASE, B.MES_FIN, C.CODIGO_DIVISION, B.ANIO
        ), CONSOLIDADO AS 
        (
            SELECT
                ID,
                NOMBRE,
                MES,
                ('ANIO-' || ANIO) CODIGO_DIVISION,
                SUM(VALOR) VALOR
            FROM
            (
                SELECT
                    ID,
                    NOMBRE,
                    MES,
                    VALOR,
                    ANIO
                FROM VALORES
                UNION ALL
                SELECT
                    ID,
                    NOMBRE,
                    MES,
                    VALOR,
                    ANIO
                FROM OTROS_INGRESOS_GASTOS
                UNION ALL
                SELECT
                    ID,
                    NOMBRE,
                    MES,
                    VALOR,
                    ANIO
                FROM ELIMINACIONES
                UNION ALL
                SELECT
                    A.ID,
                    A.NOMBRE,
                    M.NUMERO MES,
                    0 VALOR,
                    TO_CHAR(V_ANIO) ANIO
                FROM ESTRUCTURA A
                CROSS JOIN MESES_TABLE M
                WHERE M.NUMERO >= V_MES_INICIO AND M.NUMERO <= V_MES_FIN
                UNION ALL
                SELECT
                    A.ID,
                    A.NOMBRE,
                    M.NUMERO MES,
                    0 VALOR,
                    TO_CHAR(V_ANIO - 1) ANIO
                FROM ESTRUCTURA A
                CROSS JOIN MESES_TABLE M
                WHERE M.NUMERO >= V_MES_INICIO AND M.NUMERO <= V_MES_FIN
                UNION ALL
                SELECT
                    A.ID,
                    A.NOMBRE,
                    13 MES,
                    0 VALOR,
                    TO_CHAR(V_ANIO) ANIO
                FROM ESTRUCTURA A
                UNION ALL
                SELECT
                    A.ID,
                    A.NOMBRE,
                    13 MES,
                    0 VALOR,
                    TO_CHAR(V_ANIO - 1) ANIO
                FROM ESTRUCTURA A
                UNION ALL
                SELECT
                    A.ID,
                    A.NOMBRE,
                    14 MES,
                    0 VALOR,
                    TO_CHAR(V_ANIO) ANIO
                FROM ESTRUCTURA A
                UNION ALL
                SELECT
                    A.ID,
                    A.NOMBRE,
                    14 MES,
                    0 VALOR,
                    TO_CHAR(V_ANIO - 1) ANIO
                FROM ESTRUCTURA A
            ) GROUP BY ID, NOMBRE, MES, ANIO
        ), CONSOLIDADO_SUMA_TOTALES AS
        (
            SELECT
                ID, 
                NOMBRE,
                MES,
                CODIGO_DIVISION,
                VALOR
            FROM CONSOLIDADO
            UNION ALL
            SELECT
                ID, 
                NOMBRE,
                13 MES,
                CODIGO_DIVISION,
                SUM(VALOR) VALOR
            FROM CONSOLIDADO
            WHERE MES BETWEEN 1 AND 12
            GROUP BY ID, NOMBRE, CODIGO_DIVISION
            UNION ALL
            SELECT
                A.ID,
                A.NOMBRE,
                13 MES,
                A.CODIGO_DIVISION,
                (
                    NVL((
                        CASE
                        WHEN A.ID IN (3,5,7,10,12) THEN
                            NVL(SUM(B.VALOR), 0)
                        WHEN A.ID = 16 THEN
                            NVL(SUM(B.VALOR), 0) + NVL(SUM(I.VALOR), 0)
                        ELSE
                            0
                        END
                    ), 0)
                    -
                    NVL((
                        CASE
                        WHEN A.ID = 3 THEN
                            NVL(SUM(C.VALOR), 0)
                        WHEN A.ID = 5 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0)
                        WHEN A.ID = 7 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0) + NVL(SUM(E.VALOR), 0)
                        WHEN A.ID = 10 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0) + NVL(SUM(E.VALOR), 0) + NVL(SUM(F.VALOR), 0) + NVL(SUM(FF.VALOR), 0)
                        WHEN A.ID = 12 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0) + NVL(SUM(E.VALOR), 0) + NVL(SUM(F.VALOR), 0) + NVL(SUM(G.VALOR), 0) + NVL(SUM(FF.VALOR), 0)
                        WHEN A.ID = 16 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0) + NVL(SUM(E.VALOR), 0) + NVL(SUM(F.VALOR), 0) + NVL(SUM(G.VALOR), 0) + NVL(SUM(H.VALOR), 0) + NVL(SUM(HH.VALOR), 0) + NVL(SUM(FF.VALOR), 0)
                        ELSE
                            0
                        END
                    ), 0)
                ) VALOR
            FROM CONSOLIDADO A
            LEFT JOIN CONSOLIDADO B
                ON B.ID = 1 
                AND B.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND B.MES = A.MES
            LEFT JOIN CONSOLIDADO C
                ON C.ID = 2
                AND C.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND C.MES = A.MES
            LEFT JOIN CONSOLIDADO D
                ON D.ID = 4
                AND D.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND D.MES = A.MES
            LEFT JOIN CONSOLIDADO E
                ON E.ID = 6
                AND E.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND E.MES = A.MES
            LEFT JOIN CONSOLIDADO F
                ON F.ID = 8
                AND F.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND F.MES = A.MES
            LEFT JOIN CONSOLIDADO FF
                ON FF.ID = 9
                AND FF.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND FF.MES = A.MES
            LEFT JOIN CONSOLIDADO G
                ON G.ID = 11
                AND G.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND G.MES = A.MES
            LEFT JOIN CONSOLIDADO H
                ON H.ID = 14
                AND H.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND H.MES = A.MES
            LEFT JOIN CONSOLIDADO HH
                ON HH.ID = 15
                AND HH.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND HH.MES = A.MES
            LEFT JOIN CONSOLIDADO I
                ON I.ID = 13
                AND I.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND I.MES = A.MES
            WHERE A.ID IN (3,5,7,10,12,16)
            GROUP BY
                A.ID,
                A.NOMBRE,
                A.CODIGO_DIVISION
            UNION ALL
            SELECT
                A.ID,
                A.NOMBRE,
                A.MES,
                A.CODIGO_DIVISION,
                (
                    NVL((
                        CASE
                        WHEN A.ID IN (3,5,7,10,12) THEN
                            NVL(SUM(B.VALOR), 0)
                        WHEN A.ID = 16 THEN
                            NVL(SUM(B.VALOR), 0) + NVL(SUM(I.VALOR), 0)
                        ELSE
                            0
                        END
                    ), 0)
                    -
                    NVL((
                        CASE
                        WHEN A.ID = 3 THEN
                            NVL(SUM(C.VALOR), 0)
                        WHEN A.ID = 5 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0)
                        WHEN A.ID = 7 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0) + NVL(SUM(E.VALOR), 0)
                        WHEN A.ID = 10 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0) + NVL(SUM(E.VALOR), 0) + NVL(SUM(F.VALOR), 0) + NVL(SUM(FF.VALOR), 0)
                        WHEN A.ID = 12 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0) + NVL(SUM(E.VALOR), 0) + NVL(SUM(F.VALOR), 0) + NVL(SUM(G.VALOR), 0) + NVL(SUM(FF.VALOR), 0)
                        WHEN A.ID = 16 THEN
                            NVL(SUM(C.VALOR), 0) + NVL(SUM(D.VALOR), 0) + NVL(SUM(E.VALOR), 0) + NVL(SUM(F.VALOR), 0) + NVL(SUM(G.VALOR), 0) + NVL(SUM(H.VALOR), 0) + NVL(SUM(HH.VALOR), 0) + NVL(SUM(FF.VALOR), 0)
                        ELSE
                            0
                        END
                    ), 0)
                ) VALOR
            FROM CONSOLIDADO A
            LEFT JOIN CONSOLIDADO B
                ON B.ID = 1 
                AND B.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND B.MES = A.MES
            LEFT JOIN CONSOLIDADO C
                ON C.ID = 2
                AND C.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND C.MES = A.MES
            LEFT JOIN CONSOLIDADO D
                ON D.ID = 4
                AND D.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND D.MES = A.MES
            LEFT JOIN CONSOLIDADO E
                ON E.ID = 6
                AND E.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND E.MES = A.MES
            LEFT JOIN CONSOLIDADO F
                ON F.ID = 8
                AND F.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND F.MES = A.MES
            LEFT JOIN CONSOLIDADO FF
                ON FF.ID = 9
                AND FF.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND FF.MES = A.MES
            LEFT JOIN CONSOLIDADO G
                ON G.ID = 11
                AND G.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND G.MES = A.MES
            LEFT JOIN CONSOLIDADO H
                ON H.ID = 14
                AND H.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND H.MES = A.MES
            LEFT JOIN CONSOLIDADO HH
                ON HH.ID = 15
                AND HH.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND HH.MES = A.MES
            LEFT JOIN CONSOLIDADO I
                ON I.ID = 13
                AND I.CODIGO_DIVISION = A.CODIGO_DIVISION
                AND I.MES = A.MES
            WHERE A.ID IN (3,5,7,10,12,16)
            GROUP BY
                A.ID,
                A.NOMBRE,
                A.CODIGO_DIVISION,
                A.MES
        ), CONSOLIDADO_PORCENTAJE_TOTALES AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                A.MES,
                A.CODIGO_DIVISION,
                (
                    CASE WHEN A.ID != 1 THEN
                        CASE
                            WHEN NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM CONSOLIDADO_SUMA_TOTALES B
                                WHERE B.ID = 1
                                AND B.CODIGO_DIVISION = A.CODIGO_DIVISION
                            ), 0) != 0 THEN
                            (NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM CONSOLIDADO_SUMA_TOTALES B
                                WHERE B.ID = A.ID
                                AND B.CODIGO_DIVISION = A.CODIGO_DIVISION
                            ), 0)
                            /
                            NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM CONSOLIDADO_SUMA_TOTALES B
                                WHERE B.ID = 1
                                AND B.CODIGO_DIVISION = A.CODIGO_DIVISION
                            ), 0)) * 100
                        ELSE
                            0
                        END
                    ELSE
                        CASE
                            WHEN NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM CONSOLIDADO_SUMA_TOTALES B
                                WHERE B.ID = 1
                                AND B.CODIGO_DIVISION = A.CODIGO_DIVISION
                            ), 0) != 0 THEN
                            (NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM CONSOLIDADO_SUMA_TOTALES B
                                WHERE B.ID IN (2,4,6,8,9,11,13,14,15,16)
                                AND B.CODIGO_DIVISION = A.CODIGO_DIVISION
                            ), 0)
                            /
                            NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM CONSOLIDADO_SUMA_TOTALES B
                                WHERE B.ID = 1
                                AND B.CODIGO_DIVISION = A.CODIGO_DIVISION
                            ), 0)) * 100
                        ELSE
                            0
                        END
                    END
                ) VALOR
            FROM CONSOLIDADO_SUMA_TOTALES A
            WHERE A.MES = 14
        ) , PRESUPUESTOS_ASOCIADOS AS
        (
            SELECT 
                ID_ASOCIACION RENGLON_PRESUPUESTO,
                ID_RENGLON_REPORTE RENGLON_EERR
            FROM SAF.REPORTES_FINANCIEROS_CONFIGURACION
            WHERE TIPO_REPORTE = 7
            AND EJERCICIO = V_ANIO
        ), PRESUPUESTOS_VALOR AS
        (
            SELECT
                C.ID,
                C.NOMBRE,
                A.MES,
                SUM(A.VALOR) VALOR,
                B.CODIGO_DIVISION
            FROM
            (
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    1 MES,
                    SUM(A.ENERO) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    2 MES,
                    SUM(A.FEBRERO) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    3 MES,
                    SUM(A.MARZO) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    4 MES,
                    SUM(A.ABRIL) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    5 MES,
                    SUM(A.MAYO) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    6 MES,
                    SUM(A.JUNIO) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    7 MES,
                    SUM(A.JULIO) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    8 MES,
                    SUM(A.AGOSTO) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    9 MES,
                    SUM(A.SEPTIEMBRE) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    10 MES,
                    SUM(A.OCTUBRE) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    11 MES,
                    SUM(A.NOVIEMBRE) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
                UNION ALL
                SELECT
                    A.ID_DETALLE_PLANTILLA,
                    12 MES,
                    SUM(A.DICIEMBRE) VALOR,
                    B.CODIGO_SECCION,
                    C.RENGLON_EERR
                FROM SAF.PREA_DETALLE A
                INNER JOIN SAF.PREA_PRESUPUESTO_ANUAL B
                    ON A.ID_PRESUPUESTO = B.ID
                INNER JOIN PRESUPUESTOS_ASOCIADOS C
                    ON C.RENGLON_PRESUPUESTO = A.ID_DETALLE_PLANTILLA
                GROUP BY A.ID_DETALLE_PLANTILLA, B.CODIGO_SECCION, C.RENGLON_EERR
            ) A
            INNER JOIN SAF.GRAL_SECCIONES B ON B.CODIGO_SECCION = A.CODIGO_SECCION
            INNER JOIN ESTRUCTURA C ON C.ID_REGISTRO = A.RENGLON_EERR
            WHERE B.CODIGO_DIVISION IN
            (
                SELECT CODIGO_DIVISION FROM DIVISIONES_TABLE
            )
            AND A.MES BETWEEN V_MES_INICIO AND V_MES_FIN
            GROUP BY A.MES, C.ID, C.NOMBRE, B.CODIGO_DIVISION
            UNION ALL
            SELECT
                A.ID,
                A.NOMBRE,
                M.NUMERO MES,
                0 VALOR,
                C.CODIGO_DIVISION
            FROM ESTRUCTURA A
            CROSS JOIN MESES_TABLE M
            LEFT JOIN DIVISIONES_TABLE C ON C.CODIGO_DIVISION IS NOT NULL
            WHERE M.NUMERO >= V_MES_INICIO AND M.NUMERO <= V_MES_FIN
        ), PRESUPUESTOS_VALOR_SUMA AS
        (
        	SELECT
                A.ID,
                A.NOMBRE,
                A.MES,
                A.VALOR
            FROM PRESUPUESTOS_VALOR A
            WHERE A.ID NOT IN (3,5,7,10,12,16)
            UNION ALL
            SELECT
                A.ID,
                A.NOMBRE,
                M.NUMERO MES,
                (
                    NVL((
                        CASE
                        WHEN A.ID IN (3,5,7,10,12) THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID = 1 AND B.MES = M.NUMERO)
                        WHEN A.ID = 16 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (1,13) AND B.MES = M.NUMERO)
                        ELSE
                            0
                        END
                    ), 0)
                    -
                    NVL((
                        CASE
                        WHEN A.ID = 3 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2) AND B.MES = M.NUMERO)
                        WHEN A.ID = 5 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4) AND B.MES = M.NUMERO)
                        WHEN A.ID = 7 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4,6) AND B.MES = M.NUMERO)
                        WHEN A.ID = 10 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4,6,8,9) AND B.MES = M.NUMERO)
                        WHEN A.ID = 12 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4,6,8,9,11) AND B.MES = M.NUMERO)
                        WHEN A.ID = 16 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4,6,8,9,11,14,15) AND B.MES = M.NUMERO)
                        ELSE
                            0
                        END
                    ), 0)
                ) VALOR
            FROM ESTRUCTURA A
            CROSS JOIN MESES_TABLE M
            WHERE M.NUMERO >= V_MES_INICIO AND M.NUMERO <= V_MES_FIN
            AND A.ID IN (3,5,7,10,12,16)
        ), PRESUPUESTOS_VALOR_ACUMULADO AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                13 MES,
                SUM(A.VALOR) VALOR
            FROM PRESUPUESTOS_VALOR A
            WHERE A.ID NOT IN (3,5,7,10,12,16)
            GROUP BY A.ID, A.NOMBRE
            UNION ALL
            SELECT
                A.ID,
                A.NOMBRE,
                13 MES,
                (
                    NVL((
                        CASE
                        WHEN A.ID IN (3,5,7,10,12) THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID = 1)
                        WHEN A.ID = 16 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (1,13))
                        ELSE
                            0
                        END
                    ), 0)
                    -
                    NVL((
                        CASE
                        WHEN A.ID = 3 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2))
                        WHEN A.ID = 5 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4))
                        WHEN A.ID = 7 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4,6))
                        WHEN A.ID = 10 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4,6,8,9))
                        WHEN A.ID = 12 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4,6,8,9,11))
                        WHEN A.ID = 16 THEN
                            (SELECT NVL(SUM(B.VALOR), 0) FROM PRESUPUESTOS_VALOR B WHERE B.ID IN (2,4,6,8,9,11,14,15))
                        ELSE
                            0
                        END
                    ), 0)
                ) VALOR
            FROM ESTRUCTURA A
            WHERE A.ID IN (3,5,7,10,12,16)
        ), PRESUPUESTOS_VALOR_ACUMULADO_PORCENTAJE AS
        (
        	SELECT
                A.ID,
                A.NOMBRE,
                14 MES,
                (
                    CASE WHEN A.ID != 1 THEN
                        CASE
                            WHEN NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM PRESUPUESTOS_VALOR_ACUMULADO B
                                WHERE B.ID = 1
                            ), 0) != 0 THEN
                            (NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM PRESUPUESTOS_VALOR_ACUMULADO B
                                WHERE B.ID = A.ID
                            ), 0)
                            /
                            NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM PRESUPUESTOS_VALOR_ACUMULADO B
                                WHERE B.ID = 1
                            ), 0)) * 100
                        ELSE
                            0
                        END
                    ELSE
                        CASE
                            WHEN NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM PRESUPUESTOS_VALOR_ACUMULADO B
                                WHERE B.ID = 1
                            ), 0) != 0 THEN
                            (NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM PRESUPUESTOS_VALOR_ACUMULADO B
                                WHERE B.ID IN (2,4,6,8,9,11,13,14,15,16)
                            ), 0)
                            /
                            NVL((
                                SELECT
                                    SUM(B.VALOR)
                                FROM PRESUPUESTOS_VALOR_ACUMULADO B
                                WHERE B.ID = 1
                            ), 0)) * 100
                        ELSE
                            0
                        END
                    END
                ) VALOR
            FROM PRESUPUESTOS_VALOR_ACUMULADO A
            WHERE A.MES = 13
        ), CONSOLIDADO_SUMA_TOTALES_ANIO AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                A.CODIGO_DIVISION,
                SUM(A.VALOR) VALOR
            FROM CONSOLIDADO_SUMA_TOTALES A
            WHERE A.MES = 13
            AND A.CODIGO_DIVISION = ('ANIO-' || TO_CHAR(V_ANIO))
            GROUP BY A.ID, A.NOMBRE, A.CODIGO_DIVISION
        ), CONSOLIDADO_SUMA_TOTALES_ANIO_1 AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                A.CODIGO_DIVISION,
                SUM(A.VALOR) VALOR
            FROM CONSOLIDADO_SUMA_TOTALES A
            WHERE A.MES = 13
            AND A.CODIGO_DIVISION = ('ANIO-' || TO_CHAR(V_ANIO - 1))
            GROUP BY A.ID, A.NOMBRE, A.CODIGO_DIVISION
        ), VARIACION_ANTERIOR AS (
            SELECT
                A.ID,
                A.NOMBRE,
                ((
                    CASE
                        WHEN NVL(C.VALOR, 0) != 0 THEN
                            (NVL(B.VALOR, 0) / C.VALOR) - 1
                        ELSE
                            0 - 1
                    END
                ) * 100) VALOR
            FROM ESTRUCTURA A
            LEFT JOIN CONSOLIDADO_SUMA_TOTALES_ANIO B ON B.ID = A.ID
            LEFT JOIN CONSOLIDADO_SUMA_TOTALES_ANIO_1 C ON C.ID = A.ID
        ), CONSOLIDADO_PORCENTAJE_TOTALES_ANIO AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                A.CODIGO_DIVISION,
                SUM(A.VALOR) VALOR
            FROM CONSOLIDADO_PORCENTAJE_TOTALES A
            WHERE A.MES = 14
            AND A.CODIGO_DIVISION = ('ANIO-' || TO_CHAR(V_ANIO))
            GROUP BY A.ID, A.NOMBRE, A.CODIGO_DIVISION
        ), CONSOLIDADO_PORCENTAJE_TOTALES_ANIO_1 AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                A.CODIGO_DIVISION,
                SUM(A.VALOR) VALOR
            FROM CONSOLIDADO_PORCENTAJE_TOTALES A
            WHERE A.MES = 14
            AND A.CODIGO_DIVISION = ('ANIO-' || TO_CHAR(V_ANIO - 1))
            GROUP BY A.ID, A.NOMBRE, A.CODIGO_DIVISION
        ), RELACION_INGRESO_ANIO_ANTERIOR AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                ((
                    (NVL(B.VALOR, 0) - NVL(C.VALOR, 0))
                )) VALOR
            FROM ESTRUCTURA A
            LEFT JOIN CONSOLIDADO_PORCENTAJE_TOTALES_ANIO B ON B.ID = A.ID
            LEFT JOIN CONSOLIDADO_PORCENTAJE_TOTALES_ANIO_1 C ON C.ID = A.ID
        ), PRESUPUESTOS_VARIACION_SUMA AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                SUM(A.VALOR) VALOR
            FROM PRESUPUESTOS_VALOR_ACUMULADO A
            WHERE A.MES = 13
            GROUP BY A.ID, A.NOMBRE
        ), PRESUPUESTOS_VARIACION AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                ((
                    CASE
                        WHEN NVL(C.VALOR, 0) != 0 THEN
                            (NVL(B.VALOR, 0) / C.VALOR) - 1
                        ELSE
                            0 - 1
                    END
                ) * 100) VALOR
            FROM ESTRUCTURA A
            LEFT JOIN PRESUPUESTOS_VARIACION_SUMA B ON B.ID = A.ID
            LEFT JOIN CONSOLIDADO_SUMA_TOTALES_ANIO C ON C.ID = A.ID
        ), PRESUPUESTOS_RELACION_INGRESOS_SUMA AS
        (
            SELECT
                A.ID,
                A.NOMBRE,
                SUM(A.VALOR) VALOR
            FROM PRESUPUESTOS_VALOR_ACUMULADO_PORCENTAJE A
            WHERE A.MES = 14
            GROUP BY A.ID, A.NOMBRE
        ), PRESUPUESTOS_RELACION_INGRESOS AS 
        (
            SELECT
                A.ID,
                A.NOMBRE,
                ((
                    (NVL(B.VALOR, 0) - NVL(C.VALOR, 0))
                )) VALOR
            FROM ESTRUCTURA A
            LEFT JOIN PRESUPUESTOS_RELACION_INGRESOS_SUMA B ON B.ID = A.ID
            LEFT JOIN CONSOLIDADO_PORCENTAJE_TOTALES_ANIO C ON C.ID = A.ID
        )
        SELECT 
            ID,
            NOMBRE,
            NULL CLASE,
            NULL ID_REGISTRO,
            NULL ID_NOTA,
            MES,
            CODIGO_DIVISION,
            VALOR,
            50 BLOQUE
        FROM CONSOLIDADO_SUMA_TOTALES
        UNION ALL
        SELECT 
            ID,
            NOMBRE,
            NULL CLASE,
            NULL ID_REGISTRO,
            NULL ID_NOTA,
            MES,
            CODIGO_DIVISION,
            VALOR,
            50 BLOQUE
        FROM CONSOLIDADO_PORCENTAJE_TOTALES
        UNION ALL
        SELECT
            ID,
            NOMBRE,
            NULL CLASE,
            NULL ID_REGISTRO,
            NULL ID_NOTA,
            MES,
            '20' CODIGO_DIVISION,
            VALOR VALOR,
            51 BLOQUE
        FROM PRESUPUESTOS_VALOR_SUMA
        UNION ALL
        SELECT
            ID,
            NOMBRE,
            NULL CLASE,
            NULL ID_REGISTRO,
            NULL ID_NOTA,
            MES,
            '20' CODIGO_DIVISION,
            VALOR VALOR,
            51 BLOQUE
        FROM PRESUPUESTOS_VALOR_ACUMULADO
        UNION ALL
        SELECT
            ID,
            NOMBRE,
            NULL CLASE,
            NULL ID_REGISTRO,
            NULL ID_NOTA,
            MES,
            '20' CODIGO_DIVISION,
            VALOR VALOR,
            51 BLOQUE
        FROM PRESUPUESTOS_VALOR_ACUMULADO_PORCENTAJE
        UNION ALL
        SELECT
            ID,
            NOMBRE,
            NULL CLASE,
            NULL ID_REGISTRO,
            NULL ID_NOTA,
            16 MES,
            '22' CODIGO_DIVISION,
            VALOR,
            53 BLOQUE
        FROM VARIACION_ANTERIOR
        UNION ALL
        SELECT
            ID,
            NOMBRE,
            NULL CLASE,
            NULL ID_REGISTRO,
            NULL ID_NOTA,
            17 MES,
            '22' CODIGO_DIVISION,
            VALOR,
            53 BLOQUE
        FROM RELACION_INGRESO_ANIO_ANTERIOR
        UNION ALL
        SELECT
            ID,
            NOMBRE,
            NULL CLASE,
            NULL ID_REGISTRO,
            NULL ID_NOTA,
            18 MES,
            '24' CODIGO_DIVISION,
            VALOR,
            54 BLOQUE
        FROM PRESUPUESTOS_VARIACION
        UNION ALL
        SELECT
            ID,
            NOMBRE,
            NULL CLASE,
            NULL ID_REGISTRO,
            NULL ID_NOTA,
            19 MES,
            '24' CODIGO_DIVISION,
            VALOR,
            54 BLOQUE
        FROM PRESUPUESTOS_RELACION_INGRESOS;

BEGIN
	IF V_VERSION = 1311 THEN
		/*FOR R_DATOS IN C_DATOS_HOMOLOGADAS
		LOOP
			V_T_REPORTE_FINANCIERO_EERR_CXU.EXTEND;
			V_T_REPORTE_FINANCIERO_EERR_CXU(V_T_REPORTE_FINANCIERO_EERR_CXU.LAST) := OBJ_REPORTE_FINANCIERO_EERR_CXU
			(
				R_DATOS.ID,
				R_DATOS.NOMBRE,
				R_DATOS.CLASE,
				NULL,
				NULL,
				R_DATOS.MES,
				R_DATOS.CODIGO_DIVISION,
				R_DATOS.VALOR,
				R_DATOS.BLOQUE
			);
		END LOOP;*/
		NULL;
	ELSE
		FOR R_DATOS IN C_DATOS
		LOOP
			V_T_REPORTE_FINANCIERO_EERR_CXU.EXTEND;
			V_T_REPORTE_FINANCIERO_EERR_CXU(V_T_REPORTE_FINANCIERO_EERR_CXU.LAST) := OBJ_REPORTE_FINANCIERO_EERR_CXU
			(
				R_DATOS.ID,
				R_DATOS.NOMBRE,
				R_DATOS.CLASE,
				NULL,
				NULL,
				R_DATOS.MES,
				R_DATOS.CODIGO_DIVISION,
				R_DATOS.VALOR,
				R_DATOS.BLOQUE
			);
		END LOOP;
	END IF;
	
    RETURN V_T_REPORTE_FINANCIERO_EERR_CXU;
END;