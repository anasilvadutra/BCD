CREATE DATABASE IF NOT EXISTS castello_relacionamentos;
USE castello_relacionamentos; 

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    Foreign Key (id_cliente) REFERENCES clientes (id_cliente)
);

CREATE TABLE estouque (
    id_edtoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    Foreign Key (id_produto) REFERENCES  produto(id_produto)
);

CREATE TABLE produto(
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

SELECT * FROM estouque; 

SELECT * FROM produto;

INSERT INTO produto (nome_produto, preco) VALUES
('produto A', 10.00),
('produto B', 20.00),
('produto C', 30.00); 

-- DESAFIOS CARDINALIDADES
-- QUESTÃO 1
-- CATEGORIA 1,N -- POSSUI 1,1 -- PRODUTOS

-- QUESTÃO 2
-- FUNCIONARIOS 1,1 -- REGISTRA 1,N -- PEDIDOS

-- QUESTÃO 3
-- FORNECEDOR 1,N -- CONTRIBUI 1,N -- PRODUTOS

-- QUESTÃO 4
--CLIENTE 1,1 --RESERVA 0,N --MESA

-- QUESTÃO 5
-- PEDIDO 1,N --POSSUI 1,1 --ITENS
