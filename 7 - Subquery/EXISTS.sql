/*operador EXISTS
Verifica a existência de linhas
numa sub-busca
Sintaxe:

EXISTS(subquery)

Convenção:

SELECT 
    column1
FROM 
    table_1
WHERE 
    EXISTS( SELECT 
                1 
            FROM 
                table_2 
            WHERE 
                column_2 = table_1.column_1);

*/
\c dvdrental

/*EX1 - Uso de EXISTS
SELECT first_name || ' ' || last_name AS "Last name"
FROM customer AS c 
WHERE EXISTS
    (
        SELECT 1
        FROM payment AS p
        WHERE p.customer_id = c.customer_id 
        AND amount > 11
    )
ORDER BY first_name,
         last_name;
*/
/*EX2: NOT EXIST - Pega o complementar
da subquery 
SELECT first_name,
       last_name
FROM customer c
WHERE NOT EXISTS
    (
        SELECT 1
        FROM payment p
        WHERE p.customer_id = c.customer_id
        AND amount > 11 
    )
ORDER BY first_name,
         last_name;*/
/*EX3 - EXISTS + NULL
Para subqueries que retornam NULL,
EXISTS retorna TRUE
*/
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS( SELECT NULL )
ORDER BY
	first_name,
	last_name;

