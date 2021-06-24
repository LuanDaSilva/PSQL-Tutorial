/*SQL UNION
O operador união combina os
resultados de duas ou mais 
instruções

Sintaxes:

SELECT select_list_1
FROM table_expresssion_1
UNION
SELECT select_list_2
FROM table_expression_2

Para funcionar, o comando deve 
respeitar as seguintes regras:

O número e a ordem das colunas nas
listas selecionadas nas buscas
devem ser as mesmas

Os tipos de dados precisam ser 
compatíveis.

Na prática, usa-se o operador UNIÃO
para combinar dados de tabelas 
similares não perfeitamente
normalizadas no estoque de dados

UNION ALL - não remove os repetidos!
*/

CREATE TABLE top_rated_films(
    title VARCHAR NOT NULL,
    release_year SMALLINT
);

CREATE TABLE most_popular_films(
    title VARCHAR NOT NULL,
    release_year SMALLINT
);

INSERT INTO
    top_rated_films(title,release_year)
VALUES
    ('The Shawshank Redemption',1994),
    ('The Godfather',1972),
    ('12 Angry Men',1957);
INSERT INTO 
    most_popular_films(title,release_year)
VALUES
    ('An American Pickle',2020),
    ('The Godfather',1972),
    ('Greyhound',2020);
/*EX1 - UNION
SELECT * FROM top_rated_films
UNION
SELECT * FROM most_popular_films;

*/
/*EX2 - UNION ALL
SELECT * FROM top_rated_films
UNION ALL  SELECT * FROM most_popular_films 
ORDER BY title;*/

DROP TABLE top_rated_films,most_popular_films;