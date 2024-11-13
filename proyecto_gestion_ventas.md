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

**TEMA 1 " ---- "** 
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


