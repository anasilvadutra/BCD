create database castellovers;

use castellovers;

create table if not exists alunos (
    id_alunos bigint AUTO_INCREMENT PRIMARY KEY,
    nome varchar(60) not NULL,
    cpf char(14) not null unique, 
    status_aluno enum('ativo','inativo','concluido') default 'ativo',   
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- visualizar todos os bd
SHOW SCHEMAs;  

-- visualizar tabelas do bd
SHOW TABLES; 

-- descrição de atributosda tabela aluno
DESCRIBE alunos;

-- apagar db
DROP DATABASE castellovers;