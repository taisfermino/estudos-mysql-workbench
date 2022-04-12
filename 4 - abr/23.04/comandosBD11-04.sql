create database cadastro; -- cria banco de dados


use cadastro; -- usa o banco de dados

create table cursos ( -- cria tabela dentro do banco de dados
idCurso int not null primary key auto_increment,
nome varchar(30) not null,
descricao text,
carga int unsigned ,
totalAulas int unsigned, -- que não seja negitvo
ano year default '2021' -- default=  caso ano não receba valores, tem 2021 como padrão 
) default charset =utf8mb4;

insert into cursos values 
(default,'HTML5','Curso de HTML5','40','37','2019'),
(default,'Algoritmos','Lógica de Programação','20','15','2019'),
(default,'Photoshop','Dicas de Photoshop CC','40','8','2019'),
(default,'PHP','Curso de PHP para iniciantes','40','20','2020'),
(default,'Java','Introdição à Linguagem Java','20','29','2020'),
(default,'MySQL','Banco de dados MySQL','30','15','2018'),
(default,'Word','Curso completo de word','40','30','2018');


																						-- -- -- -- -- alter table comandos  -- -- -- -- --

-- alter table add  -- adiciona coluna
-- alter table drop -- deleta coluna
-- alter table add after -- adiciona coluna antes de outra
-- alter table add first -- adiciona coluna em primeiro
-- alter table modify -- altera a descrição de uma coluna (ex: de char pra vachar())
-- alter table change -- renomeia COLUNA
-- alter table rename to -- renomeia * TODA A TABELA *

																								-- -- -- -- -- update -- -- -- -- --

-- atualiza os dados da tabela
-- limit (3) -- update com limit por segurança 

																								-- -- -- -- -- delete -- -- -- -- --
            
-- deleta dados da tabela 

																								-- -- -- -- -- select -- -- -- -- --

select * from cursos; -- seleciona todos os registros da tabela
select  ano, nome, carga from cursos; -- seleciona por colunas - separa por virgula

																								-- -- -- -- -- order by -- -- -- -- --
select * from cursos
order by nome -- ordena por campo/coluna
desc; -- ordem descrescente e asc ordem crescente 
  
																								-- -- -- -- -- where -- -- -- -- --
                                                                                                
      
select * from cursos where ano = '2020' order by nome; 
 -- seleciona todos os registros da tabela -- seleciona as linhas que este registro está contido -- ordena pelo campo selecionado

select nome, descricao, ano from cursos where ano <= '2019' order by ano; 
-- seleciona por coluna -- seleciona a linha que o dado esta contido -- ordena pelo campo selecionado
 
 
 
																								-- -- -- -- -- between -- -- -- -- --
   
 select nome, ano from cursos
 where ano between 2019 and 2021
 order by nome desc, ano asc; -- dados entre 2019 e 2021 
 
																								-- -- -- -- -- in -- -- -- -- --
                                    
 select nome, ano from cursos
 where ano in (2018,2020) -- dados de 2018 e 2020 
 order by nome;
 
																								-- -- -- -- -- and -- -- -- -- --
                                  
        
 select * from cursos
 where carga > 35 and totalAulas <30; -- apenas seleciona onde as todas condições sejam verdadeiras
 
																								-- -- -- -- -- or -- -- -- -- --
                                    
          
  select * from cursos
 where carga > 35 or totalAulas <30; -- Seleciona onde uma das condições seja verdadeira
 
 select * from cursos
 where nome = 'PHP'; -- Todas as linha que nome seja PHP
 
																								-- -- -- -- -- like -- -- -- -- --
                               							   
 select * from cursos 
 where nome like 'a%'; -- seleciona todos os registros que o campo nome COMEÇA com 'a'
 
 select * from cursos
 where nome like '%a'; -- seleciona todos os registros que o campo nome TERMINA com 'a' ou 'A' não difere.
 
 select * from cursos
 where nome like '%o%'; -- seleciona todos os registros que o campo nome possua 'o', independendte da sua posição.
 
  select * from cursos
 where nome not like '%o%'; -- seleciona todos os registros que o campo nome NÃO tenha 'o'
 
 select * from cursos
 where nome like '_l%'; -- seleciona os registro cuja a SEGUNDA letra seja 'l'.
 -- o sublinhado '_' exige que exista exato 1 caracter antes ou depois da letra.
 
 select * from cursos 
 where nome like '%q_'; -- seleciona os registro cuja a PENULTIMA letra seja 'q'

 
																							-- -- -- -- -- distinct -- -- -- -- --
 
 select distinct carga from cursos; -- seleciona os dados sem repetição 
 select distinct ano from cursos;
 
																							-- -- -- -- -- count -- -- -- -- --
 
 select count(*)  -- conta quantos campos existem na tabela
 from cursos;
 -- outra situação
 select count(*) from cursos where carga <=30;
 
																							-- -- -- -- -- max -- -- -- -- --
	
  select max(carga) from cursos; -- seleciona a maior carga (ou quaisquer outros parametros) da tabela
  select max(ano) from cursos; -- leia como 'selecione dessa tabela o maior ano' 
  
  
																							-- -- -- -- -- min -- -- -- -- --
			
select min(ano) from cursos; -- seleciona o menor numero da coluna ano
select min(totalAulas) from cursos; -- seleciona menor numero da coluna



																							-- -- -- -- -- sum -- -- -- -- --
                          
                     
 select sum(totalAulas) from cursos; -- soma todas as aulas da tabela
 select sum(totalAulas) from cursos where ano = '2020';-- soma todas as aulas da tabela de 2020
 
 
 
																							-- -- -- -- -- avg -- -- -- -- --
      
select avg(totalAulas) from cursos; -- faz a media. Soma todas as aulas e divide pelos cursos
 -- 154h / 7 cursos
 
 
																					-- -- -- -- -- agrupando e agregando -- -- -- -- --
                      
select carga from cursos
group by carga; -- agrupa por campo

select carga, count(nome) from cursos
group by carga;  -- mostra quantos cursos eu tenho com cada carga horaria

select carga, count(nome) from cursos 
group by carga 
having count(nome) >3;-- parametro 
-- mostra quem tem nome >3

select avg(carga) from cursos; -- media de carga de todos os cursos

select carga, count(*) from cursos -- seleciona a coluna carga e conta quantos registros tem nela
where ano >2019 -- no ano de 2019
group by carga -- agrupados pela ordem da coluna carga
having carga > (select avg(carga) from cursos); -- quem tiver a carga maior que a media (select da linha de cima)



																		-- -- -- -- -- modelo de dados relacionais  -----  relacionando tabela  ----------
	
																										-- n:n / n:1 / 1:1
        
        
 alter table gafanhotos
 add cursoPreferido int; -- adiciona o uma coluna com o mesmo tipo e tamanho que o idCursos
 
 alter table gafanhotos
 add foreign key(cursoPreferido) -- adiciona cursoPreferido como fk da tabela
 references cursos (idCurso); -- referencia da tabela cursos a pk
 
 update gafanhotos 
 set cursoPreferido ='6'
 where id = '1';
 
   -- comando feito automatico 
   -- alterar o dado na tabela
   -- no canto inferior direito botão 'apllay'
   -- copiar comando caso ele não entre automatico 
   
 UPDATE `cadastro`.`gafanhotos` SET `cursoPreferido` = '1' WHERE (`id` = '2');
UPDATE `cadastro`.`gafanhotos` SET `cursoPreferido` = '1' WHERE (`id` = '3');
UPDATE `cadastro`.`gafanhotos` SET `cursoPreferido` = '5' WHERE (`id` = '4');
UPDATE `cadastro`.`gafanhotos` SET `cursoPreferido` = '7' WHERE (`id` = '5');
UPDATE `cadastro`.`gafanhotos` SET `cursoPreferido` = '4' WHERE (`id` = '6');
UPDATE `cadastro`.`gafanhotos` SET `cursoPreferido` = '3' WHERE (`id` = '7');
UPDATE `cadastro`.`gafanhotos` SET `cursoPreferido` = '2' WHERE (`id` = '8');



	-- integridade referencial 
	-- não consigo modificar um campo se ele for afetar a transação/ relação



delete from cursos where idCurso = '6'; -- vai dar erro pois esse id está relacionado com outra tabela

select * from gafanhotos; -- a fk mostra o codigo e não o curso


																									-- -- -- -- -- join -- -- -- -- --
                                                 

select gafanhotos.nome, gafanhotos.cursoPreferido, cursos.nome, cursos.ano
-- nome da tabela . nome da coluna que quer selecionar
from gafanhotos 
join cursos; -- junção de duas tabelas sem filtro


																								    -- -- -- -- -- on -- -- -- -- --

select * from gafanhotos;
select gafanhotos.nome, cursos.nome, cursos.ano
from gafanhotos 
join cursos
on cursos.idCurso = gafanhotos.cursoPreferido; -- mostra somente o campo que a fk faz a relação


																										-- apelido de coluna

																												-- as
        
select g.nome, c.nome, c.ano
from gafanhotos as g join cursos as c -- apelido para nome de tabelas
-- precisa deixar o nome completo depois do 'from' e do 'join'
on c.idCurso = g.cursoPreferido
order by g.nome;
-- o comando funciona da mesma maneira 


																								-- -- -- -- -- outer join -- -- -- -- --
                                                

select g.nome, c.nome, c.ano
from gafanhotos as g left outer join cursos as c -- da preferencia para todos os registros da tabela Gafanhoto
-- left outer join ou left join
on c.idCurso = g.cursoPreferido;
-- mostra todos os gafanhotos inclusive os que não tem preferencia por nenhum curso

select g.nome, c.nome, c.ano
from gafanhotos as g right outer join cursos as c -- da preferencia para todos os registros da tabela cursos
-- right outer join ou right join
on c.idCurso = g.cursoPreferido;
-- mostra todos os cursos inclusives o que nenhum gafanhoto prefere



																						-- -- -- -- -- nova tabela de relacinamento n:n -- -- -- -- --

create table g_Assiste_C (
id int not null auto_increment primary key,
data date,
idGafanhoto int ,
idCurso int,
foreign key (idGafanhoto) references gafanhotos(id),
foreign key (idCurso) references cursos(idCurso)
)default charset = utf8mb4;

insert into g_Assiste_C values
(default,'2014-03-01','1','2');

																								-- -- -- -- -- junções de join -- -- -- -- --

select  g.nome, c.nome from gafanhotos g -- g é apelido da tabela
-- mostra nome do gafanhoto e nome do curso
join g_Assiste_C a -- relaciona
on g.id = a.idGafanhoto -- define o relacionamento
join cursos c -- relaciona com uma terceira tabela
on c.idCurso = a.idCurso -- define o relacionamento com a terceira tabela
order by g.nome;


 
 
 
 
 
 
 
 
 
 

