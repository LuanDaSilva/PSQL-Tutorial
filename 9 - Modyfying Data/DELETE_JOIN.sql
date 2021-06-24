/*DELETE JOIN

O PSQL não apresenta esta funcionalidade;
todavia, é possível emulá-la através da 
sintaxe:

DELETE FROM table_name1
USING table_expression
WHERE condition
RETURNING returning_columns;

DELETE FROM t1
USING t2
WHERE t1.id = t2.id

*/

CREATE TABLE contacts(
   contact_id serial PRIMARY KEY,
   first_name varchar(50) NOT NULL,
   last_name varchar(50) NOT NULL,
   phone varchar(15) NOT NULL
);


CREATE TABLE blacklist(
    phone varchar(15) PRIMARY KEY
);


INSERT INTO contacts(first_name, last_name, phone)
VALUES ('John','Doe','(408)-523-9874'),
       ('Jane','Doe','(408)-511-9876'),
       ('Lily','Bush','(408)-124-9221');


INSERT INTO blacklist(phone)
VALUES ('(408)-523-9874'),
       ('(408)-511-9876');
/*EX1: USO BÁSICO DE DELETE JOIN
DELETE FROM contacts USING blacklist
WHERE contacts.phone= blacklist.phone
RETURNING *;
*/

SELECT * FROM contacts;

/*DELETE JOIN com uma subquery

DELETE FROM contacts
WHERE phone IN (SELECT phone FROM blacklist);

SELECT * FROM contacts LIMIT 5;
*/

/*DELETE JOIN COM UMA CTE*/

WITH cte_blacklist AS (SELECT phone FROM blacklist)

DELETE FROM contacts WHERE phone IN (SELECT * FROM cte_blacklist);

SELECT * FROM contacts;

DROP TABLE contacts,blacklist;