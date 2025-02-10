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

insert into aluno (Nome_Aluno, Endereco_Aluno, Cpf_Aluno) 
values 
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

insert into professor (Nome_professor, Titulacao_professor)
values 
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

insert into turmas (Sigla_turma, Data_inicio)
values 
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

insert into disciplina (Nome_disciplina, Fk_turma, Fk_professor)
values 
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

insert into turmas_has_aluno (Fk_turma, Fk_matricula)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

# 1. Liste alfabeticamente o nome e o endereço de todos os alunos.
select nome_aluno, endereco_aluno from aluno order by nome_aluno;

# 2. Liste o nome dos professores que possuem a titulação "Mestre"
select * from professor where titulacao_professor = 'Mestre';

# 3. Liste a sigla e a data de início de todas as turmas que começaram no ano de 2023.
select sigla_turma, data_inicio from turma
where data_inicio >= '2023-01-01' and data_inicio < '2024-01-01';

# 4. Liste o nome dos alunos matriculados na turma com a sigla " T ELET"
select aluno.nome_aluno, turma.sigla_turma from turma_has_aluno 
join aluno on turma_has_aluno.fk_matricula = aluno.pk_matricula
join turma on turma_has_aluno.fk_turma = turma.pk_turma
where turma.sigla_turma = 'T ELET';

# 5. Liste alfabeticamente o nome das disciplinas que possuem a palavra "Matemática" no nome - trocarei para 'Desenvolvimento'
select nome_disciplina from disciplina
where nome_disciplina like "Desenvolvimento"
order by nome_disciplina;

# 6. Liste o nome dos alunos que estão matriculados em turmas cujos professores possuem a titulação "Doutorado".
select nome_aluno, sigla_turma, nome_professor, titulacao_professor
from aluno, turma, professor, disciplina, turma_has_aluno
where aluno.pk_matricula = turma_has_aluno.fk_matricula
and turma_has_aluno.fk_turma = turma.pk_turma
and turma.pk_turma = disciplina.fk_turma
and disciplina.fk_professor = professor.pk_professor
and professor.titulacao_professor = 'Doutorado'
order by nome_aluno;

# 7. Liste o nome e a sigla das turmas que possuem alunos matriculados com endereço contendo a palavra "Joinville". # SUBSTITUIREI POR AVENIDA
select turma.pk_turma, turma.sigla_turma, aluno.nome_aluno
from turma
join turma_has_aluno on turma.pk_turma = turma_has_aluno.fk_turma
join aluno on aluno.pk_matricula = turma_has_aluno.fk_matricula
where aluno.endereco_aluno like '%Avenida%' 
and aluno.nome_aluno like 'M%'
order by aluno.nome_aluno;

# 8. Liste o nome dos professores que lecionam em turmas que começaram após o dia 01/01/2024.
select turma.pk_turma, turma.sigla_turma, professor.nome_professor, turma.data_inicio
from professor
join disciplina on disciplina.fk_professor = professor.pk_professor
join turma on turma.pk_turma = disciplina.fk_turma
where turma.data_inicio >= '2024-01-01'
order by professor.nome_professor;

# 9. Liste alfabeticamente o nome dos alunos que estão matriculados em mais de uma turma.
select aluno.nome_aluno
from aluno
join turma_has_aluno on aluno.pk_matricula = turma_has_aluno.fk_matricula
group by aluno.pk_matricula
having count(turma_has_aluno.fk_turma) > 1
order by aluno.nome_aluno;

# 10. Liste o nome das disciplinas e seus respectivos professores que são lecionadas na turma "T DESI".
select distinct turma.sigla_turma, disciplina.nome_disciplina, professor.nome_professor
from professor
join disciplina on disciplina.fk_professor = professor.pk_professor
join turma on turma.pk_turma = disciplina.fk_turma
where turma.sigla_turma = 'T DESI'
order by professor.nome_professor;
