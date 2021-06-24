/*LIMIT

PostgreSQL LIMIT restringe o número
de linhas retornadas por uma busca.

Exemplo:

SELECT select_list 
FROM table_name
ORDER BY sort_expression
LIMIT row_count

*/

\c dvdrental
/*Exemplo 1: verificando o comando LIMIT para uma busca simples
SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	title
LIMIT 5;

*/
/* Exemplo 2 - Usando LIMIT com OFFSET. OFFSET translada a tabela 
SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	film_id
LIMIT 4 OFFSET 3;

*/

/*Exemplo 4: */

SELECT
	film_id,
	title,
	rental_rate
FROM
	film
ORDER BY
	rental_rate DESC
LIMIT 10;