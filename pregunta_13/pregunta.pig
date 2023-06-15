/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
lines = LOAD 'data.csv' USING PigStorage(',') AS (id:chararray, name:chararray, lastname:chararray, birth:chararray, color:chararray, qty:chararray);
filt = FILTER lines BY (INDEXOF('b', SUBSTRING(color, 0, 1)) == 0);
data = FOREACH filt GENERATE color;
STORE data INTO 'output' USING PigStorage (',');
