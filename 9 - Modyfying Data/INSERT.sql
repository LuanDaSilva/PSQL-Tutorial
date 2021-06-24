/*
INSERT - insere uma nova linha
numa tabela.
Sintaxe:

INSERT INTO table_name(column1, column2, …)
VALUES (value1, value2, …);

Estrutura do insert:
INSERT oid count
onde: oid - identificador do objeto

RETURNING - devolve a informação
da linha inserida

Opções:
1)INSERT INTO table_name(column1, column2, …)
VALUES (value1, value2, …)
RETURNING *;

2)INSERT INTO table_name(column1, column2, …)
VALUES (value1, value2, …)
RETURNING id;

para renomear basta usar: AS output_name

INSERT INTO table_name(column1, column2, …)
VALUES (value1, value2, …)
RETURNING output_expression AS output_name;

*/

/*DROP TABLE IF EXISTS links;*/
/*OBS: quando não há a restrição
após a declaração da variável, 
o PostgreSQL preenche os campos
com NULL. Caso contrário, há
um erro*/

/*
Obs: para adicionar um texto
que tem ', basta adicionar um 
novo apóstrofo
*/
CREATE TABLE links 
(
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255),
        last_update DATE
);
INSERT INTO links (url, name)/*,description,last_update)*/
VALUES('https://www.postgresqltutorial.com',
        'PostgreSQL Tutorial'/*,
        'Just a dummy description',
        '18/05/2021'*/
        )
RETURNING *; /*Retorna tudo, mas poderia retornar url, nome ou qualquer outra variável*/
INSERT INTO links(url,name)
VALUES('http://www.oreilly.com','O''Reilly Media') RETURNING *;
INSERT INTO links (url, name, last_update)
VALUES('https://www.google.com','Google','2013-06-01') RETURNING *;
SELECT * FROM links;
DROP TABLE links;



