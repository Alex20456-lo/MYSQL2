create database ClinicaTech;
use ClinicaTech;

create table paciente(
codpaciente int,
nomepaciente varchar(45),
datanasci date,
convenio varchar(45),
constraint pkcodpaciente primary key (codpaciente));

create table medico(
crm int,
nomemedico varchar(45),
especialidade varchar(45),
constraint pkcrm primary key (crm));

create table tipo_exame(
codexame int,
nomeexame varchar(45),
valorbase float,
setor varchar(45),
constraint pkcodexame primary key (codexame));

create table consulta(
codconsulta int,
codpaciente int, 
crm int,
dataconsulta date,
constraint pkcodconsulta primary key (codconsulta),
constraint fkcodpaciente foreign key (codpaciente) references paciente(codpaciente),
constraint fkcrm foreign key (crm) references medico(crm));

create table solicitacao_exame(
codsolicitacao int,
codconsulta int,
codexame int,
datacoleta date,
statusexame varchar(45),
constraint pkcodsolicitacao primary key (codsolicitacao),
constraint fkcodconsulta foreign key (codconsulta) references consulta(codconsulta),
constraint fkcodexame foreign key (codexame) references tipo_exame(codexame));

create table unidade(
codunidade int,
nomeunidade varchar(45),
endereco varchar(50),
constraint pkcodunidade primary key (codunidade));

create table resultado_exame(
codresultado int,
codsolicitacao int,
codunidade int,
dataliberacao date,
valorresultado float,
referencia varchar(45),
constraint pkcodresultado primary key (codresultado),
constraint fkcodsolicitacao foreign key (codsolicitacao) references solicitacao_exame(codsolicitacao),
constraint fkcodunidade foreign key (codunidade) references unidade(codunidade));

create table convenio(
nomeconvenio varchar(45),
cnpj int,
descontopadrao varchar(45),
constraint pknomeconvenio primary key (nomeconvenio));

show tables;

describe paciente;
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (1, 'Wallace', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (2, 'Alex', '2005-10-11', 'cvnA');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (3, 'Arthur', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (4, 'Jonas', '2005-10-11', 'cvnY');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (5, 'Jonny', '2005-10-11', 'cvnY');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (6, 'Luiza', '2005-10-11', 'cvnA');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (7, 'Lucia', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (8, 'Jose', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (9, 'Mateus', '2005-10-11', 'cvnB');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (10, 'Julia', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (11, 'Paulo', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (12, 'Vitor', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (13, 'Sheila', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (14, 'Juquinha', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (15, 'Riana', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (16, 'Tomas', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (17, 'Davi', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (18, 'Diego', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (19, 'Agatha', '2005-10-11', 'cvnX');
insert into paciente(codpaciente, nomepaciente, datanasci, convenio) values (20, 'Juliano', '2005-10-11', 'cvnX');
select * from paciente;

describe medico;
insert into medico(crm, nomemedico, especialidade) values (1, 'David', 'Dermatologia');
insert into medico(crm, nomemedico, especialidade) values (2, 'Lucia', 'Infectologia');
insert into medico(crm, nomemedico, especialidade) values (3, 'Ana', 'Cardiologia');
insert into medico(crm, nomemedico, especialidade) values (4, 'Mateus', 'Neurologia');
insert into medico(crm, nomemedico, especialidade) values (5, 'Joao', 'Anestesiologista');
insert into medico(crm, nomemedico, especialidade) values (6, 'Teles', 'Ortopedia e Traumatologia');
insert into medico(crm, nomemedico, especialidade) values (7, 'Oscar', 'Cirurgia Geral');
insert into medico(crm, nomemedico, especialidade) values (8, 'Beatriz', 'Medicina do Trabalho');
insert into medico(crm, nomemedico, especialidade) values (9, 'Ana Maria', 'Cirurgia Plástica');
insert into medico(crm, nomemedico, especialidade) values (10, 'Luiz', 'Ortopedia e Traumatologia');
insert into medico(crm, nomemedico, especialidade) values (11, 'Paola', 'Anestesiologista');
insert into medico(crm, nomemedico, especialidade) values (12, 'Priscila', 'Cardiologia');
insert into medico(crm, nomemedico, especialidade) values (13, 'Carol', 'Anestesiologista');
insert into medico(crm, nomemedico, especialidade) values (14, 'Fernando', 'Dermatologia');
insert into medico(crm, nomemedico, especialidade) values (15, 'Franscisco', 'Neurologia');
insert into medico(crm, nomemedico, especialidade) values (16, 'Rodrigo', 'Cirurgia Geral');
insert into medico(crm, nomemedico, especialidade) values (17, 'Suelen', 'Cardiologia');
insert into medico(crm, nomemedico, especialidade) values (18, 'Filipe', 'Infectologia');
insert into medico(crm, nomemedico, especialidade) values (19, 'Sofia', 'Neurologia');
insert into medico(crm, nomemedico, especialidade) values (20, 'Golias', 'Infectologia');
select * from medico;

describe tipo_exame;
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (1, 'Hemograma', 1000, 1);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (2, 'Glicemia em jejum', 1000, 2);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (3, 'Colesterol e Triglicerídeos', 1000, 1);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (4, 'Ureia e Creatina', 1000, 3);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (5, 'TGO (AST) e TGP (ALT)', 1000, 4);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (6, 'TSH e T4 livre', 1000, 6);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (7, 'Ácido Úrico', 1000, 4);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (8, 'Exames de urina', 1000, 2);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (9, 'Eletrocardiograma', 1000, 2);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (10, 'Teste Ergométrico', 1000, 3);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (11, 'Ecocardiograma', 1000, 6);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (12, 'Análise de líquidos corporais', 1000, 5);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (13, 'Diagnóstico por imagem', 1000, 2);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (14, 'Endoscopia', 1000, 1);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (15, 'Medição das funções corporais', 1000, 3);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (16, 'Biópsia', 1000, 2);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (17, 'Análise de material genético', 1000, 4);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (18, 'Teste Ergométrico', 1000, 5);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (19, 'Teste Ergométrico', 1000, 7);
insert into tipo_exame(codexame, nomeexame, valorbase, setor) values (20, 'Teste Ergométrico', 1000, 8);
select * from tipo_exame;

describe consulta;
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (1, 1, 1, '2025-12-20');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (2, 2, 2, '2026-01-20');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (3, 3, 3, '2026-02-24');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (4, 4, 4, '2026-03-14');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (5, 5, 5, '2026-02-04');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (6, 6, 6, '2026-02-17');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (7, 7, 7, '2026-03-15');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (8, 8, 8, '2026-01-16');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (9, 9, 9, '2026-02-19');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (10, 10, 10, '2026-03-20');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (11, 11, 11, '2026-04-07');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (12, 12, 12, '2026-05-25');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (13, 13, 13, '2026-04-23');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (14, 14, 14, '2026-04-13');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (15, 15, 15, '2026-03-15');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (16, 16, 16, '2026-05-22');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (17, 17, 17, '2026-05-13');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (18, 18, 18, '2026-06-27');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (19, 19, 19, '2026-04-25');
insert into consulta(codconsulta, codpaciente, crm, dataconsulta) values (20, 20, 20, '2026-05-22');
select * from consulta;

describe solicitacao_exame;
INSERT INTO solicitacao_exame (codsolicitacao, codconsulta, codexame, datacoleta, statusexame) VALUES
(1, 1, 1, '2025-01-05', 'Pendente'),
(2, 2, 2, '2025-01-06', 'Coletado'),
(3, 3, 3, '2025-01-07', 'Em Análise'),
(4, 4, 4, '2025-01-08', 'Concluído'),
(5, 5, 5, '2025-01-09', 'Pendente'),
(6, 6, 6, '2025-01-10', 'Coletado'),
(7, 7, 7, '2025-01-11', 'Concluído'),
(8, 8, 8, '2025-01-12', 'Pendente'),
(9, 9, 9, '2025-01-13', 'Coletado'),
(10, 10, 10, '2025-01-14', 'Em Análise'),
(11, 11, 11, '2025-01-15', 'Concluído'),
(12, 12, 12, '2025-01-16', 'Pendente'),
(13, 13, 13, '2025-01-17', 'Coletado'),
(14, 14, 14, '2025-01-18', 'Concluído'),
(15, 15, 15, '2025-01-19', 'Em Análise'),
(16, 16, 16, '2025-01-20', 'Pendente'),
(17, 17, 17, '2025-01-21', 'Coletado'),
(18, 18, 18, '2025-01-22', 'Concluído'),
(19, 19, 19, '2025-01-23', 'Pendente'),
(20, 20, 20, '2025-01-24', 'Em Análise');
select * from solicitacao_exame;

describe unidade;
INSERT INTO unidade (codunidade, nomeunidade, endereco) VALUES
(1, 'Unidade Central', 'Rua das Flores, 101'),
(2, 'Unidade Norte', 'Avenida Brasil, 250'),
(3, 'Unidade Sul', 'Rua dos Ipês, 45'),
(4, 'Unidade Leste', 'Rua das Acácias, 88'),
(5, 'Unidade Oeste', 'Avenida Paulista, 500'),
(6, 'Unidade Jardim', 'Rua do Lago, 120'),
(7, 'Unidade Hospitalar 1', 'Rua São Pedro, 77'),
(8, 'Unidade Hospitalar 2', 'Avenida Independência, 310'),
(9, 'Clínica Popular 1', 'Rua XV de Novembro, 90'),
(10, 'Clínica Popular 2', 'Travessa das Palmeiras, 25'),
(11, 'Posto de Saúde 1', 'Rua do Comércio, 188'),
(12, 'Posto de Saúde 2', 'Rua da Liberdade, 220'),
(13, 'Unidade Especializada 1', 'Avenida das Nações, 999'),
(14, 'Unidade Especializada 2', 'Rua do Sol, 132'),
(15, 'Centro Médico 1', 'Avenida Atlântica, 410'),
(16, 'Centro Médico 2', 'Rua Bela Vista, 300'),
(17, 'Unidade Rural 1', 'Estrada Velha, 55'),
(18, 'Unidade Rural 2', 'Estrada das Laranjeiras, 70'),
(19, 'Unidade Infantil 1', 'Rua das Crianças, 12'),
(20, 'Unidade Infantil 2', 'Rua Esperança, 44');
select * from unidade;

describe resultado_exame;
INSERT INTO resultado_exame (codresultado, codsolicitacao, codunidade, dataliberacao, valorresultado, referencia) VALUES
(1, 1, 1, '2025-02-01', 4.5, 'Normal'),
(2, 2, 2, '2025-02-02', 7.8, 'Acima do normal'),
(3, 3, 3, '2025-02-03', 2.1, 'Abaixo do normal'),
(4, 4, 4, '2025-02-04', 5.4, 'Normal'),
(5, 5, 5, '2025-02-05', 8.2, 'Acima do normal'),
(6, 6, 6, '2025-02-06', 1.9, 'Abaixo do normal'),
(7, 7, 7, '2025-02-07', 4.8, 'Normal'),
(8, 8, 8, '2025-02-08', 6.3, 'Normal'),
(9, 9, 9, '2025-02-09', 9.0, 'Acima do normal'),
(10, 10, 10, '2025-02-10', 3.3, 'Abaixo do normal'),
(11, 11, 11, '2025-02-11', 4.9, 'Normal'),
(12, 12, 12, '2025-02-12', 5.7, 'Normal'),
(13, 13, 13, '2025-02-13', 8.9, 'Acima do normal'),
(14, 14, 14, '2025-02-14', 2.7, 'Abaixo do normal'),
(15, 15, 15, '2025-02-15', 4.2, 'Normal'),
(16, 16, 16, '2025-02-16', 6.8, 'Normal'),
(17, 17, 17, '2025-02-17', 7.9, 'Acima do normal'),
(18, 18, 18, '2025-02-18', 3.1, 'Abaixo do normal'),
(19, 19, 19, '2025-02-19', 5.0, 'Normal'),
(20, 20, 20, '2025-02-20', 9.5, 'Acima do normal');
select * from resultado_exame;

describe convenio;
INSERT INTO convenio (nomeconvenio, cnpj, descontopadrao) VALUES
('SaudePlus', 123456789, '10%'),
('VidaTotal', 234567890, '15%'),
('MaisSaude', 345678901, '20%'),
('BemEstar', 456789012, '5%'),
('ClinVida', 567890123, '12%'),
('UniSaude', 678901234, '18%'),
('SaudePrime', 789012345, '25%'),
('MedPrev', 890123456, '8%'),
('SaudeMais', 901234567, '7%'),
('VivaBem', 102345678, '10%'),
('SaudeCare', 213456789, '15%'),
('ClinPrime', 324567890, '22%'),
('PlenaSaude', 435678901, '12%'),
('MedExpress', 546789012, '17%'),
('TotalCare', 657890123, '30%'),
('VidaSaudavel', 768901234, '5%'),
('PrimeVida', 879012345, '9%'),
('ApoioSaude', 980123456, '14%'),
('ForteSaude', 109234567, '13%'),
('MasterClin', 210345678, '20%');
select *from convenio;

/*estrutura*/
alter table tipo_exame add column tempojejum varchar(45);
update tipo_exame set valorbase = valorbase * 1.15 where setor = 3 and valorbase < 50;
delete from medico where especialidade = 'Cirurgia Geral' or nomemedico like 'j%';

/*consulta*/
SELECT crm AS RegistroProfissional,nomemedico FROM medico ORDER BY especialidade DESC;
SELECT nomepaciente, datanasci FROM paciente WHERE datanasci BETWEEN '1980-01-01' AND '1995-12-31';
SELECT nomeexame, setor FROM tipo_exame WHERE nomeexame NOT LIKE '%Glicose%' AND setor LIKE '%Bio%';
SELECT nomeunidade,endereco FROM unidade WHERE endereco IN ('Bairro Central', 'Zona Sul', 'Centro');
SELECT nomepaciente, convenio FROM paciente WHERE convenio NOT IN ('Unimed', 'Bradesco Saúde', 'Particular');

/*Joins e mais*/
SELECT p.nomepaciente,m.nomemedico,c.dataconsulta FROM consulta c
INNER JOIN paciente p ON c.codpaciente = p.codpaciente
INNER JOIN medico m ON c.crm = m.crm
WHERE c.dataconsulta > '2025-12-01';
SELECT p.nomepaciente,t.nomeexame,s.statusexame FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN tipo_exame t ON s.codexame = t.codexame ORDER BY p.nomepaciente ASC;
SELECT p.nomepaciente,t.nomeexame,u.nomeunidade FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN resultado_exame r ON s.codsolicitacao = r.codsolicitacao
INNER JOIN tipo_exame t ON s.codexame = t.codexame
INNER JOIN unidade u ON r.codunidade = u.codunidade
WHERE r.valorresultado > 4 AND t.nomeexame = 'Hemograma';
SELECT m.nomemedico,m.especialidade,t.nomeexame FROM medico m
INNER JOIN consulta c ON m.crm = c.crm
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN tipo_exame t ON s.codexame = t.codexame
WHERE m.especialidade = 'Cardiologia' OR t.setor = 3;
SELECT m.nomemedico, COUNT(c.codconsulta) AS TotalConsultas FROM medico m
INNER JOIN consulta c ON m.crm = c.crm
GROUP BY m.nomemedico;
SELECT setor,MIN(valorbase) AS ValorMinimo FROM tipo_exame
GROUP BY setor;
SELECT p.nomepaciente,MAX(r.valorresultado) AS ResultadoMaximo FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN resultado_exame r ON s.codsolicitacao = r.codsolicitacao
GROUP BY p.nomepaciente;
SELECT p.nomepaciente,t.nomeexame FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN tipo_exame t ON s.codexame = t.codexame
WHERE p.datanasci >= '1990-01-01' AND c.crm NOT BETWEEN 5000 AND 8000;
SELECT nomeunidade,endereco FROM unidade
WHERE nomeunidade LIKE 'Unidade%' AND codunidade BETWEEN 10 AND 50;
SELECT p.nomepaciente,m.nomemedico,t.nomeexame,s.statusexame FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN medico m ON c.crm = m.crm
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN tipo_exame t ON s.codexame = t.codexame
WHERE s.statusexame IN ('Em Análise') ORDER BY c.dataconsulta DESC;

/*inner join*/
SELECT p.nomepaciente,t.nomeexame,m.nomemedico FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN medico m ON c.crm = m.crm
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN tipo_exame t ON s.codexame = t.codexame
WHERE p.nomepaciente NOT LIKE '%Silva%' OR m.nomemedico NOT LIKE '%Dr.%';
SELECT setor,SUM(valorbase) AS ReceitaEstimada FROM tipo_exame GROUP BY setor;
SELECT p.nomepaciente,m.nomemedico,c.dataconsulta FROM consulta c
INNER JOIN paciente p ON c.codpaciente = p.codpaciente
INNER JOIN medico m ON c.crm = m.crm
ORDER BY m.especialidade ASC, c.dataconsulta DESC;
SELECT p.nomepaciente,m.nomemedico,p.convenio AS nomeConvenio FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN medico m ON c.crm = m.crm
WHERE p.convenio = 'cvnX' AND m.especialidade = 'Dermatologia';
SELECT setor,COUNT(DISTINCT nomeexame) AS TiposDistintos FROM tipo_exame GROUP BY setor;
SELECT p.nomepaciente,u.nomeunidade FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN resultado_exame r ON s.codsolicitacao = r.codsolicitacao
INNER JOIN unidade u ON r.codunidade = u.codunidade
WHERE NOT (p.datanasci BETWEEN '1970-01-01' AND '1979-12-31') AND r.dataliberacao > '2025-11-01';
SELECT p.nomepaciente,t.nomeexame FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN tipo_exame t ON s.codexame = t.codexame
WHERE t.nomeexame LIKE 'T%' OR p.nomepaciente LIKE '%Ferreira%';
SELECT p.convenio, AVG(t.valorbase) AS ValorMedio FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN tipo_exame t ON s.codexame = t.codexame
GROUP BY p.convenio;
SELECT m.nomemedico,u.nomeunidade,r.dataliberacao FROM medico m
INNER JOIN consulta c ON m.crm = c.crm
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta
INNER JOIN resultado_exame r ON s.codsolicitacao = r.codsolicitacao
INNER JOIN unidade u ON r.codunidade = u.codunidade
WHERE u.codunidade IN (1, 5, 10) AND m.especialidade IN ('Neurologia', 'Oftalmologia');
SELECT p.nomepaciente,m.nomemedico,p.convenio AS nomeConvenio,t.nomeexame FROM paciente p
INNER JOIN consulta c ON p.codpaciente = c.codpaciente INNER JOIN medico m ON c.crm = m.crm
INNER JOIN solicitacao_exame s ON c.codconsulta = s.codconsulta INNER JOIN tipo_exame t ON s.codexame = t.codexame
WHERE p.convenio = 'cvnX' OR t.nomeexame = 'Eletrocardiograma';