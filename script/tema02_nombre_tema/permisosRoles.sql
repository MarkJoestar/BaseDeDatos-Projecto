-- Crear los usuarios
CREATE USER usuario1 WITH PASSWORD = 'password123';
CREATE USER usuario2 WITH PASSWORD = 'password456';

-- Crear el rol Lector
CREATE ROLE Lector;
GRANT SELECT ON Libros TO Lector;

-- Asignar el rol al usuario1
GRANT Lector TO usuario1;

-- Intentar leer la tabla Libros desde ambos usuarios
-- Conectarse como usuario1
USE libreria;
GO
EXECUTE AS USER = 'usuario1';
SELECT * FROM Libros;
REVERT;

-- Conectarse como usuario2
USE libreria;
GO
EXECUTE AS USER = 'usuario2';
SELECT * FROM Libros;
REVERT;
