/*CREATE TABLE AS
Cria uma nova tabela e a preenche
com os dados retornados por uma busca.

Sintaxe:

CREATE TABLE new_table_name
AS query;

Cria a tabela com o nome e em seguida entrega
a busca cujo resultado é adicionado à tabela
após o keyword.

Também é possível gerar uma tabela temporária
e uma unlogged

CREATE TEMP TABLE new_table_name AS query;

CREATE UNLOGGED TABLE new_table_name
AS query;

Também é possível renomear o nome das colunas(atributos):

CREATE UNLOGGED TABLE new_table_name
AS query;

*/
\c dvdrental

/*Exemplos*/

/*EX1*/
CREATE TABLE action_film AS

SELECT
    film_id,
    title,
    release_year,
    length,
    rating
FROM
    film
INNER JOIN film_category USING (film_id)
WHERE
    category_id = 1;

SELECT * FROM action_film WHERE CAST(rating AS VARCHAR) LIKE 'PG%' ORDER BY title;
\d action_film;
/*OBS: Para converter dados de um tipo para outro, utiliza-se o comando cast*/
/*OBS: para verificar a estrutura de uma tabela, basta utilizar o comando \d */
DROP TABLE action_film;

/*OBS: SELECT INTO */








