/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' USING PigStorage('\t') AS (a:chararray, b:bag{}, c:map[]);
flatdata = FOREACH lines GENERATE FLATTEN(c) AS c;
groupdata = GROUP flatdata BY c;
sum = FOREACH groupdata GENERATE group AS c, COUNT(flatdata.c);
STORE sum INTO 'output' USING PigStorage (',');
