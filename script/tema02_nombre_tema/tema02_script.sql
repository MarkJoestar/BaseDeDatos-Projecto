--Se crea un procedimiento almacenado para insertar nuevos productos.
CREATE USER usuarioAdministrador WITH PASSWORD = 'password123';
CREATE USER usuarioVisitante WITH PASSWORD = 'password456';

-- Asignar permisos al usuario administrador
GRANT ALL ON SistemaCompras_Proyecto_BdD.* TO usuarioAdministrador;

-- Asignar permisos al usuario visitante
GRANT SELECT ON SistemaCompras_Proyecto_BdD.Productos TO usuarioVisitante;
GRANT EXECUTE ON SistemaCompras_Proyecto_BdD.sp_InsertarProducto TO usuarioVisitante;

-- Intentar insertar un producto directamente con ambos usuarios
-- Conectarse como usuarioAdministrador
USE SistemaCompras_Proyecto_BdD;
GO
EXECUTE AS USER = 'usuarioAdministrador';
INSERT INTO Productos (Nombre, Precio) VALUES ('Producto Nuevo', 19.99);
REVERT;

-- Conectarse como usuarioLector
USE tienda;
GO
EXECUTE AS USER = 'usuarioLector';
INSERT INTO Productos (Nombre, Precio) VALUES ('Otro Producto', 29.99);
REVERT;

-- Intentar insertar un producto usando el procedimiento almacenado con el usuario lector
USE tienda;
GO
EXECUTE AS USER = 'usuarioLector';
EXEC sp_InsertarProducto 'Producto desde procedimiento', 9.99;
REVERT;
