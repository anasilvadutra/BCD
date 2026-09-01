-- PROJETO SMARTCOFFE

create database SMARTCOFFEE_ANA; 
-- COMANDOS PARA APAGAR BD
drop database SMARTCOFFEE_ANA;
-- COMANDO PARA APAGAR TABELA
drop table CLIENTES;

create table CLIENTES (
ID_CLIENTES int auto_increment primary key,
NOME varchar(60) not null unique,
PEDIDO varchar(60) not null,
NUMERO_SENHA date not null,
COMANDA varchar (14) NOT null
);