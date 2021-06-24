\c dvdrental

/* Exemplo 1: Busca pelos nomes completos cujo primeiro nome 
	começa com An e o sobrenome começa com B por meio do wildcard %
SELECT
	first_name || ' ' || last_name AS "full name"
 
FROM
	customer
WHERE
	first_name LIKE 'An%' AND last_name LIKE 'B%'; 
*/

/*Exemplo 2: usando operador LIKE
e BETWEEN
SELECT
	first_name,
	LENGTH(first_name) AS name_length
FROM
	customer
WHERE 
	first_name LIKE 'A%' AND
	LENGTH(first_name) BETWEEN 3 AND 5
ORDER BY
	name_length;
*/
/*Exemplo 3: Utilizando operador WHERE
combinado com LIKE e operador <>
SELECT 
	first_name, 
	last_name
FROM 
	customer 
WHERE 
	first_name LIKE 'Bra%' AND 
	last_name <> 'Motley';
*/