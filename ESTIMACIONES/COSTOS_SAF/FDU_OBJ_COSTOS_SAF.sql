-- SAF.FDU_OBJ_COSTOS_SAF definition

CREATE OR REPLACE TYPE SAF.FDU_OBJ_COSTOS_SAF AS OBJECT 
(
  NOMBRE VARCHAR2(2048),
  VALOR NUMBER(20,0)
);