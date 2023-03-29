#2.1. Obtener los apellidos de los empleados
SELECT APELLIDOS FROM empleados;

# 2.2. Obtener los apellidos de los empleados sin repeticiones
SELECT DISTINCT APELLIDOS FROM empleados;

# 2.3. Obtener todos los datos de los empleados que se apellidan 'López'
SELECT * FROM empleados WHERE APELLIDOS = 'López';

# 2.4. Obtener todos los datos de los empleados que se apellidan 'López' ó 'Pérez'
SELECT *
FROM empleados
WHERE APELLIDOS = 'López' OR APELLIDOS = 'Pérez';

# 2.5. Obtener todos los datos de los empleados que trabajan para el departamento 14
SELECT * FROM empleados WHERE DEPARTAMENTO = 14;

# 2.6. Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77
/* Con OR */
SELECT *
FROM empleados
WHERE DEPARTAMENTO = 37 OR DEPARTAMENTO = 77;

# 2.7. Obtener todos los datos de los empleados cuyo apellido comience por 'P'
SELECT * FROM empleados WHERE APELLIDOS LIKE 'P%';

# 2.8. Obtener el presupuesto total de todos los departamentos
SELECT SUM(PRESUPUESTO) FROM departamentos;

# 2.9. Obtener el número de empleados en cada departamento
SELECT DEPARTAMENTO, COUNT(*)
FROM empleados
GROUP BY DEPARTAMENTO;

# 2.10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento
SELECT *
FROM empleados, departamentos
WHERE empleados.DEPARTAMENTO = departamentos.CODIGO;

# 2.11. Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento
SELECT E.NOMBRE, APELLIDOS, D.NOMBRE, PRESUPUESTO
FROM empleados E, departamentos D
WHERE E.DEPARTAMENTO = D.CODIGO;

# 2.12. Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €
SELECT empleados.NOMBRE, APELLIDOS
FROM empleados, departamentos
WHERE empleados.DEPARTAMENTO = departamentos.CODIGO
AND departamentos.PRESUPUESTO > 60000;

# 2.13. Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos
SELECT *
FROM departamentos
WHERE PRESUPUESTO > (SELECT AVG(PRESUPUESTO) FROM departamentos);

# 2.14. Obtener los nombres (únicamente los nombres) de los departamentos que tienen más de dos empleados
SELECT NOMBRE
FROM departamentos
WHERE CODIGO IN (
	SELECT DEPARTAMENTO
	FROM empleados
	GROUP BY DEPARTAMENTO
	HAVING COUNT(*) > 2 );
    
# 2.15. Añadir un nuevo departamento: 'Calidad', con presupuesto de 40.000 € y código 11. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI: 89267109
INSERT INTO departamentos
VALUES ( 11 , 'Calidad' , 40000);
INSERT INTO empleados
VALUES ('89267109', 'Esther', 'Vázquez', 11);

# 2.16. Aplicar un recorte presupuestario del 10 % a todos los departamentos
UPDATE departamentos SET PRESUPUESTO = PRESUPUESTO * 0.9;

# 2.17. Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14)
UPDATE empleados SET DEPARTAMENTO = 14 WHERE DEPARTAMENTO = 77;

# 2.18. Despedir a todos los empleados que trabajan para el departamento de informática a (código 14)
DELETE FROM empleados WHERE DEPARTAMENTO = 14;

# 2.19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €
DELETE FROM empleados
WHERE DEPARTAMENTO IN (SELECT CODIGO FROM departamentos WHERE PRESUPUESTO >= 60000);

# 2.20. Despedir a todos los empleados
DELETE FROM empleados;
