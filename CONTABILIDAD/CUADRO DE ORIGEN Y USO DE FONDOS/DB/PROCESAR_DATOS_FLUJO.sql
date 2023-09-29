Declare
   cursor c_flujo(v_id_flujo number, pfechai date, pfechaf date) is
   select 1 Orden,
   	   'Ingresos' Descripcion,
   	   0 MontoUSD$,
   	   sum(nvl(monto_x_cobrar,0)) MontoQTZ,
         nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
         Codigo_Empresa
     from flujo_efectivo_ingresos
    where codigo_empresa in (
               select CODIGO_EMPRESA 
                 From FLUJO_EMPRESAS_CONSOLIDADORAS  
                where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
      and ID_FLUJO = v_id_flujo
  group by codigo_empresa
Union  
Select 2 Orden,
	   'CXP Materiales' Descripcion,
	   sum(nvl(Monto_Origen,0))*-1 MontoUSD$,
	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,
      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
      Codigo_Empresa
  from flujo_efectivo_antiguedad_cxp
 where codigo_empresa in (
    select CODIGO_EMPRESA 
      From FLUJO_EMPRESAS_CONSOLIDADORAS  
      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
   and Nvl(ES_SERVICIO, 'N') = 'N'
   and nvl(Proveedor_Mayor,'N')  = 'N'
   and nvl(sub_contratista,'N') = 'N'
   and nvl(empleado,'N') = 'N'
   and intercompany = 'N'
   and ID_FLUJO = v_id_flujo
   group by codigo_empresa
Union
Select 3 Orden,
	   'CXP Servicios' Descripcion,
	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,
	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,
      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
      Codigo_Empresa
  from flujo_efectivo_antiguedad_cxp
 where codigo_empresa in (
    select CODIGO_EMPRESA 
      From FLUJO_EMPRESAS_CONSOLIDADORAS  
      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
   and Nvl(ES_SERVICIO, 'N') = 'S'
   and nvl(Proveedor_Mayor,'N')  = 'N'
   and nvl(sub_contratista,'N') = 'N'
   and nvl(empleado,'N') = 'N'
   and intercompany = 'N'
   and ID_FLUJO = v_id_flujo
   group by codigo_empresa
Union
Select 4 Orden,
	   'CXP Proveedores Mayores' Descripcion,
	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,
	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,
      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
      Codigo_Empresa
  from flujo_efectivo_antiguedad_cxp
 where codigo_empresa in (
    select CODIGO_EMPRESA 
      From FLUJO_EMPRESAS_CONSOLIDADORAS  
      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
   and nvl(Proveedor_Mayor,'N')  = 'S'
   and nvl(sub_contratista,'N') = 'N'
   and nvl(empleado,'N') = 'N'
   and intercompany = 'N'
   and ID_FLUJO = v_id_flujo
 group by codigo_empresa
union
 select 5 orden,
        'Pagos Recurrentes',
        sum(nvl(monto_pagar_origen,0))*-1 MontoUSD$,
        sum(nvl(monto_pagar_local,0))*-1 MontoQTZ,
        nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
        Codigo_Empresa
   from FLUJO_EFECTIVO_PAGOS_RECURRENTES
  where codigo_empresa = nvl(:P103_EMPRESA_CONSOLIDADORA, codigo_empresa)
    and ID_FLUJO = v_id_flujo
 group by codigo_empresa
Union
Select 6 Orden,
	   'Planillas' Descripcion,
	   0 MontoUSD$,
	   sum(nvl(Liquido,0))*-1  MontoQTZ,
      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
      Codigo_Empresa
  from flujo_efectivo_planillas x
 where codigo_empresa in (
    select CODIGO_EMPRESA 
      From FLUJO_EMPRESAS_CONSOLIDADORAS  
      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
  and es_Prestacion = 'N'
  and id_flujo = v_id_flujo /*in (select max(ID_FLUJO)
				    from  flujo_efectivo_planillas
				   where codigo_empresa = x.codigo_empresa)*/
 group by codigo_empresa
Union
Select 7 Orden,
	   'Prestaciones' Descripcion,
	   0 MontoUSD$,
	   nvl(sum(nvl(Liquido,0)),0)*-1  MontoQTZ,
      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
      Codigo_Empresa
  from flujo_efectivo_planillas x
 where codigo_empresa in (
    select CODIGO_EMPRESA 
      From FLUJO_EMPRESAS_CONSOLIDADORAS  
      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
  and es_Prestacion = 'S'
  and id_flujo = v_id_flujo /*in (select max(ID_FLUJO)
				    from  flujo_efectivo_planillas
				   where codigo_empresa = x.codigo_empresa)*/
 group by codigo_empresa
union 
select 8 Orden,
	   'Igss' Descripcion,
	   0 MontoUSD$,
	   nvl(Sum(Igss),0) * - 1 MontoQtz,
      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
      Codigo_Empresa
	  from flujo_efectivo_planillas_igss x
   where codigo_empresa in (
          select CODIGO_EMPRESA 
            From FLUJO_EMPRESAS_CONSOLIDADORAS  
            where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
     and id_flujo = v_id_flujo /*in (select max(ID_FLUJO)
				    from  flujo_efectivo_planillas
				   where codigo_empresa = x.codigo_empresa)*/
  group by codigo_empresa
Union 
select 9 Orden,
	   'Anticipos x Liquidar' Descripcion,
	   nvl(sum(Monto_AXLUSD$),0) Monto_AXLUSD$,
 	   nvl(sum(Monto_AXLQTZ),0) Monto_AXLQTZ,
       nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
       Codigo_Empresa
  from (
        Select case 
                 when codigo_moneda = 2 then
                   nvl(sum(MONTO_$),0) * -1
               end Monto_AXLUSD$,
 		       case 
 		         when codigo_moneda = 1 then
 			       nvl(sum(MONTO_QTZ),0) * -1
		       end Monto_AXLQTZ,
               codigo_empresa
          From FLUJO_EFECTIVO_ANTICIPOS axl
         where codigo_empresa in (
               select CODIGO_EMPRESA 
                 From FLUJO_EMPRESAS_CONSOLIDADORAS  
                where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
           and id_flujo = v_id_flujo
        Group by Codigo_Moneda, codigo_empresa)
group by codigo_empresa
union 
 Select 10 Orden,
	    'Cajas Chicas' Descripcion,
	    decode(codigo_moneda,2,sum(monto_pago),0) * -1 Monto_USD$,
	    decode(codigo_moneda,1,sum(monto_pago),0) * -1 MontoQtz,
       nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
       Codigo_Empresa
 from FLUJO_EFECTIVO_CAJAS_CHICAS
 where idflujo = v_id_flujo
 group by codigo_empresa,codigo_moneda
union 
select orden, descripcion, sum(monto_usd$) monto_usd$, sum(monto_qtz) monto_qtz, empresa_consolidadora,
       Codigo_Empresa
  from (
		select 11 Orden, 'Impuestos' Descripcion, 0 Monto_USD$,
			  sum(IMPUESTOS) Monto_Qtz,
		      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
            codigo_empresa
		From flujo_impuestos
		where ID_FLUJO = v_id_flujo
		group by codigo_empresa
  )
  group by orden, descripcion, empresa_consolidadora, codigo_empresa
union
Select 12 Orden,
	   'Subcontratistas' Descripcion,
	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,
	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,
      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
      Codigo_Empresa
  from flujo_efectivo_antiguedad_cxp
 where codigo_empresa in (
    select CODIGO_EMPRESA 
      From FLUJO_EMPRESAS_CONSOLIDADORAS  
      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
   and nvl(Proveedor_Mayor,'N')  = 'N'
   and nvl(sub_contratista,'N') = 'S'
   and nvl(empleado,'N') = 'N'
   and intercompany = 'N'
   and ID_FLUJO = v_id_flujo
 group by codigo_empresa
 union
---------------- Nuevo Union para Flujo de Pago de Tarjeta credito ---------------
select 13 Orden,
    'Tarjeta Credito' DESCRIPCION,
    sum(
        (
            case when CODIGO_MONEDA = 2 THEN
                nvl(VALOR * TASA_CAMBIO,0)
            ELSE
                0.00
            END
        )
        
        
        )*-1  MontoUSD,

    sum(
        (
            case when CODIGO_MONEDA = 1 THEN
                nvl(VALOR,0)
            ELSE
                0.00
            END
        )
        
        
        )*-1  MontoQTZ,

    nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
     Codigo_Empresa
from FLUJO_EFECTIVO_TCC_SOLICITUD_COMPRA
where CODIGO_EMPRESA in( 
    (
        select CODIGO_EMPRESA 
        From FLUJO_EMPRESAS_CONSOLIDADORAS  
        where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
    )
    and ID_FLUJO = v_id_flujo
    group by codigo_empresa
union

Select 14 Orden,
	   'Viaticos, Depreciación y Combustible' Descripcion,
	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,
	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,
      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
      Codigo_Empresa
  from flujo_efectivo_antiguedad_cxp
 where codigo_empresa in (
    select CODIGO_EMPRESA 
      From FLUJO_EMPRESAS_CONSOLIDADORAS  
      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
   and nvl(Proveedor_Mayor,'N')  = 'N'
   and nvl(sub_contratista,'N') = 'N'
   and nvl(empleado,'N') = 'S'
   and ID_FLUJO = v_id_flujo
 group by codigo_empresa
--Order by 1
---------------- Nuevo Union para Flujo de prestamos y solitud de Pago ---------------
UNION
    select 15 orden,
    'Préstamos' Descripcion,
    sum((case when CODIGO_MONEDA = 2 THEN
            nvl(TOTAL_ORIGEN,0)
         ELSE
            0.00
         END))*-1  MontoUSD,
    sum((case when CODIGO_MONEDA = 1 THEN
            nvl(TOTAL_LOCAL,0)
        ELSE
            0.00
        END))*-1  MontoQTZ,
    nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
    CODIGO_EMPRESA
    from FLUJO_PRESTAMOS_SOLICITUD_PAGO
    where CODIGO_EMPRESA in((
            select CODIGO_EMPRESA 
            From FLUJO_EMPRESAS_CONSOLIDADORAS  
            where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora)))
        and ID_FLUJO = v_id_flujo
    group by CODIGO_EMPRESA
-------------------------------- FIN DEL NUEVO UNION -----------------------
UNION
    select 17 orden,
    'Solicitud de Viaticos' Descripcion,
    
    sum((case when MONEDA = 2 THEN
                nvl(TOTAL_ORIGEN,0)
            ELSE
                0.00
            END))*-1  MontoUSD,
    sum((case when MONEDA = 1 THEN
                nvl(TOTAL_LOCAL,0)
            ELSE
                0.00
            END))*-1  MontoQTZ,
    nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
    CODIGO_EMPRESA
    from FLUJO_VTC_SOLICITUD_VIATICOS
    where CODIGO_EMPRESA in( 
        (
            select CODIGO_EMPRESA 
            From FLUJO_EMPRESAS_CONSOLIDADORAS  
            where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
        )
        and ID_FLUJO = v_id_flujo
    group by CODIGO_EMPRESA
-- ############################### INTERCOMPANY #########################################
    UNION
    Select 18 Orden,
	   'Empresas relacionadas' Descripcion,
	   sum(nvl(Monto_Origen,0))*-1  MontoUSD$,
	   sum(nvl(Monto_Local,0))*-1  MontoQTZ,
      nvl(fnc_get_flujo_empresa_consolidadora(codigo_empresa),codigo_empresa) Empresa_Consolidadora,
      Codigo_Empresa
  from flujo_efectivo_antiguedad_cxp
 where codigo_empresa in (
    select CODIGO_EMPRESA 
      From FLUJO_EMPRESAS_CONSOLIDADORAS  
      where CODIGO_EMPRESA_CONSOLIDADORA  = nvl(:P103_EMPRESA_CONSOLIDADORA, Codigo_Empresa_Consolidadora))
   and intercompany = 'S'
   and ID_FLUJO = v_id_flujo
 group by codigo_empresa
-- ############################### FIN DEL INTERCOMPANY #####################################
-- INICIO FDU_TRANSACCIONES_FINANCIERAS
    UNION
    SELECT
        19 ORDEN,
        'Inversión/Prestamos' DESCRIPCION,
        SUM(NVL(SAF.APX_FNC_CONVERSION_MONEDAS
            (
                MONTO_ORIGEN,
                CODIGO_MONEDA,
                2,
                TASA_CAMBIO,
                NULL
            ), 0)) * -1 MONTOUSD,
        SUM(NVL(MONTO_LOCAL, 0)) * -1 MONTOQTZ,
        NVL(SAF.FNC_GET_FLUJO_EMPRESA_CONSOLIDADORA(CODIGO_EMPRESA), CODIGO_EMPRESA) EMPRESA_CONSOLIDADORA,
        CODIGO_EMPRESA
    FROM SAF.FLUJO_EFECTIVO_FDU_TRANSACCIONES_FINANCIERAS
    WHERE ID_FLUJO = v_id_flujo
    AND CODIGO_EMPRESA IN
    (
        SELECT 
            CODIGO_EMPRESA
        FROM SAF.FLUJO_EMPRESAS_CONSOLIDADORAS
        WHERE CODIGO_EMPRESA_CONSOLIDADORA = NVL(:P103_EMPRESA_CONSOLIDADORA, CODIGO_EMPRESA_CONSOLIDADORA)
    )
    GROUP BY CODIGO_EMPRESA
-- FIN FDU_TRANSACCIONES_FINANCIERAS
Order by 1;

    cursor c_id is
        Select max(id) id
        From Flujo_Efectivo_Proceso
        where to_char(fechai, 'dd-mm-yyyy') = to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy')
          and to_char(fechaf, 'dd-mm-yyyy') = to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy');
 
 	cursor c_fechas is
	   select trunc(add_months(last_day(to_Date(:P103_FECHAI, 'dd-mm-yyyy')),-2) + 1) First_Date,
	   		  trunc(last_day(add_months(last_day(to_date(:P103_FECHAI,'dd-mm-yyyy')),-2) + 1)) Last_date
	   from dual;

    l_id    Flujo_Efectivo_Proceso.id%Type:=0;
    l_fecha_i	date;
	 l_fecha_f	date;
    l_fechai   date;
    l_fechaf   date;

    cont_ingresos number;
    cont_cxp_materiales number;
    cont_cxp_servicios number;
    cont_cxp_proveedores_mayores number;
    cont_pagos_recurrentes number;
    cont_planillas number;
    cont_prestaciones number;
    cont_igss number;
    cont_anticipos_x_liquidar number;
    cont_cajas_chicas number;
    cont_impuestos number;
    cont_subcontratistas number;
    cont_otros_presupuestos number;
    cont_viaticos_dep_com number;
    cont_prestamos number;
    cont_pagos_solicitados number;
    cont_viaticos_solicitados number;
    cont_empresas_relacionadas number;
    -- INICIO FDU_TRANSACCIONES_FINANCIERAS
    CONST_FDU_TRANSACCIONES_FINANCIERAS NUMBER;
    -- FIN FDU_TRANSACCIONES_FINANCIERAS

Begin

    cont_ingresos := 0;
    cont_cxp_materiales := 0;
    cont_cxp_servicios := 0;
    cont_cxp_proveedores_mayores := 0;
    cont_pagos_recurrentes := 0;
    cont_planillas := 0;
    cont_prestaciones := 0;
    cont_igss := 0;
    cont_anticipos_x_liquidar := 0;
    cont_cajas_chicas := 0;
    cont_impuestos := 0;
    cont_subcontratistas:= 0;
    cont_otros_presupuestos:= 0;
    cont_viaticos_dep_com:= 0;
    cont_prestamos:= 0;
    cont_pagos_solicitados:= 0;
    cont_viaticos_solicitados := 0;
    cont_empresas_relacionadas := 0;
    -- INICIO FDU_TRANSACCIONES_FINANCIERAS
    CONST_FDU_TRANSACCIONES_FINANCIERAS := 0;
    -- FIN FDU_TRANSACCIONES_FINANCIERAS


	-- Con este cambio siempre traemos los impuestos del mes Anterior
	-- A solicitud de Gerson 
	open c_fechas;
	fetch c_fechas into l_fecha_i, l_fecha_f;
	close c_fechas;
 
    Insert Into Flujo_Efectivo_Proceso(FechaI, FechaF,codigo_empresa,fechaiingreso,fechafingreso)
    Values(:P103_FECHAI, :P103_FECHAF,:P103_EMPRESA_CONSOLIDADORA,:P103_FECHAI_INGRESOS,:P103_FECHAF_INGRESOS);
    Commit;

    open c_id;
    fetch c_id into l_id;
    close c_id;


    
    SAF.PR_FLUJO_EFECTIVO_INGRESOS(:P103_FECHAI_INGRESOS, :P103_FECHAF_INGRESOS, l_id, :P103_EMPRESA_CONSOLIDADORA) ;
    SAF.PR_FLUJO_EFECTIVO_ANTIGUEDADCXP(:P103_FECHAF, l_id, :P103_EMPRESA_CONSOLIDADORA) ;
    SAF.PR_FLUJO_EFECTIVO_Planillas(:P103_FECHAI_INGRESOS, :P103_FECHAF_INGRESOS, l_id, :P103_EMPRESA_CONSOLIDADORA) ;
    SAF.PR_FLUJO_EFECTIVO_PLANILLAS_IGSS(:P103_FECHAI, :P103_FECHAF, l_id, :P103_EMPRESA_CONSOLIDADORA) ;
    saf.PR_FLUJO_EFECTIVO_pagos_recurrentes(l_id, :P103_EMPRESA_CONSOLIDADORA) ;
    SAF.PR_FLUJO_EFECTIVO_ANTICIPOS(l_id, :P103_EMPRESA_CONSOLIDADORA,:P103_FECHAI, :P103_FECHAF);
    saf.PR_FLUJO_EFECTIVO_CAJAS_CHICAS(l_id, :P103_EMPRESA_CONSOLIDADORA,:P103_FECHAI, :P103_FECHAF) ;
    saf.PR_FLUJO_IMPUESTOS(l_id, :P103_EMPRESA_CONSOLIDADORA, l_fecha_i, l_fecha_f) ;
    -- procedimiento de flujo de prestamos
    --Raise_Application_Error(-20366,'Valor : '||l_id || '-' || :P103_EMPRESA_CONSOLIDADORA || '-' ||  l_fecha_i || '-' || l_fecha_f);
    saf.PR_FLUJO_PRESTAMO(l_id, :P103_EMPRESA_CONSOLIDADORA,  :P103_FECHAI, :P103_FECHAF);
    --Funcion para el pago de tarjeta
    saf.PR_FLUJO_PAGO_TARJETA_CREDITO(l_id,:P103_EMPRESA_CONSOLIDADORA,sysdate, :GLOBAL_CODIGO_USUARIO);
    saf.PR_FLUJO_VIATICOS(l_id, :P103_EMPRESA_CONSOLIDADORA,:P103_FECHAI, :P103_FECHAF);
    -- INICIO FDU_TRANSACCIONES_FINANCIERAS
    SAF.PR_FLUJO_TRANSACCIONES_FINANCIERAS(l_id, :P103_EMPRESA_CONSOLIDADORA);
    -- FIN FDU_TRANSACCIONES_FINANCIERAS
    Commit;

    for cf in c_flujo(l_id, l_fecha_i, l_fecha_f) Loop
      if cf.descripcion = 'Ingresos' then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI_INGRESOS, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF_INGRESOS, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               cf.descripcion, cf.montoUsd$, cf.montoQtz, cf.orden, cf.empresa_consolidadora, cf.codigo_empresa );
      else
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               cf.descripcion, cf.montoUsd$, cf.montoQtz, cf.orden, cf.empresa_consolidadora, cf.codigo_empresa );
      end if;

      case
        when cf.orden = 1 then
        cont_ingresos := cont_ingresos +1;

        when cf.orden = 2 then
        cont_cxp_materiales := cont_cxp_materiales +1;

        when cf.orden = 3 then
        cont_cxp_servicios := cont_cxp_servicios +1;

        when cf.orden = 4 then
        cont_cxp_proveedores_mayores := cont_cxp_proveedores_mayores +1;

        when cf.orden = 5 then
        cont_pagos_recurrentes := cont_pagos_recurrentes +1;

        when cf.orden = 6 then
        cont_planillas := cont_planillas +1;

        when cf.orden = 7 then
        cont_prestaciones := cont_prestaciones +1;

        when cf.orden = 8 then
        cont_igss := cont_igss +1;

        when cf.orden = 9 then
        cont_anticipos_x_liquidar := cont_anticipos_x_liquidar +1;

        when cf.orden = 10 then
        cont_cajas_chicas := cont_cajas_chicas +1;

        when cf.orden = 11 then
        cont_impuestos := cont_impuestos +1;
        
        when cf.orden = 12 then
        cont_subcontratistas := cont_subcontratistas +1;
        
        when cf.orden = 13 then
        cont_otros_presupuestos := cont_otros_presupuestos +1;
        
        when cf.orden = 14 then
        cont_viaticos_dep_com := cont_viaticos_dep_com +1;
        
        when cf.orden = 15 then
        cont_prestamos := cont_prestamos +1;
        
        when cf.orden = 16 then
        cont_pagos_solicitados := cont_pagos_solicitados +1;

        when cf.orden = 17 then
        cont_viaticos_solicitados := cont_viaticos_solicitados +1;

        when cf.orden = 18 then
        cont_empresas_relacionadas := cont_empresas_relacionadas +1; -- INTERCOMPANY
        
        -- INICIO FDU_TRANSACCIONES_FINANCIERAS
        WHEN cf.orden = 19 then
        CONST_FDU_TRANSACCIONES_FINANCIERAS := CONST_FDU_TRANSACCIONES_FINANCIERAS + 1;
        -- FIN FDU_TRANSACCIONES_FINANCIERAS
      end case;

    end loop;
    


    if cont_ingresos=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI_INGRESOS, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF_INGRESOS, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Ingresos', 0, 0, 1, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );    
    end if;
    if cont_cxp_materiales=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'CXP Materiales', 0, 0, 2, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_cxp_servicios=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'CXP Servicios', 0, 0, 3, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_cxp_proveedores_mayores=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'CXP Proveedores Mayores', 0, 0, 4, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_pagos_recurrentes=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Pagos Recurrentes', 0, 0, 5, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_planillas=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Planillas', 0, 0, 6, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_prestaciones=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Prestaciones', 0, 0, 7, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_igss=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Igss', 0, 0, 8, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_anticipos_x_liquidar=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Anticipos x Liquidar', 0, 0, 9, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_cajas_chicas=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Cajas Chicas', 0, 0, 10, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_impuestos=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Impuestos', 0, 0, 11, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_subcontratistas=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Subcontratistas', 0, 0, 12, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_otros_presupuestos=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Tarjeta Credito', 0, 0, 13, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_viaticos_dep_com=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Viaticos, Depreciación y Combustible', 0, 0, 14, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_prestamos=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Préstamos', 0, 0, 15, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_pagos_solicitados=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Pagos Solicitados por Dirección', 0, 0, 16, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;
    if cont_viaticos_solicitados=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Solicitud de Viaticos', 0, 0, 16, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;

    if cont_empresas_relacionadas=0 then
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Empresas relacionadas', 0, 0, 18, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    end if;

    -- INICIO FDU_TRANSACCIONES_FINANCIERAS
    IF CONST_FDU_TRANSACCIONES_FINANCIERAS = 0 THEN
        insert into Flujo_Efectivo_Historico(id, fechai, fechaf, tipo, monto_usd$, monto_qtz, orden, empresa_consolidadora, codigo_empresa)
        values(l_id, to_char(to_date(:P103_FECHAI, 'dd-mm-yyyy'), 'dd-mm-yyyy'), 
                to_char(to_date(:P103_FECHAF, 'dd-mm-yyyy'), 'dd-mm-yyyy'),
               'Transacciones Financieras', 0, 0, 19, :P103_EMPRESA_CONSOLIDADORA, :P103_EMPRESA_CONSOLIDADORA );
    END IF;
    -- FIN FDU_TRANSACCIONES_FINANCIERAS
    commit;

End;