/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.csv' USING PigStorage(',') AS (id:chararray, name:chararray, lastname:chararray, birth:DateTime, color:chararray, qty:chararray);
grouped = GROUP lines BY GetYear(birth);
con = FOREACH grouped GENERATE group as g, COUNT(lines.name) AS qty;
STORE con INTO 'output' USING PigStorage (',');
