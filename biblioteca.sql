--seleciona todos os funcionarios
select * from FUNCIONARIO;

--seleciona todos os atendentes
select * from ATENDENTE;

--ordenando por nome de funcionario
select * from FUNCIONARIO order by nome;

--selecionando por nome
select * from FUNCIONARIO where nome like 'ca%'

--total de funcionarios
select * from FUNCIONARIO;
select count(*) as Total_funcionarios from FUNCIONARIO;

--selecionando por sobrenome
select * from FUNCIONARIO where nome like '%silva'

select * from LIVRO;

--ano de publicação crescente
select * from LIVRO order by ano_publicacao;

--ano de publicação decrescente
select * from LIVRO order by ano_publicacao desc;

--ordenando por nome do autor
select * from LIVRO order by autor;