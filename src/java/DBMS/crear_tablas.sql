drop table PRESUPUESTO;
drop table CHEQUE_OG;
drop table ORDEN_GASTO;
drop table CHEQUE;
create table PRESUPUESTO 
    (codigo int unique CHECK (codigo > 0), 
    tipo varchar(50), 
    descripcion varchar(50), 
    status int NOT NULL CHECK  (status in (0,1)), 
    CONSTRAINT PK_PRESUPUESTO PRIMARY KEY (codigo,tipo));

create table CHEQUE 
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
create table ORDEN_GASTO 
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


