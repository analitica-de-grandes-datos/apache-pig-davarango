/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' USING PigStorage('\t') as (a:chararray,b:chararray,c:int);
groupdata = GROUP lines BY a;
sumdata = foreach groupdata generate group, COUNT(lines.c);
STORE sumdata INTO 'output' USING PigStorage (',');