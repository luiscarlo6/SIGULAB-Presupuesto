/* eejemplo para el auto generado
insert into tipo_de_presupuesto(tipo, descripcion, status, monto, dia, mes, ano) values('FUNINDES', 'La Fundación de Investigación y Desarrollo', 1, '260000.00', '1','ENERO','2014');*/

insert into tipo_de_presupuesto values(default, 'FUNINDES', 'La Fundación de Investigación y Desarrollo', 1, '260000.00', '1/01/2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 1', 1, '250000.00', '30/09/2014');
insert into tipo_de_presupuesto values(default, 'Donacion', 'Donaciones a la Unidad de Laboratorios', 1, '400000.00', '7/10/2014');
insert into tipo_de_presupuesto values(default, 'Ordinario', 'Presupuesto Ordinario asignado', 1, '350000.00', '27/02/2014');
insert into tipo_de_presupuesto values(default, 'Ordinario', 'Presupuesto Delegado de la DII', 1, '170000.00', '23/04/2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 3', 1, '280000.00', '21/01/2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 2', 1, '135000.00', '18/11/2014');
insert into tipo_de_presupuesto values(default, 'FONACIT', 'Presupuesto para Proyecto 4', 1, '218000.00', '17/03/2014');


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


select distinct t1.* from tipo_de_presupuesto t1 order by t1.tipo;


(select distinct lab.codigo_laboratorio as codigo_lab, lab.nombre as nombre, SUM(p.monto_asignado) as monto
from laboratorio lab, Presupuesto p, Tipo_de_Presupuesto tdp
where lab.codigo_laboratorio = p.codigo_laboratorio and p.status = 1 and tdp.codigo = p.codigo_tdp
group by lab.codigo_laboratorio
order by lab.codigo_laboratorio)
UNION
(Select codigo_laboratorio, nombre, monto 
from laboratorio
where (codigo_laboratorio,nombre) NOT IN (select distinct lab.codigo_laboratorio as codigo_lab, lab.nombre as nombre
        from laboratorio lab, Presupuesto p
        where lab.codigo_laboratorio = p.codigo_laboratorio and p.status = 1
        group by lab.codigo_laboratorio
        order by lab.codigo_laboratorio))
order by codigo_lab;


*/

