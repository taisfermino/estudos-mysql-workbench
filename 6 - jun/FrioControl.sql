create database FrioControl;
use FrioControl;

-- Criando a tabela Empresa
create table Empresa (
	idEmpresa int primary key auto_increment,
    cnpj char(14),
    nomeEmpresa varchar(40),
    situacao varchar(10) default 'Ativo',
    check (situacao = 'Ativo' or situacao = 'Inativo'),
    emailEmpresa varchar(50)
    ) auto_increment = 1000;
    
-- Criando a tabela Usuário
create table Usuario (
	idUsuario int primary key auto_increment,
    nomeUsuario varchar(40),
    emailUsuario varchar(50),
    usuario varchar(25),
    senha varchar(25),
    fotoPerfil varchar(200) default 'img/user.png',
    situacao varchar(10) default 'Ativo',
    check (situacao = 'Ativo' or situacao = 'Inativo'),
    cargo varchar(20),
    check (cargo = 'funcionario' or cargo = 'empresa' or cargo = 'admin'),
    fkEmpresa int,
    foreign key (fkEmpresa) references Empresa (idEmpresa)
    ) auto_increment = 2000;
    
-- Criando a tabela Contato
create table Contato (
	idContato int primary key auto_increment,
    numContato varchar(12),
    tipo varchar(10),
    check (tipo = 'fixo' or tipo = 'movel'),
    fkUsuario int,
    foreign key (fkUsuario) references Usuario (idUsuario)
    ) auto_increment = 10000;
    
-- Criando a tabela Freezer
create table Freezer (
	idFreezer int primary key auto_increment,
    nomeFreezer varchar(40),
    sensor varchar(20),
    fkEmpresa int,
    situacao varchar(10) default 'Ativo',
    check (situacao = 'Ativo' or situacao = 'Inativo'),
    foreign key (fkEmpresa) references Empresa (idEmpresa)
    ) auto_increment = 20000;
    
-- Criando a tabela HistóricoFreezer
create table HistoricoFreezer (
	idHistoricoFreezer int primary key auto_increment,
    dataHora datetime,
    temperatura decimal,
    fkFreezer int,
    foreign key (fkFreezer) references Freezer (idFreezer)
    ) auto_increment = 100000;
    
-- Criando a tabela HistoricoTransporte
create table HistoricoTransporte (
	idHistoricoTransporte int primary key auto_increment,
    responsavel varchar(45),
    celularResponsavel varchar(12),
    dataSaida date,
    dataChegada date,
    localSaida varchar(45),
    localChegada varchar(45),
    situacao varchar(30),
    check ( situacao = 'concluido' or situacao = 'andamento'),
    fkFreezer int,
    foreign key (fkFreezer) references Freezer (idFreezer),
    fkUsuario int,
    foreign key (fkUsuario) references Usuario (idUsuario)
    ) auto_increment = 100000;
    
-- Inserindo dados na tabela Empresa
insert into Empresa (cnpj, nomeEmpresa, emailEmpresa) values
	('35043901000145', 'FrioControl', 'friocontrol@kfriocontrol.com.br'),
	('35003201000194', 'King Maker', 'kingmaker@kingmaker.com.br'),
    ('25012401000131', 'FrioTransp', 'friotransp@friotransp.com.br'),
    ('61843901000185', 'VacineDist S.A.', 'vacinedist@vacinedist.com.br'),
    ('54143901000118', 'Bandtec', 'bandtec@bandtec.com.br');

select * from Empresa;

-- Inserindo dados na tabela Usuario
insert into Usuario (nomeUsuario, emailUsuario, usuario, senha, cargo, fkEmpresa) values
	('Taís Fermino', 'taisfermino@friocontrol.com.br', 'taisadmin', '01543Hcss!', 'admin', 1000),
    ('King Maker', 'kingmaker@kingmaker.com.br', 'kingmaker', 'KingMaker!123', 'empresa', 1001),
    ('Elizabette Kim', 'bettekim@kingmaker.com.br', 'bettekim', 'EliKim8765*', 'funcionario', 1001),
    ('Laerte Coelho', 'la.coelho@kingmaker.com.br', 'laerteco', '&154dnasyd', 'funcionario', 1001),
    ('FrioTransp', 'taisfermino@friotransp.com.br', 'friotransp', 'FrioTransp485senha', 'empresa', 1002),
    ('Walter Rocha', 'wal_rocha@friotransp.com.br', 'walrocha', 'senhaS1234', 'funcionario', 1002),
    ('VacineDist S.A.', 'vacinedist@vacinedist.com.br', 'vacinedist', 'Dist15Vacine', 'empresa', 1003);
    
select * from Usuario;

-- Inserindo dados na tabela Contato
insert into Contato (numContato, tipo, fkUsuario) values 
	('119478512768', 'movel', 2000),
    ('1129847581', 'fixo', 2000),
    ('1134587215', 'fixo', 2001),
    ('11998722447', 'movel', 2002),
    ('1167482475', 'fixo', 2002),
    ('18984576358', 'movel', 2003);

select* from Contato;
	
-- Inserindo dados na tabela Freezer
insert into Freezer (nomeFreezer, sensor, fkEmpresa) values 
	('FrioControlTeste01', 'sensor00001', 1000),
    ('FrioControlTeste02', 'sensor00002', 1000),
    ('FrioControlTeste03', 'sensor00003', 1000),
    ('KM001', 'sensor00004', 1001),
    ('KM002', 'sensor00005', 1001),
    ('KM003', 'sensor00006', 1001),
    ('KM004', 'sensor00007', 1001),
    ('KM005', 'sensor00008', 1001);
    
select * from Freezer;

-- Inserindo dados na tabela HistoricoFreezer
insert into HistoricoFreezer (dataHora, temperatura, fkFreezer) values
	('2021-04-10 10:00:55', -72, 20000),
    ('2021-04-10 10:01:00', -70, 20000),
    ('2021-04-10 10:01:05', -79, 20000),
    ('2021-04-10 10:01:10', -85, 20000),
    ('2021-04-18 23:45:40', -60, 20001),
    ('2021-04-18 23:45:45', -68, 20001),
    ('2021-04-18 23:45:50', -70, 20001),
    ('2021-04-18 23:45:55', -89, 20001),
    ('2021-04-18 13:15:45', -68, 20002),
    ('2021-04-18 13:15:50', -64, 20002),
    ('2021-04-18 13:15:55', -78, 20002),
    ('2021-04-20 17:19:45', -85, 20003),
    ('2021-04-20 17:19:50', -90, 20003),
    ('2021-04-20 17:19:55', -60, 20003),
    ('2021-04-21 00:15:20', -75, 20004),
    ('2021-04-21 00:15:25', -80, 20004);
    
    
    insert into HistoricoFreezer (dataHora, temperatura, fkFreezer) values
	('2021-04-10 10:00:55', -90, 20003),
    ('2021-04-10 10:01:00', -87, 20004),
    ('2021-04-10 10:01:05', -50, 20005),
    ('2021-04-10 10:01:10', -64, 20006);
    
-- Inserindo dados na tabela HistoricoTransporte
insert into HistoricoTransporte (responsavel, celularResponsavel, dataSaida, dataChegada, localSaida, localChegada, situacao, fkFreezer, fkUsuario) values
	('João Kleber', '011948575842', '2021-04-18', '2021-04-20', 'São Paulo', 'Salvador', 'concluido', 20003, 2002),
    ('Marco Antonio', '011948648742', '2021-04-20', null, 'Salvador', 'São Paulo', 'andamento', 20003, 2002),
    ('Caio Andrade', '011948142742', '2021-04-18', '2021-04-20', 'São Paulo', 'Rio de Janeiro', 'concluido', 20004, 2003),
    ('Jorge Santos', '011979558427', '2021-04-18', '2021-04-20', 'São Paulo', 'Curitiba', 'concluido', 20004, 2003);
    
select * from HistoricoTransporte;
select * from empresa;
select * from usuario;

-- Contadores dos cards admin
select count(idEmpresa) as contador from Empresa where situacao = 'Ativo';    
select count(idUsuario) as contador from Usuario where situacao = 'Ativo';  
select count(idFreezer) as contador from Freezer where situacao = 'Ativo';

-- Contadores dos cards Empresa
select count(idhistoricotransporte) as contador from historicotransporte join freezer on fkfreezer = idfreezer where fkEmpresa = 1001 and historicotransporte.situacao = 'concluido'; 
select count(idUsuario) as contador from usuario where fkEMpresa = 1001;
select count(idFreezer) as contador from freezer where fkEmpresa = 1001;

-- Contadores dos cards  Funcionario
select count(idhistoricotransporte) as contador from historicotransporte
	where fkUsuario = 2003 and historicotransporte.situacao = 'concluido';
select count(idhistoricotransporte) as contador from historicotransporte
	where fkUsuario = 2003 and historicotransporte.situacao = 'andamento';


select * from historicotransporte;
select * from historicofreezer;


SELECT * FROM HistoricoFreezer inner join Freezer on HistoricoFreezer.fkFreezer = idFreezer inner join historicotransporte on historicotransporte.fkFreezer = idFreezer WHERE dataHora in (SELECT MAX(dataHora) FROM HistoricoFreezer) and fkUsuario = 2003 group by idhistoricofreezer;

SELECT MAX(dataHora) FROM HistoricoFreezer;

insert into HistoricoFreezer values (null, '2021-04-21 00:15:25', -90,  20004);
    SELECT * FROM HistoricoFreezer inner join Freezer on HistoricoFreezer.fkFreezer = idFreezer inner join historicotransporte on historicotransporte.fkFreezer = idFreezer WHERE dataHora in (SELECT MAX(dataHora) FROM HistoricoFreezer);

drop table Usuario;
drop table Freezer;
drop table Contato;
drop table HistoricoTransporte;
drop table HistoricoFreezer;
drop database FrioControl;