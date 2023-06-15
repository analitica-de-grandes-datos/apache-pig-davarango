/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' USING PigStorage('\t') AS (a:chararray, b:bag{}, c:map[]);
data = FOREACH lines GENERATE a, COUNT(b) AS b, SIZE(c) AS c;
sortdata = ORDER data BY a,b,c;
STORE sortdata INTO 'output' USING PigStorage (',');