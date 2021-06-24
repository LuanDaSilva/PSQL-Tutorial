\c dvdrental
/*SEM ALIAS
SELECT
	film.film_id,
	title,
	inventory_id
FROM
	film
LEFT JOIN inventory 
    ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL
ORDER BY title;*/
/*COM ALIAS
SELECT
	f.film_id,
	title,
	inventory_id
FROM
	film AS f
LEFT JOIN inventory AS i
    ON i.film_id = f.film_id
WHERE i.film_id IS NULL
ORDER BY title;
*/
/*ALIAS e USING*/
SELECT
	f.film_id,
	title,
	inventory_id
FROM
	film f
LEFT JOIN inventory i USING (film_id)
WHERE i.film_id IS NULL
ORDER BY title;
