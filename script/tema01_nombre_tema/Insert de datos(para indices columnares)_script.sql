--Copia de la tabla con mayor concurrencia (Detalle_Venta) en la cual se realizara la carga de datos
CREATE TABLE Detalle_Venta_Masiva
(
  Precio_Venta DECIMAL(10,2) NOT NULL,
  Cantidad INT NOT NULL,
  SubTotal DECIMAL(10,2) NOT NULL,
  Id_Venta INT NOT NULL,
  Id_Producto INT NOT NULL,
  CONSTRAINT PK_Detalle_Venta_Masiva PRIMARY KEY (Id_Venta, Id_Producto),
  CONSTRAINT FK_Detalle_Venta_Masiva_Venta FOREIGN KEY (Id_Venta) REFERENCES Venta(Id_Venta),
  CONSTRAINT FK_Detalle_Venta_Masiva_Producto FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
);


--Scipt para la carga masiva de datos
DECLARE @i INT = 1;

WHILE @i <= 1000000
BEGIN
    INSERT INTO Detalle_Venta_Masiva (Precio_Venta, Cantidad, SubTotal, Id_Venta, Id_Producto)
    VALUES 
    (
        ROUND(RAND() * (100 - 10) + 10, 2),  -- Precio_Venta entre 10 y 100
        FLOOR(RAND() * (10 - 1) + 1),        -- Cantidad entre 1 y 10
        ROUND(RAND() * (1000 - 50) + 50, 2), -- SubTotal entre 50 y 1000
        FLOOR(RAND() * (100 - 1) + 1),       -- Id_Venta entre 1 y 100 (ajusta según registros)
        FLOOR(RAND() * (100 - 1) + 1)        -- Id_Producto entre 1 y 100 (ajusta según registros)
    );
    
    SET @i = @i + 1;
END;





