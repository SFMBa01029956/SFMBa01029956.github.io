# **REFLEXION FINAL**

Salvador Federico Milanes Braniff
Tonatiuh Reyes Huerta

# **Running this program**

Run ~iex psr.exs to use the syntax higlighter.
The script contains a single module 'Parser'
Run 'Parser.json_to_html(a,b)' where a is a source .json file and b is any .html filename.
Run 'Parser.test_do()' alternatively, without arguments, to instantiate json_to_html() with preset values.

You can then review the result on the generated .html file "result.html".

# **Reflexion**

Se tuvo la oportunidad de trabajar con el lenguaje Elixir para crear un programa capaz de utilizar expresiones -s para identificar categorias lexicas, y acto seguido generar un script representativo de tipo html delimitando los distintos elementos mediante una clave de color. 
Para nuestra solucion, se utilizo un metodo recursivo que lee linea por linea de un archivo JSON, y las manda a una coleccion de funciones con expresiones regulares para identificar tokens especificos y extraerlos, de los cuales entonces se genera un objeto span de html con un formato particular segun el token identificado. La funcion extrae elementos del archivo y se vuelve a llamar de forma recursiva hasta que se haya terminado de consumir. 

La complejidad de nuestro programa es de O(MxN) al usarse Enum.map() (N) y Regex.run() (MxN, donde M es la expresion -s y N la longitud del tipo de dato) de formna recursiva.