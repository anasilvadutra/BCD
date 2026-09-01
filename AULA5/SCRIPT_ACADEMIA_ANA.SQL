-- COMANDOS PARA CRIAR BD
create database ACADEMIA_ANA;
create database if not exists ACADEMIA_ANA;

-- COMANDOS PARA APAGAR BD
drop database ACADEMIA_ANA;
-- COMANDO PARA APAGAR TABELA
drop table CLIENTES;


-- COMANDOS CRIAR TABELA
create table if not exists CLIENTES (
ID_CLIENTE int auto_increment primary key,
CPF varchar(14) not null unique,
NOME varchar(60) not null,
NUMERO varchar(15) not null,
ENDERECO varchar(100),
DATA_NASCIMENTO date not null,
STATUS_CLIENTE enum ('PENDENTE', 'ATIVO', 'INATIVO') default "PENDENTE",
DATA_CADASTRO timestamp default current_timestamp
);

create table FUNCIONARIOS (
ID_FUNCIONARIOS int auto_increment primary key,
NOME varchar(60) not null unique,
TELEFONE varchar(16) not null,
SALARIO date not null,
CPF varchar (14) NOT null
);

create table PLANOS (
ID_PLANOS int auto_increment primary key,
NOME_PLANO varchar(20) not null,
TIPOS_PLANOS char(10) default "MENSAL",
VALOR decimal(5,2) default 0.00,
ADICIONAIS char(10) default "EXAME",
OBSERVACAO text

-- COMANDO PARA ATIVAR BD
USE ACADEMIA_ANA;

-- COMANDOS PARA ALTERAR E CORRIGIR
-- ADICIONANDO UM CAMPO (ATRIBUTO) NOVO
alter table CLIENTES add EMAIL varchar(100);

-- MODIFICAR TIPO DE DADOS OU CAMPOS
alter table CLIENTE modify EMAIL varchar(150);

-- RENOMEAR TABELAS
rename table CLIENTES TO CLIENTESS;

-- EXCLUIR ATRIBUTO
alter table CLIENTESS drop column EMAIL;

-- VISUALIZAR TABELAS NO BD
show tables; 

-- LIMPAR DADOS DA TABELA
truncate table CLIENTES;