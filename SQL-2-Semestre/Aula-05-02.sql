#####
# DBZINHA BASICA DO MOISES J. FERREIRA
# 05/02/2025
# TDESN V3
#####

create database Escola;
use Escola;

create table aluno(
  PK_Matricula int not null auto_increment,
  Nome_Aluno varchar(45),
  Endereco_Aluno varchar(60),
  Cpf_Aluno bigint,
  primary key (PK_Matricula)
);

create table turmas_has_aluno(
  Pk_Turmas_has_Aluno int not null auto_increment,
  Fk_turma int,
  Fk_matricula int,
  foreign key (Fk_turma) references turmas(Pk_turma),
  foreign key (Fk_matricula) references aluno(PK_Matricula)
  on delete restrict on update cascade
);

create table professor(
  Pk_professor int not null auto_increment,
  Nome_professor varchar(45),
  Titulacao_professor varchar(30),
  primary key (Pk_professor)
);

create table turmas(
  Pk_turma int not null auto_increment,
  Sigla_turma varchar(8),
  Data_inicio date,
  primary key (Pk_turma)
);

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
