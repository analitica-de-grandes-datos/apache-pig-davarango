/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' USING PigStorage('\t') AS (a:chararray, b:bag{}, c:chararray);
flatdata = FOREACH lines GENERATE FLATTEN(b) AS b;
groupdata = GROUP flatdata BY b;
sum = FOREACH groupdata GENERATE group AS b, COUNT(flatdata.b);
STORE sum INTO 'output' USING PigStorage (',');