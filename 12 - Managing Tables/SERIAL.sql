/*AUTO-INCREMENT*/
/*

No Psql, uma sequencia é um tipo
especial de base de dados que
gera uma sequência de inteiros.

Uma sequência é comumente usada
como chave primária numa tabela.

Ao criar uma nova tabela, 
a sequência pode ser criada
por meio do pseudo-tipo SERIAL
como se segue:

CREATE TABLE table_name(
    id SERIAL
);

Ao assinalar o pseudotipo SERIAL
à coluna id, o psql faz o seguinte:

Primeiro, cria-se um objeto
sequencial e o próximo valor
gerado pela squência é o valor
padrão para a coluna.

Segundo, adiciona-se uma restrição
do tipo not null ao id, dado
que a sequência sempre é um 
inteiro, que por definição é
não-nulo.

Terceiro, atribui-se ao id a 
posse da sequência. Como resultado, 
o objeto sequência é deletado quando
coluna id é removida.

O que acontece é o seguinte:

CREATE SEQUENCE table_name_id_seq;

CREATE TABLE table_name (
    id integer NOT NULL DEFAULT nextval('table_name_id_seq')
);

ALTER SEQUENCE table_name_id_seq
OWNED BY table_name.id;
*/

/*EXEMPLOS*/

CREATE TABLE IF NOT EXISTS fruits(
   id SERIAL PRIMARY KEY,
   name VARCHAR NOT NULL
);

INSERT INTO fruits(name) VALUES
    ('Orange'),
    ('Apple'),
    ('Banana');
INSERT INTO fruits(id,name)
    VALUES(DEFAULT,'Pinapple') RETURNING id;
SELECT * FROM fruits;

/*Para pegar o nome de uma coluna basta utilizar 
o comando

pg_get_serial_sequence('table_name','column_name')
*/
SELECT currval(pg_get_serial_sequence('fruits','id'));
DROP TABLE fruits;

/*OBS: A operação de geração de sequências não
é à prova de transações, o que signifiac que 
se duas bases de dados concorentes tentam obter
o valor de uma chave numa sequência, cada cliente
obterá um valor diferente.*/
   
