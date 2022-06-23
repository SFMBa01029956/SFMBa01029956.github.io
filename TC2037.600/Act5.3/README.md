# **REFLEXION FINAL**

Salvador Federico Milanes Braniff | A01029956

Tonatiuh Reyes Huerta | A01

# **Running this program**

Run ~iex psr.exs to use the syntax higlighter.
The script contains a single module **'Parser'**
Run **'Parser.json_to_html(a,b)'** where a is a source .json file and b is any .html filename.
Run **'Parser.test_do()'** alternatively, without arguments, to instantiate json_to_html() with preset values.

You can then review the result on the generated .html file **"result.html"**.

Two functions for parsing an array of .json files have been created: use **'Parser.single_json_to_html(pth)'** where pth is the desired directory containing .json files, for parsing through each file of such array one-by-one; use **'Parser.parallel_json_to_html(pth)'** for parsing through the files in parallel. These functions will generate an assortment of .html files for each .json on the directory given.

An additional function for reviewing speed of the former methods has been created: use **'Parser.timer(fn -> {fx} end)'** where fx is the desired function to evaluate including a valid argument. This method returns execution speed in seconds.

# **Reflexion**

Se tuvo la oportunidad de trabajar nuevamente con el lenguaje Elixir, aprovechando el programa de la actividad previa para identificar categorias lexicas, y acto seguido generar un script representativo de tipo html delimitando los distintos elementos mediante una clave de color. 

Para esta nueva entrega, se anadio como requerimiento el manejo de multiples archivos .json para generar sus .html correspondientes. Nuestra solucion aprovecha el metodo recursivo creado previamente; que lee linea por linea de un archivo JSON, y las manda a una coleccion de funciones con expresiones regulares para identificar tokens especificos y extraerlos, de los cuales entonces se genera un objeto span de html con un formato particular segun el token identificado. La funcion extrae elementos del archivo y se vuelve a llamar de forma recursiva hasta que se haya terminado de consumir. Alrededor de esta funcion, se han implementado entonces dos metodos para el manejo de multiples archivos, uno que itera de archivo en archivo y el otro que los maneja de forma paralela aprovechando los nucleos de la computadora. 
***
## **PRUEBAS**

Se realizaron 5 pruebas, con carga (cantidad y tamano de los archivos a procesar) en orden ascendiente.

**Prueba 1**: Archivos del directorio *"short_jsons"* 1, 2 y 3

    Single: 0.253235s
    Parallel: 0.108032s

    Speedup: 2.344073

**Prueba 2**: Archivos del directorio *"short_jsons"* del 1 al 5

    Single: 0.419328s
    Parallel: 0.109465s

    Speedup: 3.830703
    
**Prueba 3**: Archivos del directorio *"short_jsons"* del 1 al 10

    Single: 0.80855s
    Parallel: 0.17582s

    Speedup: 4.59873

**Prueba 4**: Archivos del directorio *"short_jsons"* del 1 al 20

    Single: 1.325465s
    Parallel: 0.239616s

    Speedup: 5.531621

**Prueba 5**: Archivos del directorio *"short_jsons"* del 1 al 20 duplicados. (40 archivos en total).

    Single: 2.649804
    Parallel: 0.403251

    Speedup: 6.571103

>La complejidad de nuestro programa esta separada en los dos nuevos metodos para manejar multiples archivos .json: La de archivo por archivo (single_json_to_html) es directamente proporcional a la .cantidad de tareas a realizar, al hacerlas de una en una: O(N).  La de multiples archivos en paralelo depende de los nucleos disponibles y la cantidad de archivos a procesar, anadiendo un factor x: O(N) * x.
>
>Se puede ver una diferencia con aumento lineal en los tiempos de ejecucion de ambos metodos contra la cantidad de archivos que se manejan, la diferencia en el metodo single tiene creces de casi el doble al duplicar la cantidad de archivos, mientras que el metodo parallel es capaz de realizar todas las operaciones en menos de un segundo y la diferencia entre 3 y 40 archivos casi no se nota, demostrando en verdad la eficiencia superior de este segundo metodo y su complejidad. Desde la primera prueba se obtiene un speedup mayor a uno, de hecho es del doble; demostrando la mejora significativa, que se vuelve mayor de acuerdo a la carga de la tarea.
>
>Para fines de curiosidad nada mas, se ha realizado una prueba adicional, con 600 copias del archivo 1 del directorio json_files. Se espera una diferencia significativa en la ejecucion de los dos metodos:

**Prueba 6**: 600 copias del Archivo 1 del directorio *"short_jsons"*

    Single: 55.270076
    Parallel: 2.214732

    Speedup: 24.955649