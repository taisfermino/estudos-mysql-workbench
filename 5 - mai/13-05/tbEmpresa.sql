create database bdEmpresa;
use bdEmpresa;

# -- 1 empresa tem muitos funcionarios (fk no muitos) --
# -- 1 empresa tem muitos departamentos (fk no muitos) --
create table tbEmpresa(
    cnpjEmpresa int not null primary key,
	nomeEmpresa varchar (30),
    cepEmpresa varchar (20),
    ufEmpresa varchar (2),
    cidadeEmpresa varchar (50),
    bairroEmpresa varchar (50),
    logEmpresa varchar (50),
    numEmpresa int,
    complEmpresa varchar (50)
);
    
    
# -- 1 empresa pode ter muitos departamentos --
create table tbDepartamento(
	idDepartamento int not null primary key auto_increment,
	nomeDepartamento varchar (50),
    areaDepartamento varchar (20),
    fkEmpresa int,
    foreign key (fkEmpresa) references tbEmpresa(cnpjEmpresa)
);

# -- 1 funcionario pode ter apenas 1 chefe --
# -- 1 funcionario pode trabalhar em apenas 1 departamento --
# -- O chefe também é um funcionario --
create table tbFuncionario(
    idFuncionario int primary key auto_increment,
    cpfFuncionario varchar(11),
	nomeFuncionario varchar (50),
    cepFuncionario varchar (20),
    ufFuncionario varchar (2),
    cidadeFuncionario varchar (50),
    bairroFuncionario varchar (50),
    logFuncionario varchar (50),
    numFuncionario int ,
    complFuncionario varchar (50),
	tipoFuncionario varchar(20),
    check (tipoFuncionario = 'Empregado' or tipoFuncionario = 'Chefe'),
    fkChefe int,
    foreign key (fkChefe) references tbFuncionario(idFuncionario),
	fkEmpresa int,
    foreign key (fkEmpresa) references tbEmpresa(cnpjEmpresa),
	fkDepartamento int,
    foreign key (fkDepartamento) references tbDepartamento(idDepartamento)
);

insert into tbEmpresa values (1451254851, 'Santander', '123654-521', 'MG', 'Belo Horizonte', 'Buritis', 'Sagrada Familia', 25, 'A');
insert into tbEmpresa values (1542548756, 'Getnet', '786542-369', 'PI', 'Teresina', 'Picos', 'Feliciano de Mendonça', 785, 'C');

insert into tbDepartamento values (null, 'Departamento Administrativo', 'Administrativa', 1451254851);
insert into tbDepartamento values (null, 'Departamento Financeiro', 'Financeira', 1451254851);
insert into tbDepartamento values (null, 'Recursos Humanos', 'RH', 1542548756);
insert into tbDepartamento values (null, 'Departamento Comercial', 'Comercial', null);

insert into tbFuncionario values (null, '45216987453', 'Tiago', '123654-521', 'MG', 'Belo Horizonte', 'Buritis', 'Sagrada Familia', 40, 'D', 'Chefe', 1, 1451254851, 2);
insert into tbFuncionario values (null, '10054236587', 'Daniela', '123654-521', 'MG', 'Belo Horizonte', 'Buritis', 'Sagrada Familia', 50, 'E', 'Empregado', 1, 1451254851, 3);
insert into tbFuncionario values (null, '10054236587', 'Diana', '786542-369', 'PI', 'Teresina', 'Picos', 'Feliciano de Mendonça', 800, 'C', 'Empregado', null, 1542548756, 4);

# -- mostrar todas as tabelas separadamente
	select * from tbEmpresa;
    
# -- mostrar todas as tabelas separadamente
    select * from tbDepartamento;
    
# -- mostrar todas as tabelas separadamente
    select * from tbFuncionario;
    
# -- mostrar os departamentos de determinada empresa
select * from tbDepartamento inner join tbEmpresa on fkEmpresa = cnpjEmpresa where nomeEmpresa = 'Santander';

# -- mostar apenas os departamentos com empresa
select * from tbDepartamento right join tbEmpresa on fkEmpresa = cnpjEmpresa;

# -- mostar todos os departamentos até os departamentos sem empresa
select * from tbDepartamento left join tbEmpresa on fkEmpresa = cnpjEmpresa;

# -- mostrar os funcionarios e sua empresa
select * from tbFuncionario left join tbEmpresa on fkEmpresa = cnpjEmpresa;

# -- mostrar os funcionarios e seu departamento
select * from tbFuncionario left join tbDepartamento on fkDepartamento = idDepartamento;

# -- mostrar todos os funcionarios até os sem chefe
select * from tbFuncionario as funcionario left join tbFuncionario as chefe on funcionario.fkChefe = chefe.idFuncionario;

# -- mostrar funcionarios apenas com chefe
select * from tbFuncionario as funcionario inner join tbFuncionario as chefe on funcionario.fkChefe = chefe.idFuncionario;

# -- criando coluna salario no funcionario 
alter table tbFuncionario add salarioFuncionario double;

update tbFuncionario set salarioFuncionario = 500 where idFuncionario = 2;
update tbFuncionario set salarioFuncionario = 1000 where idFuncionario = 3;
update tbFuncionario set salarioFuncionario = 3000 where idFuncionario = 1;

-- mostrando a soma dos salarios de todos os empregados
select sum(salarioFuncionario) from tbFuncionario where tipoFuncionario = 'Empregado';

-- mostrando a soma dos salarios de todos os funcionarios (chefe e empregado)
select sum(salarioFuncionario) from tbFuncionario;

-- mostrando a soma dos salarios de todos os funcionarios de um chefe
select sum(salarioFuncionario) from tbFuncionario where fkChefe = 1;

-- mostrar soma salario dos chefes
select sum(salarioFuncionario) from tbFuncionario where tipoFuncionario = 'Chefe';

select sum(salarioFuncionario) from tbFuncionario group by fkChefe = 1;