CREATE OR REPLACE FUNCTION SAF.GET_CS_ESTADOS_CONTRATO
(
	V_CONTRATOID NUMBER
)
RETURN FDU_T_CUADRO_ORIGEN_USO_FONDO AS
    CURSOR C_ESTADOS IS
        SELECT
            COLUMN_VALUE
        FROM
        (
            SELECT COLUMN_VALUE FROM TABLE (apex_string.split('BORRADOR:APROBADO:SUSPENDIDO:CERRADO',':'))
        );
    
    CURSOR C_ESTADOS_SIN_B IS
        SELECT
            COLUMN_VALUE
        FROM
        (
            SELECT COLUMN_VALUE FROM TABLE (apex_string.split('BORRADOR:APROBADO:SUSPENDIDO:CERRADO',':'))
        )
        WHERE COLUMN_VALUE != 'BORRADOR';

    CURSOR C_ESTADOS_SIN_B_A_S IS
        SELECT
            COLUMN_VALUE
        FROM
            (
                SELECT COLUMN_VALUE FROM TABLE (apex_string.split('BORRADOR:APROBADO:SUSPENDIDO:CERRADO',':'))
            )
        WHERE COLUMN_VALUE = 'CERRADO';

    V_FDU_T_CUADRO_ORIGEN_USO_FONDO FDU_T_CUADRO_ORIGEN_USO_FONDO := FDU_T_CUADRO_ORIGEN_USO_FONDO(); 
    V_ESTADO VARCHAR2(256);
BEGIN
    SELECT
        ESTADO_RESOLUCION
    INTO
        V_ESTADO
    FROM SAF.EST_CS_CONTRATOS_SERVICIO
    WHERE ID = V_CONTRATOID;

    IF V_ESTADO = 'BORRADOR' OR V_ESTADO = 'N' THEN
        FOR R_ESTADOS IN C_ESTADOS
        LOOP
            V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
            V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
            (
                NULL,
                NULL,
                R_ESTADOS.COLUMN_VALUE,
                NULL,
                NULL,
                NULL,
                R_ESTADOS.COLUMN_VALUE,
                NULL,
                NULL,
                NULL,
                NULL
            );
        END LOOP;
    ELSIF V_ESTADO = 'CERRADO' THEN
        FOR R_ESTADOS IN C_ESTADOS_SIN_B_A_S
        LOOP
            V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
            V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
                                                                                     (
                    NULL,
                    NULL,
                    R_ESTADOS.COLUMN_VALUE,
                    NULL,
                    NULL,
                    NULL,
                    R_ESTADOS.COLUMN_VALUE,
                    NULL,
                    NULL,
                    NULL,
                    NULL
                                                                                     );
        END LOOP;
    ELSE
        FOR R_ESTADOS IN C_ESTADOS_SIN_B
        LOOP
            V_FDU_T_CUADRO_ORIGEN_USO_FONDO.EXTEND;
            V_FDU_T_CUADRO_ORIGEN_USO_FONDO(V_FDU_T_CUADRO_ORIGEN_USO_FONDO.LAST) := FDU_OBJECT_CUADRO_ORIGEN_USO_FONDO
            (
                NULL,
                NULL,
                R_ESTADOS.COLUMN_VALUE,
                NULL,
                NULL,
                NULL,
                R_ESTADOS.COLUMN_VALUE,
                NULL,
                NULL,
                NULL,
                NULL
            );
        END LOOP;
    END IF;

    RETURN V_FDU_T_CUADRO_ORIGEN_USO_FONDO;
END GET_CS_ESTADOS_CONTRATO;