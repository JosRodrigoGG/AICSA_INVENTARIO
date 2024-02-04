create or replace FUNCTION     SAF.APX_FNC_RETURN_CONTRATO_CARGA_TREE
(
    PCODIGOS_OFERTAS IN VARCHAR2,
    TIPOARBOL IN NUMBER
)

    RETURN T_TREE_TABLE AS
    V_TABLE_RETURN  T_TREE_TABLE := T_TREE_TABLE();
    V_CODIGOS_CARGA VARCHAR2(1000);

    CURSOR C_CARGAS IS
        SELECT
            COPA.ID_OFERTA,
            CCP.CODIGO_CARGA,
            COPA.codigo_reporte,
            --REP.NOMBRE,
            CAST(TEMP.CODIGO_RENGLON_OFERTA AS VARCHAR2(20))||CAST(COPA.CODIGO_RENGLON AS VARCHAR2(20)) CODIGO_RENGLON,
            DECODE(CCP.CODIGO_CARGA,NULL,'','I' || LPAD(CCP.CODIGO_CARGA,6,'0')) REGISTRO_REPORTE,
            REPLACE(CURRENTY_SIMBOL,'.') SIMBOLO_MONEDA,
            TEMP.CODIGO_RENGLON_OFERTA
        FROM SAF.CTS_OFERTAS_PROYECTOS_ASIGNADOS COPA
                 INNER JOIN
             (
                 SELECT
                     TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) ID_OFERTA,
                     SUBSTR(COLUMN_VALUE,INSTR(COLUMN_VALUE,'|')+1,LENGTH(COLUMN_VALUE))  CODIGO_RENGLON_OFERTA
                 FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_OFERTAS,':') )
             ) TEMP ON COPA.ID_OFERTA=TEMP.ID_OFERTA
                 INNER JOIN SAF.CTS_CARGAS_PROYECTOS CCP ON COPA.CODIGO_CARGA=CCP.CODIGO_CARGA
        ORDER BY CODIGO_RENGLON_OFERTA, CODIGO_RENGLON;

    -- MASTER FORMAT
    CURSOR C_PRESUPUESTOMASTERFORM(PCODIGOS_CARGA VARCHAR2) IS
        SELECT
            CODIGO_CARGA,
            GROUPCODEID,
            TITLE,
            GROUCODEID_PADRE,
            LEVEL NIVEL,
            UNIT,
            TOTALUNITS,
            TOTALCOST,
            OFFPRICE,
            CODIGO_RENGLON_OFERTA,
            REPLACE(MONEDA,'.') MONEDA,
            BOQITEMID
        FROM
            (
                SELECT
                    A.CODIGO_CARGA,
                    A.BOQITEMID,
                    NULL GROUPCODEID,
                    CAST(A.TITLE AS VARCHAR2(4000)) TITLE,
                    B.GROUPCODEID GROUCODEID_PADRE,
                    SAF.CTS_GET_UNIT(A.UNIT) UNIT,
                    TO_NUMBER(A.QUANTITY) TOTALUNITS,
                    A.TOTALCOST TOTALCOST,A.OFFPRICE,
                    --TEMP.CODIGO_OFERTA|| CAST(A.BOQITEMID AS VARCHAR2(100)) CODIGO_RENGLON_OFERTA,
                    ''|| CAST(A.BOQITEMID AS VARCHAR2(100)) CODIGO_RENGLON_OFERTA,
                    B.CURRENTY_SIMBOL MONEDA
                FROM SAF.CTS_BOQITEM_STG A
                         INNER JOIN SAF.CTS_EXTRACODE3_STG B ON A.CODIGO_CARGA = B.CODIGO_CARGA  AND A.EXTRACODE3_GROUPCODEID = B.GROUPCODEID
                         INNER JOIN SAF.CTS_CARGAS_PROYECTOS B ON B.CODIGO_CARGA = A.CODIGO_CARGA
                         INNER JOIN
                     (
                         SELECT
                             TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA,
                             SUBSTR(COLUMN_VALUE,INSTR(COLUMN_VALUE,'|')+1,LENGTH(COLUMN_VALUE)) CODIGO_OFERTA
                         FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))
                     ) TEMP ON A.CODIGO_CARGA = TEMP.CODIGO_CARGA
                UNION
                SELECT
                    NULL CODIGO_CARGA,
                    NULL BOQITEMID,
                    A.GROUPCODEID,
                    CAST(TITLE AS VARCHAR2(2000)) TITLE,
                    CASE
                        WHEN GROUCODEID_PADRE IS NULL THEN -1
                        ELSE GROUCODEID_PADRE
                        END,
                    NULL UNIT,
                    NULL TOTALUNITS,
                    NULL TOTALCOST,
                    NULL OFFPRICE,
                    CAST(A.GROUPCODE AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    NULL MONEDA
                FROM SAF.CTS_EXTRACODE3_STG A
                WHERE CODIGO_CARGA IN
                      (
                          SELECT TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA
                          FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':') )
                      )  --AND (NVL(LABTOTALCOST,0)+NVL(EQUTOTALCOST,0)+NVL(SUBTOTALCOST,0)+NVL(MATTOTALCOST,0)) >0
                GROUP BY A.GROUPCODEID, A.GROUPCODE, TITLE, GROUCODEID_PADRE
            )
        START WITH GROUPCODEID IN
                   (
                       SELECT GROUPCODEID
                       FROM SAF.CTS_EXTRACODE3_STG CES
                       WHERE CODIGO_CARGA IN
                             (
                                 SELECT TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA
                                 FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))
                             )  AND GROUCODEID_PADRE  IS NULL
                       GROUP BY (GROUPCODEID)
                   )
        CONNECT BY PRIOR  GROUPCODEID =  GROUCODEID_PADRE;
    -- UNIT FORMAT
    CURSOR C_PRESUPUESTOUNITFORM(PCODIGOS_CARGA VARCHAR2) IS
        SELECT
            CODIGO_CARGA,
            GROUPCODEID,
            TITLE,
            GROUCODEID_PADRE,
            LEVEL NIVEL,
            UNIT,
            TOTALUNITS,
            TOTALCOST,
            OFFPRICE,
            CODIGO_RENGLON_OFERTA,
            REPLACE(MONEDA,'.') MONEDA,
            BOQITEMID
        FROM
            (
                SELECT
                    A.CODIGO_CARGA,
                    A.BOQITEMID,
                    NULL GROUPCODEID,
                    CAST(A.TITLE AS VARCHAR2(4000)) TITLE,
                    B.GROUPCODEID GROUCODEID_PADRE,
                    SAF.CTS_GET_UNIT(A.UNIT) UNIT,
                    TO_NUMBER(A.QUANTITY) TOTALUNITS,
                    A.TOTALCOST TOTALCOST,
                    A.OFFPRICE,
                    --CAST (TEMP.CODIGO_OFERTA||A.BOQITEMID AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    CAST (''||A.BOQITEMID AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    B.CURRENTY_SIMBOL MONEDA
                FROM SAF.CTS_BOQITEM_STG A
                         INNER JOIN SAF.CTS_EXTRACODE2_STG B ON A.CODIGO_CARGA = B.CODIGO_CARGA  AND A.EXTRACODE2_GROUPCODEID = B.GROUPCODEID
                         INNER JOIN SAF.CTS_CARGAS_PROYECTOS B ON B.CODIGO_CARGA = A.CODIGO_CARGA
                         INNER JOIN
                     (
                         SELECT
                             TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA,
                             SUBSTR(COLUMN_VALUE,INSTR(COLUMN_VALUE,'|')+1,LENGTH(COLUMN_VALUE)) CODIGO_OFERTA
                         FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))
                     ) TEMP ON A.CODIGO_CARGA = TEMP.CODIGO_CARGA
                UNION
                SELECT
                    NULL CODIGO_CARGA,
                    NULL BOQITEMID,
                    A.GROUPCODEID,
                    CAST(TITLE AS VARCHAR2(2000)) TITLE,
                    CASE
                        WHEN GROUPCODEID_PADRE IS NULL THEN -1
                        ELSE GROUPCODEID_PADRE
                        END GROUCODEID_PADRE,
                    NULL UNIT,
                    NULL TOTALUNITS,
                    NULL TOTALCOST,
                    NULL OFFPRICE,
                    CAST(A.GROUPCODE AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    NULL MONEDA
                FROM SAF.CTS_EXTRACODE2_STG A
                WHERE CODIGO_CARGA IN
                      (
                          SELECT TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA
                          FROM
                              TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':') )
                      )
                GROUP BY A.GROUPCODEID, A.GROUPCODE, TITLE, GROUPCODEID_PADRE
            )
        START WITH GROUPCODEID IN
                   (
                       SELECT GROUPCODEID FROM SAF.CTS_EXTRACODE2_STG CES
                       WHERE CODIGO_CARGA IN
                             (
                                 SELECT TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA
                                 FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))
                             )  AND GROUPCODEID_PADRE  IS NULL
                       GROUP BY (GROUPCODEID)
                   )
        CONNECT BY PRIOR  GROUPCODEID =  GROUCODEID_PADRE;

    -- WBS
    CURSOR C_PRESUPUESTOWBS(PCODIGOS_CARGA VARCHAR2) IS
        SELECT
            CODIGO_CARGA,
            GROUPCODEID,
            TITLE,
            GROUCODEID_PADRE,
            LEVEL NIVEL,
            UNIT,
            TOTALUNITS,
            TOTALCOST,
            OFFPRICE,
            CODIGO_RENGLON_OFERTA,
            REPLACE(MONEDA,'.') MONEDA,
            BOQITEMID
        FROM
            (
                SELECT
                    A.CODIGO_CARGA,
                    A.BOQITEMID,
                    NULL GROUPCODEID,
                    CAST(A.TITLE AS VARCHAR2(4000)) TITLE,
                    B.PROJECTWBSID GROUCODEID_PADRE,
                    SAF.CTS_GET_UNIT(A.UNIT) UNIT,
                    TO_NUMBER(A.QUANTITY) TOTALUNITS,
                    A.TOTALCOST TOTALCOST,
                    A.OFFPRICE,
                    --CAST (TEMP.CODIGO_OFERTA||A.BOQITEMID AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    CAST (''||A.BOQITEMID AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    C.CURRENTY_SIMBOL MONEDA
                FROM SAF.CTS_BOQITEM_STG A
                         INNER JOIN SAF.CTS_PROJECTWBS2_STG B ON A.WBS2CODE_PROJECTWBSID = B.PROJECTWBSID
                         INNER JOIN SAF.CTS_CARGAS_PROYECTOS C ON C.CODIGO_CARGA = A.CODIGO_CARGA
                         INNER JOIN
                     (
                         SELECT
                             TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA,
                             SUBSTR(COLUMN_VALUE,INSTR(COLUMN_VALUE,'|')+1,LENGTH(COLUMN_VALUE)) CODIGO_OFERTA
                         FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))
                     ) TEMP ON A.CODIGO_CARGA = TEMP.CODIGO_CARGA
                UNION
                SELECT
                    A.CODIGO_CARGA,
                    NULL MATID,
                    A.PROJECTWBSID,
                    CAST(A.TITLE AS VARCHAR2(4000)),
                    CASE WHEN A.PROJECTWBSID_PADRE IS NULL THEN -1 ELSE A.PROJECTWBSID_PADRE END,
                    SAF.CTS_GET_UNIT(A.UNIT) UNIT,
                    TO_NUMBER(A.QUANTITY) TOTALUNITS,
                    TOTALCOST,
                    A.OFFPRICE,
                    CAST (A.CODE AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    NULL MONEDA
                FROM SAF.CTS_PROJECTWBS2_STG A
                WHERE CODIGO_CARGA IN
                      (
                          SELECT TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA
                          FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':') )
                      ) AND TOTALCOST > 0
                UNION
                SELECT
                    A.CODIGO_CARGA,
                    A.BOQITEMID,
                    NULL GROUPCODEID,
                    CAST(A.TITLE AS VARCHAR2(4000)) TITLE,
                    B.PROJECTWBSID GROUCODEID_PADRE,
                    SAF.CTS_GET_UNIT(A.UNIT) UNIT,
                    TO_NUMBER(A.QUANTITY) TOTALUNITS,
                    A.TOTALCOST TOTALCOST,
                    A.OFFPRICE,
                    --CAST (TEMP.CODIGO_OFERTA||A.BOQITEMID AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    CAST (''||A.BOQITEMID AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    C.CURRENTY_SIMBOL MONEDA
                FROM SAF.CTS_BOQITEM_STG A
                         INNER JOIN SAF.CTS_PROJECTWBS_STG B ON A.WBSCODE_PROJECTWBSID = B.PROJECTWBSID
                         INNER JOIN SAF.CTS_CARGAS_PROYECTOS C ON C.CODIGO_CARGA = A.CODIGO_CARGA
                         INNER JOIN
                     (
                         SELECT
                             TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA,
                             SUBSTR(COLUMN_VALUE,INSTR(COLUMN_VALUE,'|')+1,LENGTH(COLUMN_VALUE)) CODIGO_OFERTA
                         FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))
                     ) TEMP ON A.CODIGO_CARGA = TEMP.CODIGO_CARGA
                UNION
                SELECT
                    A.CODIGO_CARGA,
                    NULL MATID,
                    A.PROJECTWBSID,
                    CAST(A.TITLE AS VARCHAR2(4000)),
                    CASE WHEN A.PROJECTWBSID_PADRE IS NULL THEN -1 ELSE A.PROJECTWBSID_PADRE END,
                    SAF.CTS_GET_UNIT(A.UNIT) UNIT,
                    TO_NUMBER(A.QUANTITY) TOTALUNITS,
                    TOTALCOST,
                    A.OFFPRICE,
                    CAST (A.CODE AS VARCHAR2(200)) CODIGO_RENGLON_OFERTA,
                    NULL MONEDA
                FROM SAF.CTS_PROJECTWBS_STG A
                WHERE CODIGO_CARGA IN
                      (
                          SELECT TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA
                          FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':') )
                      ) AND TOTALCOST > 0
            )
        START WITH GROUPCODEID IN
                   (
                       SELECT PROJECTWBSID FROM SAF.CTS_PROJECTWBS_STG CES
                       WHERE CODIGO_CARGA IN
                             (
                                 SELECT TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA
                                 FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))
                             )  AND PROJECTWBSID_PADRE  IS NULL
                       GROUP BY (PROJECTWBSID)
                       UNION
                       SELECT PROJECTWBSID FROM SAF.CTS_PROJECTWBS2_STG CES
                       WHERE CODIGO_CARGA IN
                             (
                                 SELECT TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA
                                 FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))
                             ) AND PROJECTWBSID_PADRE  IS NULL
                       GROUP BY (PROJECTWBSID)
                   )
        CONNECT BY PRIOR  GROUPCODEID =  GROUCODEID_PADRE;

BEGIN
    SELECT NVL(LISTAGG(CCP.CODIGO_CARGA||'|'||CAST(TEMP.CODIGO_RENGLON_OFERTA AS VARCHAR2(20))||CAST(COPA.CODIGO_RENGLON AS VARCHAR2(20))||':')  WITHIN GROUP (ORDER BY COPA.CODIGO_RENGLON),'')
    INTO V_CODIGOS_CARGA
    FROM SAF.CTS_OFERTAS_PROYECTOS_ASIGNADOS COPA
             INNER JOIN
         (
             SELECT
                 TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) ID_OFERTA,
                 SUBSTR(COLUMN_VALUE,INSTR(COLUMN_VALUE,'|')+1,LENGTH(COLUMN_VALUE))  CODIGO_RENGLON_OFERTA
             FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_OFERTAS,':') )
         ) TEMP ON COPA.ID_OFERTA=TEMP.ID_OFERTA
             INNER JOIN SAF.CTS_CARGAS_PROYECTOS CCP ON COPA.CODIGO_CARGA=CCP.CODIGO_CARGA
    --LEFT JOIN COSTOS_REPORTES REP ON CCP.CODIGO_TIPO_REPORTE = REP.CODIGO_REPORTE
    ORDER BY CODIGO_RENGLON_OFERTA, CODIGO_RENGLON;

    CASE TIPOARBOL
        WHEN 1 THEN
            -- UNIT FORMAT
            FOR R_PRESUPUESTO IN C_PRESUPUESTOUNITFORM(V_CODIGOS_CARGA) LOOP
                    V_TABLE_RETURN.EXTEND;

                    V_TABLE_RETURN(V_TABLE_RETURN.LAST) := TREE_RECORD(
                            R_PRESUPUESTO.CODIGO_CARGA,
                            R_PRESUPUESTO.GROUPCODEID,
                            NULL,
                            R_PRESUPUESTO.TITLE,
                            R_PRESUPUESTO.GROUCODEID_PADRE,
                            R_PRESUPUESTO.NIVEL,
                            R_PRESUPUESTO.UNIT,
                            NULL,
                            NULL,
                            R_PRESUPUESTO.TOTALUNITS,
                            NULL,
                            NULL,
                            NULL,
                            NULL,
                            R_PRESUPUESTO.TOTALCOST,
                            R_PRESUPUESTO.OFFPRICE,
                            NULL,
                            R_PRESUPUESTO.CODIGO_RENGLON_OFERTA,
                            R_PRESUPUESTO.MONEDA,
                            R_PRESUPUESTO.BOQITEMID,
                            NULL,
                            NULL
                                                           );
                END LOOP;
        WHEN 2 THEN
            --MASTER FORMAT
            FOR R_PRESUPUESTO IN C_PRESUPUESTOMASTERFORM(V_CODIGOS_CARGA) LOOP
                    V_TABLE_RETURN.EXTEND;

                    V_TABLE_RETURN(V_TABLE_RETURN.LAST) := TREE_RECORD(
                            R_PRESUPUESTO.CODIGO_CARGA,
                            R_PRESUPUESTO.GROUPCODEID,
                            NULL,
                            R_PRESUPUESTO.TITLE,
                            R_PRESUPUESTO.GROUCODEID_PADRE,
                            R_PRESUPUESTO.NIVEL,
                            R_PRESUPUESTO.UNIT,
                            NULL,
                            NULL,
                            R_PRESUPUESTO.TOTALUNITS,
                            NULL,
                            NULL,
                            NULL,
                            NULL,
                            R_PRESUPUESTO.TOTALCOST,
                            R_PRESUPUESTO.OFFPRICE,
                            NULL,
                            R_PRESUPUESTO.CODIGO_RENGLON_OFERTA,
                            R_PRESUPUESTO.MONEDA,
                            R_PRESUPUESTO.BOQITEMID,
                            NULL,
                            NULL
                                                           );
                END LOOP;
        WHEN 3 THEN
            -- WBS
            FOR R_PRESUPUESTO IN C_PRESUPUESTOWBS(V_CODIGOS_CARGA) LOOP
                    V_TABLE_RETURN.EXTEND;
                    V_TABLE_RETURN(V_TABLE_RETURN.LAST) := TREE_RECORD(
                            R_PRESUPUESTO.CODIGO_CARGA,
                            R_PRESUPUESTO.GROUPCODEID,
                            NULL,
                            R_PRESUPUESTO.TITLE,
                            R_PRESUPUESTO.GROUCODEID_PADRE,
                            R_PRESUPUESTO.NIVEL,
                            R_PRESUPUESTO.UNIT,
                            NULL,
                            NULL,
                            R_PRESUPUESTO.TOTALUNITS,
                            NULL,
                            NULL,
                            NULL,
                            NULL,
                            R_PRESUPUESTO.TOTALCOST,
                            R_PRESUPUESTO.OFFPRICE,
                            NULL,
                            R_PRESUPUESTO.CODIGO_RENGLON_OFERTA,
                            R_PRESUPUESTO.MONEDA,
                            R_PRESUPUESTO.BOQITEMID,
                            NULL,
                            NULL
                                                           );
                END LOOP;
        ELSE
            V_TABLE_RETURN.EXTEND;
            V_TABLE_RETURN(V_TABLE_RETURN.LAST) := TREE_RECORD(
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL
                                                   );
        END CASE;

    RETURN V_TABLE_RETURN;

END;