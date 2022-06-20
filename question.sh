#
#  LAB: Transformación de archivos con `sed`
#  ================================================
#
#  Una tarea común en Analytics es el procesamiento de archivos en bruto para que puedan 
#  ser usados en otros procesos, donde gran parte de dicho procesamiento corresponde a la 
#  transforamción del formato. Estos archivos suelen tener millones de registros por lo que 
#  la aplicación de procedimientos manuales no es práctica.
#  
#  El archivo `data.csv` contiene una muestra de los archivos generados automáticamente 
#  por un software. El archivo contiene cuatro (4) columnas, donde los valores válidos
#  para los campos son los siguientes:
#  
#  * Columna 1: `DD/MM/AA`.
#  * Columna 2: `A`, `B`, `C`. `\N` indica NULL.
#  * Columna 3: Número entero. `\N` indica NULL.
#  * Columna 4: Número decimal. `\N` indica NULL.
#  
#  
#  Usted debe escribir un script en bash que use sed para que realice 
#  las siguientes acciones:
#    
#  * Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
#  
#  * Transforme el archivo para que todos los campos nulos aparezcan como `\N`.
#  
#  * Reemplace los `;` por `,`.
#  
#  * Use el `.` para indicar decimales.
#
#  El resultado del script se escribe en pantalla.
#
#  El programa se llamara por el evaluador tal como se indica a continuación:
#
#  $ bash question.sh data.csv > output.csv
#  
#  Rta/
#  2013-03-12,A,1,100.0
#  ...
#  2014-09-01,A,3,100.4
#
#  >>> Escriba su codigo a partir de este punto <<<
#

sed '12 s/\([0-9]\/\)/0\1/ g' data.csv > salida1.csv # poner en el mismo formato de día y mes a la línea 12

sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\);/\1\/\2\/20\3;/1g' salida1.csv > salida2.csv #Para formatear la fecha

sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\);/\3-\2-\1;/1g' salida2.csv > salida3.csv

sed -e 's/\(.*\)/\U\1/' salida3.csv > salida4.csv  # Cambiar minusculas por mayusculas

sed 's/;N/;\\N/g' salida4.csv > salida5.csv # Cambiar N por \N

sed 's/;;/;\\N;/g' salida5.csv > salida6.csv

#sed 's/N;/\\N;/g' salida6.csv > salida7.csv

sed 's/;$/;\\N/' salida6.csv > salida7.csv

sed 's/,/./g' salida7.csv > salida8.csv

sed 's/;/,/g' salida8.csv

rm salida*.csv