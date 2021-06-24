/*GROUP BY
sintaxe:
SELECT 
   column_1, 
   column_2,
   ...,
   aggregate_function(column_3)
FROM 
   table_name
GROUP BY 
   column_1,
   column_2,
   ...;
*/

\c dvdrental
/*EX1 - uso básico
SELECT
   customer_id
FROM
   payment
GROUP BY
   customer_id;
*/
/*EX2
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id;
*/
/*EX3 - ALIAS + GROUP BY
SELECT
	customer_id,
	SUM (amount) AS total_debt
FROM
	payment
GROUP BY
	customer_id    
ORDER BY 
    total_debt;
*/
/*EX 4 - GROUP BY + INNER JOIN
SELECT
	first_name || ' ' || last_name AS full_name,
	SUM (amount) AS amount
FROM
	payment
INNER JOIN customer USING (customer_id)    	
GROUP BY
	full_name
ORDER BY amount DESC;

*/
/*EX5 - GROUP BY + COUNT()
SELECT
	staff_id,
	COUNT (payment_id)
FROM
	payment
GROUP BY
	staff_id;
*/
/*EX6 -  GROUP BY Múltiplo
SELECT 
	customer_id, 
	staff_id, 
	SUM(amount) 
FROM 
	payment
GROUP BY 
	staff_id, 
	customer_id
ORDER BY 
    customer_id;
*/

/*EX7 - GROUP BY & DATE */

SELECT 
	DATE(payment_date) AS paid_date, 
	SUM(amount) AS sum
FROM 
	payment
GROUP BY
	paid_date
ORDER BY
    sum DESC;