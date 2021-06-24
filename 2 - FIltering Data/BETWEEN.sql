/*Operador BETWEEN
usado para buscar valores entre
dois valores

sintaxe:

value BETWEEN low AND high;

O operador BETWEEN é implementado
da seguinte forma

value >= low and value <= high;

Para verificar se um valor não se 
encontra numa faixa, basta usar o 
operador BETWEEN em conjunção com 
o operador NOT:

value NOT BETWEEN low and high;

que é análoga ao seguinte:

value < low OR value > high

*/
\c dvdrental
/*EX1: uma aplicação simples*/


SELECT
    customer_id,
    payment_id,
    amount,
    payment_id
FROM
    payment
WHERE
    amount NOT BETWEEN 8 AND 9;
