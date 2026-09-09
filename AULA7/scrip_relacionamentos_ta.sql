-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE clientes (
id_clientes Texto(1) PRIMARY KEY,
nome_cliente varchar(60)
)

CREATE TABLE pedidos (
id_pedidos Texto(1) PRIMARY KEY,
quantidade varchar(60),
id_clientes Texto(1),
FOREIGN KEY(id_clientes) REFERENCES clientes (id_clientes)
)

CREATE TABLE produtos+estoques (
id_produtos Texto(1),
nome_produto Texto(1),
id_estoques Texto(1),
valor Texto(1),
PRIMARY KEY(id_produtos,id_estoques)
)

CREATE TABLE fornecedores (
id_fornecedores Texto(1) PRIMARY KEY,
razao_social Texto(1)
)

CREATE TABLE produtos (
id_produtos int PRIMARY KEY,
nome_produto varchar(100)
)

CREATE TABLE item_produto (
id_produtos int,
id_fornecedores int,
id_item int auto_increment primary key PRIMARY KEY,
quantidade int,
FOREIGN KEY(id_produtos) REFERENCES produtos (id_produtos)
)

