CREATE OR REPLACE PROCEDURE SAF.PR_ACTUALIZA_INFO_INTEGRACION_GERENCIAL_INDICADORES_GERENCIALES
(
    P_EMPRESAS VARCHAR2,
    P_EJERCICIO CON_EJERCICIOS.EJERCICIO%TYPE,
    P_FECHA_DESDE DATE,
    P_FECHA_HASTA DATE,
    P_TIPO_REPORTE VARCHAR2,
    P_DIVISION VARCHAR2,
    P_USUARIO NUMBER DEFAULT 1
)
IS
    CURSOR C_DEBE (V_MES NUMBER, V_USER NUMBER) IS
        SELECT 
            ABS(SUM(SALDO))
        FROM 
            CON_INTEGRACION_GERENCIAL 
        WHERE 
        (
          COD_CTA LIKE '4%' 
          OR COD_CTA LIKE '711%'
        ) 
        AND MES = V_MES 
        AND USUARIO_GRABACION = V_USER;
    
    CURSOR C_HABER(V_MES NUMBER, V_USER NUMBER) IS 
        SELECT 
            ABS(
              SUM(SALDO)
            ) 
        FROM 
            CON_INTEGRACION_GERENCIAL 
        WHERE 
        (
          COD_CTA LIKE '5%' 
          OR COD_CTA LIKE '6%' 
          OR COD_CTA LIKE '712%'
        ) 
        AND MES = V_MES 
        AND USUARIO_GRABACION = V_USER;
    
    CURSOR C_EMPRESAS(V_EMPRESAS VARCHAR2) IS
        SELECT 
            TO_NUMBER(REGEXP_SUBSTR(V_EMPRESAS, '[^|,]+', 1, level)) AS CODIGO_EMPRESA 
        FROM 
            dual CONNECT BY REGEXP_SUBSTR(V_EMPRESAS, '[^|,]+', 1, level) IS NOT NULL;
    
    CURSOR C_DIVISION(V_EMPRESA NUMBER, V_DIVISION VARCHAR2) IS
        SELECT
            CODIGO_DIVISION
        FROM SAF.GRAL_EMPRESAS_DIVISION
        WHERE CODIGO_EMPRESA = V_EMPRESA
        AND CODIGO_DIVISION IN
        (
            SELECT 
                TO_NUMBER(REGEXP_SUBSTR(V_DIVISION, '[^|,]+', 1, level)) AS CODIGO_DIVISION 
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(V_DIVISION, '[^|,]+', 1, level) IS NOT NULL
        );
    
    V_LIBROS VARCHAR2(200);
BEGIN
    SELECT
        LISTAGG(LIBRO, ',') WITHIN GROUP (ORDER BY LIBRO)
    INTO
        V_LIBROS
    FROM SAF.CON_LIBROS;

    BEGIN
        FOR R_EMPRESAS IN C_EMPRESAS(P_EMPRESAS)
        LOOP
            FOR R_DIVISION IN C_DIVISION(R_EMPRESAS.CODIGO_EMPRESA, P_DIVISION)
            LOOP
                    INSERT INTO SAF.CON_INTEGRACION_GERENCIAL_LOG
                    (
                        ID_EMPRESA,
                        ID_CENTRO_COSTO,
                        EJERCICIO,
                        FECHA_INICIO, 
                        FECHA_FIN, 
                        LIBROS, 
                        TIPO_REPORTE, 
                        DIVISIONES, 
                        USUARIO_GRABACION, 
                        FECHA_GRABACION
                    )
                    VALUES
                    (
                        R_EMPRESAS.CODIGO_EMPRESA, 
                        -1, 
                        P_EJERCICIO, 
                        TRUNC(P_FECHA_DESDE), 
                        TRUNC(P_FECHA_HASTA), 
                        V_LIBROS,
                        P_TIPO_REPORTE, 
                        R_DIVISION.CODIGO_DIVISION,
                        P_USUARIO, 
                        SYSDATE
                    );
            END LOOP;
        END LOOP;
    END;
END PR_ACTUALIZA_INFO_INTEGRACION_GERENCIAL_INDICADORES_GERENCIALES;