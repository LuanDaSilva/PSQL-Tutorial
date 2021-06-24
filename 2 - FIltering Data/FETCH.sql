/*FETCH  é o comando padrão SQL, tendo
a mesma função de LIMIT. 

A sintaxe para o FETCH é a seguinte:

OFFSET start { ROW | ROWS }
FETCH { FIRST | NEXT } [ row_count ] { ROW | ROWS } ONLY

 "|" indica que os comanos são intercambiáveis
*/
/*OFFSET translada os resultados num dado
número de linhas*/

\c dvdrental
/*Exemplo 1*/
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
OFFSET 5 ROWS
FETCH FIRST 5 ROWS ONLY;
