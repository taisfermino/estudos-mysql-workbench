create database Escola;
use Escola;

create table Disciplinas (
	idDisciplina int primary key auto_increment
    ,nome varchar(40)
    ,carga int 
    ,fkProfessor int
);

create table Professor (
	idProfessor int primary key auto_increment
    ,nome varchar(40)
);

alter table Disciplinas add foreign key (fkProfessor) references Professor(idProfessor);

	insert into Professor (nome) values
    ('Batman'),
    ('Coringa'),
    ('Ravena');
    
	insert into Disciplinas (nome, carga, fkProfessor) values
    ('lala', 215, 1),
    ('lele', 541, 2),
    ('lili', 254, 3);

select * from Disciplinas join Professor where Disciplinas.fkProfessor=idProfessor;

create table Aula(
idAula int primary key auto_increment
,nomeAula varchar(40)
,dataAula date
,tipo char(1),
check (tipo = 'o' or tipo = 'h' or tipo = 'p')
,mensagem varchar(100)
);

insert into Aula values (null, 'Algoritimos', '2021-03-19','p','lala')
,(null, 'Banco de Dados', '2021-03-19','p','lala')
,(null, 'Socio', '2021-03-19','p','lala')
,(null, 'ArqComp', '2021-03-19','p','lala');

select * from Aula;

create table chamada(
idChamada int primary key auto_increment
,dtPresenca datetime default current_timestamp
,presenca char(3)
,check (presenca = 'sim' or presenca = 'não')
,fkAula int
,foreign key (fkAula) references aula(idAula)
)auto_increment = 20000;

select * from chamada;

insert into chamada (presenca, fkAula) values 
('sim', 1), ('sim', 2), ('não', 3), ('não', 4);

	select * from chamada join Aula where chamada.fkAula=Aula.idAula;
    select * from chamada join Aula on fkAula = idAula;
    
   
create table Aluno(
idAuluno int primary key auto_increment
,nome varchar(50)
);

alter table chamada add column fkAluno int;
alter table chamada add foreign key (fkAluno) references Aluno(idAuluno);

insert into Aluno (nome) values
('Tais'), ('Tiago'), ('Guilherme'), ('Gustavo');

select * from Aluno;

alter table Aluno;

drop database Escola;

 select * from chamada join Aluno on fkAluno = idAuluno;
 
 update chamada set FkAluno='1' where idChamada = 20000;
 update chamada set FkAluno='2' where idChamada = 20001;
 update chamada set FkAluno='3' where idChamada = 20002;
 update chamada set FkAluno='4' where idChamada = 20003;
 
 #-- só exibir presença e mensagem da aula 19-03  --
 select chamada.presenca, aula.mensagem from Aula join chamada
 on chamada.fkAula = Aula.idAula where chamada.dtPresenca='2021-03-19 14:16:24';