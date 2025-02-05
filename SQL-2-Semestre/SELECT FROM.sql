#SQL AULA 04/02/25 - ALLAN
use hubmenu

INSERT INTO hubmenu.funcionario
(nome_func, cargo_func, salario_func, fk_depto)
VALUES
('Yohan Sie', 'Analista', 5000, 2),
('Maria Souza', 'Desenvolvedora', 7000, 3),
('Carlos Lima', 'Gerente', 9000, 1),
('Fernanda Alves', 'Assistente Administrativo', 3500, 4),
('João Pereira', 'Consultor', 4500, 2),
('Amanda Costa', 'Coordenadora', 8000, 1),
('Pedro Oliveira', 'Designer', 5500, 3),
('Lucas Santos', 'Analista de Sistemas', 6000, 2),
('Julia Rocha', 'Programadora', 6500, 3),
('Roberta Martins', 'Recepcionista', 3000, 4);

select nome_func, cargo_func from funcionario;
select cargo_func, salario_func, fk_depto from funcionario;
select fk_depto, cargo_func, salarico_func from funcionario;
select nome_func, salario_func, fk_depto, cargo_func from funcionario;

select * from funcionario where fk_depto = '1';

select fk_depto, nome_func, cargo_func from funcionario
where fk_depto = '1'
order by nome_func;

select nome_func, cargo_func, salario_func from funcionario
where salario_func >= 5000
and salario_func <= 8000;

#ALTER TABLE

alter table funcionario add admissao_func date;

INSERT INTO funcionario (nome_func, cargo_func, fk_depto) values (
'Mark Stolfi', 'Administrador', '1'
);

#ADD - FUNCIONARIO
alter table funcionario add admissao_func date;

alter table funcionario add dependentes_func varchar(45);
alter table funcionario drop dependentes_func;
alter table funcionario change cargo_func funcao_func varchar(40);
alter table funcionario modify nome_func varchar(50);
alter table funcionario add sexo_func set ('f', 'm') after nome_func;
alter table funcionario drop sexo_func;


#UPDATE
DESCRIBE funcionario;
ALTER TABLE funcionario ADD COLUMN sexo_func CHAR(1);

update funcionario set sexo_func = 'm' where pk_funcionario = 1;
update funcionario set admissao_func = '2010-03-08' where pk_funcionario = 1;
update funcionario set sexo_func = 'm' where pk_funcionario = 2;
update funcionario set admissao_func = '2010-05-18' where pk_funcionario = 2;
update funcionario set sexo_func = 'f' where pk_funcionario = 3;
update funcionario set admissao_func = '2010-07-28' where pk_funcionario = 3;
update funcionario set sexo_func = 'm' where pk_funcionario = 4;
update funcionario set admissao_func = '2010-02-14' where pk_funcionario = 4;
update funcionario set sexo_func = 'm' where pk_funcionario = 5;
update funcionario set admissao_func = '2010-08-16' where pk_funcionario = 5;
update funcionario set sexo_func = 'm' where pk_funcionario = 6;
update funcionario set admissao_func = '2010-09-21' where pk_funcionario = 6;
update funcionario set sexo_func = 'f' where pk_funcionario = 7;
update funcionario set admissao_func = '2010-10-25' where pk_funcionario = 7;
update funcionario set sexo_func = 'm' where pk_funcionario = 8;
update funcionario set admissao_func = '2010-01-26' where pk_funcionario = 8;
update funcionario set sexo_func = 'f' where pk_funcionario = 9;
update funcionario set admissao_func = '2010-06-23' where pk_funcionario = 9;
update funcionario set sexo_func = 'm' where pk_funcionario = 10;
update funcionario set admissao_func = '2010-09-27' where pk_funcionario = 10;