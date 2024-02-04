create or replace FUNCTION     SAF.APX_FNC_RETURN_CONTRATO_CARGA_TREE
(
    PCODIGOS_OFERTAS IN VARCHAR2,
    TIPOARBOL IN NUMBER
)

    RETURN T_TREE_TABLE AS
    V_TABLE_RETURN  T_TREE_TABLE := T_TREE_TABLE();
    V_CODIGOS_CARGA VARCHAR2(1000);

    -- MASTER FORMAT
    CURSOR C_PRESUPUESTOMASTERFORM(PCODIGOS_CARGA VARCHAR2) IS
        WITH DATOS_OFERTAS AS
                 (SELECT
                      TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA,
                      SUBSTR(COLUMN_VALUE,INSTR(COLUMN_VALUE,'|')+1,LENGTH(COLUMN_VALUE)) CODIGO_OFERTA
                  FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))),
             DATOS_TEMP AS
                 (SELECT
                      A.CODIGO_CARGA,
                      A.BOQITEMID,
                      NULL AS GROUPCODEID,
                      CAST(A.TITLE AS VARCHAR2(4000)) AS TITLE,
                      B.GROUPCODEID AS GROUCODEID_PADRE,
                      SAF.CTS_GET_UNIT(A.UNIT) AS UNIT, -- DATOS QUEMADOS PARA HACER LA HOMOLOGACION DE UNIDADES SAF/COSTOS
                      TO_NUMBER(A.QUANTITY) TOTALUNITS,
                      A.TOTALCOST AS TOTALCOST,
                      A.OFFPRICE,
                      CAST(A.BOQITEMID AS VARCHAR2(100)) AS CODIGO_RENGLON_OFERTA,
                      REPLACE(C.CURRENTY_SIMBOL, '.') MONEDA
                  FROM SAF.CTS_BOQITEM_STG A
                           INNER JOIN SAF.CTS_EXTRACODE3_STG B ON
                      A.CODIGO_CARGA = B.CODIGO_CARGA AND
                      A.EXTRACODE3_GROUPCODEID = B.GROUPCODEID
                           INNER JOIN SAF.CTS_CARGAS_PROYECTOS C ON
                      C.CODIGO_CARGA = A.CODIGO_CARGA
                  WHERE A.CODIGO_CARGA IN
                        (SELECT CODIGO_CARGA FROM DATOS_OFERTAS WHERE CODIGO_CARGA IS NOT NULL)
                  UNION
                  SELECT
                      NULL AS CODIGO_CARGA,
                      NULL AS BOQITEMID,
                      A.GROUPCODEID,
                      CAST(A.TITLE AS VARCHAR2(2000)) AS TITLE,
                      (CASE
                           WHEN A.GROUCODEID_PADRE IS NULL THEN -1
                           ELSE A.GROUCODEID_PADRE
                          END) AS GROUCODEID_PADRE,
                      NULL AS UNIT,
                      NULL AS TOTALUNITS,
                      NULL AS TOTALCOST,
                      NULL AS OFFPRICE,
                      CAST(A.GROUPCODE AS VARCHAR2(200)) AS CODIGO_RENGLON_OFERTA,
                      NULL AS MONEDA
                  FROM SAF.CTS_EXTRACODE3_STG A
                  WHERE A.CODIGO_CARGA IN
                        (SELECT CODIGO_CARGA FROM DATOS_OFERTAS WHERE CODIGO_CARGA IS NOT NULL)
                  GROUP BY A.GROUPCODEID, A.GROUPCODE, A.TITLE, A.GROUCODEID_PADRE)
        SELECT
            A.*,
            LEVEL AS NIVEL
        FROM DATOS_TEMP A
        START WITH A.GROUPCODEID IN
            (
                SELECT
                    DISTINCT
                    B.GROUPCODEID
                FROM SAF.CTS_EXTRACODE3_STG B
                WHERE B.CODIGO_CARGA IN
                      (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL)
                AND B.GROUCODEID_PADRE IS NULL
            )
        CONNECT BY PRIOR A.GROUPCODEID = A.GROUCODEID_PADRE;

    -- UNIT FORMAT
    CURSOR C_PRESUPUESTOUNITFORM(PCODIGOS_CARGA VARCHAR2) IS
        WITH DATOS_OFERTAS AS
                 (SELECT
                      TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA,
                      SUBSTR(COLUMN_VALUE,INSTR(COLUMN_VALUE,'|')+1,LENGTH(COLUMN_VALUE)) CODIGO_OFERTA
                  FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))),
        DATOS AS
            (SELECT
                A.CODIGO_CARGA,
                A.BOQITEMID,
                NULL AS GROUPCODEID,
                CAST(A.TITLE AS VARCHAR2(4000)) AS TITLE,
                B.GROUPCODEID AS GROUCODEID_PADRE,
                SAF.CTS_GET_UNIT(A.UNIT) AS UNIT,
                TO_NUMBER(A.QUANTITY) AS TOTALUNITS,
                A.TOTALCOST AS TOTALCOST,
                A.OFFPRICE,
                CAST (A.BOQITEMID AS VARCHAR2(200)) AS CODIGO_RENGLON_OFERTA,
                REPLACE(C.CURRENTY_SIMBOL, '.') AS MONEDA
            FROM SAF.CTS_BOQITEM_STG A
                     INNER JOIN SAF.CTS_EXTRACODE2_STG B
                                ON A.CODIGO_CARGA = B.CODIGO_CARGA
                                    AND A.EXTRACODE2_GROUPCODEID = B.GROUPCODEID
                     INNER JOIN SAF.CTS_CARGAS_PROYECTOS C
                                ON C.CODIGO_CARGA = A.CODIGO_CARGA
            WHERE A.CODIGO_CARGA IN
                  (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL)
            UNION
            SELECT
                NULL AS CODIGO_CARGA,
                NULL AS OQITEMID,
                A.GROUPCODEID,
                CAST(A.TITLE AS VARCHAR2(2000)) AS TITLE,
                (
                    CASE
                        WHEN A.GROUPCODEID_PADRE IS NULL THEN -1
                        ELSE A.GROUPCODEID_PADRE
                        END
                    ) AS GROUCODEID_PADRE,
                NULL AS UNIT,
                NULL AS TOTALUNITS,
                NULL AS TOTALCOST,
                NULL AS OFFPRICE,
                CAST(A.GROUPCODE AS VARCHAR2(200)) AS CODIGO_RENGLON_OFERTA,
                NULL AS MONEDA
            FROM SAF.CTS_EXTRACODE2_STG A
            WHERE A.CODIGO_CARGA IN
                  (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL))
        SELECT
            A.*,
            LEVEL AS NIVEL
        FROM DATOS A
        START WITH A.GROUPCODEID IN
                   (
                       SELECT
                           DISTINCT
                           B.GROUPCODEID
                       FROM SAF.CTS_EXTRACODE2_STG B
                       WHERE B.CODIGO_CARGA IN
                             (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL)
                         AND B.GROUPCODEID_PADRE IS NULL
                   )
        CONNECT BY PRIOR A.GROUPCODEID = A.GROUCODEID_PADRE;

    -- WBS
    CURSOR C_PRESUPUESTOWBS(PCODIGOS_CARGA VARCHAR2) IS
        WITH DATOS_OFERTAS AS
                 (SELECT
                      TO_NUMBER(SUBSTR(COLUMN_VALUE,0,INSTR(COLUMN_VALUE,'|')-1)) CODIGO_CARGA,
                      SUBSTR(COLUMN_VALUE,INSTR(COLUMN_VALUE,'|')+1,LENGTH(COLUMN_VALUE)) CODIGO_OFERTA
                  FROM TABLE ( APEX_STRING.SPLIT(PCODIGOS_CARGA,':'))),
        DATOS AS
            (SELECT
                A.CODIGO_CARGA,
                A.BOQITEMID,
                NULL GROUPCODEID,
                CAST(A.TITLE AS VARCHAR2(4000)) AS TITLE,
                B.PROJECTWBSID GROUCODEID_PADRE,
                SAF.CTS_GET_UNIT(A.UNIT) AS UNIT,
                TO_NUMBER(A.QUANTITY) AS TOTALUNITS,
                A.TOTALCOST AS TOTALCOST,
                A.OFFPRICE,
                CAST (A.BOQITEMID AS VARCHAR2(200)) AS CODIGO_RENGLON_OFERTA,
                REPLACE(C.CURRENTY_SIMBOL, '.') MONEDA
            FROM SAF.CTS_BOQITEM_STG A
                     INNER JOIN SAF.CTS_PROJECTWBS2_STG B ON A.WBS2CODE_PROJECTWBSID = B.PROJECTWBSID
                     INNER JOIN SAF.CTS_CARGAS_PROYECTOS C ON C.CODIGO_CARGA = A.CODIGO_CARGA
            WHERE A.CODIGO_CARGA IN
                  (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL)
            UNION
            SELECT
                A.CODIGO_CARGA,
                NULL AS BOQITEMID,
                A.PROJECTWBSID,
                CAST(A.TITLE AS VARCHAR2(4000)),
                CASE WHEN A.PROJECTWBSID_PADRE IS NULL THEN -1 ELSE A.PROJECTWBSID_PADRE END,
                SAF.CTS_GET_UNIT(A.UNIT) AS UNIT,
                TO_NUMBER(A.QUANTITY) AS TOTALUNITS,
                A.TOTALCOST,
                A.OFFPRICE,
                CAST (A.CODE AS VARCHAR2(200)) AS CODIGO_RENGLON_OFERTA,
                NULL AS MONEDA
            FROM SAF.CTS_PROJECTWBS2_STG A
            WHERE A.CODIGO_CARGA IN
                  (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL)
              AND A.TOTALCOST > 0
            UNION
            SELECT
                A.CODIGO_CARGA,
                A.BOQITEMID,
                NULL GROUPCODEID,
                CAST(A.TITLE AS VARCHAR2(4000)) AS TITLE,
                B.PROJECTWBSID AS GROUCODEID_PADRE,
                SAF.CTS_GET_UNIT(A.UNIT) AS UNIT,
                TO_NUMBER(A.QUANTITY) AS TOTALUNITS,
                A.TOTALCOST AS TOTALCOST,
                A.OFFPRICE,
                CAST (A.BOQITEMID AS VARCHAR2(200)) AS CODIGO_RENGLON_OFERTA,
                REPLACE(C.CURRENTY_SIMBOL, '.') MONEDA
            FROM SAF.CTS_BOQITEM_STG A
                     INNER JOIN SAF.CTS_PROJECTWBS_STG B ON A.WBSCODE_PROJECTWBSID = B.PROJECTWBSID
                     INNER JOIN SAF.CTS_CARGAS_PROYECTOS C ON C.CODIGO_CARGA = A.CODIGO_CARGA
            WHERE A.CODIGO_CARGA IN
                  (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL)
            UNION
            SELECT
                A.CODIGO_CARGA,
                NULL MATID,
                A.PROJECTWBSID,
                CAST(A.TITLE AS VARCHAR2(4000)),
                CASE WHEN A.PROJECTWBSID_PADRE IS NULL THEN -1 ELSE A.PROJECTWBSID_PADRE END,
                SAF.CTS_GET_UNIT(A.UNIT) AS UNIT,
                TO_NUMBER(A.QUANTITY) AS TOTALUNITS,
                TOTALCOST,
                A.OFFPRICE,
                CAST (A.CODE AS VARCHAR2(200)) AS CODIGO_RENGLON_OFERTA,
                NULL MONEDA
            FROM SAF.CTS_PROJECTWBS_STG A
            WHERE A.CODIGO_CARGA IN
                  (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL)
              AND A.TOTALCOST > 0)
        SELECT
            A.*,
            LEVEL AS NIVEL
        FROM DATOS A
        START WITH A.GROUPCODEID IN
                   (
                       SELECT
                           B.PROJECTWBSID
                       FROM SAF.CTS_PROJECTWBS_STG B
                       WHERE B.CODIGO_CARGA IN
                             (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL)
                        AND B.PROJECTWBSID_PADRE  IS NULL
                        GROUP BY (B.PROJECTWBSID)
                        UNION
                        SELECT
                            C.PROJECTWBSID
                        FROM SAF.CTS_PROJECTWBS2_STG C
                        WHERE C.CODIGO_CARGA IN
                              (SELECT AA.CODIGO_CARGA FROM DATOS_OFERTAS AA WHERE AA.CODIGO_CARGA IS NOT NULL)
                        AND C.PROJECTWBSID_PADRE  IS NULL
                        GROUP BY (C.PROJECTWBSID)
                   )
        CONNECT BY PRIOR A.GROUPCODEID = A.GROUCODEID_PADRE;

BEGIN
    SELECT
        NVL(LISTAGG(CCP.CODIGO_CARGA||'|'||CAST(TEMP.CODIGO_RENGLON_OFERTA AS VARCHAR2(20))||CAST(COPA.CODIGO_RENGLON AS VARCHAR2(20))||':')  WITHIN GROUP (ORDER BY COPA.CODIGO_RENGLON),'')
    INTO
        V_CODIGOS_CARGA
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