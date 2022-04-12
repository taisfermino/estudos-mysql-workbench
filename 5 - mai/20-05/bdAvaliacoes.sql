create database dbAvaliacao;
use dbAvaliacao;

create table tbProfessor (
	idProfessor int primary key auto_increment,
    nomeProfessor varchar(50),
    disciplinaProfessor varchar(40)
)auto_increment = 10000;

create table tbGrupo (
	idGrupo int primary key auto_increment,
	nomeGrupo varchar(25),
    descProjetoGrupo varchar(50)
);

create table tbAvaliacoes (
	idAvaliacao int primary key auto_increment,
    datahoraAvaliacao datetime default current_timestamp,
    notaAvaliacao double,
    fkProfessor int,
    foreign key (fkProfessor) references tbProfessor(idProfessor),
    fkGrupo int,
    foreign key (fkGrupo) references tbGrupo(idGrupo)
);

create table tbAluno (
	idAluno int primary key ,
    nomeAluno varchar(50),
    emailAluno varchar(60),
	fkGrupo int,
    foreign key (fkGrupo) references tbGrupo(idGrupo)
);

insert tbProfessor values 
	(null, 'Fernando Brandão', 'Pesquisa e Inovação'),
    (null, 'Alex Barreira', 'Banco de Dados'),
    (null, 'Leonardo', 'Tecnologia da Informação'),
    (null, 'Vera', 'Socioemocional'),
    (null, 'Claudio Frizzarini', 'Algoritiomos');
    
insert tbGrupo values 
	(null, 'Frio Control', 'Armazenamento e Transporte de Vacinas'),
    (null, 'ColorfullLife', 'Alertas e contenção de crises em pessoas autistas');
    
insert tbAluno values 
	(1234, 'Isac Francisco', 'isac@gmail.com', 2),
    (4321, 'Matheus Lustosa', 'matheus@gmail.com', 2),
    (6789, 'Stefanie', 'ste@hotmail.com', 1),
    (9876, 'Mauricio Ishikawa', 'mauricio@bol.com', 1),
    (3694, 'Matheus Lemos', 'lemos@frio.com', 1);
    
insert tbAvaliacoes values 
	(null, now(), '10', 10000, 1),
    (null, now(), '9.7', 10000, 2),
	(null, now(), '8', 10001, 1),
    (null, now(), '7.6', 10002, 2),
	(null, now(), '8.4', 10003, 1),
    (null, now(), '9.5', 10004, 1);
    
# -- exibir todos os dados de cada tabela separadamente --
	select * from tbAluno;
    
	select * from tbGrupo;
    
	select * from tbProfessor;
    
    select * from tbAvaliacoes;
    
# -- Exibir dados dos grupos e de seus respectivos alunos --
	 select * from tbGrupo inner join tbAluno on fkGrupo = idGrupo;
    
# -- Exibir dados de um determinado grupo e de seus respectivos alunos --
	 select * from tbGrupo inner join tbAluno on fkGrupo = idGrupo where idGrupo = 1;
    
# -- Exibir a média das notas atribuidas aos grupos, no geral --
	 select avg(notaAvaliacao) from tbAvaliacoes;
    
# -- Exibir a nota minima e a nota máxima que foi atribuidas aos grupos, no geral --
	 select min(notaAvaliacao), max(notaAvaliacao) from tbAvaliacoes;

# -- Exibir a soma das notas dadas aos grupos, no geral --
	 select sum(notaAvaliacao) from tbAvaliacoes;
    
# -- Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos e a data e horario da avaliação --
	 select * from tbProfessor inner join tbAvaliacoes on fkProfessor = idProfessor inner join tbGrupo on fkGrupo = idGrupo;
    
# -- Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo e a data e horario da avaliação --
	 select * from tbProfessor inner join tbAvaliacoes on fkProfessor = idProfessor inner join tbGrupo on fkGrupo = idGrupo where idGrupo = 2;
     
# -- Exibir os nomes dos grupos que foram avaliados por um determinado professor --
	select nomeGrupo from tbGrupo inner join tbAvaliacoes on fkGrupo = idGrupo inner join tbProfessor on fkProfessor = idProfessor where nomeProfessor = 'Vera';
    
# -- Exibir os dados dos grupos, alunos correspondentes, professores que avaliaram e a data e horario da avaliação --
	select * from tbGrupo inner join tbAluno on fkGrupo = idGrupo inner join tbAvaliacoes inner join tbProfessor on fkProfessor = idProfessor;

# -- Exibir a quantidade de notas distintas --
	 select COUNT(distinct notaAvaliacao) from tbAvaliacoes;

# -- Exibir a identificação do professor (fk ou nome), a média das notas e a soma das notas atribuidas, agrupadas por professor -- 
	select nomeProfessor, sum(notaAvaliacao), avg(notaAvaliacao) from tbProfessor inner join tbAvaliacoes on fkProfessor = idProfessor group by idProfessor;
    
# -- Exibir a identificação do grupo (fk ou nome), a média das notas e a soma das notas atribuidas, agrupadas por grupo --
	select nomeGrupo, avg(notaAvaliacao), sum(notaAvaliacao) from tbGrupo inner join tbAvaliacoes on fkGrupo = idGrupo group by idGrupo;

# -- Exibir a identificação do professor (fk ou nome), a menor nota e a maior nota atribuida, agrupada por professor --
	 select nomeProfessor, min(notaAvaliacao), max(notaAvaliacao) from tbProfessor inner join tbAvaliacoes on fkProfessor = idProfessor group by idProfessor;

# -- Exibir a identificação do grupo (fk ou nome), a menor nota e a maior nota atribuida, agrupada por grupo --
	select nomeGrupo, min(notaAvaliacao), max(notaAvaliacao) from tbGrupo inner join tbAvaliacoes on fkGrupo = idGrupo group by idGrupo;

