drop table PRESUPUESTO;
drop table TIPO_DE_PRESUPUESTO;
drop table LABORATORIO;
drop table USUARIO;
/*drop table CHEQUE_OG;
drop table ORDEN_GASTO;
drop table CHEQUE;*/
drop sequence codigo_seq;
SET DATESTYLE TO 'European';
CREATE SEQUENCE codigo_seq Start with 100000;
/*
  drop sequence codigo_seq;
  CREATE SEQUENCE codigo_seq Start with 100000;
  esto es para la autogeneracion de codigo, se colocaria en codigo de tdp dsps del check DEFAULT NEXTVAL('codigo_seq')
TEXT unique NOT NULL DEFAULT 'TDP-'||nextval('codigo_seq'::regclass)::TEXT,
*/
create table USUARIO 
    (usbid varchar(30) unique CHECK (usbid != ''), 
    contrasena varchar(50) NOT NULL CHECK (contrasena != ''),
    CONSTRAINT PK_USUARIO PRIMARY KEY (usbid));

create table TIPO_DE_PRESUPUESTO 
    (codigo int unique DEFAULT NEXTVAL('codigo_seq'),
    tipo varchar(100) NOT NULL CHECK (tipo != ''), 
    descripcion varchar(200), 
    status int NOT NULL CHECK  (status in (0,1)), 
    monto float NOT NULL CHECK (monto >= 0.0),
    fecha Date,
    CONSTRAINT PK_TIPO_DE_PRESUPUESTO PRIMARY KEY (codigo,tipo));


create table LABORATORIO 
    (codigo_laboratorio int unique CHECK (codigo_laboratorio > 0), 
    nombre varchar(50) NOT NULL CHECK (nombre != ''),
    descripcion varchar(200),
    monto float NOT NULL CHECK (monto >= 0.0),
    CONSTRAINT PK_LABORATORIO PRIMARY KEY (codigo_laboratorio));

/*el tipo de codigo_tdp debe ser int para funcionalidades totales, toy acomodando*/
create table PRESUPUESTO 
    (id SERIAL,
    codigo_TDP int, 
    codigo_laboratorio int, 
    monto_asignado float NOT NULL CHECK (monto_asignado > 0.0),    
    status int NOT NULL CHECK  (status in (0,1)),
    fecha Date Default current_date,
    descripcion varchar(200) Default '',
    CONSTRAINT PK_PRESUPUESTO PRIMARY KEY (id,codigo_TDP,codigo_laboratorio),
    CONSTRAINT FK_PRESUPUESTO_TIPO_DE_PRESUPUESTO FOREIGN KEY (codigo_TDP)  REFERENCES TIPO_DE_PRESUPUESTO (codigo),
    CONSTRAINT FK_PRESUPUESTO_LABORATORIO FOREIGN KEY (codigo_laboratorio)  REFERENCES LABORATORIO);



/*create table CHEQUE 
    (codigo int, 
    monto FLOAT(10),
    fecha varchar(50),
    status VARCHAR(50) NOT NULL CHECK (status = 'custodia' or status = 'entregado' or status = 'rechazado'),
    CONSTRAINT PK_CHEQUE PRIMARY KEY (codigo));
/*muestra las tablas de la BD*/
/* \dt */
/* rif es la clave foranea a proveedor de la orden de gasto */
/* proveedor es una tabla del sistema de comprasv*/
/* CONSTRAINT FK_rif FOREIGN KEY rif --> dependera de la base de datos d elos de Compras*/
/*create table ORDEN_GASTO 
    (rif varchar(50), 
    fecha varchar(50), 
    num_orden varchar(50),
    CONSTRAINT PK_rif_num_orden PRIMARY KEY (num_orden));

create table CHEQUE_OG
    (codigo int, 
    num_orden varchar(50),
    CONSTRAINT FK_CHEQUE FOREIGN KEY (codigo)  REFERENCES CHEQUE,
    CONSTRAINT FK_OG FOREIGN KEY (num_orden)  REFERENCES ORDEN_GASTO,
    CONSTRAINT PK_CHEQUE_OG PRIMARY KEY (codigo,num_orden));

*/
/*
drop sequence test_seq;
drop table adc;

CREATE SEQUENCE test_seq Start with 1000001;
CREATE TABLE abc 
(val TEXT NOT NULL DEFAULT 'AAAA'||nextval('test_seq'::regclass)::TEXT, 
foo TEXT);

INSERT INTO abc (foo) VALUES ('qewSDADSAr');

select * from adc;
*/

insert into laboratorio values(01050301, 'ULAB', 'Administracion de laboratorios, Sartenejas',0.0);
insert into laboratorio values(01050303, 'Laboratorio A', 'Investigacion en Ingenieria Aplicada', 0.0);
insert into laboratorio values(01050304, 'Laboratorio B', 'Investigacion en Laboratorios de Biologia, Quimica y Polimeros',0.0);
insert into laboratorio values(01050305, 'Laboratorio C', 'Investigacion en Laboratorios de Electronica', 0.0);
insert into laboratorio values(01050306, 'Laboratorio D', 'Investigacion en Laboratorios de Fisica', 0.0);
insert into laboratorio values(01050307, 'Laboratorio E', 'Investigacion en Laboratorios de Materiales y Procesos de Fabricacion', 0.0);
insert into laboratorio values(01050308, 'Laboratorio F', 'Investigacion en Laboratorios de Tecnologia de la Informacion', 0.0);
insert into laboratorio values(01050309, 'Laboratorio G', 'Apoyo Interdiciplinario a la Investicagion', 0.0);
insert into usuario values('visit','123456');
insert into usuario values('admin','123456');
insert into usuario values('juanpe','123456');


/*
select nombre,monto from laboratorio
where exists
(select p.codigo_laboratorio, SUM(p.monto_asignado) monto 
from presupuesto p
where p.status = 1
group by p.codigo_laboratorio 
order by p.codigo_laboratorio
HAVE sum = 0);

*/