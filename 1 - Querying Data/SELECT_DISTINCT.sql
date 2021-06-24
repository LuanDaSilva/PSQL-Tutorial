CREATE TABLE distinct_demo (
	id serial NOT NULL PRIMARY KEY,
	bcolor VARCHAR,
	fcolor VARCHAR
);

INSERT INTO distinct_demo (bcolor, fcolor)
VALUES
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');
/*EX 1
SELECT
	id,
	bcolor,
	fcolor
FROM
	distinct_demo ;*/
/*EX 2
SELECT
	DISTINCT bcolor
FROM
	distinct_demo
ORDER BY
	bcolor;
DROP TABLE distinct_demo;
*/
/*EX 3 AVALIA AS LINHAS ÚNICAS

SELECT
	DISTINCT bcolor,fcolor
FROM 
	distinct_demo
ORDER BY
	bcolor,
	fcolor;
*/
/*EX 4 DISTINCT ON seleciona as
primeiras linhas não repetidas de bcolor*/
SELECT 
	DISTINCT ON (bcolor) bcolor,fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;
DROP TABLE distinct_demo;