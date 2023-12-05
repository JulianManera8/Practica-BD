CREATE database tatomanera;
USE tatomanera;

CREATE TABLE hijos (
	id int,
    nombre varchar(255),
	estado varchar(255),
    PRIMARY KEY (id)
);

ALTER TABLE hijos MODIfY COLUMN id int auto_increment;

INSERT INTO hijos (nombre, estado) VALUES ('marcelo', 'feliz');
INSERT INTO hijos (nombre, estado) VALUES ('veronica', 'feliz');

DELETE from hijos WHERE id = 2;

UPDATE hijos SET estado = 'triste' WHERE id = 1;

CREATE TABLE nietos (
	id int auto_increment,
    nombre varchar(255),
	estado varchar(255),
    PRIMARY KEY (id)
);

INSERT INTO nietos (nombre, estado) VALUES ('julian', 'feliz');
INSERT INTO nietos (nombre, estado) VALUES ('matias', 'feliz');
INSERT INTO nietos (nombre, estado) VALUES ('manuel', 'feliz');

INSERT INTO hijos (nombre, estado) VALUES ('veronica', 'feliz');

SELECT * FROM hijos WHERE nombre = 'marcelo';

UPDATE hijos SET estado = 'feliz' WHERE id = 1;

UPDATE hijos SET id = 2 WHERE id = 3;

SELECT * FROM hijos;
SELECT * FROM nietos;

-- HASTA ACA PROBE YO HACIENDO MI PROPIA BASE DE DATOS DE tatomanera, ahora voy a hacer una que hace en el video para practicar junto con el

CREATE TABLE user (
	id int auto_increment,
    nombre varchar(255),
    edad int,
    mail varchar(255),
    PRIMARY KEY (id)
);

INSERT INTO user (nombre, edad, mail) VALUES ('julian','22','julianmanera@hotmail.com');
INSERT INTO user (nombre, edad, mail) VALUES ('matias','19','matiasmanera@hotmail.com');
INSERT INTO user (nombre, edad, mail) VALUES ('marcelo','56','mc.manera@gmail.com');
INSERT INTO user (nombre, edad, mail) VALUES ('carina','56','carinafossas@gmail.com');

-- PROBEMOS TODOS LOS TIPOS DE SELECT QUE VI EN EL CURSO

SELECT * FROM user; -- selecciona toda la columna
SELECT * FROM user WHERE id = 2; -- selecciona solo el que sea id 2
SELECT * FROM user WHERE edad = 56 AND nombre = 'marcelo'; -- selector and, solo trae los que cumplan LAS DOS CONDICIONES
SELECT * FROM user WHERE edad = 89 OR nombre = 'julian'; -- selector OR, trae los que cumplan AL MENOS UNA de las dos condiciones
SELECT * FROM user WHERE edad > 19; -- selector mayor que... , trae a todos menos a matias
SELECT * FROM user WHERE edad < 22; -- selector menor que... , trae solo a matias
SELECT * FROM user WHERE edad >= 19; -- selector mayor/menor igual que... , trae a todos
SELECT * FROM user WHERE edad = 56 LIMIT 1; -- selector con LIMIT hace que solo retorne una cantidad especifica (1 en este caso) de filas
SELECT * FROM user WHERE edad BETWEEN 15 AND 30; -- selecciona los elementos que esten dentro de 15 y 30, matias y yo
SELECT * FROM user WHERE edad != 22; -- selecciona todos menos los de 22
SELECT * FROM user WHERE mail LIKE '%gmail%'; -- selecciona todos los que en la columna mail tengan en algun lado gmail, solo papa y mama
SELECT * FROM user WHERE mail LIKE '%gmail'; -- selecciona los que terminen si o si con gmail, pero pueden empezar cualquier cosa
SELECT * FROM user WHERE mail LIKE 'gmail%'; -- selecciona los que empiecen si o si con gmail, pero pueden terminar con cualquier cosa
SELECT * FROM user ORDER BY edad ASC; -- me los ordena s/edad en orden ascendiente, de menor a mayor
SELECT * FROM user ORDER BY edad DESC; -- me los ordena s/edad en orden descendiente, de mayor a menor
SELECT max(edad) AS mayor FROM user; -- me selecciona solo el elemento que tenga mayor edad
SELECT min(edad) AS menor FROM user; -- me  selecciona solo el elemento que tenga menor edad
SELECT id, nombre FROM user; -- me selecciona solo las columnas de una determinada tabla, no todas
SELECT id, nombre AS name FROM user; -- me selecciona igual que la de arriba pero con el nombre AS name, cambio el nombre de esa columna

-- arrancamos a probar lo de joins y claves foraneas

use tatomanera;

CREATE TABLE productos (
	id int auto_increment,
    nombre varchar(50),
    created_by int,
    marca varchar(50),
    primary key (id),
    foreign key (created_by) references user (id)
);

RENAME TABLE productos TO producto;


INSERT INTO producto (nombre, created_by, marca) 
VALUES
	('macmini',1,'apple'),
    ('bicicleta',2,'venzo'),
    ('auriculares',1,'jbl'),
    ('iphone',3,'apple'),
    ('iphone',3,'apple'),
    ('navaja',3,'leatherman'),
    ('cubo',3,'qiyi');
    
SELECT * FROM producto;

-- LEFT JOIN nos trae los elementos que crearon cada usuario y su id, si no tienen id asociado en producto no trae nd como carina
SELECT u.id, u.nombre, p.nombre as nombreprod FROM user u LEFT JOIN producto p ON u.id = p.created_by;

-- RIGHT JOIN nos trae los elementos que crearon cada usuario y su id, si no tienen id asociado en producto NO TRAE NINGUN USER, lo principal es el prodcuto 
SELECT u.id, u.nombre, p.nombre as nombreprod FROM user u RIGHT JOIN producto p ON u.id = p.created_by;

-- INNER JOIN nos trae todos los productos REGISTRADOS Y ASOCIADOS al id de user, si hubiese alguno no asociado a un id de user, no lo trae
SELECT u.id, u.nombre, p.nombre as nombreprod FROM user u INNER JOIN producto p ON u.id = p.created_by;


-- GROUP BY en este caso nos da cuantos id tenemos asociado con cada marca, con apple tenemos 3 que son los dos iphone y el macmini
SELECT count(id), marca FROM producto GROUP BY marca;

-- podemos agrupar tmb haciendo una left/right join
-- en este caso, nos cuenta la cantidad de veces que las personas agregaron productos, nos lo muestra por su id y por su nombre
SELECT count(p.id), u.nombre FROM producto p LEFT JOIN user u on u.id = p.created_by GROUP BY p.created_by HAVING count(p.id) >= 2;

-- DROP TABLES borrar tablas
DROP TABLE producto;
DROP TABLE user;





