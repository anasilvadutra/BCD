-- Active: 1788351675293@@127.0.0.1@3306@smartcoffee_dml_ana
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: -- ana francisca da silva dutra 
-- Turma: -- devie 2026  Data: -- 07/10/2026
-- ============================================================
USE smartcoffee_dml_ana;

-- PARTE A - AQUECIMENTO
-- 1. Liste todos os clientes cadastrados.
SELECT * FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email
FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade
FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT NOME, PRECO 
FROM produto
ORDER BY PRECO ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT NOME, PRECO 
FROM produto
ORDER BY PRECO DESC
LIMIT 5;

-- PARTE B - FILTROS
-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT NOME, PRECO     
FROM produto
WHERE PRECO >= 8.00 AND PRECO <= 15.00;   

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT NOME, CIDADE, ATIVO AS STATUS
FROM cliente
WHERE ATIVO = TRUE
AND (CIDADE = 'LIMEIRA' OR CIDADE = 'AMERICANA');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT NOME 
FROM produto
WHERE NOME LIKE 'CAFÉ%';

-- 9. Liste os clientes que não informaram telefone.
SELECT NOME, TELEFONE
FROM cliente
WHERE TELEFONE IS NULL; 

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT NOME, PRECO 
FROM produto
ORDER BY PRECO DESC; 
 
-- PARTE C - CÁLCULOS E AGRUPAMENTOS
-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*)
FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT NOME, PRECO 
FROM produto
WHERE PRECO < 7.00;

SELECT NOME, PRECO 
FROM produto
WHERE PRECO > 7.00

SELECT AVG(PRECO) AS MÉDIA_PREÇOS
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT CIDADE, COUNT(*) AS QTDE_CIDADES
FROM cliente
GROUP BY CIDADE; 

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT CIDADE, COUNT(*) AS QUANTIDADE_CLIENTES
FROM cliente
GROUP BY CIDADE 
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(VALOR_TOTAL) AS FATURAMENTO_MENSAL
FROM pedido
WHERE STATUS = 'ABERTO'

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.

SELECT P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%d %m %Y %H:%i') AS DATA, C.NOME AS CLIENTE, 
PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE 
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME;

-- 17. Liste cada produto acompanhado do nome de sua categoria.

SELECT PR.NOME AS PRODUTO, CA.CATEGORIA AS CATEGORIA, PR.PRECO
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA
ORDER BY CA.CATEGORIA, PR.NOME;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.

SELECT P.ID_PEDIDO, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.

SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
ORDER BY C.NOME;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.

SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.

SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P 
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS = 'FINALIZADO'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.

SELECT P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%d %m %Y %H:%i') AS DATA, C.NOME AS CLIENTE, 
PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE 
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT nome, preco
FROM produto
ORDER BY preco ASC;

SELECT nome, preco
FROM produto
ORDER BY preco DESC;

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.

SELECT NOME, PRECO,
CASE
WHEN PRECO < 8.00 THEN 'Econômico'
WHEN PRECO <= 15.00 THEN 'Intermediário'
ELSE 'Premium'
END AS CLASSIFICAÇÃO
FROM PRODUTO
ORDER BY PRECO;

-- 25. CONSULTA AUTORAL
-- Pergunta de negócio: Quais são os cinco produtos mais vendidos?

-- Por que essa informação é útil?  Essa informação ajuda a identificar os produtos mais procurados pelos clientes, controlar o estoque e planejar a reposição dos produtos.

-- Consulta:
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P 
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS = 'FINALIZADO'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;