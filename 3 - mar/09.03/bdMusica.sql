# 2- Crie um banco de dados chamado Musica --
create database Musica;
use Musica;

# 2.1- Criar tabela Musica --
create table tbMusica (
	idMusica int primary key not null
    ,titulo varchar(40)
    ,artista varchar(40)
    ,genero varchar(40)
);

# 2.2 Inserir dados na tabela --
insert into tbMusica values (1, 'Balão', 'Orochi', 'RAP'), (2, 'Save Your Tears', 'The Weeknd', 'POP'),
							(3, 'Mirrors', 'Justin Timberlake', 'POP'),(4, 'Diamons', 'Rihanna', 'POP'),
                            (5, 'Vai me Dando Corda', 'Grupo Menos é Mais', 'Pagode'), (6, 'Californication', 'Red Hot Chili Peppers', 'ROCK'),
                            (7, 'So Sick', 'Ne-Yo', 'POP'), (8, 'Photograph', 'Jaden', 'POP'), (9, 'SOLTO', 'Djonga', 'RAP');

# a- Exibir todos os dados --
select * from tbMusica;

# b- Exibir apenas os titulos e os artistas das musicas --
select titulo, artista from tbMusica;

# c- Exibir apenas os dados das musicas de um determinado genero --
select * from tbMusica where genero='POP';

# d- Exibir os dados das musicas de um determinado artista --
select * from tbMusica where artista='Rihanna';

# e- Exibir os dados da tabela ordenados pelo titulo da musica --
select * from tbMusica order by titulo;

# f- Exibir os dados da tabela ordenados pelo artista em ordem decrescente --
select * from tbMusica order by artista desc;

# g- Exibir os dados da tabela cujo titulo comece com uma determinada letra --
select * from tbMusica where titulo like 'M%';

# h- Exibir os dados da tabela cujo artista termine com determinada letra --
select * from tbMusica where artista like '%I';

# i- Exibir os dados da tabela cujo genero tenha como segunda letra determinada letra --
select * from tbMusica where titulo like '_A%';

# j- Exibir os dados da tabela das musicas cujo genero tenha como segunda letra determinada letra --
select * from tbMusica where genero like '_A%';

# k- Elimine a tabela --
drop table tbMusica;