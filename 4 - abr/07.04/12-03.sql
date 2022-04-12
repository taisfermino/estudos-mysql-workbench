USE faculdade;

CREATE TABLE aula (
    idAula int primary key auto_increment,
    nomeAula varchar(75),
    tipo char(1),
    check (tipo = 'P' or tipo = 'H' or tipo = 'R'),
    dtAula date,
    mensagem varchar(100)
);


Select * from aula;


INSERT INTO aula values 
	(null, 'Apresentação da disciplina e primeiros conceitos',
		'H', '2021-02-04', 'Conhecendo Banco de Dados'),
    (null, 'Continuação de conceitos e primeiros comandos SQL',
		'R', '2021-02-11', 'O primeiro comando a gente nunca esquece');
    
    
SELECT * FROM aula;

INSERT INTO aula (nomeAula, tipo, dtAula, mensagem) values 
	('Permissão de usuário e comandos gerais', 'p', 
    '2021-02-18', 'Sejam bem vindos!');
  
INSERT INTO aula (nomeAula, tipo, dtAula, mensagem) values 
	('Linha de comando - CLI - MySQL Server Client', 'P', 
    '2021-02-25', 'Codando no client!');

    
INSERT INTO aula (nomeAula, tipo, dtAula, mensagem) values 
	('Avaliaçao Continuada I', 'p', 
    '2021-03-04', 'Boa prova!');
    
INSERT INTO aula (nomeAula, tipo, dtAula, mensagem) values 
	('Entregáveis de banco de dados', 'o', 
    '2021-03-11', 'Boa Sprint!');
    
INSERT INTO aula (nomeAula, tipo, dtAula, mensagem) values 
	('Chave estrangeira, Constraint e Aliases', 'o', 
    '2021-03-18', 'Agora complicou! =)');
    
-- 
SELECT * FROM Aula;
select * from Aluno;

-- criar a tabela chamada
CREATE TABLE chamada (
	idChamada int primary key auto_increment,
    dtPresenca datetime default current_timestamp,
    presenca char(3),
    check (presenca = 'sim' or presenca = 'não'),
    fkAula int, -- chave estrangeira referente a tabela aula
    foreign key (fkAula) references aula(idAula) -- configuração chave estrangeira fkAula
) auto_increment = 20000;

CREATE TABLE Aluno (
    idAluno int primary key auto_increment,
    nomeAluno varchar(75)
);

ALTER TABLE Chamada ADD Column FK_aluno int;
ALTER TABLE Chamada ADD FOREIGN KEY (FK_aluno) REFERENCES Aluno(IdAluno);


-- exibir os dados da tabela chamada;
select * from chamada join aula on chamada.fkaula = aula.idaula;

select * from aula;
select * from aluno;
select * from chamada;

INSERT INTO Aluno (nomeAluno) values ('Jorge');

INSERT INTO Chamada values 
		(null,'2021-11-11','sim',1,1),
        (null,'2021-11-11','sim',1,2),
        (null,'2021-11-11','sim',1,3),
		(null,'2021-11-11','não',1,4);



-- inserir dados na tabela chamada;
insert into chamada (presenca, fkAula,FK_Aluno) values
	('sim',2,3);
    
    
insert into chamada (fkAluno, presenca, fkAula) values
	('01211025','sim',7);
    
-- exibir todos os dados da tabela chamada e o nome do aluno
select chamada.*, aluno.nome from aluno join chamada 
	on fkAluno = ra;
 



-- AVANÇADO - JOIN ENTRE 2 TABELAS
select * from aluno join chamada on fk_Aluno = idaluno;


-- AVANÇADO - JOIN ENTRE 3 TABELAS
select * from aluno join chamada on fk_Aluno = Idaluno 
                    join aula on fkAula = idAula;

-- exibir presença e a mensagem da aula do dia 19/03.

select chamada.*, aula.mensagem from aula join chamada 
	on chamada.fkAula = aula.idAula where chamada.dtPresenca = '2021-03-19 14:46:47';

select nomealuno, chamada.presenca, dtpresenca from Aula join chamada on fkAula = Idaula
                    join Aluno on fk_Aluno = idAluno                 
                    where chamada.dtPresenca = '2021-03-19 14:46:47';
                    
 
-- Bons estudos!