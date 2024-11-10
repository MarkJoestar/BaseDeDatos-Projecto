--AGREGAR
CREATE PROCEDURE InsertarProducto
    @Codigo VARCHAR(50),
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(255),
    @Stock INT,
    @Precio DECIMAL(10,2)
    @Estado INT,
    @Categoria_id INT
AS
BEGIN
    INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id)
    VALUES (@Codigo, @Nombre, @Descripcion, @Stock, @Precio, @Estado, @Categoria_id);
END

--EJEMPLO
    EXECUTE Insertar Producto 'c44', 'Arroz Danubio', 'Arroz Marca Danubio De 500grs', 45, 1500.00, 1, 4;
  
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
