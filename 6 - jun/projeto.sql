create database projetoIndividual;
use projetoIndividual;

create table tbUsuario (
	idUsuario int primary key auto_increment,
    nomeUsuario varchar(50),
    userUsuario varchar(20),
    emailUsuario varchar(50),
    senhaUsuario varchar(20),
    iconUsuario varchar(30)
);

create table tbMidias (
	idMidia int primary key auto_increment,
	linkMidia varchar(200),
	tipoMidia varchar(10) CHECK (tipoMidia = 'video' or tipoMidia = 'musica' or tipoMidia = 'imagem'),
	fkUsuario int,
    foreign key (fkUsuario) references tbUsuario(idUsuario)
);