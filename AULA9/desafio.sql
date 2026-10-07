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

