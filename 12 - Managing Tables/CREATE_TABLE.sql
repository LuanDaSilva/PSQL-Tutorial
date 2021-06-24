/*CREATE TABLE

Introdução

Uma base relacional consiste 
em um conjunto de múltiplas tabelas
mutuamente relacionadas.

Uma tabela consiste em linhas e 
colunas. As tabelas permitem o
armazenamento de dados estruturados
como usuários, produtos, funcionários,
etc.

Para criar uma nova tabela, 
usa-se a seguinte sintaxe:

CREATE TABLE [IF NOT EXISTS] table_name (
   column1 datatype(length) column_contraint,
   column2 datatype(length) column_contraint,
   column3 datatype(length) column_contraint,
   table_constraints
);

Restrições:

NOT NULL - garante que o valor das 
colunas não seja nulo.

UNIQUE - garante os valores numa
coluna únicas ao longo das linhas
de uma mesma tabela.

PRIMARY KEY - uma chave primária
unicamente define as linhas de 
uma tabela. Uma tabela pode ter 
uma e apenas uma chave primária. 
A restrição de chave primária permite
que se defina a chave primária de
uma tabela.

CHECK - Uma restrição do tipo CHECK
garante que os dados satisfaçam uma 
expressão booleanas.

FOREIGN KEY - garante que 
valores numa coluna ou num grupo de
colunas de uma tabela existam
numa coluna ou num grupo de colunas
doutra tabela. Contrária a chave primária,
uma tabela pode ter diversas chaves
estrangeiras.

*/

/*Exemplos*/

/*EX1: criando uma tabela de contas*/

CREATE TABLE IF NOT EXISTS accounts (
   user_id serial PRIMARY KEY,
   username VARCHAR(50) UNIQUE NOT NULL,
   password VARCHAR(50) NOT NULL,
   created_on TIMESTAMP NOT NULL,
   last_login TIMESTAMP
);

CREATE TABLE roles(
    role_id serial PRIMARY KEY,
    role_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE account_roles(
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    grant_date TIMESTAMP,
    PRIMARY KEY (user_id,role_id),
    FOREIGN KEY(role_id)
    REFERENCES roles (role_id),
    FOREIGN KEY (user_id)
    REFERENCES accounts (user_id)
);


DROP TABLE accounts,account_roles,roles