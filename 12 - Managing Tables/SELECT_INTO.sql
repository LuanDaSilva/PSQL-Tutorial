/*SELECT INTO

Cria uma nova tabela e insere os dados
retornados de uma busca na tabela.

A nova tabela terá colunas com  os nomes iguais
àqueles resultantes da busca. Diferentemente de 
um comando SELECT comum, o SELECT into, não retorna
um resultado para o cliente.

SELECT
    select_list
INTO [ TEMPORARY | TEMP | UNLOGGED ] [ TABLE ] new_table_name
FROM
    table_name
WHERE
    search_condition;
Onde:

TEMP - cria uma tabela temporária

UNLOGGED -serve para criar uma nova tabela como
uma tabela unlogged.

Uma unlogged table é aquela que não apresenta suporte
a recuperação pós-falha, não possuindo um log 
de transações. Com isso, há um ganho de desempenho
em todas as operações realizadas

WHERE permite a escolha das linhas das tabelas 
originais que serão inseridas na nova tabela.
Além do WHERE, é possível utilizar comandos como
INNER JOIN, LEFT JOIN, GROUP BY e HAVING.
*/

\c dvdrental

SELECT
    film_id,
    title,
    rental_rate
INTO TABLE film_r
FROM
    film
WHERE
    rating = 'R'
AND rental_duration = 5
ORDER BY
    title;

SELECT * FROM film_r;

DROP TABLE film_r;

SELECT
    film_id,
    title,
    length 
INTO TEMP TABLE short_film
FROM
    film
WHERE
    length < 60
ORDER BY
    title;
SELECT * FROM short_film;

