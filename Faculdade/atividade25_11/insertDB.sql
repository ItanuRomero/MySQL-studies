use cinema;
-- Genero
INSERT INTO `cinema`.`genero`
(`idgenero`,
`descricao`)
VALUES
('1','Ação'),
('2','Suspense'),
('3','Drama'),
('4','Policial');

select * from genero;

-- ator

INSERT INTO `cinema`.`ator`
(`idator`,
`nome`)
VALUES
('1','Brad Pit'),
('2','Angelina Jolie'),
('3','Jennifer Aniston'),
('4','Gwyneth Paltrow'),
('5','Robert John Downey');

select * from ator;

-- sala
INSERT INTO `cinema`.`sala`
(`idsala`,
`nome`,
`qtdeAssento`)
VALUES
('100','Sala A','80'),
('200','Sala B', '100'),
('300','Sala C', '90'),
('400','Sala D', '80');

select * from sala;

-- filme
INSERT INTO `cinema`.`filme`
(`idfilme`,
`titulo`,
`duracao`,
`genero_idgenero`)
VALUES
('101','Velozes e Furiosos','1:50', '1'),
('102','Homens de Ferro','2:00', '1'),
('103','Batman','2:12', '1'),
('104','O Poderoso Chefão','1:45', '4');

select * from filme;

-- sessão
INSERT INTO `cinema`.`sessao`
(`sala_idsala`,
`filme_idfilme`,
`dataHora`,
`qtdeVendidos`)
VALUES
('100','103','2018-08-06 14:00','50'),
('100','104','2018-08-06 18:00','70'),
('200','103','2018-08-06 20:00','60'),
('200','104','2018-08-06 23:00','80');

select * from sessao;


