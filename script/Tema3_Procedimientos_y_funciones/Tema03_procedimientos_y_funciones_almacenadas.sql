--AGREGAR
CREATE PROCEDURE InsertarProducto
    @IdProducto
    @Codigo VARCHAR(50),
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(255),
    @Stock INT,
    @Precio DECIMAL(10,2)
    @Estado INT,
    @Categoria_id INT
AS
BEGIN
    INSERT INTO Producto (Id_Producto, Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id)
    VALUES (@IdProducto, @Codigo, @Nombre, @Descripcion, @Stock, @Precio, @Estado, @Categoria_id);
END

--EJEMPLO
    EXECUTE Insertar Producto 1, 'c44', 'Arroz Danubio', 'Arroz Marca Danubio De 500grs', 45, 1500.00, 1, 4;
  
--MODIFICAR
--Agregar cantidad a un producto
CREATE PROCEDURE AgregarCantidadProducto
--Parámetros
@IdProducto as int,
@Cantidad as int
AS
--Actualiza Cantidad
UPDATE Producto set Stock=Stock+@Cantidad
--Indicar a qué producto se le agrega cantidad
Where Id_Producto=@IdProducto

--VERIFICACIÓN
--EXECUTE AgregarCantidadProducto 12, 5

--Quitar cantidad a un producto
CREATE PROCEDURE QuitarCantidadProducto
--Parámetros
@IdProducto as int,
@Cantidad as int
AS
--Actualiza Cantidad
UPDATE Producto set Stock=Stock-@Cantidad
--Indicar a qué producto se le quita cantidad
Where Id_Producto=@IdProducto

    
--ELIMINAR PRODUCTO
CREATE PROCEDURE EliminarProducto
@IdProducto Int
AS
BEGIN
    DELETE FROM Producto
    WHERE Id_Producto = @IdProducto;
END


--EJEMPLO
EXECUTE EliminarProducto 1;


--Insertar un lote de datos en las tablas mencionadas  (guardar el script) con sentencias insert y otro lote invocando a los procedimientos creados. 

INSERT INTO Producto (Id_Producto, Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES (1, 'A04', 'Lata Durazno', 'Durazno Enlatado', 49, 2430.00, 1, 3)
INSERT INTO Producto (Id_Producto, Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES (2, 'B44', 'Azucar AG', 'Azucar de un kilogramo', 459, 2000.00, 1, 3)
INSERT INTO Producto (Id_Producto, Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES (3, 'C09', 'Lata Durazno', 'Durazno Enlatado', 49, 2430.00, 1, 2)
INSERT INTO Producto (Id_Producto, Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES (4, 'A10', 'Lata Durazno', 'Durazno Enlatado', 49, 2430.00, 1, 1)

