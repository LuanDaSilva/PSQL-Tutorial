/*Operador ALL
Permite uma busca comparando um valor com 
uma lista de valores retornada de uma sub-busca.

Sintaxe:

comparison_operator ALL (subquery)
*/
\c dvdrental
/*EX0 - Detalhamento da subquery

SELECT
    ROUND(AVG(length), 2) avg_length
FROM
    film
GROUP BY
    rating
ORDER BY
    avg_length DESC;
*/

/*EX1 - Primeiro uso de ALL*/
SELECT
    film_id,
    title,
    length
FROM
    film
WHERE
    length > ALL (
            SELECT
                ROUND(AVG (length),2)
            FROM
                film
            GROUP BY
                rating
    )
ORDER BY
    length DESC;
