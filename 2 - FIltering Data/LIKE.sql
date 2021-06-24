/*Operadores LIKE e ILIKE
Busca na base de dados um valor
semelhante a uma dada entrada
*/

\c dvdrental
SELECT
    first_name,
    last_name
FROM
    customer
WHERE 
    first_name LIKE 'J%' 
    AND
    last_name NOT LIKE 'J%'
    ORDER BY first_name LIMIT 25;