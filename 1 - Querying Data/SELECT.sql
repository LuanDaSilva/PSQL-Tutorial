\c dvdrental

SELECT first_name FROM customer;/* Escolhe a coluna com o  primeiro nome da tabela customer*/
/* Escolhe as colunas: primeiro nome, o sobrenome e o email da tabela customer*/
SELECT 
    first_name,
    last_name,
    email
FROM customer;

SELECT * FROM customer; /*Seleciona todos as colunas da tabela customer*/
/* É muito mais lento que os métodos de escolha direta por coluna !!!!!*/

SELECT first_name || ' ' || last_name AS "full name",email FROM customer;
