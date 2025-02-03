#CRIA O BANCO
CREATE DATABASE hubmenu;

#USA O BANCO
USE hubmenu;

#DROP TABLE
DROP TABLE funcionario;

#CRIAR TABELA
CREATE TABLE funcionario(
pk_funcionario int auto_increment primary key,
nome_func varchar(40) not null,
cargo_func varchar(30) not null,
salario_func decimal(10,2),
fk_depto int not null,
foreign key(fk_depto) references depto(pk_depto) on delete restrict on update cascade
);

#CRIAR TABELA DEPTO
CREATE TABLE depto(
pk_depto int auto_increment primary key,
nome_depto varchar(20)
);

#APAGA A TABELA SE PRECISAR
DROP TABLE funcionario;

INSERT INTO funcionario(nome_func, cargo_func, salario_func, fk_depto) VALUES
('Mark Stolfi', 'CEO', '10000', '1');

INSERT INTO depto(pk_depto, nome_depto) VALUES
('1', 'Gerencia'),
('2', 'Vendas'),
('3', 'Estoque'),
('4', 'TI'),
('5', 'Secretaria')
