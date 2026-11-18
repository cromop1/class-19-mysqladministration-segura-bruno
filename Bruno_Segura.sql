-- clase 19 - administracion basica de usuarios en mysql
-- bruno segura
-- trabajar con sakila y ejecutar cada parte con el usuario indicado
-- no ejecutar todo junto porque hay que cambiar de conexion

-- 1 crear el usuario desde root
CREATE USER IF NOT EXISTS 'data_analyst'@'localhost'
IDENTIFIED BY 'Bd2_2026_prueba!';

-- 2 darle permisos de lectura, modificacion y borrado sobre sakila
GRANT SELECT, UPDATE, DELETE ON sakila.*
TO 'data_analyst'@'localhost';

SHOW GRANTS FOR 'data_analyst'@'localhost';

-- 3 entrar con data_analyst e intentar crear una tabla
USE sakila;

CREATE TABLE prueba_permisos (
    id INT PRIMARY KEY,
    descripcion VARCHAR(50)
);

-- deberia aparecer el error 1142 porque no le dimos el permiso create

-- 4 seguir con data_analyst y cambiar el titulo de una pelicula
UPDATE film
SET title = 'ACADEMY DINOSAUR - EDITADA'
WHERE film_id = 1;

SELECT film_id, title
FROM film
WHERE film_id = 1;

-- 5 volver a root y quitarle el permiso update
REVOKE UPDATE ON sakila.*
FROM 'data_analyst'@'localhost';

SHOW GRANTS FOR 'data_analyst'@'localhost';

-- 6 cerrar la conexion anterior y entrar otra vez con data_analyst
USE sakila;

UPDATE film
SET title = 'ACADEMY DINOSAUR - EDITADA OTRA VEZ'
WHERE film_id = 1;

-- ahora deberia aparecer el error 1142 porque ya no tiene update
