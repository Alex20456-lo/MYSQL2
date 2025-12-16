create database BD1612AcademiaGlobalTech;
use BD1612AcademiaGlobalTech;

CREATE TABLE Campus (
    id_campus INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);

CREATE TABLE Departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_campus INT NOT NULL,
    FOREIGN KEY (id_campus) REFERENCES Campus(id_campus)
);

CREATE TABLE Sala (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tipo ENUM('Sala de Aula', 'Laboratório') NOT NULL,
    capacidade INT,
    id_campus INT NOT NULL,
    FOREIGN KEY (id_campus) REFERENCES Campus(id_campus)
);

CREATE TABLE Professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_contratacao DATE,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    id_campus INT NOT NULL,
    FOREIGN KEY (id_campus) REFERENCES Campus(id_campus)
);

CREATE TABLE Cargo (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    id_campus INT NOT NULL,
    id_cargo INT NOT NULL,
    FOREIGN KEY (id_campus) REFERENCES Campus(id_campus),
    FOREIGN KEY (id_cargo) REFERENCES Cargo(id_cargo)
);

CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    semestre VARCHAR(10) NOT NULL,
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    id_sala INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

CREATE TABLE Matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),
    UNIQUE (id_aluno, id_turma)
);

CREATE TABLE HistoricoNota (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    nota_final DECIMAL(5,2),
    frequencia DECIMAL(5,2),
    FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula)
);

INSERT INTO Campus (nome, endereco, telefone) VALUES
('Campus São Paulo', 'Av. Paulista, 1000', '1130000001'),
('Campus Rio de Janeiro', 'Av. Atlântica, 200', '2130000002'),
('Campus Belo Horizonte', 'Av. Afonso Pena, 300', '3130000003'),
('Campus Curitiba', 'Rua XV, 400', '4130000004'),
('Campus Porto Alegre', 'Av. Ipiranga, 500', '5130000005'),
('Campus Recife', 'Av. Boa Viagem, 600', '8130000006'),
('Campus Salvador', 'Av. Oceânica, 700', '7130000007'),
('Campus Fortaleza', 'Av. Beira Mar, 800', '8530000008'),
('Campus Manaus', 'Av. Eduardo Ribeiro, 900', '9230000009'),
('Campus Belém', 'Av. Nazaré, 100', '9130000010'),
('Campus Goiânia', 'Av. Goiás, 1100', '6230000011'),
('Campus Florianópolis', 'Av. Beira Mar Norte, 1200', '4830000012');

INSERT INTO Departamento (nome, id_campus) VALUES
('Ciência da Computação', 1),
('Administração', 1),
('Engenharia', 2),
('Direito', 2),
('Marketing', 3),
('Contabilidade', 3),
('Matemática', 4),
('Física', 4),
('Arquitetura', 5),
('Design', 6),
('Economia', 7),
('Sistemas de Informação', 8);

INSERT INTO Sala (nome, tipo, capacidade, id_campus) VALUES
('Sala 101', 'Sala de Aula', 40, 1),
('Lab 01', 'Laboratório', 30, 1),
('Sala 202', 'Sala de Aula', 45, 2),
('Lab 02', 'Laboratório', 25, 2),
('Sala 303', 'Sala de Aula', 50, 3),
('Lab 03', 'Laboratório', 35, 3),
('Sala 404', 'Sala de Aula', 40, 4),
('Lab 04', 'Laboratório', 30, 4),
('Sala 505', 'Sala de Aula', 60, 5),
('Lab 05', 'Laboratório', 20, 6),
('Sala 606', 'Sala de Aula', 55, 7),
('Lab 06', 'Laboratório', 25, 8);

INSERT INTO Professor (nome, email, data_contratacao, id_departamento) VALUES
('Ana Silva', 'ana.silva@uni.com', '2018-02-10', 1),
('Carlos Lima', 'carlos.lima@uni.com', '2017-03-12', 2),
('Marcos Souza', 'marcos.souza@uni.com', '2019-05-20', 3),
('Juliana Rocha', 'juliana.rocha@uni.com', '2020-01-15', 4),
('Pedro Alves', 'pedro.alves@uni.com', '2016-08-01', 5),
('Fernanda Costa', 'fernanda.costa@uni.com', '2015-06-11', 6),
('Rafael Mendes', 'rafael.mendes@uni.com', '2018-09-17', 7),
('Luciana Freitas', 'luciana.freitas@uni.com', '2021-02-03', 8),
('Bruno Martins', 'bruno.martins@uni.com', '2014-11-22', 9),
('Paula Ribeiro', 'paula.ribeiro@uni.com', '2019-07-09', 10),
('Diego Nunes', 'diego.nunes@uni.com', '2017-04-30', 11),
('Camila Torres', 'camila.torres@uni.com', '2022-01-10', 12);

INSERT INTO Aluno (matricula, nome, data_nascimento, id_campus) VALUES
('A001', 'Lucas Pereira', '2001-01-10', 1),
('A002', 'Mariana Santos', '2000-03-22', 1),
('A003', 'Felipe Rocha', '1999-05-14', 2),
('A004', 'Beatriz Lima', '2002-07-30', 2),
('A005', 'João Alves', '2001-09-18', 3),
('A006', 'Renata Costa', '2000-11-25', 3),
('A007', 'Thiago Mendes', '1998-02-12', 4),
('A008', 'Carla Freitas', '2001-04-05', 5),
('A009', 'Eduardo Martins', '1999-06-19', 6),
('A010', 'Patrícia Ribeiro', '2002-08-08', 7),
('A011', 'André Nunes', '2000-10-27', 8),
('A012', 'Sofia Torres', '2001-12-03', 9);

INSERT INTO Cargo (nome) VALUES
('Coordenador'),
('Analista'),
('Secretário'),
('Diretor'),
('Assistente'),
('Técnico'),
('Supervisor'),
('Gerente'),
('Bibliotecário'),
('Auxiliar Administrativo'),
('Contador'),
('Recursos Humanos');

INSERT INTO Funcionario (nome, email, id_campus, id_cargo) VALUES
('José Lima', 'jose.lima@uni.com', 1, 1),
('Maria Costa', 'maria.costa@uni.com', 2, 2),
('Paulo Silva', 'paulo.silva@uni.com', 3, 3),
('Cláudia Rocha', 'claudia.rocha@uni.com', 4, 4),
('Ricardo Alves', 'ricardo.alves@uni.com', 5, 5),
('Sandra Mendes', 'sandra.mendes@uni.com', 6, 6),
('Fábio Freitas', 'fabio.freitas@uni.com', 7, 7),
('Luciano Martins', 'luciano.martins@uni.com', 8, 8),
('Patrícia Nunes', 'patricia.nunes@uni.com', 9, 9),
('Roberto Ribeiro', 'roberto.ribeiro@uni.com', 10, 10),
('Vanessa Torres', 'vanessa.torres@uni.com', 11, 11),
('Daniel Araujo', 'daniel.araujo@uni.com', 12, 12);

INSERT INTO Curso (nome, id_departamento) VALUES
('Engenharia de Software', 1),
('Sistemas de Informação', 12),
('Administração Geral', 2),
('Engenharia Civil', 3),
('Direito Empresarial', 4),
('Marketing Digital', 5),
('Contabilidade Financeira', 6),
('Licenciatura em Matemática', 7),
('Física Aplicada', 8),
('Arquitetura Urbana', 9),
('Design Gráfico', 10),
('Economia Internacional', 11);

INSERT INTO Disciplina (nome, carga_horaria, id_curso) VALUES
('Introdução à Programação', 60, 1),
('Banco de Dados', 60, 1),
('Gestão Empresarial', 60, 3),
('Cálculo I', 80, 8),
('Física I', 80, 9),
('Marketing Estratégico', 60, 6),
('Contabilidade Básica', 60, 7),
('Direito Civil', 60, 5),
('Projeto Arquitetônico', 80, 10),
('Design Digital', 60, 11),
('Economia I', 60, 12),
('Redes de Computadores', 60, 2);

INSERT INTO Turma (semestre, id_disciplina, id_professor, id_sala) VALUES
('2024.1', 1, 1, 1),
('2024.1', 2, 1, 2),
('2024.1', 3, 2, 3),
('2024.1', 4, 7, 4),
('2024.1', 5, 8, 5),
('2024.1', 6, 5, 6),
('2024.1', 7, 6, 7),
('2024.1', 8, 4, 8),
('2024.1', 9, 9, 9),
('2024.1', 10, 10, 10),
('2024.1', 11, 11, 11),
('2024.1', 12, 12, 12);

INSERT INTO Matricula (id_aluno, id_turma, data_matricula) VALUES
(1, 1, '2024-02-01'),
(2, 2, '2024-02-01'),
(3, 3, '2024-02-02'),
(4, 4, '2024-02-02'),
(5, 5, '2024-02-03'),
(6, 6, '2024-02-03'),
(7, 7, '2024-02-04'),
(8, 8, '2024-02-04'),
(9, 9, '2024-02-05'),
(10, 10, '2024-02-05'),
(11, 11, '2024-02-06'),
(12, 12, '2024-02-06');

INSERT INTO HistoricoNota (id_matricula, nota_final, frequencia) VALUES
(1, 8.5, 90),
(2, 7.8, 85),
(3, 6.9, 80),
(4, 9.0, 95),
(5, 8.0, 88),
(6, 7.5, 82),
(7, 6.8, 78),
(8, 9.2, 97),
(9, 8.7, 92),
(10, 7.9, 86),
(11, 6.5, 75),
(12, 9.4, 98);

show tables;

/*pratica 1 a 20*/
SELECT nome, email, data_contratacao 
FROM Professor
ORDER BY data_contratacao ASC;

SELECT nome
FROM Aluno
WHERE data_nascimento > '2005-01-01';

SELECT nome, carga_horaria
FROM Disciplina
ORDER BY carga_horaria DESC;

SELECT nome
FROM Sala
WHERE id_campus != 4;

SELECT nome
FROM Professor
WHERE email IS NULL;

SELECT Matricula.id_matricula
FROM HistoricoNota
JOIN Matricula ON HistoricoNota.id_matricula = Matricula.id_matricula
WHERE HistoricoNota.nota_final > 8.5;

SELECT nome
FROM Disciplina
WHERE carga_horaria BETWEEN 80 AND 120;

SELECT nome, email
FROM Funcionario
WHERE id_cargo IN (1, 3, 5);

SELECT nome
FROM Professor
WHERE nome LIKE 'A%';

SELECT nome
FROM Aluno
WHERE data_nascimento NOT BETWEEN '2000-01-01' AND '2004-12-31';

SELECT nome
FROM Disciplina
WHERE nome LIKE '%Básica%';

-- Supondo que a tabela Funcionario tenha um campo de salário chamado 'salario':
SELECT nome
FROM Funcionario
WHERE salario = 5000.00;

SELECT nome
FROM Professor
WHERE nome LIKE '%a';

SELECT nome, email, data_nascimento
FROM Aluno
WHERE data_nascimento = '2003-05-15';

SELECT nome
FROM Departamento
WHERE nome LIKE 'Engenharia%' AND id_campus = 1;

SELECT nome
FROM Cargo
ORDER BY nome DESC;

SELECT *
FROM Turma
WHERE id_sala IN (10, 20);

SELECT *
FROM Campus
WHERE id_campus IN (2, 5);

SELECT nome
FROM Aluno
WHERE nome LIKE '_____';

SELECT nota_final
FROM HistoricoNota
WHERE nota_final BETWEEN 5.0 AND 7.0
ORDER BY nota_final ASC;


/*mais pratica 20 a 40*/
SELECT a.nome AS aluno, c.nome AS campus
FROM Aluno a
INNER JOIN Campus c ON a.id_campus = c.id_campus;

SELECT p.nome AS professor, d.nome AS departamento
FROM Professor p
INNER JOIN Departamento d ON p.id_departamento = d.id_departamento;

SELECT c.nome AS curso, d.nome AS disciplina
FROM Curso c
INNER JOIN Disciplina d ON d.id_curso = c.id_curso;

SELECT 
    d.nome AS disciplina,
    p.nome AS professor,
    s.nome AS sala
FROM Turma t
INNER JOIN Disciplina d ON t.id_disciplina = d.id_disciplina
INNER JOIN Professor p ON t.id_professor = p.id_professor
INNER JOIN Sala s ON t.id_sala = s.id_sala;

SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    h.nota_final
FROM HistoricoNota h
INNER JOIN Matricula m ON h.id_matricula = m.id_matricula
INNER JOIN Aluno a ON m.id_aluno = a.id_aluno
INNER JOIN Turma t ON m.id_turma = t.id_turma
INNER JOIN Disciplina d ON t.id_disciplina = d.id_disciplina;

SELECT 
    f.nome AS funcionario,
    f.id_cargo AS cargo,
    c.endereco
FROM Funcionario f
INNER JOIN Campus c ON f.id_campus = c.id_campus;

SELECT 
    c.nome AS curso,
    d.nome AS disciplina
FROM Curso c
LEFT JOIN Disciplina d ON d.id_curso = c.id_curso;

SELECT 
    p.nome AS professor,
    t.id_turma
FROM Professor p
LEFT JOIN Turma t ON t.id_professor = p.id_professor;

SELECT 
    d.nome AS departamento,
    p.nome AS professor
FROM Professor p
RIGHT JOIN Departamento d ON p.id_departamento = d.id_departamento;

SELECT 
    a.nome AS aluno,
    m.id_turma
FROM Aluno a
LEFT JOIN Matricula m ON a.id_aluno = m.id_aluno;

SELECT 
    c.nome AS campus,
    p.nome AS professor,
    s.nome AS sala
FROM Turma t
INNER JOIN Professor p ON t.id_professor = p.id_professor
INNER JOIN Sala s ON t.id_sala = s.id_sala
INNER JOIN Campus c ON s.id_campus = c.id_campus;

SELECT 
    f.nome AS funcionario,
    c.nome AS campus
FROM Funcionario f
LEFT JOIN Campus c ON f.id_campus = c.id_campus;

SELECT 
    d.nome AS disciplina,
    dep.nome AS departamento
FROM Disciplina d
INNER JOIN Curso c ON d.id_curso = c.id_curso
INNER JOIN Departamento dep ON c.id_departamento = dep.id_departamento;

SELECT DISTINCT
    c.nome AS curso,
    p.nome AS professor
FROM Curso c
INNER JOIN Disciplina d ON d.id_curso = c.id_curso
INNER JOIN Turma t ON t.id_disciplina = d.id_disciplina
INNER JOIN Professor p ON t.id_professor = p.id_professor;

SELECT 
    a.nome AS aluno,
    d.nome AS departamento
FROM Aluno a
INNER JOIN Matricula m ON a.id_aluno = m.id_aluno
INNER JOIN Turma t ON m.id_turma = t.id_turma
INNER JOIN Disciplina di ON t.id_disciplina = di.id_disciplina
INNER JOIN Curso c ON di.id_curso = c.id_curso
INNER JOIN Departamento d ON c.id_departamento = d.id_departamento
WHERE d.id_departamento = 1;

SELECT 
    f.nome AS funcionario,
    c.nome AS cargo
FROM Funcionario f
INNER JOIN Cargo c ON f.id_cargo = c.id_cargo;

SELECT DISTINCT
    s.nome AS sala
FROM Sala s
INNER JOIN Campus c ON s.id_campus = c.id_campus
INNER JOIN Departamento d ON d.id_campus = c.id_campus
WHERE d.id_departamento = 5;

SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    h.nota_final
FROM HistoricoNota h
INNER JOIN Matricula m ON h.id_matricula = m.id_matricula
INNER JOIN Aluno a ON m.id_aluno = a.id_aluno
INNER JOIN Turma t ON m.id_turma = t.id_turma
INNER JOIN Disciplina d ON t.id_disciplina = d.id_disciplina
WHERE h.nota_final < 6.0;

SELECT 
    p.nome AS professor,
    c.nome AS campus
FROM Professor p
INNER JOIN Departamento d ON p.id_departamento = d.id_departamento
INNER JOIN Campus c ON d.id_campus = c.id_campus;

SELECT 
    f.nome AS funcionario,
    c.nome AS campus
FROM Funcionario f
INNER JOIN Cargo ca ON f.id_cargo = ca.id_cargo
INNER JOIN Campus c ON f.id_campus = c.id_campus
WHERE ca.nome = 'Coordenador';


/*Mais de 40 a 50*/
INSERT INTO Professor (nome, email, data_contratacao, id_departamento)
VALUES ('Ricardo Pacheco', 'ricardo.pacheco@uni.com', '2024-03-01', 4);

INSERT INTO Curso (nome, id_departamento)
VALUES ('Análise de Dados', 1);

UPDATE Aluno
SET email = 'novo.email12@uni.com'
WHERE id_aluno = 12;

select * from aluno;

UPDATE Funcionario
SET salario = salario * 1.15
WHERE id_cargo = 1;

DELETE FROM Funcionario
WHERE id_funcionario = 7;

INSERT INTO Campus (nome, endereco, telefone)
VALUES ('GlobalTech Virtual', 'Plataforma Online', '9999-9999');

UPDATE Aluno
SET id_campus = (
    SELECT id_campus 
    FROM Campus 
    WHERE nome = 'GlobalTech Virtual'
)
WHERE id_aluno = 25;

UPDATE Campus
SET telefone = '0000-0000'
WHERE nome LIKE '%Norte%';

DELETE FROM Turma
WHERE data_termino < '2023-01-01';

DELETE FROM Disciplina
WHERE id_curso IS NULL;
