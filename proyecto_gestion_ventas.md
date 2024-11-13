# Proyecto de Estudio!
    
**Estructura del documento principal:**

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

El sistema se basará en un software que cubre necesidades básicas de un sistemade ventas que está en constante movimiento, donde se debe actualizar los precios y el stock, así como registrar productos nuevos para que estos mismos puedan ser vendidos. También se piensa en el sistema de ventas donde se recibe el importe, el cuál puede ser abonado usando diferentes medios de pagos. Se registran los datos del cliente para la factura final. Los usuarios capaces de utilizar el sistema tienen distintos roles como puede ser un vendedor o un administrador.
Se usaran las formas normalizadas a la hora de diseñar bases de datos y convenciones de nomenclaturas que seran especificadas mas adelante en el trabajo.

...

## CAPÍTULO III: METODOLOGÍA SEGUIDA 

En este capítulo se presenta el plan seguido o las acciones llevadas a cabo para realizar el trabajo, 
las dificultades encontradas, y cualquier otra información que proporcione la idea de cómo se 
realizó el trabajo.


 **a) Cómo se realizó el Trabajo Práctico**
Tema Indices Columnares:
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

 **b) Herramientas (Instrumentos y procedimientos)**
El modelo relacional se realizo usando ERDPLUS siguiendo las convenciones de la catedra en el primer parcial y siguiendo las reglas relacionales de normalizacion de bases de datos. 


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

En el caso de Usuairo 4, como no tiene permiso para ajecutar la sentencia, ocuure el error de 'permiso no permitido'

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
![funcion](https://github.com/user-attachments/assets/0853db13-e31f-45ab-9437-6626e5ca6fe0)

### OPERACIÓN DIRECTA
![rendimiento](https://github.com/user-attachments/assets/8d96130b-5d21-48a7-a392-9e0728e81ffa)

### PROCEDIMIENTO ALMACENADO
![RENDIMIENTO 2](https://github.com/user-attachments/assets/4adc7fa1-c6db-426f-8722-312f0b94e7ce)

### Conclusion Procedimientos y funciones almacenadas:
Para consultas simples y únicas, las operaciones directas pueden ser más prácticas. Para consultas complejas o con operaciones repetitivas, el uso de procedimientos y funciones almacenadas es más eficiente.
Esto debido a que puede llevar más tiempo que escribir consultas directas pero se compila y optimizan una sola vez, en llamadas posteriores tendrá una ejecución más rápida.
Para sacar el máxima provecho, la correcta integración de un sistema que use ambos, sería utilizar procedimientos almacenados para comunicarse y enviar datos a la aplicación; mientras que las funciones se usan para procesar datos internamente dentro del procedimiento almacenado.


Tema Indices Columnares:
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
Resultados del script de indices Columnares:

![image](https://github.com/user-attachments/assets/5e6186e2-421f-4f5d-b8a3-a189b2b515f2)

Conclusion Indices Columnares:
Se puede observar que si bien el tiempo total es menor en la tabla que no tiene indices columnares la carga de procesamiento fue casi la misma en ambas consultas, esto pude indicar que los indices columnares mejoran el tiempo de ejecucion gracias a el acceso mas rapido a las columnas de las tablas que a travez de un procesamiento mas eficiente ya que los indices columnares mejoran la eficiencia al permitir extraer y guardar en la ram solo columnas especificas. Ademas, Si el volumen de datos aumenta, es probable que la diferencia de rendimiento entre la tabla con y sin índice columnar se amplíe. 


### Diagrama relacional
![diagrama_relacional](https://github.com/MarkJoestar/BaseDeDatos-Projecto/blob/main/doc/modelo_relacional.jpeg)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_de_datos_bdd.pdf) del diccionario de datos.

### Desarrollo TEMA 1 "----"

Script de tablas

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)
## CAPÍTULO V: CONCLUSIONES

------



## BIBLIOGRAFÍA DE CONSULTA

 1. Soledad Navarro, 01/05/2024, Cómo pagan los argentinos: ¿Prefieren el efectivo, las tarjetas de crédito o débito, o las billeteras virtuales?, Clarín
1. Victor Cardenas, 22/02/2022, Indices Columnares y Tablas en memoria, Visoalgt


