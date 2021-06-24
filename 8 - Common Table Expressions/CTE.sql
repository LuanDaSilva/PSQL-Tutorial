/*CTE
Common Table Expression

É um resultado temporário que pode 
ser referenciado dentro de outra busca 
utilizando SELECT,INSERT,UPDATE e DELETE

É uma boa forma de se estabelecer uma
subquery e chamá-la de modo mais legível
possível.

WITH cte_name (column_list) AS (
    CTE_query_definition 
)
statement;

*/
\c dvdrental
/*EX1 - CTE 1
WITH cte_film AS (
    SELECT 
        film_id, 
        title,
        (CASE 
            WHEN length < 30 THEN 'Short'
            WHEN length < 90 THEN 'Medium'
            ELSE 'Long'
        END) length    
    FROM
        film
)
SELECT
    film_id,
    title,
    length
FROM 
    cte_film
WHERE
    length = 'Long'
ORDER BY 
    title; 
*/
/*EX2 - CTE2
WITH cte_film AS (
    SELECT 
        film_id, 
        title,
        (CASE 
            WHEN length < 30 
                THEN 'Short'
            WHEN length >= 30 AND length < 90 
                THEN 'Medium'
            WHEN length >=  90 
                THEN 'Long'
        END) AS length    
    FROM
        film
)

SELECT
    film_id,
    title,
    length
FROM 
    cte_film
WHERE
    length = 'Long'
ORDER BY 
    title; 
*/
/*EX3 - cte com count 
WITH cte_rental AS (
    SELECT staff_id,
        COUNT(rental_id) rental_count
    FROM   rental
    GROUP  BY staff_id
)
SELECT s.staff_id,
    first_name,
    last_name,
    rental_count
FROM staff s
    INNER JOIN cte_rental USING (staff_id); */

WITH cte_film AS  (
    SELECT film_id,
        title,
        rating,
        length,
        RANK() OVER (
            PARTITION BY rating
            ORDER BY length DESC) 
        AS length_rank
    FROM 
        film
)
SELECT *
FROM cte_film
WHERE length_rank = 1;