
insert into tipo_de_presupuesto values(100001, 'FUNINDES', 'La Fundación de Investigación y Desarrollo', 1, '150000.00', '1','ENERO','2014');
insert into tipo_de_presupuesto values(100002, 'FONACIT', 'Presupuesto para Proyecto 1', 1, '150000.00', '30','SEPTIEMBRE','2014');
insert into tipo_de_presupuesto values(100003, 'Donacion', 'Donaciones a la Unidad de Laboratorios', 1, '150000.00', '7','OCTUBRE','2014');
insert into tipo_de_presupuesto values(100004, 'Ordinario', 'Presupuesto Ordinario asignado', 1, '150000.00', '27','FEBRERO','2014');
insert into tipo_de_presupuesto values(100005, 'Ordinario', 'Presupuesto Delegado de la DII', 1, '150000.00', '23','ABRIL','2014');
insert into tipo_de_presupuesto values(100006, 'FONACIT', 'Presupuesto para Proyecto 3', 1, '150000.00', '21','ENERO','2014');
insert into tipo_de_presupuesto values(100007, 'FONACIT', 'Presupuesto para Proyecto 2', 1, '150000.00', '18','NOVIEMBRE','2014');
insert into tipo_de_presupuesto values(100008, 'FONACIT', 'Presupuesto para Proyecto 4', 1, '150000.00', '17','MARZO','2014');

insert into laboratorio values(50000000, 'ULAB');
insert into laboratorio values(50000001, 'Laboratorio A');
insert into laboratorio values(50000002, 'Laboratorio B');
insert into laboratorio values(50000003, 'Laboratorio C');
insert into laboratorio values(50000004, 'Laboratorio D');
insert into laboratorio values(50000005, 'Laboratorio E');
insert into laboratorio values(50000006, 'Laboratorio F');
insert into laboratorio values(50000007, 'Laboratorio G');


insert into presupuesto values(100001,50000001,'20000');
insert into presupuesto values(100002,50000001,'50000');

insert into presupuesto values(100003,50000002,'50000');
insert into presupuesto values(100004,50000002,'80000');

insert into presupuesto values(100001,50000003,'10000');
insert into presupuesto values(100003,50000003,'40000');

insert into presupuesto values(100004,50000004,'70000');
insert into presupuesto values(100002,50000004,'60000');

insert into presupuesto values(100006,50000005,'20000');
insert into presupuesto values(100005,50000005,'20000');

insert into presupuesto values(100007,50000006,'10000');
insert into presupuesto values(100005,50000006,'10000');

insert into presupuesto values(100008,50000007,'20000');
insert into presupuesto values(100002,50000007,'60000');

insert into presupuesto values(100001,50000000,'80000');
insert into presupuesto values(100007,50000000,'100000');

select * from presupuesto;


select distinct lab.codigo_laboratorio, lab.nombre, SUM(p.monto_asignado) as "Monto total asignado"
from laboratorio lab, Presupuesto p 
where lab.codigo_laboratorio = p.codigo_laboratorio 
group by lab.codigo_laboratorio 
order by lab.codigo_laboratorio;


