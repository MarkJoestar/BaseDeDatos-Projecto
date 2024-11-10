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

