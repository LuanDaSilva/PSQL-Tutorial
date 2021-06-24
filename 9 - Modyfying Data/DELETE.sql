/*DELETE
Permite deletar uma ou mais linhas de uma 
tabela

Sintaxe:

DELETE FROM table_name WHERE condition;

Retorna o número de linhas deletadas.
Para mais informações, basta utilizar:
DELETE FROM table_name
WHERE condition
RETURNING (select_list | *)

*/

DROP TABLE IF EXISTS links;

CREATE TABLE links (
    id serial PRIMARY KEY,
    url varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255),
    rel varchar(10),
    last_update date DEFAULT now()
);

INSERT INTO  
   links 
VALUES 
   ('1', 'https://www.postgresqltutorial.com', 'PostgreSQL Tutorial', 'Learn PostgreSQL fast and easy', 'follow', '2013-06-02'),
   ('2', 'http://www.oreilly.com', 'O''Reilly Media', 'O''Reilly Media', 'nofollow', '2013-06-02'),
   ('3', 'http://www.google.com', 'Google', 'Google', 'nofollow', '2013-06-02'),
   ('4', 'http://www.yahoo.com', 'Yahoo', 'Yahoo', 'nofollow', '2013-06-02'),
   ('5', 'http://www.bing.com', 'Bing', 'Bing', 'nofollow', '2013-06-02'),
   ('6', 'http://www.facebook.com', 'Facebook', 'Facebook', 'nofollow', '2013-06-01'),
   ('7', 'https://www.tumblr.com/', 'Tumblr', 'Tumblr', 'nofollow', '2013-06-02'),
   ('8', 'http://www.postgresql.org', 'PostgreSQL', 'PostgreSQL', 'nofollow', '2013-06-02');

SELECT * FROM links;

DELETE FROM links WHERE id = 1 RETURNING *;

SELECT * FROM links;

/*DELETANDO VÁRIAS LINHAS

DELETE FROM links WHERE id IN (7,4);*/

/*FORMA ALTERNATIVA*/

DELETE FROM links WHERE id BETWEEN 4 AND 7;

/*DELETAR TUDO

DELETE FROM links;

*/

SELECT * FROM links;

DROP TABLE links;

