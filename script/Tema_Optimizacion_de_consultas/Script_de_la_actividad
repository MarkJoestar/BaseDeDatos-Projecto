--OPTIMIZACION DE CONSULTAS A TRAVES DE INDICES--

--actividades a realizar:
/*
-Realizar una carga masiva de por lo menos un millón de registro sobre alguna tabla que contenga un campo fecha (sin índice).
Hacerlo con un script para poder automatizarlo.

-Realizar una búsqueda por periodo y registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.

-Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior.
Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.

-Borrar el índice creado.

-Definir otro índice agrupado sobre la columna fecha pero que además incluya las columnas seleccionadas y repetir la consulta anterior.
Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.

-Expresar las conclusiones en base a las pruebas realizadas.
*/



/****--Carga masiva de registros--****/
-- Creamos una nueva tabla VentaNuevo para la carga masiva, que tendrá la misma estructura que la tabla 'Ventas', ya que esta tiene un campo de fecha.

CREATE TABLE VentaNuevo (
    id_Venta INT PRIMARY KEY,
    MontoPago INT,
    MontoTotal INT,
    FechaRegistro DATE,
    Id_Usuario INT,
    Id_Cliente INT
);


-- Declaramos las variables necesarias
DECLARE @i INT = 0;

DECLARE @total INT = 1000000;

-- Generamos los registros de prueba
WHILE @i < @total
BEGIN
    INSERT INTO VentaNuevo (id_Venta, MontoPago, MontoTotal, FechaRegistro, Id_Usuario, Id_Cliente)
    VALUES (
        -- id_Venta será incremental para cada registro
        @i + 1,
        -- Genera un valor aleatorio para MontoPago entre 100 y 5000
        ABS(CHECKSUM(NEWID()) % 4900) + 100,
        -- Genera un valor aleatorio para MontoTotal entre 500 y 10000
        ABS(CHECKSUM(NEWID()) % 9500) + 500,
        -- Genera una fecha aleatoria en un rango de 10 años desde 2010
        DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 3650), '2010-01-01'),
        -- Genera un Id_Usuario aleatorio entre 1 y 1000
        ABS(CHECKSUM(NEWID()) % 1000) + 1,
        -- Genera un Id_Cliente aleatorio entre 1 y 1000
        ABS(CHECKSUM(NEWID()) % 1000) + 1
    );

    SET @i = @i + 1;
END;

PRINT 'carga masiva completada.';


--medición del Rendimiento sin Índices
--se ejecuta una consulta que busque por un período de fechas,
--por ejemplo, un periodo de un año:

SET STATISTICS TIME ON;		--activamos estas opciones que permiten medir y analizar el rendimiento de las consultas,
SET STATISTICS IO ON;		--en términos de tiempo y de operaciones de entrada/salida.

SELECT * 
FROM VentaNuevo
WHERE FechaRegistro BETWEEN '2015-01-01' AND '2015-12-31';



SET STATISTICS TIME OFF;	--las desactivamos nuevamente para que no afecten futuras consultas
SET STATISTICS IO OFF;  
--registramos los datos



--ahora definimos un Índice Agrupado en el Campo Fecha para mejorar el rendimiento de la consulta.
CREATE CLUSTERED INDEX IDX_VentaNuevo_FechaRegistro
ON VentaNuevo(FechaRegistro);

--repetimos la consulta de búsqueda por período y registramos los datos nuevamente



--se retira el índice creado anteriormente para evaluar otra estrategia
DROP INDEX IDX_VentaNuevo_FechaRegistro ON VentaNuevo;


--ahora creamos de un Índice Agrupado que Incluya Otras Columnas Seleccionadas

CREATE CLUSTERED INDEX [IDX_VentaNuevo_FechaRegistro]
    ON [dbo].[VentaNuevo] ([FechaRegistro],[MontoPago], [MontoTotal])

--ahora ejecutamos nuevamente la consulta inicial para registrar los nuevos datos
