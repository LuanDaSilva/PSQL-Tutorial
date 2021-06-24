/*Operador ANY
Compara um valor em questão 
com uma série de valores retornados
por uma sub-busca.
Sintaxe:
expresion operator ANY(subquery)

OBS:

Retorna apenas uma coluna
O ANY é precedido por operadores de 
comparação

Retorna True se houver correspondência
e false caso contrário.

Pode ser usado SOME no seu lugar.
*/
\c dvdrental
/*EX0 - Detalhando a subquery*/
SELECT 
        MAX (length )
    FROM   
        film
    INNER JOIN film_category
        USING(film_id)
    GROUP BY 
        category_id;

/*EX1 - Uso básico do ANY
com uma subquery
SELECT film.title
FROM film
WHERE film.length>= ANY(
    SELECT 
        MAX ( film.length )
    FROM   
        film
    INNER JOIN film_category
        USING(film_id)
    GROUP BY 
        category_id
);
*/
/*EX2 - IN é equivalente
a = ANY 

SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id = ANY(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );
*/
/*EX3 - Uso de IN
SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id IN(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );
*/
