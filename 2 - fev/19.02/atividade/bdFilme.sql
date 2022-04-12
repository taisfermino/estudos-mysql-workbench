# 1- Criar um banco de dados Filme --
create database bdFilmes;

# 2- Selecione o banco de dados filme --
use bdFilmes;
    
# 3- Crias a tabela tbFilmes com os campos: idFilme, tituloFilme, generoFilme, diretorFilme onde idFilme é a chave primária da tabela --
create table tbFilme(
	idFilme int primary key auto_increment
	,tituloFilme varchar(50)
	,generoFilme varchar(20)
	,diretorFilme varchar (50)
	);
        
# 4- Exibir dados da tabela filmes --
select * from tbFilme;
        
# 5- Inserir os dados de um filme, da maneira como já vimos na aula passada  --    
insert into tbFilme values (3, 'Vingadores: Guerra Infinita', 'Ação e Aventura', 'Anthony Russo & Joe Russo');

# 6- Fornecer os dados de todos os campos da tabela, exatamente na ordem em que os campos foram criados  --    
select idFilme, tituloFilme, generoFilme, diretorFilme from tbFilme;  
    
# 7- Inserir os dados de um filme, porém apenas os dados do idFilme e do título --
insert into tbFilme (idFilme, tituloFilme) values (10, 'Batman - O cavaleiro das Trevas');

# 8- Inserir os dados de um filme, porém apenas os dados do idFilme e do título --
insert into tbFilme (tituloFilme, idFilme) values ('Batman - O cavaleiro das Trevas Ressurge', 2);

# 9- Inserir os dados de vários filmes, porém apenas o idFilme e o título  --  
insert into tbFilme (idFilme, tituloFilme) values
(4, 'Capitã Marvel'),
(5, 'Homem de Ferro'),
(6, 'Os Vingadores'),
(7, 'Thor: O Mundo Sombrio'),
(8, 'Guardiões da Galáxia'),
(9, 'Doutor Estranho no Multiverso da Loucura');

# 10- Exibir os dados da tabela Filme  --  
select * from tbFilme;

select * from tbFilme where idFilme = 2;

# Diferente de 2 --
select * from tbFilme where idFilme <> 2;

select * from tbFilme where idFilme >= 2;

# Exibir oq começa com tal letra --
select * from tbFilme where tituloFilme like 'B%';

# Exibir oq tem como segunda letra --
select * from tbFilme where tituloFilme like '_I%';

# Exibir todos que tem a letra --
select * from tbFilme where tituloFilme like '%V%';

# Alterar dados --
UPDATE tbFilme set generoFilme = 'Ação', diretorFilme = 'lalala' where idFilme = 5;

select * from tbFilme where tituloFilme like 'H%';

delete from tbFilme where idFilme = 2;

select * from tbFilme;

update tbFilme set generoFilme='drama' where idFilme in (5, 6);

update tbFilme set generoFilme='drama' where idFilme = 6 or idFilme = 10;

alter table tbFilme modify tituloFilme varchar (200);

# mostra a estrutura da tabela --
desc tbFilme;

describe tbFilme;