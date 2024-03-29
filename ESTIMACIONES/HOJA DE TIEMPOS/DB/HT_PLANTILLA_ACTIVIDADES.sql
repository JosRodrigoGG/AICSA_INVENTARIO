-- create tables
create table saf.ht_plantilla_actividades (
                                          id                             number generated by default on null as identity
                                              constraint ht_plantilla_activ_id_pk primary key,
                                          nombre                         varchar2(256 char) not null,
                                          descripcion                    varchar2(1024 char),
                                          usuario_creacion               number not null,
                                          fecha_creacion                 date default SYSDATE,
                                          usuario_modificacion           number,
                                          fecha_modificacion             date
)
;

-- load data

-- Generated by Quick SQL Friday January 26, 2024  12:53:38

/*
HT_PLANTILLA_ACTIVIDADES
    ID NUM /PK
    NOMBRE VC256 /NN,
    DESCRIPCION VC1024,
    USUARIO_CREACION NUM /NN,
    FECHA_CREACION DATE /DEFAULT SYSDATE,
    USUARIO_MODIFICACION NUM,
    FECHA_MODIFICACION DATE

# settings = { semantics: "CHAR", language: "EN", APEX: true }
*/
