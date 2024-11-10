
USE DATABASE SistemaCompras_Proyecto_BdD
GO

CREATE TABLE VentaNuevo1 (
    id_Venta INT PRIMARY KEY,
    MontoPago INT,
    MontoTotal INT,
    FechaRegistro DATE,
    Id_Usuario INT,
    Id_Cliente INT
);

CREATE COLUMNSTORE INDEX IX_Columna_VentaNueva
ON VentaNuevo1 (id_Venta, MontoPago, FechaRegistro, Id_Usuario, Id_Cliente);

SUM(CONVERT(BIGINT, MontoTotal))
select * from ventanuevo

SET STATISTICS TIME ON;

-- Consulta en ventanuevo
SELECT SUM(CONVERT(BIGINT, MontoTotal)) AS TotalVentas
FROM ventanuevo
WHERE FechaRegistro BETWEEN '2015-01-01' AND '2020-12-31';

-- Consulta en VentaNuevo1
SELECT SUM(CONVERT(BIGINT, MontoTotal)) AS TotalVentas
FROM VentaNuevo1
WHERE FechaRegistro BETWEEN '2015-01-01' AND '2020-12-31';

SET STATISTICS TIME OFF;


