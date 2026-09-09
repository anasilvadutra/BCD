CREATE DATABASE oficina_ana;
 USE oficina_ana;

 CREATE TABLE clentes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    telefone CHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    nome_cliente VARCHAR(60) NOT NULL,
    endereco VARCHAR(100),
    cpf_cliente CHAR(14) NOT NULL UNIQUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 );

 CREATE TABLE if NOT exists veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    descricao_problema TEXT(300) NOT NULL,
    placa CHAR(8) NOT NULL UNIQUE,
    cor VARCHAR(25), 
    marca VARCHAR(25),
    quilometragem INT
 );

CREATE TABLE if NOT exists marcas (
    id_marcas INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(50) NOT NULL,
    pais_origem VARCHAR(30),
    ano_lancamento YEAR,
    modelo TEXT(500),
    tipo_combustivel ENUM('gasolina','etanol', 'disel')
    DEFAULT 'etanol' NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE modelos (
    id_modelos INT AUTO_INCREMENT PRIMARY KEY,
    nome_modelo VARCHAR(30) NOT NULL,
    tipo_modelo  ENUM('suv','compacto','sedan') DEFAULT
    'compacto',
    ano_fabricacao YEAR NOT NULL,
    potencia CHAR(10),
    status_modelo ENUM('ativo','inativo') DEFAULT 'ativo',
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE funcionarios(
    id_funcionarios INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(60) NOT NULL,
    cpf_funcionario CHAR(14) NOT NULL UNIQUE,
    telefone_funcionario CHAR(15) NOT NULL,
    cargo VARCHAR(30),
    salario DECIMAL(10,2) NOT NOT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE servicos(
    id_servicos INT AUTO_INCREMENT PRIMARY KEY,
    tipo_servico VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_inicio DATETIME NOT NULL,
    data_termini DATETIME NOT NULL,
    descricao_servico TEXT(500) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fornecedores(
    id_fornecedores INT AUTO_INCREMENT PRIMARY KEY,
    telefone CHAR(15) NOT NULL,
    -- tempo_entrega VARCHAR(30),
    cnpj CHAR(18) NOT NULL UNIQUE,
    razao_social VARCHAR(100) NOT NULL, 
    sagmento_area VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    status_fornecedor ENUM('ativo','inativo') DEFAULT 'ativo',
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


































