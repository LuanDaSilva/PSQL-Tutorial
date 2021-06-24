/*EXCEPT
Retorna uma busca com os elementos que não estão
na tabela à direita.

Sintaxe:

SELECT select_list
FROM A
EXCEPT 
SELECT select_list
FROM B;

*/

/*INTERSECT
Sintaxe:

SELECT select_list
FROM A
INTERSECT
SELECT select_list
FROM B
ORDER BY sort_expression;

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


SELECT *
FROM top_rated_films 
EXCEPT
SELECT *
FROM most_popular_films
ORDER BY title;

DROP TABLE top_rated_films,most_popular_films;