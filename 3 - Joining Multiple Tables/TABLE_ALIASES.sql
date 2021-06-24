/*Table Aliases e JOINs
Um alias é um nome temporário atribuído a uma tabela.

sintaxe:

table_name AS alias_name;

OU

table_name alias_name
*/

/*EX1: Inner Join*/
\c dvdrental
/*OBS para chamar um atributo de uma tabela, utiliza-se o seguinte:
tabela.coluna*/
/*Ex1 Sem o Alias
SELECT
	customer.customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	customer
INNER JOIN payment 
    ON payment.customer_id = customer.customer_id
ORDER BY payment_date;*/
/*Ex2: com o Alias
SELECT
	c.customer_id,
	first_name,
	last_name,
	email,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p 
    ON p.customer_id = c.customer_id
WHERE
    c.customer_id = 2;
*/
/*Comando USING: útil quando
duas tabelas possuem o mesmo atributo.
É uma alternativa ao uso do alias
SELECT
	customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	customer
INNER JOIN payment USING(customer_id)
ORDER BY payment_date;
*/
/*Uso de JOIN sequenciais

SELECT
	c.customer_id,
	c.first_name customer_first_name,
	c.last_name customer_last_name,
	s.first_name staff_first_name,
	s.last_name staff_last_name,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p 
    ON p.customer_id = c.customer_id
INNER JOIN staff s 
    ON p.staff_id = s.staff_id
ORDER BY payment_date;
*/

SELECT
	c.customer_id,
	c.first_name || ' ' || c.last_name  AS "customer full name",
	s.first_name || ' ' || s.last_name  AS "staff full name",
	amount,
	payment_date
FROM
	customer AS c
INNER JOIN payment AS  p 
    ON p.customer_id = c.customer_id
INNER JOIN staff s 
    ON p.staff_id = s.staff_id
ORDER BY payment_date;



