--- banco de Dados Clinica Médica - Modelo Fisico ---

--reate database clinica_medica;

--use clinica_medica;

CREATE TABLE paciente (
	cpf varchar (14) PRIMARY KEY,
	nome_paciente varchar(40), 
	telefone varchar (14),
	numero_plano int,
	nome_plano varchar (20),
	tipo_plano varchar (10)
);

CREATE TABLE medico(
	crm int PRIMARY KEY,
	nome_medico varchar (30),
	especialidade varchar (20),
);

CREATE TABLE consulta(
	numero_consulta int identity (22000,1) PRIMARY KEY,
	data_consulta date,
	horario_consulta time,
	fk_paciente_cpf varchar(14),
	fk_medico_crm int
);

CREATE TABLE pedido_exame(
	numero_pedido int identity (2200,1) PRIMARY KEY,
	resultado varchar(40),
	data_exame date,
	valor_pagar money,
	fk_consulta_numero_consulta int,
	fk_exame_codigo int
);

CREATE TABLE exame(
	codigo int PRIMARY KEY,
	especificacao varchar (20),
	preco money
);

ALTER TABLE pedido_exame ADD CONSTRAINT fk_pedido_exame_2
	FOREIGN KEY (fk_consulta_numero_consulta)
	REFERENCES consulta (numero_consulta)
	ON DELETE CASCADE;

ALTER TABLE pedido_exame ADD CONSTRAINT fk_pedido_exame_3
	FOREIGN KEY (fk_exame_codigo)
	REFERENCES exame (codigo);
--   ON DELETE RESTRICT;

ALTER TABLE consulta ADD CONSTRAINT fk_consulta_2
	FOREIGN KEY (fk_paciente_cpf)
	REFERENCES paciente (cpf)
	ON DELETE CASCADE;

ALTER TABLE consulta ADD CONSTRAINT fk_consulta_3
	FOREIGN KEY (fk_medico_crm)
	REFERENCES medico (crm)
	ON DELETE CASCADE;

--- Inclusão -----
--tabela paciente---
insert into paciente values ('012.345.678-90','Leonardo Ribeiro','(11)91234-5678', 123456,'Inovamed','Padrão');
insert into paciente values ('123.456.789-12','Bruna Alves','(15)92345-6789',234567,'Ultramed','Basico');
insert into paciente values ('234.567.890-23', 'Gilberto Barros','(11)94567-8901',345678,'Inovamed','Especial');
insert into paciente values	('345.678.901-45','Maria Pereira','(12)95678-9012',456789,'Ultramed','Padrão');
insert into paciente values ('456.789.012-34','Arnaldo Coelho','(19)96789-0123',567890,'Inovamed','Especial');

SELECT * FROM paciente;

--tabela medico---
insert into medico values(102030,'Agildo Nunes','Cardiologia');
insert into medico values(203040,'Marcia Alves','Gastrologia');
insert into medico values(304050,'Roberto Gusmão','Neurologia');
insert into medico values(405060,'Edna Cardoso','Ortopedia');
insert into medico values(506070,'Ricardo Souza','Otorrinolaringologia');
insert into medico values(607080,'Lucia Marques','Pediatria');
insert into medico values(708090,'Beatriz Lucena','Oncologia');

SELECT * from medico;

--tebela exames---
insert into exame values(10020,'Hemograma',100.00);
insert into exame values(10030,'Tomografia',250.00);
insert into exame values(10040,'Ultrassonografia',550.00);
insert into exame values(10050,'Ressonancia',800.00);
insert into exame values(10060,'Radiografia',70.00);
insert into exame values(10070,'Mamografia',150.00);
insert into exame values(10080,'Endoscopia',300.00);
insert into exame values(10090,'Colonoscopia',300.00);
insert into exame values(10100,'Eletrocariograma',50.00);
insert into exame values(10110,'Ecocardiograma',120.00);
insert into exame values(10120,'Audiometria',65.00);

SELECT * from exame;

--tabela consulta--
insert into consulta values('2022/12/12','14:30','012.345.678-90',102030);
insert into consulta values('2022/12/13','15:00','123.456.789-12',203040);
insert into consulta values('2022/12/14','15:30','234.567.890-23',304050);
insert into consulta values('2022/12/15','16:00','345.678.901-45',405060);
insert into consulta values('2022/12/16','16:30','456.789.012-34',506070);
insert into consulta values('2022/12/17','17:00','012.345.678-90',607080);
insert into consulta values('2022/12/18','17:30','123.456.789-12',708090);
insert into consulta values('2022/12/19','08:00','234.567.890-23',405060);
insert into consulta values('2022/12/20','08:30','345.678.901-45',102030);
insert into consulta values('2022/12/21','09:00','456.789.012-34',506070);

SELECT * from consulta;

--tabela pedido exame--
insert into pedido_exame values('Normal','2022/12/15',0.00,22000,10040);
insert into pedido_exame values('','2022/12/19',0.00,22000,10100);
insert into pedido_exame values('','2022/12/16',0.00,22001,10080);
insert into pedido_exame values('Normal','2022/12/15',0.00,22002,10050);
insert into pedido_exame values('Inconsistente','2022/12/16',0.00,22003,10080);
insert into pedido_exame values('','2022/12/17',0.00,22004,10060);
insert into pedido_exame values('Normal','2022/12/21',0.00,22007,10020);
insert into pedido_exame values('','2022/12/22',0.00,22008,10030);
insert into pedido_exame values('','2022/12/22',0.00,22008,10050);

SELECT * from pedido_exame;

-- delete from pedido_exame
-- reinicia campo numero_pedido --> proximo 2200
-- DBCC CHECKIDENT('pedido_exame', RESSED, 2199)


--Alteração de dados de tabelas -----------
select * from paciente;
update paciente set nome_paciente = 'Aguinaldo Coelho' where cpf = '456.789.012-34';
select * from paciente;

select * from medico;
update medico set especialidade = 'Ginecologia' where crm = 708090;
select * from medico;

select * from exame;
update exame set preco = 135.00 where codigo = 10110;
select * from exame;

--exclusão de registro de tabelas---------

select * from paciente;
delete from paciente where cpf = '456.789.012-34';
select * from paciente;

select * from medico;
delete from medico where crm = 708090;
select * from medico;