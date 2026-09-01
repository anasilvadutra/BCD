-- SOMATIVA OFICINA
create database OFICINA_ANA;

USE OFICINA_ANA;

DROP DATABASE oficina_ana;

SHOW TABLES;

create table CLIENTE (
ID_CLIENTE int auto_increment primary key,
NOME varchar(60) not null unique,
PRAZO_ESPERADO varchar(50) not null,
CPF varchar (14) NOT null,
ENDERECO varchar (40) not null,
IDADE varchar (10) not null
);

create table VEICULOS (
ID_VEICULOS int auto_increment primary key,
MARCA varchar(60) not null unique,
POTENCIA_MOTOR varchar(50) not null,
ANO_FABRICADO varchar (50) NOT null,
PAIS_ORIGEM varchar (40) not null,
DATA_COMPRADA varchar (10) not null
);

create table MARCAS (
ID_MARCAS int auto_increment primary key,
ANO_FABRICADO varchar(60) not null unique,
PAIS varchar(50) not null,
DATA_FABRICACAO varchar (40) NOT null,
FABRICANTE varchar (40) not null,
CRIADOR varchar (40) not null
);

create table MODELOS (
ID_MODELOS int auto_increment primary key,
TIPO varchar(60) not null unique,
MARCA varchar(50) not null,
ANO varchar (40) NOT null,
QUALIDADE varchar (40) not null,
COR varchar (40) not null
);

create table FUNCIONARIOS (
ID_FUNCIONARIOS int auto_increment primary key,
DATA_NASCIMENTO varchar(60) not null unique,
HORARIO_TRABALHO varchar(50) not null,
CPF varchar (40) NOT null,
NOME varchar (40) not null,
CARGO varchar (40) not null
);

create table SERVICOS (
ID_SERVICOS int auto_increment primary key,
TROCA_PECA varchar(60) not null unique,
TROCA_OLEO varchar(50) not null,
PNEUS_NOVOS varchar (14) NOT null,
TROCAS_VELAS varchar (40) not null,
REPARO_GERAL varchar (10) not null
);

create table PECAS (
ID_PECAS int auto_increment primary key,
QUANTIDADE varchar(60) not null unique,
VALOR varchar(50) not null,
TAMANHO varchar (40) NOT null,
NOME varchar (40) not null,
QUALIDADE varchar (40) not null
);

create table ORDENS_SERVICOS (
ID_ORDENS_SERVICOS int auto_increment primary key,
HORARIO varchar(60) not null unique,
HORAS_TRABALHADAS varchar(50) not null,
PRAZO varchar (40) NOT null,
TIPO_SERVICO varchar (40) not null,
HORARIO_ENTREGAS varchar (40) not null
);

create table PAGAMENTOS (
ID_PAGAMENTOS int auto_increment primary key,
DEBITO varchar(60) not null unique,
CREDITO varchar(50) not null,
PIX varchar (40) NOT null,
BOLETO varchar (40) not null,
DINHEIRO varchar (40) not null
);

create table FORNECEDOR (
ID_FORNECEDOR int auto_increment primary key,
ENTREGA varchar(60) not null unique,
DATA_PEDIDO varchar(50) not null,
DATA_ENTRGA varchar (14) NOT null,
GARANTIA varchar (40) not null,
QUANTIDADE_PECAS varchar (10) not null
);

