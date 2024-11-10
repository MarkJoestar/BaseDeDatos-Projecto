DECLARE @contador INT = 0;

DECLARE @cantidadTotal INT = 1000000;  -- Número total de registros que queremos insertar

-- Generamos los registros de prueba
WHILE @contador < @cantidadTotal
BEGIN
    INSERT INTO VentaNuevo1 (id_Venta, MontoPago, MontoTotal, FechaRegistro, Id_Usuario, Id_Cliente)
    VALUES (
        -- id_Venta será incremental para cada registro
        @contador + 1,
        
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

    -- Incrementa el contador
    SET @contador = @contador + 1;

    -- Cada 1000 registros, imprime un mensaje para mostrar el progreso
    IF @contador % 1000 = 0
    BEGIN
        PRINT CONCAT('Insertados ', @contador, ' registros...');
    END
END;

PRINT 'Carga masiva completada.';





