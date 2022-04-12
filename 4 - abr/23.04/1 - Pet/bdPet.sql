create database bdPet;
use bdPet;

create table tbTelefoneCliente (
	idTelefoneCliente int primary key auto_increment
    ,celularTelefoneCliente varchar(13)
    ,telefoneTelefoneCliente varchar(13)
);

create table tbCliente (
	idCliente int primary key auto_increment
    ,nomeCliente varchar(50)
    ,cepCliente varchar(10)
    ,ufCliente varchar(2)
    ,cidadeCliente varchar(10)
    ,municipioCliente varchar(20)
    ,bairroCliente varchar(20)
    ,logCliente varchar(20)
    ,numeroCliente int
    ,complementoCliente varchar(20)
	,fk_TelefoneCliente int,
    foreign key (fk_TelefoneCliente) references tbTelefoneCliente(idTelefoneCliente)
);

create table tbPet (
	idPet int primary key auto_increment
	,tipoPet varchar(20)
    ,nomePet varchar(20)
    ,racaPet varchar(20)
    ,dtnascPet date
	,fk_Cliente int,
    foreign key (fk_Cliente) references tbCliente(idCliente)
)auto_increment = 101;

insert into tbTelefoneCliente values
	(null, '551178456987', '551152275875')
    ,(null, '551178456458', '551152158758')
    ,(null, '551178454527', '551152458753')
    ,(null, '551178454547', '551152448757');
    
insert into tbCliente values
  (null, 'Daniel Pereira', '78545', 'SP', 'São Paulo', 'São Paulo', 'JD São Paulo', 'R. Feliciano', 12, 'casa 3', 1 )
  ,(null, 'Sueli Pereira', '45876', 'SP', 'São Paulo', 'São Paulo', 'Tatuape', 'R. Azul', 75, null, 2)
  ,(null, 'Alex Barreira', '45879', 'SP', 'São Paulo', 'São Paulo', 'Morumbi', 'R. ourinhos', 545, null, 3);
  
insert into tbPet values
	(null, 'Cadela', 'Ravena', 'Poodle', '2017-05-05', 1)
    ,(null, 'Tartaruga', 'Batman', 'De Pente', '2005-02-14', 1)
    ,(null, 'Cobra', 'Hera', 'Rateira', '2020-07-31', 2)
    ,(null, 'Gato', 'Robin', 'Persa', '2014-10-01', 3);
    
    select * from tbPet;
    select * from tbTelefoneCliente;
    select * from tbCliente;
    
  
