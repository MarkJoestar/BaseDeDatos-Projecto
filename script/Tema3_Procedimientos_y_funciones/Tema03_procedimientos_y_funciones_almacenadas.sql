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
INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES ('C09', 'Coca Cola', 'Coca cola de vidrio 1.5lt', 49, 2000.00, 1, 5)
INSERT INTO Producto (Codigo, Nombre, Descripcion, Stock, Precio, Estado, Categoria_id) VALUES ('C10', 'Fanta', 'Fanta Naranja retornable 2LT', 56, 2000.00, 1, 5)

EXECUTE InsertarProducto 'B14', 'Arroz Danubio 1kg', 'Arroz Marca Danubio De 1kg', 55, 2500.00, 1, 4;
EXECUTE InsertarProducto 'B12', 'Arroz Danubio 500grs', 'Arroz Marca Danubio De 500grs', 45, 1500.00, 1, 4;
EXECUTE InsertarProducto 'B04', 'Fideos La Providencia', 'Fideos La Providencia en todas las presentaciones', 83, 2000.00, 1, 4;
EXECUTE InsertarProducto 'B33', 'Sal Fina', 'Sal Fina Celusal', 15, 1200.00, 1, 4;

--Realizar  update y delete sobre  algunos de los registros insertados  en esas tablas invocando a los procedimientos. 

--DELETE
EXECUTE EliminarProducto 1;
EXECUTE EliminarProducto 3;
--UPDATE
EXECUTE AgregarCantidadProducto 4, 5
EXECUTE AgregarCantidadProducto 8, 15

--FUNCION QUE CALCULA EDAD

CREATE FUNCTION calcularEdad (@fechnac date)
RETURNS INT
AS

BEGIN
	DECLARE @edad INT
	SELECT @edad = DATEDIFF(YEAR, @fechnac, getdate()) 
	RETURN @edad
END


--FUNCION PRODUCTO QUE MUESTRE UN PRODUCTO MAYOR A TAL PRECIO

CREATE FUNCTION CompararNumeros (@Numero1 INT,@Numero2 INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @Resultado NVARCHAR(100);

    IF @Numero1 > @Numero2
        SET @Resultado = CONCAT(@Numero1, ' es mayor que ', @Numero2);
    ELSE IF @Numero1 < @Numero2
        SET @Resultado = CONCAT(@Numero2, ' es mayor que ', @Numero1);
    ELSE
        SET @Resultado = 'Ambos números son iguales';

    RETURN @Resultado;
END;
	
--FUNCION QUE MUESTRE DESCUENTO 15%

CREATE FUNCTION CalcularDescuento (
    @Precio DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Descuento DECIMAL(10, 2);
    
    -- Calcula el descuento (15% del precio)
    SET @Descuento = @Precio * 0.15;
    
    -- Devuelve el precio después del descuento
    RETURN @Precio - @Descuento;
END;


--Comparar la eficiencia de las operaciones directas versus el uso de procedimientos y funciones.
Para consultas simples y únicas, las operaciones directas pueden ser más prácticas. Para consultas complejas 
o con operaciones repetitivas, el uso de procedimientos y funciones almacenadas es más eficiente.
Esto debido a que puede llevar más tiempo que escribir consultas directas pero se compila y optimizan una sola vez,
en llamadas posteriores tendrá una ejecución más rápida
