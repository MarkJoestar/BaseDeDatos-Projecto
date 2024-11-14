
# PRESENTACIÓN Proyecto Gestión Ventas

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
 - Barrios, Cesar Pietro DNI 44.542.063
 - Caballero, Agustin DNI 43.452.430
 - Ojeda, Lucas Fernando DNI 45.845.469
 - Cristanchi, Marcos Romero DNI 42.425.274
 

**Año**: 2024

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

Sistema de Gestión de ventas para un supermercado. 

### Definición o planteamiento del problema

El objetivo de estudio es realizar ventas sin perder el control de lo que se vende, a quién se vende, cómo se vende, además de saber quien lo está vendiendo. Dentro de la problemática, se incluye los montos y cantidades de productos, los cuáles tienen un proveedor y una categoria.

¿Por qué es necesario un sistema de gestión de ventas? El software se hace necesario para un supermercado para que este mismo genere rentabilidad, saber que el comercio obtiene ganancias al vender sus productos y se tiene conocimiento de los productos que aún están disponibles para su venta. Al existir diversa cantidad de productos con nombres similares, se debe poder encontrar un producto con un identificador (id).

Existen distintos medios de pagos en la actualidad, y no todos utilizan el mismo método. Por ejemplo, Argentina realiza pagos con billeteras digitales en un 31% de las transacciones. También, se piden los datos del cliente para poder generar la factura final.

Definimos distintos roles para los usuarios del sistema, para así poder asignar distintos tipos de permisos. Los vendedores se dedican exclusivamente a vender y los administradores son los encargados del manejo de productos, actualización de stock, compra de insumos a proveedores.


###  Objetivo del Trabajo Práctico.
El trabajo fue realizo para comprender la organización de los datos en un sistemas de ventas, gracias a esto se podra observar las entidades que realizan las compras y ventas dentro del sistema y los elementos que operan. Ademas de poder visualizar un sistema de gestion de roles y tipos de usuario, tipos de categorias de productos y proveedores de los mismos.

## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

El sistema se basará en un software que cubre necesidades básicas de un sistema de ventas que está en constante movimiento, donde se debe actualizar los precios y el stock, así como registrar productos nuevos para que estos mismos puedan ser vendidos. También se piensa en el sistema de ventas donde se recibe el importe, el cuál puede ser abonado usando diferentes medios de pagos. Se registran los datos del cliente para la factura final. Los usuarios capaces de utilizar el sistema tienen distintos roles como puede ser un vendedor o un administrador.
Se usaran las formas normalizadas a la hora de diseñar bases de datos y convenciones de nomenclaturas que seran especificadas mas adelante en el trabajo.


## CAPÍTULO III: METODOLOGÍA SEGUIDA
En este capítulo se presenta el plan de trabajo, las acciones desarrolladas para completar cada etapa del proyecto, las herramientas utilizadas, y las dificultades encontradas a lo largo del proceso.

a) Cómo se realizó el Trabajo Práctico
Para llevar a cabo este trabajo, se siguió una metodología estructurada en varias etapas. En primer lugar, se realizó un análisis de los requerimientos del sistema, que incluyó identificar las necesidades de la base de datos y definir los datos clave para el funcionamiento del sistema. A continuación, se diseñó el modelo de datos, aplicando las convenciones establecidas en el curso. Este diseño incluyó la creación de entidades, relaciones y atributos necesarios para el modelo relacional de la base de datos, y se realizó una primera versión del esquema conceptual.

La siguiente fase fue la normalización de la base de datos para asegurar que cumpliera con las reglas de las formas normales y reducir la redundancia de datos. Durante esta etapa, se aplicaron los conceptos de normalización y se ajustó el modelo para optimizar la estructura de las tablas, minimizando inconsistencias y mejorando la eficiencia de las consultas. Finalmente, se implementaron índices y optimizaciones de consultas, con el fin de mejorar el rendimiento y asegurar que el sistema pudiera manejar consultas complejas de forma eficaz.

b) Herramientas (Instrumentos y procedimientos)
Para el desarrollo de este modelo relacional se utilizó ERDPlus, una herramienta de diseño que permite construir diagramas entidad-relación (ER) de manera visual y amigable. ERDPlus facilitó la creación del esquema conceptual y el modelo relacional, permitiendo seguir las convenciones establecidas por la cátedra en el primer parcial. Esta herramienta fue clave para asegurar que el diseño del modelo fuera consistente con los principios de diseño relacional y las reglas de normalización de bases de datos.

Una vez finalizado el diseño del modelo, se utilizó SQL Server para implementar y gestionar la base de datos. SQL Server permitió aplicar y probar el modelo relacional en un entorno de gestión de datos, proporcionando las herramientas necesarias para crear tablas, índices y optimizar consultas. Además, SQL Server fue fundamental para realizar pruebas de rendimiento y asegurar que el sistema respondiera de manera óptima a las consultas y necesidades del proyecto. Esta plataforma también facilitó la asignación de permisos de usuario, contribuyendo a un control de acceso seguro y bien definido.

Adicionalmente, se emplearon técnicas de normalización para optimizar el modelo, garantizando que las tablas y relaciones cumplieran con las primeras tres formas normales. El proceso de normalización fue seguido rigurosamente para minimizar la redundancia de datos y asegurar una estructura de base de datos coherente, alineada con los principios de diseño eficiente.


## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

Tema permisos:
En SQL Server, los permisos se utilizan para controlar el acceso a los objetos de la base de datos, como tablas, vistas, procedimientos almacenados, funciones y esquemas. Los permisos se asignan a usuarios, grupos o roles, y determinan qué acciones pueden realizar sobre los objetos de la base de datos.

Tipos de permisos:

-ALTER: Permite modificar objetos, como tablas, vistas y procedimientos almacenados.

-CONTROL: Permite controlar objetos, como asignar permisos a otros usuarios o grupos.

-DELETE: Permite eliminar filas de una tabla o eliminar objetos.

-EXECUTE: Permite ejecutar procedimientos almacenados y funciones.

-INSERT: Permite insertar filas en una tabla.

-REFERENCES: Permite establecer relaciones entre objetos, como foreign keys.

-SELECT: Permite leer datos de una tabla o vista.

-TAKE OWNERSHIP: Permite tomar la propiedad de un objeto.

-UPDATE: Permite actualizar filas en una tabla.

-VIEW CHANGE TRACKING: Permite seguir los cambios en una vista.

-VIEW DEFINITION: Permite ver la definición de un objeto.

![poj2](https://github.com/user-attachments/assets/1d6f98a5-5837-4f60-9786-ca072cf2e9ca)

Se crean usuarios para otorgar permisos a nivel de usuario. Al usuario ReadOnlyUser se le otorga el permiso para realizar el comando de "Select On" lo cual significa que puede leer la tabla producto.
En cuanto a AdminUser se ejecuta la sentencia de db_owner, lo cual le da al permiso de administrador.

![poj3](https://github.com/user-attachments/assets/394113ea-ea69-4d97-8103-afdc4e3ab28d)

Se crea el procedimiento Insertar producto y se le da permiso de ejecutarlo al usuario ReadOnlyUser

![poj4](https://github.com/user-attachments/assets/764e1b51-e238-4b41-93d6-005ef4de2152)

Se agregan 2 items a la tabla producto, uno mediante un insert comun por parte del administrador y otro medainte la ejecucion del procedimiento.

![poj5](https://github.com/user-attachments/assets/c5508790-bc87-4c62-9e1a-916764d368ef)

Se crrean nuevos usuarios pero esta vez para otorgar permisos a nivel de roles del DBMS. Para eso se deben crear roles y designarselos a los usuarios, lo cual se ve tras la creacion del Rol 'RolLectura'.

![poj6](https://github.com/user-attachments/assets/c79a6dbb-6875-4fa7-8f3d-c037e95a3eae)

Se utiliza grant para especificar que el rol de 'RolLectura' puede ejecutar 'Select on producto'
El comando sp_addrolemember se utiliza para otorgar el rol 'RolLectura' al Usuario3.

![poj7](https://github.com/user-attachments/assets/526d114a-26de-4c42-8323-4434feb4d5ba)

Ambos usuarios ejecutan la sentencia de 'Select * from producto'. Como solo Usuario 3, tiene permiso es el unico que podra leer la lista de productos.

![poj1](https://github.com/user-attachments/assets/1b768f8a-f170-413f-9dd5-7a494eda08fb)

En el caso de Usuario 4, como no tiene permiso para ajecutar la sentencia, ocurre el error de 'permiso no permitido'

CONLCUSION:

Los permisos SQL son fundamentales para controlar y gestionar el acceso a recursos y datos en un servidor de bases de datos. Es útil utilizarlos en situaciones que requieren seguridad, control de acceso, optimización de recursos, cumplimiento con regulaciones y auditoría.



### Tema Procedimientos y funciones almacenadas:
Un procedimiento almacenado es un conjunto de instrucciones SQL que se almacena asociado a una base de datos. El cual se crea con la sentencia CREATE PROCEDURE y se invoca con la sentencia EXECUTE. Un procedimiento puede tener cero o muchos parámetros de entrada y cero o muchos parámetros de salida. Las funciones, en cambio, son un conjunto de instrucciones que siempre retornan un valor, estas pueden ser utilizadas en expresiones y consultas.

### Ventajas del uso de procedimientos almacenados:
+ Rendimiento: Los procedimientos almacenados se compilan una sola vez y son almacenados en la base de datos, por lo que se reduce la cantidad de necesarias de compilación cada vez que se realiza una consulta.
+ Reutilización del código: Enfoque más modular y eficiente
+ Seguridad: Permiten establecer permisos específicos y restringir el acceso a las tablas, lo que protege de forma más eficiente los datos.
+ Reducción del Tráfico de Red:
Al ejecutar la lógica en el servidor, se minimiza la cantidad de datos que necesitan ser enviados entre el cliente y el servidor.

### EJEMPLO DE USO DE PROCEDIMIENTOS ALMACENADOS PARA INSERTAR PRODUCTOS NUEVOS:
![agregar](https://github.com/user-attachments/assets/76ec6bd9-430e-4a5e-931a-96e3f317cb6b)

### Ventajas del uso de funciones almacenadas:
+ Cálculos simplificados: Facilitan realizar cálculos complejos y devolver resultados en una sola llamada, simplificando las llamadas.
+ Rendimiento: Se compilan en el servidor, por lo que el tiempo de ejecución mejora notablemente. 

### EJEMPLO DE USO DE FUNCIONES ALMACENADAS PARA CALCULAR EDAD:
![image](https://github.com/user-attachments/assets/ceebf2aa-3a37-4e55-aea3-4b3933f8d644)


### OPERACIÓN DIRECTA
![rendimiento](https://github.com/user-attachments/assets/8d96130b-5d21-48a7-a392-9e0728e81ffa)

### PROCEDIMIENTO ALMACENADO
![RENDIMIENTO 2](https://github.com/user-attachments/assets/4adc7fa1-c6db-426f-8722-312f0b94e7ce)

### Conclusion Procedimientos y funciones almacenadas:
Para consultas simples y únicas, las operaciones directas pueden ser más prácticas. Para consultas complejas o con operaciones repetitivas, el uso de procedimientos y funciones almacenadas es más eficiente.
Esto debido a que puede llevar más tiempo que escribir consultas directas pero se compila y optimizan una sola vez, en llamadas posteriores tendrá una ejecución más rápida.
Para sacar el máxima provecho, la correcta integración de un sistema que use ambos, sería utilizar procedimientos almacenados para comunicarse y enviar datos a la aplicación; mientras que las funciones se usan para procesar datos internamente dentro del procedimiento almacenado.


## Tema Indices Columnares:
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

![image](https://github.com/user-attachments/assets/72ced864-4b6e-409f-b9b9-b9cc54f03ac4)

Resultados del script de indices Columnares:

![image](https://github.com/user-attachments/assets/7315c922-3a9b-4938-af2e-782152634b14)


![image](https://github.com/user-attachments/assets/13d94356-2b00-422b-afab-c02178cf0038)


Podemos ver que en la primera consulta (la cual no tiene un indice columnar) la mayor parte del tiempo de ejecucion de destino a:
Clustered Index Scan (Costo: 96%)
Se hace un scaneo completo de las filas de venta nuevo y se scanea un indice agrupado donde id_usuario = 1, es donde se destina la mayor parte del tiempo de ejecucion porque se esta escanenado toda la tabla en busca de las filas que cumplen con el filtro.

En el segundo plan de ejecucion, La consulta comienza con un escaneo sobre el índice columnar no agrupado en la tabla VentaNuevo1 donde se accede a la columna monto total, En este paso, el motor de SQL Server está preparando los datos de MontoTotal que serán utilizados en el cálculo de la suma, pero aún no ha aplicado el filtro id_usuario = 1 para esto el motor de SQL Server realiza un Key Lookup en el índice agrupado de la tabla para buscar solo los registros que cumplen con la condición, entonces se utiliza el operador Nested Loops para combinar los datos obtenidos en el Columnstore Index Scan y el Key Lookup.

### Conclusion indices columnares:
Se puede observar que el tiempo total es menor en la tabla que tiene indices columnares, esto  indica que los indices columnares mejoran el tiempo de ejecucion gracias a el acceso mas rapido a las columnas de las tablas a travez de un procesamiento mas eficiente ya que los indices columnares mejoran la eficiencia al permitir extraer y guardar en la ram solo columnas especificas. Ademas, Si el volumen de datos aumenta, es probable que la diferencia de rendimiento entre la tabla con y sin índice columnar se amplíe. 


### Diagrama relacional
![diagrama_relacional](https://github.com/MarkJoestar/BaseDeDatos-Projecto/blob/main/doc/modelo_relacional.jpeg)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_de_datos_bdd.pdf) del diccionario de datos.



Script de tablas

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)



## TEMA: Optimización de Consultas a través de Índices

### Conceptos Básicos sobre Índices

Un índice en SQL Server mejora la velocidad de recuperación de datos en las consultas, funcionando como un "índice" en un libro para localizar información rápidamente. Los índices son estructuras de datos que permiten acceder a los datos de forma más rápida al ordenar físicamente (índices agrupados) o mediante referencias organizadas (índices no agrupados).


Los índices más comunes son:

- **Índice Clustered (agrupado)**: Ordena físicamente los datos en la tabla. Solo puede haber uno por tabla, ya que define el orden físico de los datos.
- **Índice Non-Clustered (no agrupado)**: Crea una estructura separada que apunta a las filas de datos. Puede haber múltiples índices non-clustered en una tabla.

### Mejora del Rendimiento con Índices

Para mejorar el rendimiento de una consulta usando índices, se deben identificar las consultas que involucran operaciones de búsqueda y filtrado (`WHERE`, `JOIN`); y que *ordenan o agrupan* datos frecuentemente (`ORDER BY`, `GROUP BY`). También, se debe priorizar la selección de una porción de registros en lugar de hacer un escaneo completo de la tabla. 

SQL Server proporciona herramientas como el **Execution Plan** para revisar cómo se ejecuta una consulta y ver qué índice se utilizó para llevarla a cabo.

**En este informe, solo se trabajó con los Índices Agrupados (Clustered).**

---

### Aplicación en SQL Server

A continuación, aplicaremos los índices a tablas relevantes de nuestra base de datos:

### Ejemplo en la Tabla `Ventas`

La tabla `Ventas` es una tabla donde se harán muchas consultas de búsqueda. Estas búsquedas podrían realizarse por columnas como `FechaRegistro` o `MontoPago`. Un índice en esos campos va a mejorar el rendimientode  estas búsquedas.


### TAREAS SOLICITADAS

1. **Realizar una carga masiva de por lo menos un millón de registros sobre alguna tabla que contenga un campo fecha (sin índice).** Hacerlo con un script para poder automatizarlo.

   ![CargaDeRegistros](https://github.com/user-attachments/assets/2c35cce5-0afa-47ad-9991-be8118890ea8)

   Se creo una tabla nueva en base a la tabla de Ventas.
   Luego, cargamos un millon de registros en ella con un script.


2. **Realizar una búsqueda por periodo y registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.**

se ejecuta una consulta que busque por un período de fechas, en este caso, un periodo de un año:

![RealizarConsulta](https://github.com/user-attachments/assets/6ef38235-3526-4731-baf6-f50d201e7ff5)
los comandos `SET STATISTICS TIME ON` y SET `STATISTICS IO ON`
permiten medir y analizar el rendimiento de las consultas, en términos de tiempo y de operaciones de entrada/salida.


-Obtuvimos los siguientes resultados al realizar la consulta sin ningun indice:

![executionTime](https://github.com/user-attachments/assets/cf105280-2c16-4d96-bf10-ffcee4f669b6) 
Lecturas lógicas: 4951

Se puede ver que la consulta sin ningún índice mostró un tiempo de ejecución relativamente alto y número elevado de lecturas lógicas. Esto se debe a que SQL Server tuvo que realizar una búsqueda completa en la tabla, revisando cada fila para cumplir con los criterios de búsqueda.

En la siguiente imagen se puede ver que el programa no usó ningún índice para realizar la consulta.
![WhatsApp Image 2024-11-10 at 17 58 08_34ba7878](https://github.com/user-attachments/assets/6407e099-f3d1-4c3a-84c9-b2ed6a043084)



3. **Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior. Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.**
   

Declaramos el Índice Agrupado (Clustered) en el Campo  de FechaRegistro para mejorar el rendimiento de la consulta:

![DefinicionDeIndice_1columna](https://github.com/user-attachments/assets/4b404ac2-c484-437f-bf49-8a9b05d6a03c)


Se vuelve a ejecutar la consulta de búsqueda por un periodo de un año. y se obtiene estos resultados:

![medicion_1Columna](https://github.com/user-attachments/assets/cbe22355-effc-4d58-850c-186a3d4d2a8e)
Lecturas lógicas: 501

Al aplicar un índice agrupado en la columna FechaRegistro, el rendimiento mejoró de forma notable. La reducción en las lecturas lógicas (de 4951 a 501) muestra que SQL Server pudo localizar de manera más eficiente los registros dentro del rango de fechas especificado, sin necesidad de escanear toda la tabla.


En la siguiente imagen se puede ver el uso del índice agrupado para efectuar la consulta:

![WhatsApp Image 2024-11-10 at 18 09 42_bd62bedd](https://github.com/user-attachments/assets/0b5e9df8-c227-4d67-91e9-bfa87637ce47)



3. **Definir otro índice agrupado sobre la columna fecha pero que además incluya las columnas seleccionadas y repetir la consulta anterior. Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.**


Primero, eliminamos el índice anterior para evaluar el nuevo índice agrupado.

![EliminacionIndice_1columna](https://github.com/user-attachments/assets/bc20b04e-11d1-42e1-ae0c-8e857af91ed7)


Ahora creamos de un Índice Agrupado sobre la misma columna FechaRegistro, que ahora incluye otras columnas en la consulta para mejorar la optimización en accesos específicos:

![definicionDeIndice_ColumnasExtra](https://github.com/user-attachments/assets/a7fd9bca-daae-4f14-bffc-6046678550dc)


Ejecutamos de nuevo la consulta de búsqueda por un periodo de un año, y obtenemos estos resultados:

![medicion_3columnas](https://github.com/user-attachments/assets/0d635c6e-870d-4a90-9a9e-c99131d35a96)
Lecturas lógicas: 401

Al añadir las columnas MontoPago y MontoTotal al índice agrupado, el rendimiento mostró una pequeña mejora en el tiempo de ejecución y las lecturas lógicas. Lo que hizo la inclusión de estas columnas es que SQL Server pudo satisfacer la consulta utilizando únicamente el índice, ya que se evita hacer búsquedas adicionales en la tabla para recuperar estos datos.


En la siguiente imagen se puede ver el uso del índice agrupado con las columnas agregadas para efectuar la consulta:

![WhatsApp Image 2024-11-12 at 19 56 26_09ae8dd2](https://github.com/user-attachments/assets/98369684-0496-4ca9-aff5-5ce9d713e033)


4. **Expresar las conclusiones en base a las pruebas realizadas.**


En conclusión, el uso de índices agrupados en la columna FechaRegistro, y en particular la inclusión de las columnas necesarias en el índice, optimizó significativamente las consultas en términos de tiempo de respuesta y eficiencia de lecturas.

La estructura del índice agrupado ordena físicamente los datos según FechaRegistro, esto hizo que las búsquedas de rangos sean mucho más eficientes en comparación con una consulta sin índices. Tambien, el incluir las columnas seleccionadas en el índice agrupado evitó que se hagan accesos innecesarios a la tabla, lo que mejoró más el rendimiento de la consulta y redujo las lecturas lógicas.





## CAPÍTULO V: CONCLUSIONES

La implementación de procedimientos y funciones almacenadas, índices columnares, optimización de consultas y gestión de permisos SQL en un sistema de bases de datos contribuye de manera significativa a mejorar su eficiencia, seguridad y rendimiento general. Los procedimientos y funciones almacenadas permiten optimizar consultas complejas y repetitivas, mejorando la velocidad de ejecución a través de su compilación y optimización iniciales. Los índices columnares, por su parte, reducen los tiempos de respuesta al acceder selectivamente a columnas específicas, lo cual resulta especialmente beneficioso a medida que el volumen de datos crece. Además, la utilización de índices agrupados en columnas claves como FechaRegistro mejora el tiempo de respuesta al ordenar los datos físicamente, optimizando aún más las consultas. Finalmente, el control de acceso mediante permisos SQL asegura la protección y administración de los recursos, facilitando un entorno de trabajo seguro y regulado. En conjunto, estos elementos fortalecen tanto el rendimiento como la seguridad del sistema, creando una base de datos más robusta y eficaz.





## BIBLIOGRAFÍA DE CONSULTA

1. Victor Cardenas, 22/02/2022, Indices Columnares y Tablas en memoria, Visoalgt
2. Material de la Asignatura proporcionado en el Aula virtual de la misma.


