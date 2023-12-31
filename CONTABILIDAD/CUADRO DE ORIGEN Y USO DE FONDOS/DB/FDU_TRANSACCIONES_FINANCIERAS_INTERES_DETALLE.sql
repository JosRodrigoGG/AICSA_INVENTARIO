-- create tables
create table SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE (
    id                             number generated by default on null as identity 
                                   constraint PK_FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE primary key,
    id_fdu_transacciones_financieras number(10,0)
                                   constraint FK_FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE
                                   references FDU_TRANSACCIONES_FINANCIERAS on delete cascade not null,
    fecha_interes                  date default SYSDATE,
    codigo_moneda                  number(5,0) not null,
    tasa_moneda                    number(20,5) not null,
    monto_origen                   number(20,5) not null,
    monto_local                    number(20,5) not null,
    capital                        number(20,5),
    estado                         number(5,0),
    ID_INTERES_COBRADO             number(10,0),
    usuario_grabacion              number(10,0) not null,
    fecha_grabacion                date default SYSDATE
)
;

-- table index
create index FK_FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE on SAF.FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE (id_fdu_transacciones_financieras);

-- load data
 
-- Generated by Quick SQL Friday September 01, 2023  09:51:47
 
/*
FDU_TRANSACCIONES_FINANCIERAS_INTERES_DETALLE {
    id /pk,
    id_fdu_transacciones_financieras num(10,0) /nn /fk table FDU_TRANSACCIONES_FINANCIERAS
    fecha_interes date /default sysdate
    codigo_moneda num(5,0) /nn,
    tasa_moneda num(20,5) /nn,
    monto_origen num(20,5) /nn,
    monto_local num(20,5) /nn,
    usuario_grabacion num(10,0) /nn,
    fecha_grabacion date /default sysdate
}

# settings = { semantics: "CHAR", language: "EN", APEX: true }
*/
