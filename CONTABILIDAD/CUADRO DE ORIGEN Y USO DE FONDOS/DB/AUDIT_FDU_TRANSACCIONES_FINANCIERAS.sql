CREATE OR REPLACE TRIGGER SAF.SAF.AUDIT_FDU_TRANSACCIONES_FINANCIERAS
    AFTER
    INSERT OR UPDATE OR DELETE
    ON SAF.FDU_TRANSACCIONES_FINANCIERAS
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
DECLARE
    TABLA VARCHAR2(128) := 'FDU_TRANSACCIONES_FINANCIERAS';
    US GRAL_USUARIOS.CODIGO_USUARIO%TYPE := PCK_GRAL.FNC_TRAE_NO_USUARIO(NVL(V('APP_USER'),USER));
    L_ACCION VARCHAR(1):=NULL;
BEGIN
    IF UPDATING THEN   
        L_ACCION := 'U';
    ELSIF DELETING THEN
        L_ACCION := 'D';
    END IF;

    IF UPDATING OR DELETING THEN
        IF :OLD.CODIGO_EMPRESA IS NOT NULL AND :NEW.CODIGO_EMPRESA IS NULL 
            OR :OLD.CODIGO_EMPRESA IS NOT NULL AND :NEW.CODIGO_EMPRESA IS NULL
            OR :NEW.CODIGO_EMPRESA<> :OLD.CODIGO_EMPRESA THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'CODIGO_EMPRESA', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(3,0)', :OLD.CODIGO_EMPRESA, :NEW.CODIGO_EMPRESA
            );
        END IF;

        IF :OLD.TIPO_DESTINATARIO IS NOT NULL AND :NEW.TIPO_DESTINATARIO IS NULL 
            OR :OLD.TIPO_DESTINATARIO IS NOT NULL AND :NEW.TIPO_DESTINATARIO IS NULL
            OR :NEW.TIPO_DESTINATARIO<> :OLD.TIPO_DESTINATARIO THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'TIPO_DESTINATARIO', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'VARCHAR2(10 CHAR)', :OLD.TIPO_DESTINATARIO, :NEW.TIPO_DESTINATARIO
            );
        END IF;

        IF :OLD.ID_ASOCIACION IS NOT NULL AND :NEW.ID_ASOCIACION IS NULL 
            OR :OLD.ID_ASOCIACION IS NOT NULL AND :NEW.ID_ASOCIACION IS NULL
            OR :NEW.ID_ASOCIACION<> :OLD.ID_ASOCIACION THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'ID_ASOCIACION', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(10,0)', :OLD.ID_ASOCIACION, :NEW.ID_ASOCIACION
            );
        END IF;

        IF :OLD.ESTADO IS NOT NULL AND :NEW.ESTADO IS NULL 
            OR :OLD.ESTADO IS NOT NULL AND :NEW.ESTADO IS NULL
            OR :NEW.ESTADO<> :OLD.ESTADO THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'ESTADO', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'VARCHAR2(100 CHAR)', :OLD.ESTADO, :NEW.ESTADO
            );
        END IF;

        IF :OLD.FECHA_RECUPERACION_TOTAL IS NOT NULL AND :NEW.FECHA_RECUPERACION_TOTAL IS NULL 
            OR :OLD.FECHA_RECUPERACION_TOTAL IS NOT NULL AND :NEW.FECHA_RECUPERACION_TOTAL IS NULL
            OR :NEW.FECHA_RECUPERACION_TOTAL<> :OLD.FECHA_RECUPERACION_TOTAL THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'FECHA_RECUPERACION_TOTAL', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'DATE', :OLD.FECHA_RECUPERACION_TOTAL, :NEW.FECHA_RECUPERACION_TOTAL
            );
        END IF;

        IF :OLD.CODIGO_MONEDA IS NOT NULL AND :NEW.CODIGO_MONEDA IS NULL 
            OR :OLD.CODIGO_MONEDA IS NOT NULL AND :NEW.CODIGO_MONEDA IS NULL
            OR :NEW.CODIGO_MONEDA<> :OLD.CODIGO_MONEDA THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'CODIGO_MONEDA', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(5,0)', :OLD.CODIGO_MONEDA, :NEW.CODIGO_MONEDA
            );
        END IF;

        IF :OLD.TASA_CAMBIO IS NOT NULL AND :NEW.TASA_CAMBIO IS NULL 
            OR :OLD.TASA_CAMBIO IS NOT NULL AND :NEW.TASA_CAMBIO IS NULL
            OR :NEW.TASA_CAMBIO<> :OLD.TASA_CAMBIO THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'TASA_CAMBIO', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.TASA_CAMBIO, :NEW.TASA_CAMBIO
            );
        END IF;

        IF :OLD.MONTO_ORIGEN IS NOT NULL AND :NEW.MONTO_ORIGEN IS NULL 
            OR :OLD.MONTO_ORIGEN IS NOT NULL AND :NEW.MONTO_ORIGEN IS NULL
            OR :NEW.MONTO_ORIGEN<> :OLD.MONTO_ORIGEN THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'MONTO_ORIGEN', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.MONTO_ORIGEN, :NEW.MONTO_ORIGEN
            );
        END IF;

        IF :OLD.MONTO_LOCAL IS NOT NULL AND :NEW.MONTO_LOCAL IS NULL 
            OR :OLD.MONTO_LOCAL IS NOT NULL AND :NEW.MONTO_LOCAL IS NULL
            OR :NEW.MONTO_LOCAL<> :OLD.MONTO_LOCAL THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'MONTO_LOCAL', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.MONTO_LOCAL, :NEW.MONTO_LOCAL
            );
        END IF;

        IF :OLD.OBSERVACIONES IS NOT NULL AND :NEW.OBSERVACIONES IS NULL 
            OR :OLD.OBSERVACIONES IS NOT NULL AND :NEW.OBSERVACIONES IS NULL
            OR :NEW.OBSERVACIONES<> :OLD.OBSERVACIONES THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'OBSERVACIONES', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'VARCHAR2(2048 CHAR)', :OLD.OBSERVACIONES, :NEW.OBSERVACIONES
            );
        END IF;

        IF :OLD.ES_PRESTAMO IS NOT NULL AND :NEW.ES_PRESTAMO IS NULL 
            OR :OLD.ES_PRESTAMO IS NOT NULL AND :NEW.ES_PRESTAMO IS NULL
            OR :NEW.ES_PRESTAMO<> :OLD.ES_PRESTAMO THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'ES_PRESTAMO', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'VARCHAR2(1 CHAR)', :OLD.ES_PRESTAMO, :NEW.ES_PRESTAMO
            );
        END IF;

        IF :OLD.TIPO_PRESTAMO IS NOT NULL AND :NEW.TIPO_PRESTAMO IS NULL 
            OR :OLD.TIPO_PRESTAMO IS NOT NULL AND :NEW.TIPO_PRESTAMO IS NULL
            OR :NEW.TIPO_PRESTAMO<> :OLD.TIPO_PRESTAMO THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'TIPO_PRESTAMO', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(3,0)', :OLD.TIPO_PRESTAMO, :NEW.TIPO_PRESTAMO
            );
        END IF;

        IF :OLD.PLAZO IS NOT NULL AND :NEW.PLAZO IS NULL 
            OR :OLD.PLAZO IS NOT NULL AND :NEW.PLAZO IS NULL
            OR :NEW.PLAZO<> :OLD.PLAZO THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'PLAZO', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(8,0)', :OLD.PLAZO, :NEW.PLAZO
            );
        END IF;

        IF :OLD.MEDIDA_PLAZO IS NOT NULL AND :NEW.MEDIDA_PLAZO IS NULL 
            OR :OLD.MEDIDA_PLAZO IS NOT NULL AND :NEW.MEDIDA_PLAZO IS NULL
            OR :NEW.MEDIDA_PLAZO<> :OLD.MEDIDA_PLAZO THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'MEDIDA_PLAZO', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(3,0)', :OLD.MEDIDA_PLAZO, :NEW.MEDIDA_PLAZO
            );
        END IF;

        IF :OLD.TIPO_TASA IS NOT NULL AND :NEW.TIPO_TASA IS NULL 
            OR :OLD.TIPO_TASA IS NOT NULL AND :NEW.TIPO_TASA IS NULL
            OR :NEW.TIPO_TASA<> :OLD.TIPO_TASA THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'TIPO_TASA', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(5,0)', :OLD.TIPO_TASA, :NEW.TIPO_TASA
            );
        END IF;

        IF :OLD.TASA_INTERES IS NOT NULL AND :NEW.TASA_INTERES IS NULL 
            OR :OLD.TASA_INTERES IS NOT NULL AND :NEW.TASA_INTERES IS NULL
            OR :NEW.TASA_INTERES<> :OLD.TASA_INTERES THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'TASA_INTERES', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.TASA_INTERES, :NEW.TASA_INTERES
            );
        END IF;

        IF :OLD.FECHA_COBRO IS NOT NULL AND :NEW.FECHA_COBRO IS NULL 
            OR :OLD.FECHA_COBRO IS NOT NULL AND :NEW.FECHA_COBRO IS NULL
            OR :NEW.FECHA_COBRO<> :OLD.FECHA_COBRO THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'FECHA_COBRO', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'DATE', :OLD.FECHA_COBRO, :NEW.FECHA_COBRO
            );
        END IF;

        IF :OLD.TIPO_COBRO_MORA IS NOT NULL AND :NEW.TIPO_COBRO_MORA IS NULL 
            OR :OLD.TIPO_COBRO_MORA IS NOT NULL AND :NEW.TIPO_COBRO_MORA IS NULL
            OR :NEW.TIPO_COBRO_MORA<> :OLD.TIPO_COBRO_MORA THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'TIPO_COBRO_MORA', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(5,0)', :OLD.TIPO_COBRO_MORA, :NEW.TIPO_COBRO_MORA
            );
        END IF;

        IF :OLD.TIPO_MORA IS NOT NULL AND :NEW.TIPO_MORA IS NULL 
            OR :OLD.TIPO_MORA IS NOT NULL AND :NEW.TIPO_MORA IS NULL
            OR :NEW.TIPO_MORA<> :OLD.TIPO_MORA THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'TIPO_MORA', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(5,0)', :OLD.TIPO_MORA, :NEW.TIPO_MORA
            );
        END IF;

        IF :OLD.PORCENTAJE_MORA IS NOT NULL AND :NEW.PORCENTAJE_MORA IS NULL 
            OR :OLD.PORCENTAJE_MORA IS NOT NULL AND :NEW.PORCENTAJE_MORA IS NULL
            OR :NEW.PORCENTAJE_MORA<> :OLD.PORCENTAJE_MORA THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'PORCENTAJE_MORA', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.PORCENTAJE_MORA, :NEW.PORCENTAJE_MORA
            );
        END IF;

        IF :OLD.MONTO_MORA_LOCAL IS NOT NULL AND :NEW.MONTO_MORA_LOCAL IS NULL 
            OR :OLD.MONTO_MORA_LOCAL IS NOT NULL AND :NEW.MONTO_MORA_LOCAL IS NULL
            OR :NEW.MONTO_MORA_LOCAL<> :OLD.MONTO_MORA_LOCAL THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'MONTO_MORA_LOCAL', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.MONTO_MORA_LOCAL, :NEW.MONTO_MORA_LOCAL
            );
        END IF;

        IF :OLD.MONTO_MORA_ORIGEN IS NOT NULL AND :NEW.MONTO_MORA_ORIGEN IS NULL 
            OR :OLD.MONTO_MORA_ORIGEN IS NOT NULL AND :NEW.MONTO_MORA_ORIGEN IS NULL
            OR :NEW.MONTO_MORA_ORIGEN<> :OLD.MONTO_MORA_ORIGEN THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'MONTO_MORA_ORIGEN', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.MONTO_MORA_ORIGEN, :NEW.MONTO_MORA_ORIGEN
            );
        END IF;

        IF :OLD.MONTO_RECUPERADO_LOCAL IS NOT NULL AND :NEW.MONTO_RECUPERADO_LOCAL IS NULL 
            OR :OLD.MONTO_RECUPERADO_LOCAL IS NOT NULL AND :NEW.MONTO_RECUPERADO_LOCAL IS NULL
            OR :NEW.MONTO_RECUPERADO_LOCAL<> :OLD.MONTO_RECUPERADO_LOCAL THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'MONTO_RECUPERADO_LOCAL', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.MONTO_RECUPERADO_LOCAL, :NEW.MONTO_RECUPERADO_LOCAL
            );
        END IF;

        IF :OLD.MONTO_RECUPERADO_ORIGEN IS NOT NULL AND :NEW.MONTO_RECUPERADO_ORIGEN IS NULL 
            OR :OLD.MONTO_RECUPERADO_ORIGEN IS NOT NULL AND :NEW.MONTO_RECUPERADO_ORIGEN IS NULL
            OR :NEW.MONTO_RECUPERADO_ORIGEN<> :OLD.MONTO_RECUPERADO_ORIGEN THEN
            INSERT INTO HISTORY 
            (
                ID, TABLE_NAME, COLUMN_NAME, PK1, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
            ) 
            VALUES 
            (
                HISTORY_SEQ.NEXTVAL, TABLA, 'MONTO_RECUPERADO_ORIGEN', :OLD.ID, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.MONTO_RECUPERADO_ORIGEN, :NEW.MONTO_RECUPERADO_ORIGEN
            );
        END IF;
    END IF;

END;
