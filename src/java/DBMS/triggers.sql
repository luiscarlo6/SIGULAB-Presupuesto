CREATE OR REPLACE TRIGGER UpdateTipoDePresupuesto
BEFORE INSERT on PRESUPUESTO
FOR EACH ROW
DECLARE
	v_codigo_TDP NUMBER(10);
	v_codigo_lab NUMBER(10);
	v_monto_presupuesto VARCHAR(25);
	v_monto_tdp FLOAT;
	v_fin DATE;

	montoExcedido EXCEPTION;
BEGIN
	v_codigo_TDP := :new.codigo_TDP;
	v_codigo_lab := :new.codigo_laboratorio;
        v_monto_presupuesto := :new.monto_asignado;

	SELECT tdp.monto INTO v_monto_TDP
	FROM TIPO_DE_PRESUPUESTO tdp
	WHERE tdp.codigo = v_codigo_TDP;

--> v_monto_tdp monto que tiene el tipo de presupuesto que hace referencia al presupuesto que se agrega

	IF (v_monto_TDP <= v_monto_presupuesto) THEN
            UPDATE TIPO_DE_PRESUPUESTO SET monto = v_monto_presupuesto - v_monto_TDP where codigo_TDP= v_codigo_TDP;
        ELSE
            raise montoExcedido
        END IF;	
    EXCEPTION
	WHEN montoExcedido THEN
	      raise_application_error (-20300, 'monto excedido');
END UpdateTipoDePresupuesto;
/