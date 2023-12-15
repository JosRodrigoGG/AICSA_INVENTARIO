CREATE OR REPLACE FUNCTION SAF.GET_FDU_CLIENTES_FILTRO
(
	V_VECTOR_EMPRESA VARCHAR2,
    V_FECHA_INICIO VARCHAR2,
    V_FECHA_FIN VARCHAR2
)
RETURN FDU_T_CUADRO_ORIGEN_USO_FONDO AS
    V_FDU_T_CUADRO_ORIGEN_USO_FONDO FDU_T_CUADRO_ORIGEN_USO_FONDO := FDU_T_CUADRO_ORIGEN_USO_FONDO(); 

    CURSOR C_CLIENTES_F(P_VECTOR_EMPRESA VARCHAR2, P_FECHA_INICIO VARCHAR2, P_FECHA_FIN VARCHAR2) IS
        SELECT 
            DISTINCT
            (A.NUMERO_CUENTA || ' - ' || SAF.FNC_GET_NOMBRE_CLIENTE(229, A.NUMERO_CUENTA)) DESCRIPCION,
            A.NUMERO_CUENTA NUMERO_CUENTA
        FROM BCOMOVIG E
        LEFT JOIN BCOMOVID F
            ON E.CODIGO_EMPRESA = F.CODIGO_EMPRESA
            AND E.CODMAE = F.CODMAE
            AND E.TIPO_TRANSACCION = F.TIPO_TRANSACCION
            AND E.SERIE = F.SERIE
            AND E.NUMDOC = F.NUMDOC
        INNER JOIN SAF.EST_PROYECTOS A
            ON A.CODIGO_PROYECTO = NVL(F.CODIGO_CC, E.CODIGO_CC)
            AND A.NUMERO_CUENTA IS NOT NULL
        WHERE E.CODIGO_EMPRESA > 99
        AND E.CODIGO_EMPRESA IN
        (
            SELECT 
                REGEXP_SUBSTR(P_VECTOR_EMPRESA, '[^\:]+', 1, level) AS CODIGO_EMPRESA
            FROM 
                dual CONNECT BY REGEXP_SUBSTR(P_VECTOR_EMPRESA, '[^\:]+', 1, level) IS NOT NULL
        )
        AND TRUNC(E.FEDOC) BETWEEN TRUNC(TO_DATE(V_FECHA_INICIO, 'DD/MM/YYYY')) AND TRUNC(TO_DATE(V_FECHA_FIN, 'DD/MM/YYYY'))
        AND E.TIPO_TRANSACCION IN 
        (
            SELECT 
                TIPO_TRANSACCION
            FROM GRAL_TIPOS_TRANSAC_MODULOS GTTM
            WHERE CODIGO_MODULO = 8
            AND CARGO_ABONO IN ('C', 'A')
        )
        AND E.TIPO_TRANSACCION NOT IN (14, 15)
        AND E.FANULA IS NULL
        AND NVL(F.CODIGO_CC, E.CODIGO_CC) LIKE '2%'
        ORDER BY A.NUMERO_CUENTA;

    CURSOR C_TODOS_CLIENTES IS
        SELECT
            '0 - Todos los Clientes' AS DESCRIPCION,
	        0 AS NUMERO_CUENTA
        FROM DUAL;
BEGIN
    FOR R_DATOS IN C_TODOS_CLIENTES
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            R_DATOS.NUMERO_CUENTA,
            R_DATOS.DESCRIPCION,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL
        );
    END LOOP;
    
	FOR R_DATOS IN C_CLIENTES_F(V_VECTOR_EMPRESA, V_FECHA_INICIO, V_FECHA_FIN)
    LOOP
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
        V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
        (
            NULL,
            R_DATOS.NUMERO_CUENTA,
            R_DATOS.DESCRIPCION,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL
        );
    END LOOP;

    RETURN V_FDU_T_CUADRO_ORIGEN_USO_FONDO;
END GET_FDU_CLIENTES_FILTRO;