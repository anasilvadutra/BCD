-- Active: 1788351675293@@127.0.0.1@3306@smartcoffee_dml_ana
USE SMARTCOFFEE_DML_ANA;

-- INSERINDO DADOS NO BD 
-- DML: INSERTS, UPDATE, DELETE 

INSERT INTO cliente (NOME,EMAIL,TELEFONE,CIDADE,ATIVO) VALUES
('ADRYAN COSTA','ADRYAN@EMAL.COM','1999901','LIMEIRA',TRUE),
('ANA FRANCISCA','ANA2@EMAIL.COM','199902','LENÇOIS PAULISTA',TRUE),
('Anna Julia', 'anaj@email.com', '199999903', 'Limeira', TRUE),
('Beatriz Barros', 'beatrizb@email.com', '199999904', 'Limeira', TRUE),
('Beatriz Santana', 'beatrizs@email.com', '199999905', 'Limeira', TRUE),
('Bruno Dias', 'bruno2@email.com', '199999906', 'Limeira', TRUE),
('Cristopher da Costa', 'cristopher@email.com', '199999907', 'Mogi Guacu', TRUE),
('Davi Guerra', 'davi@email.com',NULL, 'Limeira', TRUE),
('Gabriel Lucio','grabiel@email.com', '199999908', 'Limeira', TRUE),
('Gabriela Lima', 'gabriela2@email.com', '199999909', 'Curitiba', TRUE),
('Giovana Santana', 'giovana@email.com', NULL, 'Juqueropólis', FALSE),
('Gustavo Couto', 'gustavo@email.com', '199999910', 'Ipatinga', FALSE),
('Isabeli Sousa', 'isabeli@email.com',NULL, 'Limeira', TRUE),
('Jaco de Souza', 'jaco@email.com', '199999911', 'Limeira', TRUE),
('Joao Moreira', 'joao2@email.com', '199999912', 'Limeira', TRUE),
('John Pierre', 'john@email.com', '199999913', 'cap haitien', TRUE),
('Jonas Dawid', 'jonas@email.com', '199999914', 'Rio de Janeiro', TRUE),
('Juan Pablo', 'juan@email.com', '199999915', 'Limeira', TRUE),
('Julia Fernanda', 'julia@email.com', '199999916', 'Limeira', TRUE);

INSERT INTO forma_pagamento (descricao) VALUES
('Dinheiro'), ('PIX'), ('Cartão de Crédito'), ('Cartão de Débito');

INSERT INTO produto (NOME,PRECO,ATIVO,ID_CATEGORIA) VALUES
('MANTEIGA GIOVANA',14.00, TRUE, 3)


INSERT INTO pedido (DATA_PEDIDO,STATUS,VALOR_TOTAL, ID_CLIENTE) VALUES
(NOW(),'ABERTO',14.00,4)


SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

------------------------------------------------------------

-- ATUALIZANDO OU MODIFICANDO DADOS NO BD
-- EX: ATUALIZANDO IRNFORMAÇÕES INDIVIDUAIS
UPDATE cliente
SET TELEFONE = '19999888801'
WHERE ID_CLIENTE = 37;

UPDATE cliente
SET ATIVO = TRUE
WHERE ID_CLIENTE = 3;

-- NUNCA, JAMAIS, NEVER ESQUEÇAM DE UTILILAR O WHERE

-- REGRA DE OURO 
-- PRIMEIRA ETAPA
SELECT * FROM cliente
WHERE ID_CLIENTE = 3;

-- SEGUNDA ETAPA
UPDATE cliente
SET ATIVO = FALSE
WHERE ID_CLIENTE = 3;

-- EX 2: ATUALIZANDO MAIS DO QUE UM CAMPO
UPDATE cliente
SET TELEFONE = '19999888016',
    CIDADE = 'CAMPINAS'
WHERE ID_CLIENTE = 3; 

-- EX 3: ATUALIZANDO COM CONDICIONAIS
UPDATE produto
SET PRECO = PRECO * 2.50
WHERE ID_CATEGORIA = 1; 


-- APAGANDO DADOS 
-- EX 1: APAGAR DADOS SEM CONTER INFORMAÇÕES
DELETE FROM cliente;

-- EX 2: APAGAR DADOS COM CONDIÇÕES
DELETE FROM cliente
WHERE ID_CLIENTE = 3;

-- EX 3: APAGANDO DADOS DE TODA TABELA
TRUNCATE TABLE cliente;

-- EX 4: APAGAR DE FORMA REPRESENTATIVA OU LÓGICA
UPDATE produto
SET ATIVO = FALSE
WHERE ID_PRODUTO = 19;

----------------------------------------
-- REALIZANDO PASSOS PARA UMA COMPRA NO SMARTCOFFE
-- PASSO 1: CADASTRAR UM NOVO CLIENTE
INSERT INTO cliente (NOME,EMAIL,TELEFONE,CIDADE,ATIVO)  VALUES
('ANA ','ANASILVA23@EMAIL.COM','1999901','PIRACICABA',TRUE);
SET @cliente = LAST_INSERT_ID();

-- PASSO 2: CRIAR PEDIDO
INSERT INTO pedido (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES
(NOW(),'ABERTO',0.00,4);
SET @pedido = LAST_INSERT_ID();

-- PASSO 3: INSERIR ITENS NO PEDIDO
INSERT INTO item_pedido(ID_PEDIDO, ID_PRODUTO,QUANTIDADE,PRECO_UNITARIO) VALUES
(@pedido,4,1,73.13),
(@pedido,11,1,11.25);

-- PASSO 4: ATUALIZAR O TOTAL E STATUS
UPDATE pedido
SET VALOR_TOTAL = 84.38,
    STATUS = 'REPARANDO'
WHERE ID_PEDIDO = @pedido; 

-- PASSO 5: REGISTRAR PAGAMENTO
INSERT INTO pagamento(ID_PEDIDO,ID_FORMA_PAGAMENTO,VALOR,DATA_PAGAMENTO) VALUES
(@pedido, 1,84.38, NOW());


-- CONSULTAR DADOS EM TABELAS BD
--CONSULTAR TODA A TABELA
SELECT * FROM pedido;
-- CONSULTAR INDIVIDUAL POR ID
SELECT * FROM cliente
WHERE ID_CLIENTE = 115;