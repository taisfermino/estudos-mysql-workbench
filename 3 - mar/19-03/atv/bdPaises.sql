create database bdPaises;

use bdPaises;

#-- 1. Crie uma tabela País com 4 atributos + id_pais --
	create table tbPais(
		id_pais int primary key auto_increment
        ,nomePais varchar(30)
        ,continentePais varchar(20)
        ,populacaoPais double
        ,moedaPais varchar(10)
    );

#-- 2. Crie uma tabela Atleta com 4 atributos + id_atleta + fk_pais --
	create table tbAtleta(
		id_atleta int primary key auto_increment
        ,nomeAtleta varchar(30)
        ,idadeAtleta int
        ,sexoAtleta varchar(1)
        CHECK (sexoAtleta = 'F' or sexoAtleta = 'M')
        ,cpfAtleta varchar(14)
        ,fk_pais int
        ,foreign key (fk_pais) references tbPais(id_pais)
    );
    
    	insert into tbPais values 
		 (null, 'França', 'Europa','66.99','Euro')
        ,(null, 'Singapura', 'Ásia','5.639','Dolar')
        ,(null, 'Suriname', 'América do Sul','575.991','Dolar')
        ,(null, 'Quênia', 'África','51.39','Xelim');
        
        
	insert tbAtleta values
		(null, 'Tiago Frances','20','M', '454.454.454-54',1)
	   ,(null, 'Guilherme Singapuriano', '27', 'M', '363.363.366-54', 2)
	   ,(null, 'Xuxa Surinamesa','14','F', '758.456.987-12',3)
	   ,(null, 'Aline Queniana', '45', 'F', '452.458.789-78', 4);
       
       #-- 3. Relacione os atletas com os países mostrando todos os campos da tabela atletas e dois campos da tabela país --

	select tbAtleta.id_atleta, tbAtleta.nomeAtleta, tbAtleta.idadeAtleta, tbAtleta.sexoAtleta, tbAtleta.cpfAtleta, tbAtleta.fk_pais,
		tbPais.nomePais, tbPais.continentePais 
		from tbPais join tbAtleta on tbAtleta.fk_pais = tbPais.id_pais;
 
#-- 4. Relacione os atletas com os países mostrando dois campos da tabela atletas e um campo da tabela país --
	select tbAtleta.nomeAtleta, tbAtleta.idadeAtleta, tbPais.nomePais
	from tbPais join tbAtleta on tbAtleta.fk_pais = tbPais.id_pais;
    
#-- 5. Crie uma tabela modalidade com 4 atributos + id_modalidade (descubra as FKs necessárias nessa tabela) --
	create table tbModalidade (
		id_modalidade int primary key auto_increment
        ,nomeModalidade varchar(50)
        ,faixaEtariaModalidade varchar(15)
        ,tipoModalidade varchar(20)
        ,numIntegrantesModalidade int
    );
    
    -- nenhuma tabela é necessaria nessa tabela pois uma modalidade pode ser exercida por muitos atletas e em muitos paises --
    
    #-- 6. Relacione a modalidade com uma das tabelas criadas acima --
	alter table tbAtleta add column fk_modalidade int;
	alter table tbAtleta add foreign key (fk_modalidade) references tbModalidade(id_modalidade);

#-- 7. Descreva a regra de negócio desse relacionamento --
-- A fk da modalidade está no atleta só pode ter uma modalidade mas uma modalidade pode ser exercida por muitos atletas --