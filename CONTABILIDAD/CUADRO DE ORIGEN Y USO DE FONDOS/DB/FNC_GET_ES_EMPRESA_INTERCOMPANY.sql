CREATE OR REPLACE function SAF.fnc_get_es_empresa_Intercompany(PCuenta  cxc_cuentas.numero_cuenta%Type) return varchar2 is
    cursor c_es_intercompany is
        Select count(*)
          from gral_empresas a, gral_personas b
         where a.CODIGO_PERSONA = b.CODIGO_PERSONA
           and a.CODIGO_EMPRESA > 99
           and b.NIT in (Select a.NIT_FACTURAR
                           from CXC_CUENTAS a
                          where a.NUMERO_CUENTA = PCuenta
                           group by a.nit_facturar)
           and b.NIT <> 'CF';
    l_es_intercompany   number:=0;
Begin 
    open c_es_intercompany;
    fetch c_es_intercompany into l_es_intercompany;
    close c_es_intercompany;
    if nvl(l_es_intercompany,0) > 0 then
        return 'S';
    else
        return 'N';
    end if;
END;