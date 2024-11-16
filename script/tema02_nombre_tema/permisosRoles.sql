-- PERMISOS A NIVEL DE ROLES DE DBMS


-- Crear el login y usuario para Usuario3 (que tendrá permiso sobre el rol)
CREATE LOGIN Usuario3 WITH PASSWORD = 'ContraseñaSegura3';
CREATE USER Usuario3 FOR LOGIN Usuario3;

-- Crear el login y usuario para Usuario4 (que no tendrá permiso sobre el rol)
CREATE LOGIN Usuario4 WITH PASSWORD = 'ContraseñaSegura4';
CREATE USER Usuario4 FOR LOGIN Usuario4;

-- Crear el rol de solo lectura
CREATE ROLE RolLectura;

-- Otorgar permisos de SELECT sobre la tabla Producto al rol
GRANT SELECT ON Producto TO RolLectura;

-- Asignar el rol al usuario con permisos
EXEC sp_addrolemember 'RolLectura', 'Usuario3';

-- Verificar el comportamiento de ambos usuarios

-- Comportamiento de UsuarioConPermisos
EXECUTE AS USER = 'Usuario3';
SELECT * FROM Producto;
REVERT;

-- Comportamiento de UsuarioSinPermisos
EXECUTE AS USER = 'Usuario4';
SELECT * FROM Producto;
REVERT;
