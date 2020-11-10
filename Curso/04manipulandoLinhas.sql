use cadastro;

select * from pessoas;

create table if not exists cursos (
idcurso int not null auto_increment,
nome varchar(20),
descricao varchar(100),
carga tinyint,
total_aulas tinyint,
ano int,
primary key (idcurso)
);

drop table cursos;
select * from cursos;

insert into cursos values
(default, 'jarva', 'curso de java', 10, 29, 2000),
(default, 'PGP', 'curso de PHP', 40, 20, 2010),
(default, 'HTML4', 'curso de HTML5', 40, 37, 2014); 

# modificacoes 
update cursos #nome tabela
set nome = 'HTML5' # mudanca
where idcurso = 1; # condicao

update cursos
set nome = 'PHP', ano = 2015
where idcurso = 3;

update cursos
set nome = 'Java', carga = 40, ano = 2015
where idcurso = 2
limit 1; # limita as alteracoes em apenas uma linha

select * from cursos;

delete from cursos
where idcurso = 4; # apagando apenas um registro

delete from cursos
where idcurso > 4; # caso nao funcione, desabilitar o safe update.

# apagando todos os registros
truncate table cursos; #ou
truncate cursos;