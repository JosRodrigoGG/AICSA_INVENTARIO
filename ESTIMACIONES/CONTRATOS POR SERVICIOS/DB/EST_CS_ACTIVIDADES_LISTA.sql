-- create tables
create table saf.est_cs_actividades_lista (
    id                             number generated by default on null as identity 
                                   constraint est_cs_actividades_lista_id_pk primary key,
    codigo_actividad               varchar2(256 char),
    id_est_cs_renglones_lista      number
                                   constraint est_cs_activi_lista_id_est_cs_ren_fk
                                   references est_cs_renglones_lista on delete cascade,
    titulo                         varchar2(256 char) not null,
    codigo_medida                  number
                                   constraint est_cs_activida_codigo_medi_lista_fk
                                   references gral_medidas on delete cascade,
    estado                         number(5,0),
    usuario_grabacion              number(10,0)
                                   constraint est_cs_activi_usuario_graba_fk_lista
                                   references gral_usuarios on delete cascade,
    fecha_grabacion                date default SYSDATE,
    usuario_modificacion           number(10,0)
                                   constraint est_cs_activi_usuario_modif_fk_lista
                                   references gral_usuarios on delete cascade,
    fecha_modificacion             date
)

-- table index
create index est_cs_actividades_i2 on est_cs_actividades_lista (codigo_medida);
create index est_cs_actividades_i62 on est_cs_actividades_lista (id_est_cs_renglones_lista);
create index est_cs_actividades_i73 on est_cs_actividades_lista (usuario_grabacion);
create index est_cs_actividades_i84 on est_cs_actividades_lista (usuario_modificacion);

-- load data
 
-- Generated by Quick SQL Monday December 04, 2023  10:45:12
 
/*
EST_CS_ACTIVIDADES_LISTA
    ID NUMBER /PK,
    CODIGO_ACTIVIDAD VC256,
    ID_EST_CS_RENGLONES_LISTA /FK EST_CS_RENGLONES_LISTA,
    TITULO VC256 /NN,
    CODIGO_MEDIDA NUMBER /FK GRAL_MEDIDAS,
    ESTADO NUMBER(5,0),
    USUARIO_GRABACION NUMBER(10,0) /FK GRAL_USUARIOS,
    FECHA_GRABACION DATE /DEFAULT SYSDATE,
    USUARIO_MODIFICACION NUMBER(10,0) /FK GRAL_USUARIOS,
    FECHA_MODIFICACION DATE

# settings = { semantics: "CHAR", language: "EN", APEX: true }
*/
