create database bdFrioControl;
use bdFrioControl;

create table tbLoginFuncionario (
	idLoginFuncionario int primary key auto_increment,
    userLoginFuncionario varchar(20),
    senhaLoginFuncionario varchar(30)
);

create table tbFuncionario (
	idFuncionario int primary key auto_increment,
    nomeFuncionario varchar(50),
    fkLoginFuncionario int,
    foreign key (fkLoginFuncionario) references tbLoginFuncionario (idLoginFuncionario)
);

create table tbSensor (
	idSensor int primary key auto_increment,
    nomeSensor varchar(30),
    enderecoSensor varchar(30),
    fkFuncionario int,
    foreign key (fkFuncionario) references tbFuncionario (idFuncionario)
);

# ------------------------------------------ Comandos do exercicio 1 - PET ------------------------------------------

#-- Inserir dados nas tabelas --
insert into tbLoginFuncionario values (null, 'Alex1', '321789'), (null, 'Fernando2021', '78245'), (null, 'Marise456', '54154');

insert into tbLoginFuncionario values (null, 'Alessandra547', '321789'), (null, 'FernandoSAED', '78245');

insert into tbFuncionario values (null, 'Alex', 1), (null, 'Fernando', 2), (null, 'Marise', 3);

insert into tbFuncionario values (null, 'Alessandra Vieira', 4), (null, 'Fernando Vieira', 5);

insert into tbSensor values (null, 'Sensor1', 'Bloco 1', 1), (null, 'Sensor2', 'Bloco 2', 2), (null, 'Sensor3', 'Bloco 3', 3);

#-- Exibir todos os dados das tabelas criadas separadamente --
select * from tbLoginFuncionario;
select * from tbFuncionario;
select * from tbSensor;

#-- alterar tamanho da coluna nome do Funcionario --
alter table tbFuncionario modify nomeFuncionario varchar(60);

# -- exibir os dados dos Funcionarios em ordem crescente pelo nome --
select * from tbFuncionario order by nomeFuncionario;

# -- Exibir os dados dos Funcionarios cujo nome comece com determinada letra --
select * from tbFuncionario where nomeFuncionario like 'a%';

# -- Exibir os dados dos Funcionarios que tem o mesmo sobrenome --
select * from tbFuncionario where nomeFuncionario like '%Vieira';

# -- Exibir dados dos Sensores e seus respectivos donos --
select tbSensor.* from tbSensor inner join tbFuncionario on fkFuncionario = idFuncionario;

# -- Exibir dados de um sensor e seu respectivo dono --
select nomeSensor, enderecoSensor, idSensor, tbSensor.* from tbSensor inner join tbFuncionario on fkFuncionario = idFuncionario where idFuncionario = 1;

# -- Excluir algum Sensor --
delete from tbSensor where idSensor = 3;

# -- Exibir os dados dos Sensor para verificar se excluiu --
select * from tbSensor;

# -- Excluir as tabelas -- 
drop table tbSensor;
drop table tbFuncionario;
drop table tbLoginFuncionario;
  
# ---------------------------------------- Comandos do ecercicio 3 - Gastos ------------------------------------

# ---- Exiba os dados de cada tabela filtrando por algum dado ------

# -- tbSensor | filtrando por nome --
select * from tbSensor where nomeSensor like 'Sensor1';

# -- tbFuncionario | filtrando por data --
select * from tbFuncionario where nomeFuncionario like 'Alex';

# -- tbLoginFuncionario | filtrando por data --
select * from tbLoginFuncionario where userLoginFuncionario like 'Fernando2021';

# ------------ Atualize valores ja inseridos na tabela --------------
update tbFuncionario set nomeFuncionario = 'Fernando Brandão' where idFuncionario = 2;

