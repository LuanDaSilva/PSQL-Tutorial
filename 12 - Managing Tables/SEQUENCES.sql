/*SEQUÊNCIAS
Por definição, uma sequência é uma lista ordenada
de número inteiros. A ordem dos número é importante.
Logo {1,2,3} é diferente da sequência {3,1,2}

Sintaxe:

CREATE SEQUENCE [ IF NOT EXISTS ] sequence_name
    [ AS { SMALLINT | INT | BIGINT } ]
    [ INCREMENT [ BY ] increment ]
    [ MINVALUE minvalue | NO MINVALUE ] 
    [ MAXVALUE maxvalue | NO MAXVALUE ]
    [ START [ WITH ] start ] 
    [ CACHE cache ] 
    [ [ NO ] CYCLE ]
    [ OWNED BY { table_name.column_name | NONE } ]

*/
/*EX: criando uma sequência crescente, de 5 em 5,
começando em 100*/

CREATE SEQUENCE mysequence 
START 100
INCREMENT BY 5;


/*SELECT * FROM mysequence;*/

SELECT nextval('mysequence');
SELECT nextval('mysequence');
SELECT nextval('mysequence');
SELECT nextval('mysequence');
SELECT nextval('mysequence');
SELECT nextval('mysequence');

DROP SEQUENCE mysequence;
/*EX2: gera uma sequência decrescente.
*/
CREATE SEQUENCE three
INCREMENT -1
MINVALUE 1
MAXVALUE 3
START 3
CYCLE;
/*nextval: obtém o próximo valor na sequência.*/
SELECT nextval('three');
SELECT nextval('three');
SELECT nextval('three');
SELECT nextval('three');
SELECT nextval('three');

DROP SEQUENCE three;

CREATE TABLE order_details(
    order_id SERIAL,
    item_id INT NOT NULL,
    item_text VARCHAR NOT NULL,
    price DEC(10,2) NOT NULL,
    PRIMARY KEY(order_id, item_id)
);

CREATE SEQUENCE order_item_id
START 10
INCREMENT 10
MINVALUE 10
OWNED BY order_details.item_id;

INSERT INTO 
    order_details(order_id, item_id, item_text, price)
VALUES
    (100, nextval('order_item_id'),'DVD Player',100),
    (100, nextval('order_item_id'),'Android TV',550),
    (100, nextval('order_item_id'),'Speaker',250);

SELECT
    order_id,
    item_id,
    item_text,
    price
FROM
    order_details;  

/*Listando todas as sequências numa base de dados*/
SELECT
    relname sequence_name
FROM 
    pg_class 
WHERE 
    relkind = 'S';

/*OBS drop table remove as sequências relacionadas à tabela removida.*/


/*Excluindo o SEQUENCE
DROP SEQUENCE [ IF EXISTS ] sequence_name [, ...] 
[ CASCADE | RESTRICT ];

CASCADE - descarta recursivamente os objetos que
dependem da sequência e os objetos dependentes 
de outros objetos e por aí vai.

*/
DROP SEQUENCE order_item_id;
DROP TABLE order_details;



