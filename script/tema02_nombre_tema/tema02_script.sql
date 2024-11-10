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
/*Ejecutar procedimiento como administrador*/
REVERT;

-- Conectarse como usuarioVisitante
USE tienda;
GO
EXECUTE AS USER = 'usuarioVisitante';
INSERT INTO Productos (Nombre, Precio) VALUES ('Otro Producto', 29.99);
REVERT;

-- Intentar insertar un producto usando el procedimiento almacenado con el usuario lector
USE tienda;
GO
EXECUTE AS USER = 'usuarioVisitante';
/*Ejecutar procedimiento como visitante*/
REVERT;
