/*Recursive Query

O Postgres fornece o comando WITH que permite a 
construção de comandos auxiliares para uma busca.

Esses comandos são comumente chamados de CTEs, 
tabelas temporárias que existem apenas durante
a execução da busca.

Uma recursive query é uma busca que se refere a 
um CTE recursivo. Esse tipo de query é útil em 
diversas situações tais como  buscar dados 
hierárquicos como struturas organizacionais, listas
de materiais, etc


Sintaxe:

WITH RECURSIVE cte_name AS(
    CTE_query_definition -- non-recursive term
    UNION [ALL]
    CTE_query definion  -- recursive term
) SELECT * FROM cte_name;

Um CTE recursivo em 3 elementos

1) Termo não recursivo: é a definição da CTE que
forma a base do resultado de busca da estrutura
CTE

2) Termo recursivo: o termo recursivo é um ou mais 
definições de buscas CTE juntas com o termo não 
recursivo usando o operador Union ou Union ALL.
O termo recursivo referencia o nome do CTE.

3) Termo de checagem: a recursão para quando não 
há linhas para retornar na iteração atual
*/

CREATE TABLE employees (
	employee_id serial PRIMARY KEY,
	full_name VARCHAR NOT NULL,
	manager_id INT
);

INSERT INTO employees (
	employee_id,
	full_name,
	manager_id
)
VALUES
	(1, 'Michael North', NULL),
	(2, 'Megan Berry', 1),
	(3, 'Sarah Berry', 1),
	(4, 'Zoe Black', 1),
	(5, 'Tim James', 1),
	(6, 'Bella Tucker', 2),
	(7, 'Ryan Metcalfe', 2),
	(8, 'Max Mills', 2),
	(9, 'Benjamin Glover', 2),
	(10, 'Carolyn Henderson', 3),
	(11, 'Nicola Kelly', 3),
	(12, 'Alexandra Climo', 3),
	(13, 'Dominic King', 3),
	(14, 'Leonard Gray', 4),
	(15, 'Eric Rampling', 4),
	(16, 'Piers Paige', 7),
	(17, 'Ryan Henderson', 7),
	(18, 'Frank Tucker', 8),
	(19, 'Nathan Ferguson', 8),
	(20, 'Kevin Rampling', 8);

WITH RECURSIVE subordinates AS (
	SELECT
		employee_id,
		manager_id,
		full_name
	FROM
		employees
	WHERE
		employee_id = 2
	UNION
		SELECT
			e.employee_id,
			e.manager_id,
			e.full_name
		FROM
			employees e
		INNER JOIN subordinates s ON s.employee_id = e.manager_id
) SELECT
	*
FROM
	subordinates;

DROP TABLE employees
