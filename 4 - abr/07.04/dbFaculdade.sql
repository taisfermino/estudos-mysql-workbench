create database faculdade;
use faculdade;

-- exibir data do servidor
select sysdate();
select addtime(sysdate(), '-3:00:00');
drop table sensor;
-- criar tabela sensor
create table sensor(
idSensor int primary key auto_increment,
nomeSensor varchar(100),
localSensor varchar(50),
temperatura float not null, -- decimal(5,2) 999,99
dataTemperatura datetime, -- default current_timestamp,
statusSensor varchar(30),
CHECK (statusSensor = 'ativo' or statusSensor = 'inativo')
) auto_increment = 10000;

select * from sensor;

insert into sensor (nomeSensor, localSensor, temperatura, dataTemperatura, statusSensor) values
('Sensor1', 'quarto', '37.2', '2021-03-12 14:47:40', 'ativo'),
('Sensor2', 'sala', '45.2', '2021-03-12 14:47:40', 'ativo'),
 ('Sensor3', 'banheiro', '00.0', '2021-03-12 14:47:40', 'inativo'),
 ('Sensor4', 'banheiro', '00.0', '2021-03-12 14:47:40', 'inativo'),
('Sensor4', 'cozinha', '00.0', '2021-03-12 14:47:40', 'inativo'),
 ('Sensor5', 'quarto2', '28.0', '2021-03-12 14:47:40', 'ativo');
 
 select*from sensor;