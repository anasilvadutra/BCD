-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: ANA FRANCISCA 
-- Turma: DEVIE Data: 30/09/26
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_ana;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT
INSERT INTO cliente (NOME,EMAIL,TELEFONE,CIDADE,ATIVO) VALUES
-- 1. Cadastre dois novos clientes com dados diferentes.
('THOMAS','THOMAS@EMAIL.COM','19998801','SÃO PEDRO',TRUE),
('AURORA','AURORA@EMAIL.COM','19998802','LIMEIRA',TRUE);

SELECT * FROM cliente;

-- 2. Cadastre a categoria 'Especiais da Casa'.


-- 3. Localize o id da categoria criada e cadastre três produtos nela.


-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (NOME,EMAIL,TELEFONE,CIDADE,ATIVO) VALUES
('ALICE', 'ALICE@email.com',NULL, 'Limeira', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.


-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.

SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:

UPDATE cliente
SET TELEFONE = '000000'
WHERE ID_CLIENTE = 40;

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.

UPDATE cliente
SET TELEFONE = '19999888016',
    CIDADE = 'CAMPINAS'
WHERE ID_CLIENTE = 3; 

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.


-- 10. Altere o status do pedido criado para 'PREPARANDO'.


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.


-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
