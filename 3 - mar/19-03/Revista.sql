#-- Crie um banco de dados chamado Revista --
create database Revista;
use Revista;

#-- Criar tabela Revista --
	create table Revista (
		idRevista int primary key auto_increment
		,nome varchar(40)
		,categoria varchar(30)
	);

#-- Inserir 4 registros na tabela, mas sem informar a categoria --
	insert into Revista (nome) values 
		('Folha de São Paulo'),
		('Veja'),
		('Estadão'),
		('Forum');

#-- Exiba todos os dados da tabela --
	select * from Revista;

#-- Atualize os dados das categorias das 3 revistas inseridas --
	update Revista set categoria='Noticias' where idRevista in (1, 2, 3);

#-- Exiba os dados da tabela novamente para verificar se atualizou --
	select * from Revista;
    
#-- Insira mais 3 registros completos --
	insert into Revista (nome, categoria) values 
		('lili', 'Saude'),
		('lele', 'Politica'),
		('lala', 'Cinema');

#-- Exibir novamente os dados da tabela --
	select * from Revista;
    
#-- Exibir descrição da estrutura da tabela --
	describe Revista;

#-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres --
	alter table Revista modify categoria varchar(40);

#-- Exibir novamente descrição da estrutura da tabela --
	describe Revista;
    
#-- Acrescentar a coluna periodicidade á tabela, varchar(15) --
	alter table Revista add column periodicidade varchar(15);

#-- Exiba os dados da tabela --
	select * from Revista;

#-- Exibir coluna periodicidade da tabela --
	select periodicidade from Revista;
    
#-- Excluir coluna periodicidade da tabela --
	alter table Revista drop column periodicidade;

#-- Criar tabela editora --
	create table Editora (
		idEditora int primary key auto_increment
		,nomeEditora varchar(40)
        ,dataFund date
	)auto_increment = 1000;

#-- Inserir dados na tabela editora --
	insert into Editora (nomeEditora, dataFund) values
    ('Editora Band', '2020-02-02'),
    ('Editora Tec', '1987-12-03'),
    ('Editora Bandeirantes', '1967-09-07');

#-- Acrescentar a coluna fkEditora na tabela Revista --
	alter table Revista add column FkEditora int;
	alter table Revista add foreign key (FkEditora) references Editora(idEditora);

#-- Atualizar os dados da fkEditora --
	update Revista set FkEditora='1001' where idRevista = 1;
	update Revista set FkEditora='1000' where idRevista in (2, 3, 4);
	update Revista set FkEditora='1002' where idRevista in (5, 6, 7);

#-- Exiba os dados da tabela Revista --
	select * from Revista;
    
#-- Exiba os dados das Revistas e das Editoras correspondentes --
	select nome, categoria, FkEditora from Revista;
    
#-- Exiba os dados das Revistas e das Editoras, porém apenas de uma editora --
	select * from Revista where fkEditora=1000;
