-- COMANDOS PARA CRIAR BD
create database ACADEMIA_ANA;
create database if not exists ACADEMIA_ANA;

-- COMANDOS PARA APAGAR BD
drop database ACADEMIA_ANA;
-- COMANDO PARA APAGAR TABELA
drop table CLIENTES;


-- COMANDOS CRIAR TABELA
create table if not exists CLIENTES (
ID_CLIENTE int primary key,
EMAIL varchar(225) unique
);

create table FUNCIONARIOS (
ID_FUNCIONARIOS int auto_increment primary key,
NOME varchar(60) not null unique,
TELEFONE varchar(16) not null,
SALARIO date not null,
CPF varchar (14) NOT null
);

-- COMANDO PARA INSERIR NO BD
insert into FUNCIONARIOS (ID_FUNCIONARIOS, EMAIL)
values (1, 'ANA@SENAI.COM.BR');

-- COMANDO PARA CONSULTAR INFORMAÇÕES  NA TABELA
select * from FUNCIONARIOS; 

create table PLANOS (
ID_PLANOS int auto_increment primary key,
NOME_PLANO varchar(20) not null,
TIPOS_PLANOS char(10) default "MENSAL",
VALOR decimal(5,2) default 0.00,
ADICIONAIS char(10) default "EXAME",
OBSERVACAO text
);

drop table PLANOS;

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

-- INSERIR DADOSNO BD
insert into CLIENTES (ID_CLIENTE, NOME, CPF, TELEFONE, ENDERECO, DATA_NASCIMENTO, STATUS_CLIENTE, DATA_CADASTRO)
values ('', 'BRUNO', '123.456.78', '(14)99939399', 'RUA SENAI', '13/12/2010', 'ATIVO', '')