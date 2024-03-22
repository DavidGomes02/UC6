-- Criando banco de dados
CREATE DATABASE SENAC;
USE SENAC;

-- Criando tabela SENAC
CREATE TABLE SENAC (
    id_senac INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cnpj VARCHAR(14), -- Alteração do tipo de dado para CNPJ
    endereco VARCHAR(200)
);

-- Criando tabela funcionario
CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY, -- Alteração do nome da chave primária
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11), -- Alteração do tipo de dado para CPF
    cargo VARCHAR(30),
    telefone VARCHAR(20),
    email VARCHAR(50)
);

-- Criando tabela matricula
CREATE TABLE matricula (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT, -- Alteração do nome da coluna
    matricula VARCHAR(50),
    CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos(ID),
    CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- Criando tabela Alunos
CREATE TABLE Alunos (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Idade INT,
    Email VARCHAR(50) UNIQUE,
    tipo_aluno VARCHAR(20)
);

-- Criando tabela aluno_curso
CREATE TABLE aluno_curso (
    id_aluno_curso INT IDENTITY(1,1) PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos(ID),
    CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- Criando tabela cursos
CREATE TABLE cursos (
    id_curso INT PRIMARY KEY, -- Alteração do nome da chave primária
    id_senac INT,
    nome NVARCHAR(100),
    FOREIGN KEY (id_senac) REFERENCES SENAC(id_senac)
);

-- Criando tabela curso
CREATE TABLE curso (
    id_curso INT PRIMARY KEY,
    nome NVARCHAR(100),
    cargaHoraria INT,
    dataInicio DATE,
    dataTermino DATE
);

-- Criando tabela UC (Unidades Curriculares)
CREATE TABLE UC (
    id_uc INT PRIMARY KEY,
    nome NVARCHAR(100),
    descricao VARCHAR(250),
    cargaHoraria INT
);

-- Inserindo registros na tabela SENAC
INSERT INTO SENAC (id_senac, nome, telefone, cnpj, endereco)
VALUES (1, 'SENAC São Paulo', '11 1234-5678', '12345678901234', 'Rua Senac, 123'); -- Alteração do CNPJ para 14 dígitos

-- Inserindo registros na tabela funcionario
INSERT INTO funcionario (id_funcionario, nome, cpf, cargo, telefone, email)
VALUES (1, 'João Silva', '12345678901', 'Instrutor', '11 9876-5432', 'joao.silva@example.com'),
       (2, 'Maria Souza', '98765432109', 'Coordenador', '11 8765-4321', 'maria.souza@example.com');

-- Inserindo registros na tabela Alunos
INSERT INTO Alunos (Nome, Idade, Email, tipo_aluno)
VALUES ('Pedro Santos', 25, 'pedro.santos@example.com', 'Pagante'),
       ('Ana Oliveira', 30, 'ana.oliveira@example.com', 'Bolsista'); 

-- Inserindo registros na tabela cursos
INSERT INTO cursos (id_curso, id_senac, nome)
VALUES (1, 1, 'Programação em Python'),
       (2, 1, 'Web Development');

-- Inserindo registros na tabela curso
INSERT INTO curso (id_curso, nome, cargaHoraria, dataInicio, dataTermino)
VALUES (1, 'Programação em Python', 40, '2024-04-01', '2024-05-20'),
       (2, 'Web Development', 60, '2024-04-15', '2024-06-30');

-- Inserindo registros na tabela UC (Unidades Curriculares)
INSERT INTO UC (id_uc, nome, descricao, cargaHoraria)
VALUES (1, 'Introdução à Programação', 'Introdução aos conceitos básicos de programação', 20),
       (2, 'Desenvolvimento Web', 'Desenvolvimento de aplicações web utilizando tecnologias modernas', 40);

-- Inserindo registros na tabela matricula
INSERT INTO matricula (id_matricula, id_aluno, id_curso, matricula)
VALUES (1, 1, 1, 'PYT2024001'),
       (2, 2, 2, 'WEB2024001'); -- Corrigindo o id_curso

-- Inserindo registros na tabela aluno_curso
-- Pedro Santos está matriculado em Programação em Python
INSERT INTO aluno_curso (id_aluno, id_curso) VALUES (1, 1);

-- Ana Oliveira está matriculada em Desenvolvimento Web
INSERT INTO aluno_curso (id_aluno, id_curso) VALUES (2, 2);

-- Exibindo os dados das tabelas para verificação
SELECT * FROM SENAC;
SELECT * FROM curso;
SELECT * FROM cursos;
SELECT * FROM funcionario;
SELECT * FROM Alunos;
SELECT * FROM matricula;
