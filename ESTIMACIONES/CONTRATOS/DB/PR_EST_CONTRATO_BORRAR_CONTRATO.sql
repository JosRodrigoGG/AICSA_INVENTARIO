CREATE OR REPLACE PROCEDURE SAF.PR_EST_CONTRATO_BORRAR_CONTRATO
(
    P_CONTRATO_ID NUMBER
)
IS
BEGIN
    DELETE FROM SAF.EST_ACTIVIDADES_CONSUMABLE_STG WHERE CONTRATOID = P_CONTRATO_ID;
    DELETE FROM SAF.EST_ACTIVIDADES_EQUIPMENT_STG WHERE CONTRATOID = P_CONTRATO_ID;
    DELETE FROM SAF.EST_ACTIVIDADES_LABOR_STG WHERE CONTRATOID = P_CONTRATO_ID;
    DELETE FROM SAF.EST_ACTIVIDADES_MATERIAL_STG WHERE CONTRATOID = P_CONTRATO_ID;
    DELETE FROM SAF.EST_ACTIVIDADES_SUBCONTRACTOR_STG WHERE CONTRATOID = P_CONTRATO_ID;

    DELETE FROM SAF.EST_CONSUMABLE_STG WHERE CONTRATOID = P_CONTRATO_ID;
    DELETE FROM SAF.EST_EQUIPMENT_STG WHERE CONTRATOID = P_CONTRATO_ID;
    DELETE FROM SAF.EST_LABOR_STG WHERE CONTRATOID = P_CONTRATO_ID;
    DELETE FROM SAF.EST_MATERIAL_STG WHERE CONTRATOID = P_CONTRATO_ID;
    DELETE FROM SAF.EST_SUBCONTRACTOR_STG WHERE CONTRATOID = P_CONTRATO_ID;

    DELETE FROM SAF.EST_CONTRATO_ACTIVIDAD 
    WHERE ID_CONTRATO_OFERTA IN
    (
        SELECT ID FROM SAF.EST_CONTRATOS_OFERTAS WHERE ID_CONTRATOS = P_CONTRATO_ID
    );

    DELETE FROM SAF.EST_CONTRATOS_RENGLONES WHERE CONTRATOID = P_CONTRATO_ID;

    DELETE FROM SAF.EST_CONTRATOS WHERE CONTRATOID = P_CONTRATO_ID;
   
   	DELETE FROM SAF.EST_CONTRATOS_OFERTAS WHERE ID_CONTRATOS = P_CONTRATO_ID;
END PR_EST_CONTRATO_BORRAR_CONTRATO;