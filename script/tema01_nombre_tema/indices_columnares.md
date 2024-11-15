Vamos a evaluar laversatilidad de los indices columares y compararlos con los indices normales 
![image](https://github.com/user-attachments/assets/f405c525-1f86-44b0-9f48-e176538f05e4)
En un indice tradicional, la Base de datos lee la primera fila y lee nombre departamento y salario y lo guarda en la memoria cache, luego lo repite para la siguiente fila
si la tabla tiene 60 datos tiene que leer fila por fila.
![image](https://github.com/user-attachments/assets/2e337413-7019-45a6-86dc-2123142c45e8)
Si transponemos los datos, ahora los datos quedan cargados como se muestran en la imagen.
Si hacemos la misma consulta ahora ya no va a tener que leer fila por fila sino que puede hacer un barrido, ahora para devolver todos los nombres solo tiene que leer la fila nombre y recorrer toda la fila capturando todos los nombres. 
![image](https://github.com/user-attachments/assets/72021e59-2bf6-4315-854e-0a6d77654e3b)
Cuando hacemos una peticion a traves de select, sql primero tiene que cargar a cache esas paginas de datos para construir la tabla, y luego devuelve la consulta solicitada.

![image](https://github.com/user-attachments/assets/0f993f3f-fee8-44f5-ba8e-a8a14acb1575)

El indice columnar cambia la estructura en la que se guardan los datos en la pagina y entonces cada atributo se guarda en una pagina diferente, asi cuando se hace una consulta pidiendo unicamente ciertos atributos solo tiene que cargar las paginas de los atributos solicitados en la consulta en vez de cargar todas las paginas de datos

Vamos a usar esta tabla

![image](https://github.com/user-attachments/assets/ac817fd5-e55b-403b-9abf-df537e63d367)


La renombramos 

![image](https://github.com/user-attachments/assets/6faa06eb-7e11-4621-8fd1-4119c6e5de85)

Vamos a usar este script para hacer la insercion de un millon de registros a la nueva tabla

![image](https://github.com/user-attachments/assets/89601504-7a85-49d3-8d45-b357981b863d)

Creamos un indice columnar en la nueva tabla 

![image](https://github.com/user-attachments/assets/0e24d6ba-dca6-444e-99c0-1f982e8a3909)

Vamos a utilizar el siguiente stript para realizar una comparacion entre la tabla ventanuevo original y ventanuevo con indices columnares implementados 

![image](https://github.com/user-attachments/assets/97671477-49b0-48a6-a97f-5b2429dc871f)

Resultados:

![image](https://github.com/user-attachments/assets/7315c922-3a9b-4938-af2e-782152634b14)


![image](https://github.com/user-attachments/assets/13d94356-2b00-422b-afab-c02178cf0038)


Podemos ver que en la primera consulta (la cual no tiene un indice columnar) la mayor parte del tiempo de ejecucion de destino a:
Clustered Index Scan (Costo: 96%)
Se hace un scaneo completo de las filas de venta nuevo y se scanea un indice agrupado donde id_usuario = 1, es donde se destina la mayor parte del tiempo de ejecucion porque se esta escanenado toda la tabla en busca de las filas que cumplen con el filtro.

En el segundo plan de ejecucion, La consulta comienza con un escaneo sobre el índice columnar no agrupado en la tabla VentaNuevo1 donde se accede a la columna monto total, En este paso, el motor de SQL Server está preparando los datos de MontoTotal que serán utilizados en el cálculo de la suma, pero aún no ha aplicado el filtro id_usuario = 1 para esto el motor de SQL Server realiza un Key Lookup en el índice agrupado de la tabla para buscar solo los registros que cumplen con la condición, entonces se utiliza el operador Nested Loops para combinar los datos obtenidos en el Columnstore Index Scan y el Key Lookup.


Conclusion:
Se puede observar que si bien el tiempo total es menor en la tabla que no tiene indices columnares la carga de procesamiento fue muy superior en , esto pude indicar que los indices columnares mejoran el tiempo de ejecucion gracias a el acceso mas rapido a las columnas de las tablas que a travez de un procesamiento mas eficiente ya que los indices columnares mejoran la eficiencia al permitir extraer y guardar en la ram solo columnas especificas. Ademas, Si el volumen de datos aumenta, es probable que la diferencia de rendimiento entre la tabla con y sin índice columnar se amplíe. 





