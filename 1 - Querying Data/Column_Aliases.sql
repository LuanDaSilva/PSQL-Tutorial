\c dvdrental
/*Uncomment any parts to run it. Don't forget this in the next tutorials!TESTING SYNCHRONIZATION!!!*/
/*
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC;

SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name DESC;


SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;
*/

SELECT 
	first_name,
	LENGTH(first_name) AS len
FROM
	customer
ORDER BY 
	len ASC;
