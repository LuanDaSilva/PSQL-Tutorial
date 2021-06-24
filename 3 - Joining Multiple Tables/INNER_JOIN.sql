/*INNER JOIN*/
/*
CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	manager_id INT,
	FOREIGN KEY (manager_id) 
	REFERENCES employee (employee_id) 
	ON DELETE CASCADE
);
INSERT INTO employee (
	employee_id,
	first_name,
	last_name,
	manager_id
)
VALUES
	(1, 'Windy', 'Hays', NULL),
	(2, 'Ava', 'Christensen', 1),
	(3, 'Hassan', 'Conner', 1),
	(4, 'Anna', 'Reeves', 2),
	(5, 'Sau', 'Norman', 2),
	(6, 'Kelsie', 'Hays', 3),
	(7, 'Tory', 'Goff', 3),
	(8, 'Salley', 'Lester', 3);

SELECT
    e.first_name || ' ' || e.last_name AS employee,
    m.first_name || ' ' || m.last_name AS manager
FROM
    employee AS e
*/
/*EX1
INNER JOIN employee AS m ON m.employee_id = e.manager_id
ORDER BY manager;
 */

/*EX2
LEFT JOIN employee m ON m .employee_id = e.manager_id
ORDER BY manager;
*/
/*
DROP TABLE employee;
*/
/*EX3 */

\c dvdrental
SELECT
    f1.title AS "title",
    f2.title,
    f1.length AS "length(s)"
FROM
    film f1
INNER JOIN film f2 
    ON f1.film_id <> f2.film_id AND 
       f1.length = f2.length
ORDER BY f1.title;
