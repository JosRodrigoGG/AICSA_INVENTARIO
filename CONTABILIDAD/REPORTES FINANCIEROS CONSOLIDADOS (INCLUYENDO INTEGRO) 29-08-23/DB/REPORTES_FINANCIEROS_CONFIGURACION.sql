-- SAF.REPORTES_FINANCIEROS_CONFIGURACION definition

CREATE TABLE "SAF"."REPORTES_FINANCIEROS_CONFIGURACION" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"TIPO_REPORTE" NUMBER(12,5) NOT NULL ENABLE, 
	"ID_ASOCIACION" NUMBER NOT NULL ENABLE, 
	"ID_RENGLON_REPORTE" NUMBER, 
	"CONCEPTO" VARCHAR2(512 CHAR) NOT NULL ENABLE, 
	"USUARIO_GRABACION" NUMBER(10,0) NOT NULL ENABLE, 
	"FECHA_GRABACION" DATE DEFAULT SYSDATE, 
	"EJERCICIO" VARCHAR2(10), 
	 CONSTRAINT "REPORTES_FINANCIEROS_CONFIGURACION_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SAF"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SAF" ;

CREATE UNIQUE INDEX "SAF"."REPORTES_FINANCIEROS_CONFIGURACION_ID_PK" ON "SAF"."REPORTES_FINANCIEROS_CONFIGURACION" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SAF" ;