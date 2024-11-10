Vamos a evaluar la aversatilidad de los indices columares y compararlos con los indices normales 
![image](https://github.com/user-attachments/assets/f405c525-1f86-44b0-9f48-e176538f05e4)
En un indice tradicional, la Base de datos lee la primera fila y lee nombre departamento y salado y lo guarda en la memoria cache, luego lo repite para la siguiente fila
si la tabla tiene 60 datos tiene que leer fila por fila.
![image](https://github.com/user-attachments/assets/2e337413-7019-45a6-86dc-2123142c45e8)
Si transponemos los datos, ahora los datos quedan cargados como se emuestran en la imagen.
Si hacemos la misma consulta ahora y ya no va a tener que leer fila por fila sino que puede hacer un barrido, ahora para devolver todos los nombres solo tiene que leer la fila nombre y recorrer toda la fila capturando todos los nombres. 
![image](https://github.com/user-attachments/assets/72021e59-2bf6-4315-854e-0a6d77654e3b)
Cuando hacemosuna peticion a travez de selext, sql primero tiene que cargar a cache esas paginas de datos para construir la tabla, y luego devuelve la consulta solicitada.

![image](https://github.com/user-attachments/assets/0f993f3f-fee8-44f5-ba8e-a8a14acb1575)

El indice columnar cambia la estructura en la que se guardan los datos en la pagina y entonces cada atributo se guarda en una pagina diferente, asi uando se hace una consuta pidiendo solo ciertos atributos solo tiene que cargar las paginas de los atributos solicitados en la consulta en vez de cargar todas las paginas de datos

Vamos a usar esta tabla

![image](https://github.com/user-attachments/assets/ac817fd5-e55b-403b-9abf-df537e63d367)


La renombramos 

![image](https://github.com/user-attachments/assets/6faa06eb-7e11-4621-8fd1-4119c6e5de85)

Vamos a usar este script para hacer la insercion de un millon de registros a la nueva tabla

![image](https://github.com/user-attachments/assets/89601504-7a85-49d3-8d45-b357981b863d)

Creamos un indice columnar en la nueva tabla 

![image](https://github.com/user-attachments/assets/0e24d6ba-dca6-444e-99c0-1f982e8a3909)

Vamos a utilizar el siguiente stript para realizar una comparacion entre la tabla ventanuevo original y ventanuevo con indices columnares implementados 

-- Consulta en ventanuevo (original sin indices columnares)
SELECT SUM(CONVERT(BIGINT, MontoTotal)) AS TotalVentas
FROM ventanuevo
WHERE FechaRegistro BETWEEN '2015-01-01' AND '2020-12-31';

-- Consulta en VentaNuevo1 (con indices columnares)
SELECT SUM(CONVERT(BIGINT, MontoTotal)) AS TotalVentas
FROM VentaNuevo1
WHERE FechaRegistro BETWEEN '2015-01-01' AND '2020-12-31';

Resultados:
![image](https://github.com/user-attachments/assets/5e6186e2-421f-4f5d-b8a3-a189b2b515f2)
Conclusion:
Se puede observar que si bien el tiempo total es menor en la tabla que no tiene indices columnares la carga de procesamiento fue casi la misma en ambas consultas, esto pude indicar que los indices columnares mejoran el tiempo de ejecucion gracias a el acceso mas rapido a las columnas de las tablas que a travez de un procesamiento mas eficiente ya que los indices columnares mejoran la eficiencia al permitir extraer y guardar en la ram solo columnas especificas. Ademas, Si el volumen de datos aumenta, es probable que la diferencia de rendimiento entre la tabla con y sin índice columnar se amplíe. 





