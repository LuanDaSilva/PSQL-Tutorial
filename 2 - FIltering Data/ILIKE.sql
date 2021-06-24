/*
Operador LIKE
*/
/*Wildcards % e _
% verifica a compatibilidade
de uma sequência com
um ou mais caracteres
_ verifica a compatiblidade com um 
único caractere.
Se o padrão não contiver um wildcard,
o comando like funciona tal qual o 
operador comparativo "=".
*/
/*Ex1: Uso básico
o marcador Jen% indica a busca com 
do padrão 'Jen' na base de dados
\c dvdrental
SELECT 
    first_name,
    last_name
FROM
    customer
WHERE
    first_name LIKE 'Jen%'
*/
/*Exemplo de Wildcards
SELECT
    'foo' LIKE 'foo',
    'foo' LIKE 'f%',
    'foo' LIKE '_o_',
    'bar' LIKE 'b_',
    'jujuba'LIKE '%ba';
*/
\c dvdrental
/*Exemplo 2: Wildcard %% combinado
SELECT 
    first_name,
    last_name
FROM
    customer
WHERE
    first_name LIKE '%er%' 
ORDER BY
    first_name;
*/

/*Ex3: Wildcards combinados _ e %
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE '_her%'
ORDER BY 
        first_name;
*/
/*
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE 'A%' 
ORDER BY 
        first_name;
*/

/*Operador ILIKE:
Análogo ao LIKE, mas insensível às
caixas alta e baixa*/
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name ILIKE 'bar%';

/*Outras formas de implementar LIKE e ILIKE
~~  = LIKE
~~* = ILIKE
!~~ = NOT LIKE 
!~~*= NOT ILIKE
*/


