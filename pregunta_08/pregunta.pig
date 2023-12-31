/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' USING PigStorage('\t') AS (a:chararray, b:bag{}, c:map[]);
flatdata = FOREACH lines GENERATE FLATTEN(b) AS b, FLATTEN(c) AS c;
groupdata = GROUP flatdata BY (b,c);
sum = FOREACH groupdata GENERATE group AS cuenta, COUNT(flatdata.c);
STORE sum INTO 'output' USING PigStorage (',');
