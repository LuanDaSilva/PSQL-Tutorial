/*UPDATE
O comando UPDATE permite a modificação dos
dados na tabela.

Sintaxe:

UPDATE table_name
SET column1 = value1,
    column2 = value2,
    ...
WHERE condition;

Quando o UPDATE é bem sucedido,
há o retorno do seguinte: UPDATE count, que 
retorna o número de linhas preservadas.

UPDATE retornando as linhas modificadas:

UPDATE table_name
SET column1 = value1,
    column2 = value2,
    ...
WHERE condition
RETURNING * | output_expression AS output_name;

*/

DROP TABLE IF EXISTS courses;

CREATE TABLE courses(
	course_id serial primary key,
	course_name VARCHAR(255) NOT NULL,
	description VARCHAR(500),
	published_date date
);

INSERT INTO 
	courses(course_name, description, published_date)
VALUES
	('PostgreSQL for Developers','A complete PostgreSQL for Developers','2020-07-13'),
	('PostgreSQL Admininstration','A PostgreSQL Guide for DBA',NULL),
	('PostgreSQL High Performance',NULL,NULL),
	('PostgreSQL Bootcamp','Learn PostgreSQL via Bootcamp','2013-07-11'),
	('Mastering PostgreSQL','Mastering PostgreSQL in 21 Days','2012-06-30');

SELECT * FROM courses;

UPDATE courses
SET published_date = '2020-08-01',
    description = 'A comprehensive guide to high performance SQL'
WHERE course_id = 3
RETURNING * ;

SELECT * FROM courses;

DROP TABLE  courses;