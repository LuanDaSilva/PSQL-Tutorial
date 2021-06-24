/*Operador in
Usa-se este operador em conjunção com
Where para chegar se um valor bate
outro presente numa lista de valores*/

/*
A lista de valores pode ser uma lista de
valores literais como números strings
ou até mesmo resultados de outra query.
Nesse caso, a query mais interna é chamada
subquery

Ex:
value IN (SELECT column_name FROM table_name);

*/
\c dvdrental
/*Ex1 uso simples de IN
SELECT customer_id,
    rental_id,
    return_date
FROM
    rental
WHERE 
    customer_id IN (1,2)
ORDER BY
    return_date DESC;
*/
/*Ex2 uso de operadores lógicos e 
comparativos
SELECT 
    rental_id,
    customer_id,
    return_date
FROM
    rental
WHERE
    customer_id = 1 OR customer_id = 2
ORDER BY
    return_date DESC;
*/

/*Ex3: Uso de NOT junto do operador IN
SELECT
    customer_id,
    rental_id,
    return_date
FROM
    rental
WHERE
    customer_id NOT IN (1,2);
*/
/*Ex4: Equivalente ao NOT IN com
operadores comparativos
(ESCALA MUITO MAL!)

SELECT 
    customer_id,
    rental_id,
    return_date
FROM 
    rental
WHERE
    customer_id <> 1 AND customer_id <> 2;
*/

/*Ex5: IN em uma subquery

CAST converte um valor de qualquer
tipo noutro especificado

SELECT customer_id
FROM rental
WHERE CAST (return_date AS DATE) = '2005-05-27'
ORDER BY customer_id;

*/
/*Ex5: Nested*/
SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
WHERE
	customer_id IN (
		SELECT customer_id
		FROM rental
		WHERE CAST (return_date AS DATE) = '2005-05-27'
	)
ORDER BY customer_id;
