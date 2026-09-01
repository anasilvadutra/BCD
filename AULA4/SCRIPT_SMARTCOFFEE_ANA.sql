-- PROJETO SMARTCOFFEE

create database SMARTCOFFEE_ANA;

USE SMARTCOFFEE_ANA;

create table FUNCIONARIOS (
ID_FUNCIONARIOS int auto_increment primary key,
NOME varchar(60) not null unique,
TELEFONE varchar(16) not null,
SALARIO date not null,
CPF varchar (14) NOT null
);

create table CLIENTES (
ID_CLIENTES int auto_increment primary key,
PEDIDO varchar(60) not null unique,
NOME varchar(60) not null,
ENDERECO varchar (40) not null
);

create table PRODUTOS (
ID_PRODUTOS int auto_increment primary key,
VALIDADE varchar(20) not null unique,
PRECO varchar(20) not null,
NOME_PRODUTO varchar(70) not null
);

create table PEDIDOS (
ID_PEDIDOS int auto_increment primary key,
CLIENTE varchar(60) not null unique,
VALOR varchar(30) not null,
DESCRICAO varchar(50) not null,
FORMA_PAGAMENTO varchar(90) not null
);

create table FORMA_PAGAMENTOS (
ID_FORMA_PAGAMENTOS int auto_increment primary key,
PRECO varchar(50) not null unique,
PIX varchar(50) not null,
DEBITO varchar(50) not null,
CREDITO varchar(50) not null,
DATA_ENTREGA varchar(60) not null
);

create table PROGRAMA_FIDELIDADE (
ID_PROGRAMA_FIDELIDADE int


show tables; 



