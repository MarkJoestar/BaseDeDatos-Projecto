--AGREGAR
CREATE PROCEDURE InsertarProducto
    @Codigo VARCHAR(50),
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(255),
    @Stock INT,
    @Precio DECIMAL(10,2),
    @Estado INT,
    @Categoria_id INT
AS
BEGIN
    INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id)
    VALUES (@Codigo, @Nombre, @Descripcion, @Stock, @Precio, @Estado, @Categoria_id);
END

--EJEMPLO
    EXECUTE InsertarProducto 'c44', 'Arroz Danubio', 'Arroz Marca Danubio De 500grs', 45, 1500.00, 1, 4;
  
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


--Insertar un lote de datos en las tablas mencionadas  (guardar el script) con sentencias insert y otro lote invocando a los procedimientos creados. 
-- Para cargar los productos deben existir categorías creadas
-- Id_producto se rellena automáticamente
INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES ('A04', 'Lata Durazno', 'Durazno Enlatado', 49, 2430.00, 1, 3)
INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES ('B44', 'Azucar AG', 'Azucar de un kilogramo', 459, 2000.00, 1, 3)
INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES ('C09', 'Lata Durazno', 'Durazno Enlatado', 49, 2430.00, 1, 2)
INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES ('A10', 'Lata Durazno', 'Durazno Enlatado', 49, 2430.00, 1, 1)

EXECUTE InsertarProducto 'c44', 'Arroz Danubio', 'Arroz Marca Danubio De 500grs', 45, 1500.00, 1, 4;
EXECUTE InsertarProducto 'c44', 'Arroz Danubio', 'Arroz Marca Danubio De 500grs', 45, 1500.00, 1, 4;
EXECUTE InsertarProducto 'c44', 'Arroz Danubio', 'Arroz Marca Danubio De 500grs', 45, 1500.00, 1, 4;
EXECUTE InsertarProducto 'c44', 'Arroz Danubio', 'Arroz Marca Danubio De 500grs', 45, 1500.00, 1, 4;

--Realizar  update y delete sobre  algunos de los registros insertados  en esas tablas invocando a los procedimientos. 

--DELETE
EXECUTE EliminarProducto 1;
EXECUTE EliminarProducto 3;
--UPDATE
EXECUTE AgregarCantidadProducto 4, 5
EXECUTE AgregarCantidadProducto 8, 15

--FUNCION
--FUNCION PRODUCTO QUE MUESTRE UN PRODUCTO MENOR A TAL PRECIO
--FUNCION QUE MUESTRE STOCK DE TAL PRODUCTO
