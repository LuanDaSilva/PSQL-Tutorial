/*
Exportando dados de uma tabela CSV

Sintaxe:

COPY sample_table_name
FROM 'path do csv' 
DELIMITER ',' 
CSV HEADER;


*/
CREATE TABLE persons (
  id SERIAL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  email VARCHAR(255),
  PRIMARY KEY (id)
);
COPY persons(first_name,last_name,dob,email) FROM '/tmp/persons.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM persons;
COPY persons(first_name,last_name,dob,email) TO '/tmp/first_copy_persons.csv' DELIMITER ',' CSV HEADER;
COPY persons(first_name,last_name,email) TO '/tmp/second_copy_persons.csv' DELIMITER ',' CSV HEADER;

\copy (SELECT * FROM persons) to '/tmp/outter_persons_client.csv' with csv
/*OBS: para bases remotas, basta utilizar \copy ao invés de COPY*/
DROP TABLE persons;