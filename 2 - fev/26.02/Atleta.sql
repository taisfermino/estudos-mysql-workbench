# 1- crie um banco de dados chamado atleta --
create database Atleta;

# 1.2- selecione esse banco de dados --
use Atleta;

#1.3- criar tabela chamada atleta --
create table tbAtleta (
	idAtleta int primary key not null
    ,nome varchar(40)
    ,modalidade varchar(40)
    ,qtdMedalha int
);

#1.4- inserir dados na tabela --
insert into tbAtleta values (1, 'João','Natação',3),
(2, 'Emilia','Natação',7),(3, 'Alan','Volei',4);

#1.5- Exibir todos os dados da tabela --
select * from tbAtleta;

#1.6- Exibir apenas os nomes e quantidade de medalhas dos atletas --
select nome, qtdMedalha from tbAtleta;

#1.7- Exibir apenas os dados dos atletas de determinada modalidade --
select * from tbAtleta where modalidade='Natação';

#1.8- Exibir os dados da tabela ordenados pela modalidade--
select * from tbAtleta order by modalidade;

#1.9- Exibir os dados da tabela ordenados pela quantidade de medalhas, em ordem decrescente --
select * from tbAtleta order by qtdMedalha desc;

#1.10- Exibir os dados da tabela dos atletas cujo nome contenha a letra s --
select * from tbAtleta where nome like '%S%';

#1.11- Exibir os dados da tabela cujo nome dos atletas comece com uma determinada letra --
select * from tbAtleta where nome like 'A%';

#1.12- Exibir os dados da tabela dos atletas cujo nome termine com a letra o --
select * from tbAtleta where nome like '%O';

#1.13- Exibir os dados da tabela dos atletas cujo nome tenha a penúltima letra r --
select * from tbAtleta where nome like '%R_';

#1.14- Eliminar a tabela--
drop table tbAtleta;

