/*PostgreSQL 10 apresentou uma nova
funcionalidade que permite a
atribuição de um único número 
a uma coluna

A restrição GENERATED AS IDENTITY
é uma variante da antiga coluna
serial.

Sintaxe:

column_name type GENERATED 
{ALWAYS|BY DEFAULT} AS IDENTITY
*/

/*Exemplos

CREATE TABLE color (
    color_id INT GENERATED ALWAYS AS IDENTITY,
    color_name VARCHAR NOT NULL
);

INSERT INTO color(color_name)
VALUES ('Red'),('Blue'),('Yellow');
*/
/*Inserir um ID dá conflito com o GENERATED ALWAYS
INSERT INTO color(color_id,color_name)
VALUES (4,'Purple');
*/
/*Para contornar este problema, utiliza-se 
a cláusula OVERRIDING SYSTEM VALUE
INSERT INTO color (color_id, color_name)
OVERRIDING SYSTEM VALUE 
VALUES(4, 'Purple');
SELECT * FROM color;

DROP TABLE color;
*/
/*EX2: GENERATED BY DEFAULT
CREATE TABLE color (
    color_id INT GENERATED BY DEFAULT AS IDENTITY,
    color_name VARCHAR NOT NULL
);
INSERT INTO color (color_name)
VALUES ('White');
*/
/*Com o GENERATED BY DEFAULT, 
o erro não ocorre.
INSERT INTO color(color_id,color_name)
VALUES (2,'Black');
SELECT * FROM color;
DROP TABLE color;
*/
/*Criação de índices com restrições

CREATE TABLE color (
    color_id INT GENERATED BY DEFAULT AS IDENTITY 
    (START WITH 10 INCREMENT BY 10),
    color_name VARCHAR NOT NULL
); 

INSERT INTO color (color_name)
VALUES ('Orange');

INSERT INTO color (color_name)
VALUES ('Purple');
SELECT * FROM color;

DROP TABLE color;
*/

/*Adicionando uma coluna de identidade numa
tabela já existente*/

/*Sintaxe para adicionar a coluna id 

ALTER TABLE table_name 
ALTER COLUMN column_name 
ADD GENERATED { ALWAYS | BY DEFAULT } AS IDENTITY { ( sequence_option ) }

*/

CREATE TABLE shape(
    shape_id INT NOT NULL,
    shape_name VARCHAR NOT NULL
);
ALTER TABLE shape 
    ALTER COLUMN shape_id ADD GENERATED ALWAYS AS IDENTITY;
/*INSERT INTO shape (shape_name) 
VALUES ('circle');*/

SELECT * FROM shape;
/*Removendo a restrição GENERATED AS IDENTITY*/
ALTER TABLE shape ALTER COLUMN shape_id DROP IDENTITY;

SELECT * FROM shape;

DROP TABLE shape;