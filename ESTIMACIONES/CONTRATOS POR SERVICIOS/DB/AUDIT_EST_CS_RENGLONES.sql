CREATE OR REPLACE TRIGGER SAF.AUDIT_EST_CS_RENGLONES
	AFTER
	INSERT OR UPDATE OR DELETE
	ON SAF.EST_CS_RENGLONES
	REFERENCING OLD AS OLD NEW AS NEW
	FOR EACH ROW
DECLARE
	TABLA VARCHAR2(128) := 'EST_CS_RENGLONES';
	US GRAL_USUARIOS.CODIGO_USUARIO%TYPE := PCK_GRAL.FNC_TRAE_NO_USUARIO(NVL(V('APP_USER'), USER));
	L_ACCION VARCHAR2(1);
BEGIN
	IF UPDATING THEN
		L_ACCION := 'U';
	ELSIF DELETING THEN
		L_ACCION := 'D';
	END IF;

	IF UPDATING OR DELETING THEN
		IF :OLD.CODIGO_RENGLON IS NOT NULL AND :NEW.CODIGO_RENGLON IS NULL
			OR :OLD.CODIGO_RENGLON IS NULL AND :NEW.CODIGO_RENGLON IS NOT NULL
			OR :NEW.CODIGO_RENGLON <> :OLD.CODIGO_RENGLON THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'CODIGO_RENGLON', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'VARCHAR2(256)', :OLD.CODIGO_RENGLON, :NEW.CODIGO_RENGLON
			);
		END IF;

        IF :OLD.CODIGO_RENGLON_PADRE IS NOT NULL AND :NEW.CODIGO_RENGLON_PADRE IS NULL
			OR :OLD.CODIGO_RENGLON_PADRE IS NULL AND :NEW.CODIGO_RENGLON_PADRE IS NOT NULL
			OR :NEW.CODIGO_RENGLON_PADRE <> :OLD.CODIGO_RENGLON_PADRE THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'CODIGO_RENGLON_PADRE', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'VARCHAR2(256)', :OLD.CODIGO_RENGLON_PADRE, :NEW.CODIGO_RENGLON_PADRE
			);
		END IF;

        IF :OLD.TITULO IS NOT NULL AND :NEW.TITULO IS NULL
			OR :OLD.TITULO IS NULL AND :NEW.TITULO IS NOT NULL
			OR :NEW.TITULO <> :OLD.TITULO THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'TITULO', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'VARCHAR2(256)', :OLD.TITULO, :NEW.TITULO
			);
		END IF;

        IF :OLD.DESCRIPCION IS NOT NULL AND :NEW.DESCRIPCION IS NULL
			OR :OLD.DESCRIPCION IS NULL AND :NEW.DESCRIPCION IS NOT NULL
			OR :NEW.DESCRIPCION <> :OLD.DESCRIPCION THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'DESCRIPCION', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'VARCHAR2(1024)', :OLD.DESCRIPCION, :NEW.DESCRIPCION
			);
		END IF;

        IF :OLD.CODIGO_MEDIDA IS NOT NULL AND :NEW.CODIGO_MEDIDA IS NULL
			OR :OLD.CODIGO_MEDIDA IS NULL AND :NEW.CODIGO_MEDIDA IS NOT NULL
			OR :NEW.CODIGO_MEDIDA <> :OLD.CODIGO_MEDIDA THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'CODIGO_MEDIDA', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'NUMBER', :OLD.CODIGO_MEDIDA, :NEW.CODIGO_MEDIDA
			);
		END IF;

        IF :OLD.TIPO_COSTO IS NOT NULL AND :NEW.TIPO_COSTO IS NULL
			OR :OLD.TIPO_COSTO IS NULL AND :NEW.TIPO_COSTO IS NOT NULL
			OR :NEW.TIPO_COSTO <> :OLD.TIPO_COSTO THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'TIPO_COSTO', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'NUMBER(5,0)', :OLD.TIPO_COSTO, :NEW.TIPO_COSTO
			);
		END IF;

        IF :OLD.COSTO_UNITARIO IS NOT NULL AND :NEW.COSTO_UNITARIO IS NULL
			OR :OLD.COSTO_UNITARIO IS NULL AND :NEW.COSTO_UNITARIO IS NOT NULL
			OR :NEW.COSTO_UNITARIO <> :OLD.COSTO_UNITARIO THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'COSTO_UNITARIO', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'NUMBER(24,5)', :OLD.COSTO_UNITARIO, :NEW.COSTO_UNITARIO
			);
		END IF;

        IF :OLD.COSTO_TOTAL IS NOT NULL AND :NEW.COSTO_TOTAL IS NULL
			OR :OLD.COSTO_TOTAL IS NULL AND :NEW.COSTO_TOTAL IS NOT NULL
			OR :NEW.COSTO_TOTAL <> :OLD.COSTO_TOTAL THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'COSTO_TOTAL', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'NUMBER(24,5)', :OLD.COSTO_TOTAL, :NEW.COSTO_TOTAL
			);
		END IF;

        IF :OLD.PRECIO_UNITARIO IS NOT NULL AND :NEW.PRECIO_UNITARIO IS NULL
			OR :OLD.PRECIO_UNITARIO IS NULL AND :NEW.PRECIO_UNITARIO IS NOT NULL
			OR :NEW.PRECIO_UNITARIO <> :OLD.PRECIO_UNITARIO THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'PRECIO_UNITARIO', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'NUMBER(24,5)', :OLD.PRECIO_UNITARIO, :NEW.PRECIO_UNITARIO
			);
		END IF;

        IF :OLD.PRECIO_TOTAL IS NOT NULL AND :NEW.PRECIO_TOTAL IS NULL
			OR :OLD.PRECIO_TOTAL IS NULL AND :NEW.PRECIO_TOTAL IS NOT NULL
			OR :NEW.PRECIO_TOTAL <> :OLD.PRECIO_TOTAL THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'PRECIO_TOTAL', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'NUMBER(24,5)', :OLD.PRECIO_TOTAL, :NEW.PRECIO_TOTAL
			);
		END IF;

        IF :OLD.INDIRECTO IS NOT NULL AND :NEW.INDIRECTO IS NULL
			OR :OLD.INDIRECTO IS NULL AND :NEW.INDIRECTO IS NOT NULL
			OR :NEW.INDIRECTO <> :OLD.INDIRECTO THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'INDIRECTO', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'NUMBER(24,5)', :OLD.INDIRECTO, :NEW.INDIRECTO
			);
		END IF;

        IF :OLD.INDIRECTO_PORCENTAJE IS NOT NULL AND :NEW.INDIRECTO_PORCENTAJE IS NULL
			OR :OLD.INDIRECTO_PORCENTAJE IS NULL AND :NEW.INDIRECTO_PORCENTAJE IS NOT NULL
			OR :NEW.INDIRECTO_PORCENTAJE <> :OLD.INDIRECTO_PORCENTAJE THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'INDIRECTO_PORCENTAJE', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'NUMBER(24,5)', :OLD.INDIRECTO_PORCENTAJE, :NEW.INDIRECTO_PORCENTAJE
			);
		END IF;

        IF :OLD.CANTIDAD IS NOT NULL AND :NEW.CANTIDAD IS NULL
			OR :OLD.CANTIDAD IS NULL AND :NEW.CANTIDAD IS NOT NULL
			OR :NEW.CANTIDAD <> :OLD.CANTIDAD THEN
			INSERT INTO SAF.HISTORY
			(
				ID, TABLE_NAME, COLUMN_NAME, PK1, PK2, TAB_ROW_VERSION, ACTION, ACTION_DATE, ACTION_BY, DATA_TYPE, OLD_VC, NEW_VC
			)
			VALUES
			(
				HISTORY_SEQ.NEXTVAL, TABLA, 'CANTIDAD', :OLD.ID, :OLD.ID_CS_CONTRATOS_SERVICIO, NULL, L_ACCION, SYSDATE, US, 'NUMBER(20,5)', :OLD.CANTIDAD, :NEW.CANTIDAD
			);
		END IF;
	END IF;
END;