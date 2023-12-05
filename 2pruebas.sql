-- 2 practica de mysql, de la pag https://parzbye.me/blog/2018/02/16/ejercicios-resueltos-consultas-sql-mysql/

CREATE database 2pruebas;
use 2pruebas;

CREATE TABLE tblUsuarios (
	idx INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(20),
    nombre VARCHAR(20),
    sexo VARCHAR(1),
    nivel TINYINT,
	email VARCHAR(50),
    telefono VARCHAR(20),
    marca VARCHAR(20),
    compania VARCHAR(20),
	saldo FLOAT,
	activo BOOLEAN
);

INSERT INTO tblUsuarios (idx, usuario, nombre, sexo, nivel, email, telefono, marca, compania, saldo, activo) 
VALUES 
('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','SAMSUNG','IUSACELL','100','1'),
('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG','TELCEL','0','1'),
('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','NOKIA','MOVISTAR','150','1'),
('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','SAMSUNG','TELCEL','50','1'),
('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','NOKIA','IUSACELL','50','0'),
('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','SONY','UNEFON','100','1'),
('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACKBERRY','AXEL','0','1'),
('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG','IUSACELL','50','1'),
('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG','UNEFON','100','1'),
('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','SAMSUNG','TELCEL','500','1'),
('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','SONY','UNEFON','100','0'),
('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOTOROLA','IUSACELL','150','1'),
('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACKBERRY','AT&T','50','0'),
('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOTOROLA','NEXTEL','150','1'),
('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACKBERRY','IUSACELL','0','1'),
('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','SAMSUNG','AXEL','0','0'),
('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOTOROLA','MOVISTAR','500','1'),
('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','SONY','IUSACELL','200','1'),
('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACKBERRY','UNEFON','100','1'),
('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','SONY','UNEFON','150','1'),
('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOTOROLA','AT&T','500','1');

SELECT * FROM tblUsuarios;

-- 1) listar nombre de los usuarios
SELECT nombre FROM tblUsuarios;

-- 2) Calcular saldo maximo de los usuarios de sexo mujer
SELECT max(saldo) FROM tblUsuarios WHERE sexo = 'M'; 

-- 3) Listar nombre y telefono de usuarios con telefono nokia, bb o sony
SELECT nombre, telefono FROM tblUsuarios WHERE marca IN('NOKIA','BLACKBERRY','SONY');

-- 4) contar los usuarios sin saldo o inactivos
SELECT count(idx) FROM tblUsuarios WHERE saldo = 0 OR activo = 0;

-- 5) listar el login de los usuarios (que usuarios se conectaron) con nivel 1, 2 o 3
SELECT usuario FROM tblUsuarios WHERE nivel IN(1, 2, 3);

-- 6) Listar los numeros de telefono con saldo menor o igual a 300
SELECT telefono FROM tblUsuarios WHERE saldo <= '300';

-- 7) calcular la suma de los saldos de los usuarios de la compania telefonica NEXTEL
SELECT SUM(saldo) FROM tblUsuarios WHERE compania = 'NEXTEL';

-- 8) contar el numero de usuarios por compania d telefono
-- hago un conteo de los id E invoco la compania de la tabla tblusuarios y los agrupo por compania de telefono
SELECT count(idx), compania FROM tblUsuarios GROUP BY compania;

-- 9) contar el numero de usuarios por nivel y agruparlo segun nivel de mayor nivel a menor
SELECT count(idx), nivel FROM tblUsuarios GROUP BY nivel ORDER BY nivel DESC;

-- 10) listar el login (que usuarios se conectaron) de los usuarios con nivel 2
SELECT usuario FROM tblUsuarios WHERE nivel = 2;

-- 11) mostrar el email de los usuarios que usan gmail
SELECT email FROM tblUsuarios WHERE email LIKE '%gmail%';

-- 12) listar nombre y telefono de los usuarios con telefono LG SAMSUNG O MOTOROLA
SELECT nombre, telefono FROM tblUsuarios WHERE marca IN('LG', 'SAMSUNG', 'MOTOROLA');




-- BLOQUE 2

-- 1) Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG
SELECT nombre, telefono FROM tblUsuarios WHERE marca != 'LG' OR marca != 'SAMSUNG';


-- 2) Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL
SELECT usuario, telefono FROM tblUsuarios WHERE compañia = 'IUSACELL';


-- 3) Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL
SELECT usuario, telefono FROM tblUsuarios WHERE compañia != 'TELCEL';


-- 4) Calcular el saldo promedio de los usuarios que tienen teléfono marca NOKIA
SELECT AVG(saldo) FROM tblUsuarios WHERE marca = 'NOKIA';


-- 5) Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o AXEL
SELECT usuario, telefono FROM tblUsuarios WHERE compañia IN('IUSACELL', 'AXEL');


-- 6) Mostrar el email de los usuarios que no usan yahoo
SELECT email FROM tblUsuarios WHERE email NOT LIKE '%yahoo%';


-- 7)Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL o IUSACELL
SELECT usuario, telefono FROM tblUsuarios WHERE compañia NOT IN('IUSACELL', 'TELCEL');


-- 8)Listar el login y teléfono de los usuarios con compañia telefónica UNEFON
SELECT usuario, telefono FROM tblUsuarios WHERE compañia = 'UNEFON';


-- 9)Listar las diferentes marcas de celular en orden alfabético descendentemente
SELECT DISTINCT marca FROM tblUsuarios ORDER BY marca ASC;


-- 10) Listar el login de los usuarios con nivel 0 o 2
SELECT usuario FROM tblUsuarios WHERE nivel IN('0','2');


-- 11) Calcular el saldo promedio de los usuarios que tienen teléfono marca LG
SELECT AVG(saldo) FROM tblUsuarios WHERE marca = 'LG';




-- BLOQUE 3

-- 1) Listar el login de los usuarios con nivel 1 o 3
SELECT usuario FROM tblUsuarios WHERE nivel IN('1', '3');

-- 2) Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACKBERRY
SELECT nombre, telefono FROM tblUsuarios WHERE marca != 'BLACKBERRY';

-- 3) Listar el login de los usuarios con nivel 3
SELECT usuario FROM tblUsuarios WHERE nivel = 3;

-- 4) Listar el login de los usuarios con nivel 0
SELECT usuario FROM tblUsuarios WHERE nivel = 0;


-- 5) Listar el login de los usuarios con nivel 1
SELECT usuario FROM tblUsuarios WHERE nivel = 1;


-- 6) Contar el número de usuarios por sexo
SELECT count(idx), sexo FROM tblUsuarios GROUP BY sexo;


-- 7) Listar el login y teléfono de los usuarios con compañia telefónica AT&T
SELECT usuario, telefono FROM tblUsuarios WHERE compañia = 'AT&T';

-- 8) Listar las diferentes compañias en orden alfabético descendentemente
SELECT DISTINCT compañia FROM tblUsuarios ORDER BY compañia ASC;

-- 9) Listar el login de los usuarios inactivos
SELECT usuario FROM tblUsuarios WHERE activo = '0';

-- 10) Listar los números de teléfono sin saldo
SELECT telefono FROM tblUsuarios WHERE saldo = 0;

-- 11) Calcular el saldo mínimo de los usuarios de sexo “Hombre”
SELECT MIN(saldo) FROM tblUsuarios WHERE sexo = 'H';

-- 12) Listar los números de teléfono con saldo mayor a 300
SELECT telefono, saldo FROM tblUsuarios WHERE saldo > 300;




-- BLOQUE 4

-- 1) Contar el número de usuarios por marca de teléfono


-- 2) Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG


-- 3) Listar las diferentes compañias en orden alfabético ascendentemente


-- 4) Calcular la suma de los saldos de los usuarios de la compañia telefónica UNEFON


-- 5) Mostrar el email de los usuarios que usan hotmail


-- 6) Listar los nombres de los usuarios sin saldo o inactivos


-- 7) Listar el login y teléfono de los usuarios con compañia telefónicaIUSACELL o TELCEL


-- 8) Listar las diferentes marcas de celular en orden alfabético ascendentemente


-- 9) Listar las diferentes marcas de celular en orden alfabético aleatorio


-- 10)Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o UNEFON


-- 11) Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca MOTOROLA o NOKIA


-- 12) Calcular la suma de los saldos de los usuarios de la compañia telefónica TELCEL

