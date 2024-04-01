--criando tabela para usuarios e emprestimos
create table usuario(
id_usuario int primary key,
nome varchar(100) not null,
endereco varchar(200)
);

--criando os usuarios ficticios
insert into usuario
values 
(1, 'jose', 'av das fronteiras'),
(2, 'laura', 'av maranguape'),
(3, 'fulano', 'jo�o medeiros filho')

--criando tabela para empresitmo
create table usuario_emprestimo(
	dataEmprestimo date,
	dataDevolucao date,
	id_usuario integer,
	numero_registro integer,
	CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
	CONSTRAINT fk_livro FOREIGN KEY (numero_registro) REFERENCES LIVRO(numero_registro)
);

insert into usuario_emprestimo
values 
('2022-01-10', '2022-02-20', 1, 4),
('2022-03-10', '2022-04-15', 2, 14),
('2023-01-10', '2022-04-15', 3, 11)

select * from usuario_emprestimo

use sistema_biblioteca
/*
1. Retornar todos os livros de sociologia.
*/
select * FROM livro
join SOCIOLOGIA on SOCIOLOGIA.numero_registro = livro.numero_registro;
/*
2. Listar os nomes dos funcion�rios que s�o bibliotec�rios.
*/
select * from BIBLIOTECARIO;
/*
3. Exibir os t�tulos dos livros publicados antes de 2000.
*/
select * from LIVRO
where ano_publicacao <= 2000

--inserindo livros as biblioteca
insert into LIVRO_BIBLIOTECA
values
--Livros de 1 A 5 na biblioteca 01234567000112
('01234567000112', 1),
('01234567000112', 2),
('01234567000112', 3),
('01234567000112', 4),
('01234567000112', 5)

/*
4. Mostrar o n�mero total de livros em cada biblioteca.
*/
select * from LIVRO_BIBLIOTECA

/*

5. Listar os eventos do tipo 'Workshop' que ocorreram ap�s 2020.
*/
select * from evento 
where tipo = 'workshop' and year(data) > 2020;

/*
6. Exibir os nomes dos usu�rios que fizeram empr�stimos de livros em janeiro de 2023.
*/
select * from usuario_emprestimo
where  year(dataEmprestimo) = 2023

/*
7. Retornar os t�tulos dos livros de tecnologia que t�m 'Python' no t�tulo.
*/
select * from LIVRO 
where titulo like 'python%';

/*
8. Listar os t�tulos dos peri�dicos dispon�veis na biblioteca com CNPJ
'12345678000123'.
*/
select * from PERIODICO_BIBLIOTECA
where cnpj = '12345678000123'
/*
9. Mostrar os nomes dos funcion�rios que n�o s�o t�cnicos de TI.
*/
select * from FUNCIONARIO
where matricula not like 'T%'

/*
10.Exibir o t�tulo e o autor dos livros emprestados pelo usu�rio com ID 'U0001'.
*/

/*
11.Listar todas as palestras que custaram mais de R$ 100,00.
*/

/*
12.Retornar os t�tulos dos livros de ci�ncia que foram publicados ap�s 2010.
*/

/*
13.Exibir os nomes dos atendentes que t�m 'Maria' no nome.
*/

/*
14.Mostrar os t�tulos dos livros que foram emprestados mais de 5 vezes.
*/

/*
15.Listar os nomes dos usu�rios que emprestaram livros de tecnologia.
*/

/*
16.Exibir os eventos que ocorreram na biblioteca '67890123000178' em 2022.
*/

/*
17.Retornar os t�tulos dos peri�dicos que t�m 'Sa�de' no t�tulo.
*/

/*
18.Listar os nomes dos estagi�rios que come�am com a letra 'L'.
*/

/*
19.Mostrar os t�tulos dos livros de sociologia que foram publicados nos anos 90.
*/

/*
20.Exibir os t�tulos dos livros e os nomes dos autores dos livros emprestados em
fevereiro de 2023.*/