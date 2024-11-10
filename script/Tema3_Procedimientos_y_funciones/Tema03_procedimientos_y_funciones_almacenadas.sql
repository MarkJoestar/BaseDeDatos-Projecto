--MODIFICAR
--Agregar cantidad a un producto
CREATE PROCEDURE AgregarCantidadProducto
--Par�metros
@IdProducto as int,
@Cantidad as int
AS
--Actualiza Cantidad
UPDATE Producto set Stock=Stock+@Cantidad
--Indicar a qu� producto se le agrega cantidad
Where Id_Producto=@IdProducto



--Quitar cantidad a un producto
CREATE PROCEDURE QuitarCantidadProducto
--Par�metros
@IdProducto as int,
@Cantidad as int
AS
--Actualiza Cantidad
UPDATE Producto set Stock=Stock-@Cantidad
--Indicar a qu� producto se le quita cantidad
Where Id_Producto=@IdProducto
