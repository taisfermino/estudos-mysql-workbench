create database bdGastos;
use bdGastos;

# -- Crie uma entidade pessoa, com atributos idPessoa, nome, data de nascimento e profissão --
create table tbPessoa (
	idPessoa int primary key auto_increment,
	nomePessoa varchar(45),
    dtnascPessoa date,
    profissaoPessoa varchar(20)
);

# -- Crie uma entidade Gasto, com atributos idGasto, data, valor e descrição --
create table tbGasto(
	idGasto int primary key auto_increment,
    dataGasto date,
    valorGasto double,
    descGasto varchar(45),
    fkPessoa int,
    foreign key (fkPessoa) references tbPessoa(idPessoa)
); 

# ------------------------ insira dados nas tabelas ---------------

# -- tbPessoa --
insert into tbPessoa values (null, 'Fernando', '1980-08-08', 'Professor'), (null, 'Alex', '1990-09-09', 'Analista de Dados');

# -- tbGasto | pessoa 1 --
insert into tbGasto values (null, '2021-04-23', '3000.00', 'TV SMART LG 55 polegadas', 1), (null, '2021-04-25', '600.00', 'Compra da Semana', 1);

# -- tbGasto | pessoa 2 --
insert into tbGasto values (null, '2021-02-05', '250.00' , 'moranguetes para as aulas', 2), (null, '2021-06-25', '210.00', 'Reposição moranguetes para as aulas', 2);

# -- Insira os dados das tabelas individualmente --
select * from tbPessoa;

select  * from tbGasto;

# ------------------ Exiba os dados de cada tabela filtrando por algum dado ---------------------

# -- tbPessoa | filtrando por nome --
select * from tbPessoa where nomePessoa like 'Fernando';

# -- tbDados | filtrando por data --
select * from tbGasto where dataGasto like '2021-04-25';


# ------------------ Exiba os dados das pessoas e dos seus gastos correspondentes -------------------
select * from tbPessoa join tbGasto on fkPessoa = idPessoa;


# ------------------ Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes ---------------------
select * from tbPessoa join tbGasto on fkPessoa = idPessoa where tbPessoa.nomePessoa = 'Alex';


# ------------ Atualize valores ja inseridos na tabela --------------
update tbPessoa set profissaoPessoa = 'Professor de Banco' where idPessoa = 2;


# -------------- Exclua um ou mais registros de alguma tabela -----------
delete from tbGasto where idGasto = '3';
