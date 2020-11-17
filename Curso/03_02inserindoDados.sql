use cadastro;

select * from cursos;

create table if not exists gafanhotos (
id int not null auto_increment,
nome varchar(30) not null,
profissao varchar(20),
nascimento date,
sexo enum('M', 'F'),
peso decimal(5, 2),
altura decimal(3, 2),
nacionalidade varchar(20) default 'Brasil',
primary key (id)
);

insert into gafanhotos values
(default, 'itanu', 'estudante', '2001-04-10', 'M', 65.0, 1.67, 'Uruguay');

desc gafanhotos;
select * from gafanhotos;
