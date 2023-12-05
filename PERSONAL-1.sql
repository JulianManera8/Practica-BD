-- ejercicio practico @programacion tv practica de consultas

-- 1) generar base de datos personal
CREATE database personal;
use personal;

-- 2) generar las tablas de departamento y empleados
CREATE TABLE departamento (
	clave_depto int auto_increment,
    nombre_depto varchar(30) not null,
    presupuesto int,
    PRIMARY KEY (clave_depto)
);

CREATE TABLE empleados (
	clave_empleado varchar(8) not null,
    nombre varchar(30),
    apellidos varchar(30),
    fk_depto int not null,
    PRIMARY KEY (clave_empleado),
    FOREIGN KEY (fk_depto) REFERENCES departamento (clave_depto)
);

-- 3) insertar datos en las tablas

-- de la tabla departamento
INSERT INTO departamento (nombre, presupuesto) 
VALUES 
	('Personal', 80000),
    ('Almacen', 70000),
    ('Contabilidad',60000),
    ('Manufactura',50000),
    ('Empaque',30000);


-- de la tabla empleados
INSERT INTO empleados (clave_empleado, nombre, apellidos, fk_depto) 
VALUES
	('EMP01','Armando','Lopez',2),
    ('EMP02','Tatiana','Vargas',1),
    ('EMP03','Laura','Iturria',3),
    ('EMP04','Juan','Perez',4),
    ('EMP05','Ivan','Lopez',4),
    ('EMP06','Margarita','Hernandez',1),
    ('EMP07','Jesus','Perez',3),
    ('EMP08','Tonaluh','Flores',2),
    ('EMP09','Juan','Lopez',4),
    ('EMP10','Jose','Hernandez',5);
    
-- a) obtener nombre y apellido de los empleados
SELECT nombre, apellidos FROM empleados;

-- b) Obtener apellidos de empleados sin repeticiones
SELECT DISTINCT apellidos FROM empleados;

-- c) obtener todos los datos de los empleados que se apelliden Lopez
SELECT * FROM empleados WHERE apellidos = 'Lopez';

-- d)  obtener todos los datos de los empleados que se apelliden Lopez y Perez
SELECT * FROM empleados WHERE apellidos = 'Perez' OR apellidos = 'Lopez';

-- e) Obtener nombre y clave de los trabajadores q trabajan en depto 4
-- en la tabla depto, el PK es clave_depto = 4, en mi tabla empleados, tengo ese numero como FK en fk_depto, entonces lo saco desde ahi
SELECT clave_empleado, nombre FROM empleados WHERE fk_depto = 4;

-- f) todos los datos de los empleados que trabajan para depto 1 o 3 ordenados alfab por nombre
SELECT * FROM empleados WHERE fk_depto BETWEEN 1 AND 3 ORDER BY nombre ASC;

-- g) Nombre y apellido de los empleados cuyo apellido empieza con letra H
SELECT nombre, apellidos FROM empleados WHERE apellidos LIKE 'H%';

-- h) datos de deptos con presupuesto entre 50000 y 70000
SELECT * FROM departamento WHERE presupuesto BETWEEN 50000 AND 70000;

-- i) Obtener clave de empleado, nombre y apellido de los empleados del depto de contabilidad
SELECT clave_empleado, nombre, apellidos FROM empleados WHERE fk_depto = 3;

-- j) nombre y apellido y el nombre de depto de todos los empleados
-- nos toca HACER UN INNER JOIN con nombre apellido de empleados y nombre de depto

ALTER TABLE departamento CHANGE nombre nombre_depto varchar(30);

SELECT nombre, apellidos, nombre_depto FROM empleados INNER JOIN departamento ON empleados.fk_depto = departamento.clave_depto;
-- aca para hacer el JOIN entre las dos tablas, le pasamos donde hacen la conexion y es a traves de la FK
-- por eso ponemos INNER JOIN departamento ON empleados.fk_depto = departamento.clave_depto; ahi es donde se unen

