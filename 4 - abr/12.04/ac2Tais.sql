# -- Criar o banco de dados ac2seuNome --
create database ac2Tais;

# -- Selecionar o banco de dados criado; --
use ac2Tais;


# -- Criar as tabelas e inserir dados; --
create table tbAutor (
	idAutor int primary key auto_increment
    ,nomeAutor varchar(50)
    ,dtnascAutor date
    ,cpfAutor varchar(14)
    ,generoAutor varchar(10),
    check (generoAutor= 'Feminino' or generoAutor = 'Masculino')
);

create table tbLivro (
	idLivro int primary key auto_increment
    ,nomeLivro varchar(30)
    ,generoLivro varchar(30)
    ,idiomaLivro varchar(20)
    ,lancamentoLivro date
    ,paginasLivro int
	,fkAutor int
	,foreign key (fkAutor) references tbAutor (idAutor)
)auto_increment 100;


insert into tbAutor values
	 (null, 'George Orwell', '1903-06-25', '111.111.111-11', 'Masculino')
	,(null, 'Aldous Huxley', '1894-07-26', '222.222.222-22', 'Masculino')
    ,(null, 'Clarice Lispector', '1920-12-10', '333.333.333-33', 'Feminino')
    ,(null, 'Angela Davis', '1944-01-26', '444.444.444-44', 'Feminino');
    
insert into tbLivro values
	(null, '1984', 'Ficção Científica Social', 'Português', '1945-06-08',  416, 1),
    (null, 'A revolução dos bichos', 'Ficção distópica', 'Português', '1949-08-17',  152, 1),
    (null, 'Admirável mundo novo', 'Ficção Científica',  'Português', '1932-01-18',  312, 2),
    (null, 'A hora da estrela', 'Romance psicológico',  'Português', '1977-05-20',  88, 3),
    (null, 'Mulheres, Raça e Classe', 'Feminismo Histórico', 'Português', '1981-04-01',  248, 4),
    (null, 'Mulheres, cultura e política', 'Fala', 'Português', '2015-08-17',  144, 4);

   
# -- Exibir os dados das tabelas criadas separadamente --
select * from tbAutor;

# -- Exibir os dados das tabelas criadas separadamente --
select * from tbLivro;

# -- Exibir os dados das tabelas de forma correspondente, ou seja, com a junção entre as duas tabelas --
select idLivro, nomeLivro, generoLivro, idiomaLivro, lancamentoLivro, paginasLivro, tbAutor.* 
from tbLivro inner join tbAutor on fkAutor = idAutor;

# -- Exibir os dados das tabelas, de forma correspondente, ou seja, com a junção entre as duas tabelas e com uma condição de filtro --
select idLivro, nomeLivro, generoLivro, idiomaLivro, lancamentoLivro, paginasLivro, tbAutor.* 
from tbLivro inner join tbAutor on fkAutor = idAutor where idAutor = 1;


# -- Exibir os dados de uma tabela utilizando uma das funções aprendidas (MAX, MIN, SUM, GROUP BY, AVG, COUNT) --
select count(*) from tbLivro;

# -- Exibir os dados de uma tabela utilizando uma das funções aprendidas (MAX, MIN, SUM, GROUP BY, AVG, COUNT) --
select sum(paginasLivro) from tbLivro;

