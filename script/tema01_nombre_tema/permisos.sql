-- PERMISOS A NIVEL DE USUARIOS
-- Crear el usuario para administrador
CREATE LOGIN AdminUser WITH PASSWORD = 'ContraseñaSegura1';
CREATE USER AdminUser FOR LOGIN AdminUser;

-- Crear el usuario para solo lectura
CREATE LOGIN ReadOnlyUser WITH PASSWORD = 'ContraseñaSegura2';
CREATE USER ReadOnlyUser FOR LOGIN ReadOnlyUser;

-- Asignar permisos de administrador (db_owner)
EXEC sp_addrolemember 'db_owner', 'AdminUser';
-- Asignar permisos de solo lectura en la tabla Producto
GRANT SELECT ON Producto TO ReadOnlyUser;

GO

IF OBJECT_ID('InsertarProducto', 'P') IS NOT NULL
    DROP PROCEDURE InsertarProducto;
GO

-- Crear un procedimiento almacenado de ejemplo para insertar productos
CREATE PROCEDURE InsertarProducto
    @Codigo VARCHAR(50),
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(255),
    @Stock INT,
    @Precio DECIMAL(10, 2),
    @Estado INT,
    @Categoria_id INT
AS
BEGIN
    INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id)
    VALUES (@Codigo, @Nombre, @Descripcion, @Stock, @Precio, @Estado, @Categoria_id);
END;

GRANT EXECUTE ON InsertarProducto TO ReadOnlyUser;

GO

Insert into Categoria (Nombre) values ('ejemplo');
go 

-- Realizar un INSERT directamente en la tabla como administrador
INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id)
VALUES ('P001', 'Producto A', 'Descripción del producto A', 100, 50.75, 1, 1);
Go

EXEC InsertarProducto 
    @Codigo = 'P002', 
    @Nombre = 'Producto B', 
    @Descripcion = 'Descripción del producto B', 
    @Stock = 200, 
    @Precio = 30.99, 
    @Estado = 1, 
    @Categoria_id = 1;
GO

-- Verificar los productos insertados
SELECT * FROM Producto;
-- Revocar permiso de SELECT sobre la tabla Producto
REVOKE SELECT ON Producto TO ReadOnlyUser;
-- Revocar permiso de ejecución sobre el procedimiento
REVOKE EXECUTE ON InsertarProducto TO ReadOnlyUser;
GO

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
