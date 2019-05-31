--INNER JOIN'S

SELECT LIVRO.TITULO, CATEGORIA.DESCRICAO, LIVRO.PRECO, AUTOR.NOME
FROM LIVRO INNER JOIN CATEGORIA
ON LIVRO.COD_CATEGORIA = CATEGORIA.COD_CATEGORIA

INNER JOIN LIVRO_AUTOR 
ON LIVRO.COD_LIVRO = LIVRO_AUTOR.COD_LIVRO

INNER JOIN AUTOR
ON AUTOR.COD_AUTOR = LIVRO_AUTOR.COD_AUTOR;

--======================================

SELECT CLIENTE.NOME, PEDIDO.VALOR_TOTAL,
PEDIDO.COD_PEDIDO, PEDIDO.DATA_PEDIDO
FROM CLIENTE INNER JOIN PEDIDO
ON CLIENTE.COD_CLIENTE = PEDIDO.COD_CLIENTE;

SELECT LIVRO.TITULO
FROM LIVRO INNER JOIN ITEM_PEDIDO
ON LIVRO.COD_LIVRO = ITEM_PEDIDO.COD_LIVRO;

--======================================
SELECT * FROM CATEGORIA;
SELECT * FROM LIVRO;
--=======================================


--22/05/2017

SELECT NOME, DT_NASCIMENTO, CIDADE FROM CLIENTE 

Order by -- ordena em ordem alfabetica, data etc.
DESC -- ordena por ordem decrescente 

SELECT NOME, DT_NASCIMENTO, CIDADE
FROM CLIENTE 
ORDER BY NOME;

ORDER BY NOME DESC
--ORDER BY DT_NASCIMENTO;
--ORDER BY NOME DESC;

COUNT -- faz a contagem que tem na tabela
SELECT COUNT (COD_CLIENTE) FROM CLIENTE;

SELECT COUNT (COD_CLIENTE) AS QUANTIDADE FROM CLIENTE;


GROUP BY -- consulta a quantidade de cidades na tabela
SELECT CIDADE, COUNT (COD_CLIENTE) AS QUANTIDADE FROM CLIENTE
GROUP BY CIDADE;

SUM -- faz soma de valores numericos
SELECT SUM (VALOR_TOTAL) AS SOMA_TOTAL FROM PEDIDO;

-- soma agrupado pela data
SELECT DATA_PEDIDO, SUM (VALOR_TOTAL) AS SOMA_TOTAL
FROM PEDIDO
GROUP BY DATA_PEDIDO;


select * from Pedido

UPDATE PEDIDO SET DATA_PEDIDO = '20/05/2017'
WHERE COD_PEDIDO = 9;

UPDATE PEDIDO SET DATA_PEDIDO = '20/05/2017'
WHERE COD_PEDIDO = 10;

UPDATE PEDIDO SET DATA_PEDIDO = '20/05/2017'
WHERE COD_PEDIDO = 11;


--AULA 26/05
-- Views
GRANT CREATE VIEW, CREATE SESSION, CONNECT, RESOURCE TO Livraria;
grant create view to PEDROH;


CREATE VIEW VW_CLIENTES_BARUERI AS
SELECT NOME, CIDADE FROM CLIENTE 
WHERE CIDADE = 'Barueri';

SELECT * FROM VW_CLIENTES_BARUERI;

--REPLACE 
CREATE OR REPLACE VIEW VW_CLIENTES_BARUERI AS
SELECT NOME, CIDADE, UF FROM CLIENTE 
WHERE CIDADE = 'Barueri';


--LIKE:
-- CONSULTA DE CLIENTES CUJO O NOME INICIA COM A LETRA "A".
SELECT NOME, CIDADE FROM CLIENTE
WHERE NOME LIKE 'A%';

--CONSULTA CLIENTES CUJO NOME TENHA A PALAVRA "Silva".
SELECT NOME, CIDADE FROM CLIENTE
WHERE NOME LIKE '%Silva%';

-- CONSULTA
SELECT NOME, CIDADE FROM CLIENTE
WHERE CIDADE LIKE 'Baru_ri';

--LENGTH
--Consulta quantos caracteres tem cada nome.
SELECT NOME, LENGTH(NOME) FROM CLIENTE;


--EXERCICIO 
-- Crie uma view que realize uma query para consultar os nomes dos clientes, t�tulo do livro,
-- n�mero do pedido e a data do pedido que compraram qualquer livro "Use a cabe�a!"

--Exemplo
SELECT TITULO.LIVRO, AUTOR.NOME FROM
LIVRO INNER JOIN LIVRO_AUTOR
ON LIVRO.COD = LIVRO_AUTOR.COD_LIVRO
INNER JOIN AUTOR 
ON LIVRO_AUTOR.COD_AUTOR = AUTOR.COD_AUTOR 
--====================== continua��o da corre��o 02/06
CREATE VIEW VW_CLIENTES AS 

SELECT TITULO.LIVRO, CLIENTE.NOME, PEDIDO.COD_PEDIDO, DATA_PEDIDO.PEDIDO 
FROM LIVRO INNER JOIN ITEM_PEDIDO
ON LIVRO.COD_LIVRO = ITEM_PEDIDO.COD_LIVRO

INNER JOIN PEDIDO
ON PEDIDO.COD_PEDIDO = ITEM_PEDIDO.COD_PEDIDO

INNER JOIN CLIENTE
ON CLIENTE.COD_CLIENTE = ITEM_PEDIDO.COD_CLIENTE

WHERE = 'Use a C_be�a! ';
