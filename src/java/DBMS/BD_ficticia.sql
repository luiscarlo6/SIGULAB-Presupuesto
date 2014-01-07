/* eejemplo para el auto generado
insert into tipo_de_presupuesto(tipo, descripcion, status, monto, dia, mes, ano) values('FUNINDES', 'La Fundación de Investigación y Desarrollo', 1, '260000.00', '1','ENERO','2014');*/

insert into tipo_de_presupuesto values(default, 'FUNINDES', 'La Fundación de Investigación y Desarrollo', 1, '260000.00', '1','ENERO','2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 1', 1, '250000.00', '30','SEPTIEMBRE','2014');
insert into tipo_de_presupuesto values(default, 'Donacion', 'Donaciones a la Unidad de Laboratorios', 1, '400000.00', '7','OCTUBRE','2014');
insert into tipo_de_presupuesto values(default, 'Ordinario', 'Presupuesto Ordinario asignado', 1, '350000.00', '27','FEBRERO','2014');
insert into tipo_de_presupuesto values(default, 'Ordinario', 'Presupuesto Delegado de la DII', 1, '170000.00', '23','ABRIL','2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 3', 1, '280000.00', '21','ENERO','2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 2', 1, '135000.00', '18','NOVIEMBRE','2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 4', 1, '218000.00', '17','MARZO','2014');


insert into laboratorio values(01050301, 'ULAB', 'Administracion de laboratorios, Sartenejas',0.0);
insert into laboratorio values(01050303, 'Laboratorio A', 'Investigacion en Ingenieria Aplicada', 0.0);
insert into laboratorio values(01050304, 'Laboratorio B', 'Investigacion en Laboratorios de Biologia, Quimica y Polimeros',0.0);
insert into laboratorio values(01050305, 'Laboratorio C', 'Investigacion en Laboratorios de Electronica', 0.0);
insert into laboratorio values(01050306, 'Laboratorio D', 'Investigacion en Laboratorios de Fisica', 0.0);
insert into laboratorio values(01050307, 'Laboratorio E', 'Investigacion en Laboratorios de Materiales y Procesos de Fabricacion', 0.0);
insert into laboratorio values(01050308, 'Laboratorio F', 'Investigacion en Laboratorios de Tecnologia de la Informacion', 0.0);
insert into laboratorio values(01050309, 'Laboratorio G', 'Apoyo Interdiciplinario a la Investicagion', 0.0);

insert into presupuesto values(default,100001,01050303,'120000',1);
insert into presupuesto values(default,100001,01050301,'120000',1);

insert into usuario values('visit','123456');
insert into usuario values('admin','123456');
insert into usuario values('juanpe','123456');

/*select * from presupuesto;

select distinct lab.codigo_laboratorio, lab.nombre, SUM(p.monto_asignado) as "Monto total asignado"
from laboratorio lab, Presupuesto p 
where lab.codigo_laboratorio = p.codigo_laboratorio 
group by lab.codigo_laboratorio 
order by lab.codigo_laboratorio;


select count(p)
from (SELECT distinct tdp.codigo_laboratorio FROM PRESUPUESTO tdp WHERE tdp.codigo_TDP = 100001 and tdp.status = 1) p;

SELECT * 
FROM LABORATORIO 
WHERE codigo_laboratorio NOT IN (SELECT distinct tdp.codigo_laboratorio 
    FROM PRESUPUESTO tdp 
    WHERE tdp.codigo_TDP = 100001 and tdp.status = 1) 
ORDER BY CODIGO_LABORATORIO;
*/

