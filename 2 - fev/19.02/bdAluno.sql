# Banco de Dados Aula 01 - 19/02/2021 -- 
create database Aluno;
	use Aluno;
		create table tbAluno(
        ra int primary key
        ,nome varchar(50)
        ,bairro varchar(40)
        );
        
        # Renomear --
        alter table tbAluno rename to Aluno;
        
        # Excluir tabela --
        drop table tbAluno;
        
        #Exibir tabela --
        select * from tbAluno;
        
        # Exibir nomes da tbAluno --
        select nome from tbAluno;
        
        # Exibir nome ra da tbAluno --
        select nome, ra from tbAluno;
        
        # Inserir dados de um aluno no banco --
        insert into tbAluno values (0125441, 'Tais', 'Guaianazes');
        
        # Exibir os dados de um aluno --
        select * from tbAluno;
        
        # Inserir dados de varios alunos --
        insert into tbAluno values 
        (01205555, 'Luiz Gustavo', 'Jardim Primavera'),
		(01202093, 'Luis Fernando Rocha', 'Jd.iracema'),
		(01202003, 'Caio', 'Taboão'),
		(01202099, 'Vinícius', 'Pirituba'),
		(01202079, 'Jorge ULIAM', 'Parque casa de pedra'),
		(01202027, 'Lucas', 'Pirituba');
