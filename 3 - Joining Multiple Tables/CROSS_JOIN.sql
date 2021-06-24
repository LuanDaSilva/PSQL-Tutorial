/*CROSS JOIN
Faz o produto cartesiano entre
as linhas de duas ou mais tabelas.
Diferentemente de suas contrapartes, 
LEFT JOIN e INNER JOIN, o CROSS JOIN
não precisa de predicados.
Se T1 tiver n linhas e T2 m, o 
resultado terá nxm linhas.

Sintaxe:
SELECT select_list
FROM T1
CROSS JOIN T2;

que é análogo a 

SELECT select_list
FROM T1, T2;

SELECT *
FROM T1
INNER JOIN T2 ON true;
*/

CREATE TABLE T1 (label CHAR(1) PRIMARY KEY);

CREATE TABLE T2 (score INT PRIMARY KEY);

INSERT INTO T1 (label)
VALUES
	('A'),
	('B'),
    ('C');

INSERT INTO T2 (score)
VALUES
	(1),
	(2),
	(3),
    (4);

SELECT *
FROM T1
CROSS JOIN T2;

DROP TABLE T1,T2;