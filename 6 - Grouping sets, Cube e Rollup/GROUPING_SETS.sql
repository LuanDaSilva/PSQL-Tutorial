/*GROUPING SETS

Um conjunto de agrupamento é um conjunto 
de colunas agrupáveis por meio do comando 
GROUP BY.

Um conjunto de agrupamento é denotado por uma
lista de colunas separadas por vírgulas postas 
entre parêntesis

(column1, column2, ...)

SINTAXE do GROUPING:

GROUPING( column_name | expression)

O comando GROUPING atribui 0 quando seu argumento
é um membro do conjunto de agrupamento e 1, caso contrário.

*/
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (brand, segment)
);

INSERT INTO sales (brand, segment, quantity)
VALUES
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300);
/*EX1
SELECT 
    brand,
    segment,
    SUM(quantity)
FROM
    sales
GROUP BY 
    brand,
    segment;
SELECT SUM(quantity) FROM sales;
*/
/*EX2 - FORMA BURRA (SEM GROUPING)

SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment

UNION ALL

SELECT
    brand,
    NULL,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand

UNION ALL

SELECT
    NULL,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment

UNION ALL

SELECT
    NULL,
    NULL,
    SUM (quantity)
FROM
    sales;
    */
/*Ex3
SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
ORDER BY
	brand,
	segment;*/
/*EX4
SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
HAVING GROUPING(brand) = 0	
ORDER BY
	brand,
	segment;
SELECT * FROM sales;*/
DROP TABLE sales;