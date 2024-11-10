--Se crea un procedimiento almacenado para insertar nuevos productos.
CREATE USER Administrador WITH PASSWORD = 'password123';
CREATE USER Vendedor WITH PASSWORD = 'password456';

-- Asignar permisos al usuario administrador
GRANT ALL ON SistemaCompras_Proyecto_BdD.* TO Administrador;

-- Asignar permisos al usuario Vendedor
GRANT SELECT ON SistemaCompras_Proyecto_BdD.Productos TO Vendedor;
GRANT EXECUTE ON SistemaCompras_Proyecto_BdD./*procedimento*/ TO Vendedor;

-- Intentar insertar un producto directamente con ambos usuarios
-- Conectarse como usuarioAdministrador
USE SistemaCompras_Proyecto_BdD;
GO
EXECUTE AS USER = 'Administrador';
/*Ejecutar procedimiento como administrador*/
REVERT; /*revert finaliza la sentencia de execute para que no se ejecuten mas comandos como el determinado usuario*/

-- Conectarse como Vendedor
USE tienda;
GO
EXECUTE AS USER = 'Vendedor';
INSERT INTO Productos (Nombre, Precio) VALUES ('Otro Producto', 29.99);
REVERT;

-- Intentar insertar un producto usando el procedimiento almacenado con el usuario lector
USE tienda;
GO
EXECUTE AS USER = 'vendedor';
/*Ejecutar procedimiento como vendedor*/
REVERT;
