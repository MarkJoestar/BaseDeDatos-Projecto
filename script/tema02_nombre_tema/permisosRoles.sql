-- Crear los usuarios
CREATE USER usuario1 WITH PASSWORD = '1234';
CREATE USER usuario2 WITH PASSWORD = '5678';

-- Crear el rol Lector
CREATE ROLE Lector;
GRANT SELECT ON /*precedimiento*/ TO Rol1;

-- Asignar el rol al usuario1
GRANT Rol1 TO usuario1;

-- Intentar leer la tabla Libros desde ambos usuarios
-- Conectarse como usuario1
USE SistemaCompras_Proyecto_BdD;
GO
EXECUTE AS USER = 'usuario1';
/*precedimiento*/;
REVERT;

-- Conectarse como usuario2
USE SistemaCompras_Proyecto_BdD;
GO
EXECUTE AS USER = 'usuario2';
/*precedimiento*/;
REVERT;
