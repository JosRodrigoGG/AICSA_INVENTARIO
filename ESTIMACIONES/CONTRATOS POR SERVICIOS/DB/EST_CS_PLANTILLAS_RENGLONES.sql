-- create tables
create table saf.est_cs_plantillas_renglones (
    id                             number generated by default on null as identity 
                                   constraint est_cs_plantillas_renglones_id_pk primary key,
    id_est_cs_plantillas           number
                                   constraint est_cs_planti_id_est_cs_pla_fk
                                   references saf.est_cs_plantillas on delete cascade,
    id_cts_tipo_servicio           number
                                   constraint est_cs_planti_id_cts_tipo_s_fk
                                   references saf.cts_tipo_servicio on delete cascade,
    codigo_renglon                 varchar2(256 char),
    codigo_renglon_padre           varchar2(256 char),
    orden                          number(10,0) default '1',
    titulo                         varchar2(256 char),
    descripcion                    varchar2(1024 char),
    codigo_medida                  number
                                   constraint est_cs_plantill_codigo_medi_fk
                                   references saf.gral_medidas on delete cascade,
    tipo_costo                     number(5,0),
    usuario_grabacion              number(10,0)
                                   constraint est_cs_plantillas_renglone_graba_fk
                                   references saf.gral_usuarios on delete cascade,
    fecha_grabacion                date default SYSDATE,
    usuario_modificacion           number(10,0)
                                   constraint est_cs_plantillas_renglone_modif_fk
                                   references saf.gral_usuarios on delete cascade,
    fecha_modificacion             date
)
;

-- table index
create index est_cs_plantillas_i2 on saf.est_cs_plantillas_renglones (codigo_medida);
create index est_cs_plantillas_i72 on saf.est_cs_plantillas_renglones (id_cts_tipo_servicio);
create index est_cs_plantillas_i83 on saf.est_cs_plantillas_renglones (id_est_cs_plantillas);
create index est_cs_plantillas_i94 on saf.est_cs_plantillas_renglones (usuario_grabacion);
create index est_cs_plantillas_i105 on saf.est_cs_plantillas_renglones (usuario_modificacion);

-- load data
 
-- Generated by Quick SQL Tuesday October 24, 2023  17:14:21
 
/*
EST_CS_PLANTILLAS_RENGLONES
    ID NUMBER /PK,
    ID_EST_CS_PLANTILLAS NUMBER /FK EST_CS_PLANTILLAS,
    ID_CTS_TIPO_SERVICIO NUMBER /FK CTS_TIPO_SERVICIO,
    CODIGO_RENGLON VC256,
    CODIGO_RENGLON_PADRE VC256,
    ORDEN NUMBER(10,0) /DEFAULT 1,
    TITULO VC256,
    DESCRIPCION VC1024,
    CODIGO_MEDIDA NUMBER /FK GRAL_MEDIDAS,
    TIPO_COSTO NUMBER(5,0),
    USUARIO_GRABACION NUMBER(10,0) /FK GRAL_USUARIOS,
    FECHA_GRABACION DATE /DEFAULT SYSDATE,
    USUARIO_MODIFICACION NUMBER(10,0) /FK GRAL_USUARIOS,
    FECHA_MODIFICACION DATE

# settings = { semantics: "CHAR", language: "EN", APEX: true }
*/
