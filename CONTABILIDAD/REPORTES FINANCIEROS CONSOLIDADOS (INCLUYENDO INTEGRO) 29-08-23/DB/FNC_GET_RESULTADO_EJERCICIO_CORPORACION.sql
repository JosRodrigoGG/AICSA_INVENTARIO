CREATE OR REPLACE Function SAF.FNC_GET_RESULTADO_EJERCICIO_CORPORACION
(
    P_EMPRESA VARCHAR2,
    P_EJERCICIO CON_POLIZASD.EJERCICIO%type,
    P_MES CON_POLIZASD.MES%Type,
    P_ANIO REPORTES_FINANCIEROS_INTEGRO.ANIO%TYPE,
    P_MONEDA REPORTES_FINANCIEROS_INTEGRO.MONEDA_ORIGEN%TYPE
) RETURN NUMBER IS
    CURSOR C_DATOS IS
        SELECT
            SUM(SALDO4) + SUM(SALDO5) + SUM(SALDO6) + SUM(SALDO7) + SUM(SALDO8) SALDO
        FROM
        (
            SELECT 
                SUM(DECODE(DB_HB,'D',VALOR, (VALOR * -1)) ) SALDO4, 
                0 SALDO5, 
                0 SALDO6, 
                0 SALDO7, 
                0 SALDO8
            FROM CON_POLDETXHEAD
            WHERE CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) IS NOT NULL
            )
            AND EJERCICIO = P_EJERCICIO
            AND MES <= P_MES
            AND COD_CTA LIKE '4%'
            AND COD_TIPOL NOT IN (30)
            UNION
            SELECT 
                0 SALDO04, 
                SUM(DECODE(DB_HB,'D',VALOR, (VALOR * -1)) ) SALDO5, 
                0 SALDO6, 
                0 SALDO7, 
                0 SALDO8
            FROM CON_POLDETXHEAD
            WHERE CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) IS NOT NULL
            )
            AND EJERCICIO = P_EJERCICIO
            AND MES <= P_MES
            AND COD_CTA LIKE '5%'
            AND COD_TIPOL NOT IN (30)
            UNION
            SELECT 
                0 SALDO04, 
                0 SALDO5, 
                SUM(DECODE(DB_HB,'D',VALOR, (VALOR * -1)) )  SALDO6, 
                0 SALDO7, 
                0 SALDO8
            FROM CON_POLDETXHEAD
            WHERE CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) IS NOT NULL
            )
            AND EJERCICIO = P_EJERCICIO
            AND MES <= P_MES
            AND COD_CTA LIKE '6%'
            AND COD_TIPOL NOT IN (30)
            UNION
            SELECT 
                0 SALDO04, 
                0 SALDO5, 
                0 SALDO6, 
                SUM(DECODE(DB_HB,'D',VALOR, (VALOR * -1)) ) SALDO7, 
                0 SALDO8
            FROM CON_POLDETXHEAD
            WHERE CODIGO_EMPRESA IN
            (
                SELECT 
                    REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) IS NOT NULL
            )
            AND EJERCICIO= P_EJERCICIO
            AND MES <= P_MES
            AND COD_CTA LIKE '7%'
            AND COD_TIPOL NOT IN (30)
            UNION
            SELECT 
                0 SALDO04, 
                0 SALDO5, 
                0 SALDO6, 
                0 SALDO7, 
                SUM(DECODE(DB_HB,'D',VALOR, (VALOR * -1)) ) SALDO8
            FROM CON_POLDETXHEAD
            WHERE CODIGO_EMPRESA IN 
            (
                SELECT 
                    REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) IS NOT NULL
            )
            AND EJERCICIO= P_EJERCICIO
            AND MES <= P_MES
            AND COD_CTA LIKE '8%'
            AND COD_TIPOL NOT IN (30)
        );

        CURSOR C_INTEGRO IS
            SELECT
                COUNT(*)
            FROM
            (
                SELECT 
                    REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) IS NOT NULL
            ) WHERE CODIGO_EMPRESA = 223;

        L_MONTO con_polizasd.valor%Type := 0;
        V_INTEGRO NUMBER := 0;
       V_MONTO_INTEGRO NUMBER := 0;
BEGIN
    OPEN C_DATOS;
        FETCH C_DATOS INTO L_MONTO;
    CLOSE C_DATOS;

    DECLARE
        CURSOR C_RENGLON IS
            SELECT 
                SAF.APX_FNC_CONVERSION_MONEDAS
                (
                    VALOR,
                    MONEDA_ORIGEN,
                    1,
                    VALOR_CAMBIO,
                    NULL
                ) AS TOTAL
            FROM SAF.REPORTES_FINANCIEROS_INTEGRO
            WHERE TIPO_REPORTE = 1
            AND MES_INICIO = 1
            AND ANIO = P_ANIO
            AND MES_FIN = P_MES
            AND ID_PLANTILLA_NOTA = 25
           	AND CODIGO_EMPRESA IN
           	(
           		SELECT 
                    REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) AS CODIGO_EMPRESA
                FROM 
                    dual CONNECT BY REGEXP_SUBSTR(P_EMPRESA, '[^\:]+', 1, level) IS NOT NULL
           	);
    BEGIN
    	FOR R_RENGLON IN C_RENGLON
    	LOOP
    		V_MONTO_INTEGRO := V_MONTO_INTEGRO + R_RENGLON.TOTAL;
    	END LOOP;
    		
    	V_MONTO_INTEGRO := V_MONTO_INTEGRO * -1;
    END;

    RETURN NVL(L_MONTO, 0);-- + NVL(V_MONTO_INTEGRO, 0);
END;