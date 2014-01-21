SET DATESTYLE TO 'European';
CREATE SEQUENCE codigo_seq Start with 100000;
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

insert into tipo_de_presupuesto values(default, 'FUNINDES', 'La Fundacion de Investigacion y Desarrollo', 1, '260000.00', '1/01/2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 1', 1, '250000.00', '30/09/2014');
insert into tipo_de_presupuesto values(default, 'Donacion', 'Donaciones a la Unidad de Laboratorios', 1, '400000.00', '7/10/2014');
insert into tipo_de_presupuesto values(default, 'Ordinario', 'Presupuesto Ordinario asignado', 1, '350000.00', '27/02/2014');
insert into tipo_de_presupuesto values(default, 'Ordinario', 'Presupuesto Delegado de la DII', 1, '170000.00', '23/04/2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 3', 1, '280000.00', '21/01/2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 2', 1, '135000.00', '18/11/2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 4', 1, '218000.00', '17/03/2014');
insert into tipo_de_presupuesto values('999', 'REFORMULACION', 'REFORMULACION', 0, '0.00', '01/01/2014');

insert into presupuesto values(default,100001,01050303,'120000',1);
insert into presupuesto values(default,100001,01050301,'120000',1);



