/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       LOCATE('ia', firstname) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.csv' USING PigStorage(',') AS (id:chararray, name:chararray, lastname:chararray, birth:chararray, color:chararray, qty:chararray);
data = FOREACH lines GENERATE INDEXOF(name, 'ia', 0);
STORE data INTO 'output' USING PigStorage (',');
