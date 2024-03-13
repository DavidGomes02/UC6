-- Criando o banco de dados
CREATE DATABASE livraria;

-- Usando o banco de dados criado
USE livraria;

-- Criando a tabela CLIENTE
CREATE TABLE CLIENTE (
    cod_cliente INT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50),
    telefone VARCHAR(20),
    rua VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2)
);

-- Criando a tabela PESSOA_FISICA
CREATE TABLE PESSOA_FISICA (
    cod_cliente INT PRIMARY KEY,
    rg VARCHAR(20),
    cpf VARCHAR(14),
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente)
);

-- Criando a tabela PESSOA_JURIDICA
CREATE TABLE PESSOA_JURIDICA (
    cod_cliente INT PRIMARY KEY,
    cnpj VARCHAR(18),
    ie VARCHAR(20),
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente)
);

-- Criando a tabela PEDIDO
CREATE TABLE PEDIDO (
    cod_pedido INT PRIMARY KEY,
    cod_cliente INT,
    data DATE,
    valor_pedido DECIMAL(10, 2),
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente)
);

-- Criando a tabela ITEM_PEDIDO
CREATE TABLE ITEM_PEDIDO (
    cod_pedido INT,
    cod_livro INT,
    quantidade_pedido INT,
    valor_item DECIMAL(10, 2),
    FOREIGN KEY (cod_pedido) REFERENCES PEDIDO(cod_pedido),
    FOREIGN KEY (cod_livro) REFERENCES LIVRO(cod_livro)
);

-- Criando a tabela LIVRO
CREATE TABLE LIVRO (
    cod_livro INT PRIMARY KEY,
    cod_editora INT,
    valor DECIMAL(10, 2),
    ano_publicacao DATE,
    categoria VARCHAR(50),
    titulo VARCHAR(100),
    autor VARCHAR(100),
    isbn VARCHAR(20),
    FOREIGN KEY (cod_editora) REFERENCES EDITORA(cod_editora)
);

-- Criando a tabela EDITORA
CREATE TABLE EDITORA (
    cod_editora INT PRIMARY KEY,
    telefone VARCHAR(20),
    nome_contato VARCHAR(100),
    email VARCHAR(100)
);

-- Criando a tabela ESTOQUE
CREATE TABLE ESTOQUE (
    cod_editora INT,
    cod_livro INT,
    quantidade_estoque INT,
    PRIMARY KEY (cod_editora, cod_livro),
    FOREIGN KEY (cod_editora) REFERENCES EDITORA(cod_editora),
    FOREIGN KEY (cod_livro) REFERENCES LIVRO(cod_livro)
);

-- Inserindo um cliente pessoa física
INSERT INTO CLIENTE (cod_cliente, nome, email, telefone, rua, bairro, cidade, estado) 
VALUES (1, 'João Silva', 'joao@example.com', '123456789', 'Rua Principal', 'Centro', 'Cidade A', 'UF');

-- Selecionando todos os clientes
SELECT * FROM CLIENTE;

-- Inserindo um livro e associando-o a uma editora
INSERT INTO LIVRO (cod_livro, cod_editora, valor, ano_publicacao, categoria, titulo, autor, isbn) 
VALUES (1, 1, 29.99, '2023-01-01', 'Ficção Científica', 'O Guia do Mochileiro das Galáxias', 'Douglas Adams', '978-0-330-25864-3');

-- Selecionando todos os livros de uma determinada categoria
SELECT * FROM LIVRO WHERE categoria = 'Ficção Científica';