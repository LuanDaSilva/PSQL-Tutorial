/*HAVING
Especifica uma cnodição de busca
para um grupo ou um agregado. 
A cláusula HAVE é frequentemente
utilizada com GROUP BY para filtrar
grupos ou agregados baseando-se
numa condição específica.

Sintaxe:

SELECT
	column1,
	aggregate_function (column2)
FROM
	table_name
GROUP BY
	column1
HAVING
	condition;
HAVING x WHERE

WHERE aplica-se às linhas ao 
passo que HAVING vale para grupos
de linhas
*/
\c dvdrental
/*EX1 HAVING + SUM
SELECT
	customer_id,
	SUM (amount) 
FROM
	payment
GROUP BY
	customer_id
HAVING SUM (amount)>200;
*/
/*EX2 HAVING + COUNT*/

SELECT
	store_id,
	COUNT (customer_id)
FROM
	customer
GROUP BY
	store_id
HAVING COUNT (customer_id) > 300;
