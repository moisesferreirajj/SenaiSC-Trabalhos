#############################################
# DBZINHA BASICA DO MOISES J. FERREIRA
# 05/02/2025
# TDESN V3
#############################################

create database Escola;
use Escola;

create table aluno(
  PK_Matricula int not null auto_increment,
  Nome_Aluno varchar(45),
  Endereco_Aluno varchar(60),
  Cpf_Aluno bigint,
  primary key (PK_Matricula)
);

INSERT INTO aluno (Nome_Aluno, Endereco_Aluno, Cpf_Aluno) 
VALUES 
('Carlos Silva', 'Rua A, 123', 12345678901),
('Fernanda Oliveira', 'Av. B, 456', 23456789012),
('Lucas Pereira', 'Rua C, 789', 34567890123),
('Mariana Costa', 'Av. D, 1011', 45678901234),
('João Santos', 'Rua E, 1213', 56789012345),
('Rafaela Almeida', 'Rua F, 1415', 67890123456),
('Gabriel Souza', 'Av. G, 1617', 78901234567),
('Aline Rocha', 'Rua H, 1819', 89012345678);

create table professor(
  Pk_professor int not null auto_increment,
  Nome_professor varchar(45),
  Titulacao_professor varchar(30),
  primary key (Pk_professor)
);

INSERT INTO professor (Nome_professor, Titulacao_professor)
VALUES 
('João Ferreira', 'Graduação'),
('Maria Souza', 'Mestre'),
('Carlos Rocha', 'Doutorado'),
('Renata Lima', 'Mestre'),
('Fernanda Costa', 'Mestre'),
('Luis Silva', 'Doutorado'),
('Patricia Oliveira', 'Doutorado'),
('Antonio Pereira', 'Graduação');

create table turmas(
  Pk_turma int not null auto_increment,
  Sigla_turma varchar(8),
  Data_inicio date,
  primary key (Pk_turma)
);

INSERT INTO turmas (Sigla_turma, Data_inicio)
VALUES 
('TDESI', '2025-02-10'),
('TMEC', '2025-02-12'),
('TELET', '2025-03-05'),
('TQUIM', '2025-03-10'),
('TDESI2', '2025-02-10'),
('TMEC2', '2025-02-12'),
('TELET2', '2025-03-05'),
('TQUIM2', '2025-03-10');

create table disciplina(
  Pk_disciplina int not null auto_increment,
  Nome_disciplina varchar(45),
  Fk_turma int,
  Fk_professor int,
  primary key (Pk_disciplina),
  foreign key (Fk_turma) references turmas(Pk_turma),
  foreign key (Fk_professor) references professor(Pk_professor)
  on delete restrict on update cascade
);

INSERT INTO disciplina (Nome_disciplina, Fk_turma, Fk_professor)
VALUES 
('Português', 1, 1),
('Matemática', 2, 2),
('Banco de Dados', 3, 3),
('Análise', 4, 4),
('Lógica', 5, 5),
('Front-end', 6, 6),
('Back-end', 7, 7),
('Elétrica', 8, 8);

create table turmas_has_aluno(
  Pk_Turmas_has_Aluno int not null auto_increment,
  Fk_turma int,
  Fk_matricula int,
  primary key (Pk_Turmas_has_Aluno),
  foreign key (Fk_turma) references turmas(Pk_turma),
  foreign key (Fk_matricula) references aluno(PK_Matricula)
  on delete restrict on update cascade
);

INSERT INTO turmas_has_aluno (Fk_turma, Fk_matricula)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

# 1. Liste alfabeticamente o nome e o endereço de todos os alunos.
SELECT Nome_Aluno, Endereco_Aluno 
FROM aluno 
ORDER BY Nome_Aluno;

# 2. Liste o nome dos professores que possuem a titulação "Mestre".
SELECT Nome_professor 
FROM professor 
WHERE Titulacao_professor = 'Mestre';
  
# 3. Liste a sigla e a data de início de todas as turmas que começaram no ano de 2023.
SELECT Sigla_turma, Data_inicio
FROM turmas
WHERE YEAR(Data_inicio) = 2023;

# 4. Liste o nome dos alunos matriculados na turma com a sigla " T ELET".
SELECT a.Nome_Aluno
FROM aluno a
JOIN turmas_has_aluno tha ON a.PK_Matricula = tha.Fk_matricula
JOIN turmas t ON tha.Fk_turma = t.Pk_turma
WHERE t.Sigla_turma = 'TELET';

# 5. Liste alfabeticamente o nome das disciplinas que possuem a palavra "Matemática" no nome.
SELECT Nome_disciplina
FROM disciplina
WHERE Nome_disciplina LIKE '%Matemática%'
ORDER BY Nome_disciplina;

# 6. Liste o nome dos alunos que estão matriculados em turmas cujos professores possuem a titulação "Doutorado".
SELECT DISTINCT a.Nome_Aluno
FROM aluno a
JOIN turmas_has_aluno tha ON a.PK_Matricula = tha.Fk_matricula
JOIN turmas t ON tha.Fk_turma = t.Pk_turma
JOIN disciplina d ON t.Pk_turma = d.Fk_turma
JOIN professor p ON d.Fk_professor = p.Pk_professor
WHERE p.Titulacao_professor = 'Doutorado';

# 7. Liste o nome e a sigla das turmas que possuem alunos matriculados com endereço contendo a palavra "Joinville".
SELECT DISTINCT t.Sigla_turma, a.Nome_Aluno
FROM aluno a
JOIN turmas_has_aluno tha ON a.PK_Matricula = tha.Fk_matricula
JOIN turmas t ON tha.Fk_turma = t.Pk_turma
WHERE a.Endereco_Aluno LIKE '%Joinville%';

# 8. Liste o nome dos professores que lecionam em turmas que começaram após o dia 01/01/2024.
SELECT DISTINCT p.Nome_professor
FROM professor p
JOIN disciplina d ON p.Pk_professor = d.Fk_professor
JOIN turmas t ON d.Fk_turma = t.Pk_turma
WHERE t.Data_inicio > '2024-01-01';

# 9. Liste alfabeticamente o nome dos alunos que estão matriculados em mais de uma turma.
SELECT a.Nome_Aluno
FROM aluno a
JOIN turmas_has_aluno tha ON a.PK_Matricula = tha.Fk_matricula
GROUP BY a.Nome_Aluno
HAVING COUNT(tha.Fk_turma) > 1
ORDER BY a.Nome_Aluno;

# 10. Liste o nome das disciplinas e seus respectivos professores que são lecionadas na turma "T DESI".
SELECT d.Nome_disciplina, p.Nome_professor
FROM disciplina d
JOIN professor p ON d.Fk_professor = p.Pk_professor
JOIN turmas t ON d.Fk_turma = t.Pk_turma
WHERE t.Sigla_turma = 'TDESI';
