/*UPSERT = UPDATE + INSERT
É um sinônimo para merge.
A ideia é que quando se insere
uma nova linha na tabela, o
PSQL tualizará a linha caso ela 
exista e, caso contrário, inserirá
uma nova linha. Isso é o que 
se chama de UPSERT.

Para utilizar este recurso no 
PostgreSQL, utiliza-se INSERT ON
CONFLICT como se segue:

INSERT INTO table_name(column_list) 
VALUES(value_list)
ON CONFLICT target action;

Neste contexto, target 
pode ser o seguinte:

- column_name

- ON CONSTRAINT constraint_name

- WHERE predicate

As ações podem ser as seguintes:

- DO NOTHING

- DO UPDATE SET column_1 = value_1, .. WHERE condition
atualiza alguns campos na tabela. 
*/

/*EXEMPLOS*/


/*EX1: exemplo simples*/



CREATE TABLE customers 
(
	customer_id serial PRIMARY KEY,
	name VARCHAR UNIQUE,
	email VARCHAR NOT NULL,
	active bool NOT NULL DEFAULT TRUE
);
INSERT INTO 
    customers (name, email)
VALUES 
    ('IBM', 'contact@ibm.com'),
    ('Microsoft', 'contact@microsoft.com'),
    ('Intel', 'contact@intel.com');
/*SELECT * FROM customers;*/

/*INSERT INTO customers (NAME, email)
VALUES('Microsoft','hotline@microsoft.com') 
ON CONFLICT ON CONSTRAINT customers_name_key 
DO NOTHING;*/

/*
INSERT INTO customers (name, email)
VALUES('Microsoft','hotline@microsoft.com') 
ON CONFLICT (name) 
DO NOTHING;
*/



/*Quando existe a chave no campo nome, o email novo
é adicionado. O EXCLUDED recebe a linha excluída,
pega o email e adiciona ao novo email, cujo novo
atributo é 'hotline@microsoft.com'

ON CONFLICT é o equivalente ao tratamento de exceções nas linguagens de programação
*/

INSERT INTO customers (name, email)
VALUES('Microsoft','hotline@microsoft.com')
ON CONFLICT (name) 
DO 
   UPDATE SET email = EXCLUDED.email || ';' || customers.email;

SELECT * FROM customers; 
DROP TABLE customers;