use cadastro;

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('maria', '2002-08-23', 'F', '45.0', '1.56', 'Brasil');

insert into pessoas
values
(default, 'tchurusbago', '2002-12-27', 'f', '78.0', '1.80', 'australia');

select * from pessoas;

# delete from pessoas where id=6 or id=5;

insert into pessoas
values
(default, 'claudio', '1987-12-17', 'M', '78.0', '1.80', 'Terra do nunca'),
(default, 'claudia', '1997-12-12', 'F', '65', '1.65', 'EUA');
