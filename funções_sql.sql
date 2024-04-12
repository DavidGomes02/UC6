/*
Função para contar o número total de livros em uma biblioteca
*/  

create function fn_contar_livros(@cnpj nvarchar(14))
returns int
as
begin
	declare @total_livros int;
	select @total_livros = count(*) from LIVRO_BIBLIOTECA
	where cnpj = @cnpj;
	return @total_livros
	end;

	select dbo.fn_contar_livros('12345678000123') as total_livros

	select * from LIVRO_BIBLIOTECA

/*
total de funcionarios
*/
	create function fn_contar_funcionario()
	returns int
	as
	begin 
		declare @total_funcionario int;
		select @total_funcionario = count(FUNCIONARIO.matricula) from FUNCIONARIO
		return @total_funcionario
			end;
			select dbo.fn_contar_funcionario() as total_funcionario

/*
função que calcula total de palestras
*/
create function fn_total_palestra(@tipo nvarchar(30))
returns int
as
begin
	declare @total_eventro int;
	select @total_eventro = count(*) from EVENTO
	where tipo = @tipo;
	return @total_evento
	end;

	select dbo.fn_total_palestra('palestra') as total_evento

	select * from PALESTRA