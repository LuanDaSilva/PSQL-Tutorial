/*ALTER TABLE
Sintaxe:

ALTER TABLE table_name action;

ações:

- adicionar uma coluna

Sintaxe:
ALTER TABLE table_name 
ADD COLUMN column_name datatype column_constraint;

- remover uma coluna

Sintaxe:

ALTER TABLE table_name 
DROP COLUMN column_name;

- mudar o tipo de uma coluna

- renomear uma coluna
Sintaxe:

ALTER TABLE table_name 
RENAME COLUMN column_name 
TO new_column_name;

- definir um valor padrão à coluna

ALTER TABLE table_name 
ALTER COLUMN column_name 
[SET DEFAULT value | DROP DEFAULT];

- adiciona uma restrição à coluna
Exemplo:

ALTER TABLE table_name 
ALTER COLUMN column_name 
[SET NOT NULL| DROP NOT NULL];

Exemplo 2: adição de uma restrição

ALTER TABLE table_name 
ADD CONSTRAINT constraint_name constraint_definition;


- renomeia a tabela

ALTER TABLE table_name 
RENAME TO new_table_name;

*/

/*Exemplos*/

/*EX1*/


CREATE TABLE links (
   link_id serial PRIMARY KEY,
   title VARCHAR (512) NOT NULL,
   url VARCHAR (1024) NOT NULL
);
/*Adiciona uma coluna*/

ALTER TABLE links
ADD COLUMN active boolean;

/*Remove a coluna 

ALTER TABLE links
DROP COLUMN active boolean;
*/
/*Renomeia a tabela*/

ALTER TABLE links 
RENAME COLUMN title to link_title;

ALTER TABLE links 
ADD COLUMN target VARCHAR(10);

ALTER TABLE links 
ALTER COLUMN target
SET DEFAULT '_blank';

INSERT INTO links (link_title, url)
VALUES('PostgreSQL Tutorial','https://www.postgresqltutorial.com/');

ALTER TABLE links 
ADD CONSTRAINT check_target CHECK  (target IN ('_self', '_blank', '_parent', '_top'));
/*
INSERT INTO links(link_title,url,target) 
VALUES('PostgreSQL','http://www.postgresql.org/','whatever');

SELECT * FROM links;
*/

ALTER TABLE links 
ADD CONSTRAINT unique_url UNIQUE ( url );

INSERT INTO links(link_title,url) 
VALUES('PostgreSQL','https://www.postgresqltutorial.com/');
/*
ALTER TABLE links DROP CONSTRAINT check_target;

INSERT INTO links(link_title,url,target) 
VALUES('PostgreSQL','http://www.postgresql.org/','whatever');

SELECT * FROM links;
*/

DROP TABLE  links;



