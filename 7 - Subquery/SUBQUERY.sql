\c dvdrental
/*Avaliando a média de 
lucro dos filmes.
OBS: CAST - converte um tipo
de dados em outro.
DECIMAL(tot_dig,casas após a vírgula)
SELECT
	CAST(AVG (rental_rate) AS DECIMAL(5,2))
FROM
	film;
*/
/*EX1 - Achando filmes que lucraram acima da média
SELECT
    film_id,
    title,
    rental_rate
FROM 
    film 
WHERE 
    rental_rate > 2.98;

*/

/*EX2 - Utilizando subquery
As queries são executadas de dentro para fora.


SELECT
    film_id,
    title,
    rental_rate
FROM 
    film 
WHERE 
    rental_rate > (SELECT AVG(rental_rate) FROM film);

*/
/*SUBQUERY e IN
SELECT
	film_id,
	title
FROM
	film
WHERE
	film_id IN (
		SELECT
			inventory.film_id
		FROM
			rental
		INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
		WHERE
			return_date BETWEEN '2005-05-29'
		AND '2005-05-30'
	);
    */
/*SUBQUERY e EXISTS
O operador EXISTS só leva em
consideração o número de linhas 
retornados pela busca. Logo, 
a convenção para o operador é 
a seguinte:
EXISTS (SELECT 1 FROM tbl WHERE condition);

*/
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS (
		SELECT
			0
		FROM
			payment
		WHERE
			payment.customer_id = customer.customer_id
	);
