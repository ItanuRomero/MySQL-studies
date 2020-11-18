-- -----------------------------------------------------
-- Table `SiteNoticias`.`categoria`
-- -----------------------------------------------------

INSERT INTO `sitenoticias`.`categoria`
values
('1','Fofocas'),
('2','Mundo'),
('3','Copa do Mundo');


-- -----------------------------------------------------
-- Table `SiteNoticias`.`usuario`
-- -----------------------------------------------------

INSERT INTO `sitenoticias`.`usuario`
values
('1','Fernanda de Lima', 'fe.lima@gmail.com', 'felima2018', '1' ),
('2','Wesley da Silva', 'wesley.silva@gmail.com', 'silvaw2018', '1' ),
('3','Júlia Oliveira', 'juoliveira@gmai.com', 'joliv2018', '1' );



-- -----------------------------------------------------
-- Table `SiteNoticias`.`noticia`
-- -----------------------------------------------------

INSERT INTO `sitenoticias`.`noticia`
values
('100','Fofoca Anita', '2018-07-31', 'Anita grava clipe com Projota e estão namorando!', 'C:\fotos\image01.jpg', '1', '2' ),
('200','Jogo Brasil com França', '2018-06-22', 'Brasil ganha de 7 a 1', 'C:\fotos\image02.jpg', '3', '2' ),
('300','Inglaterra', '2018-06-22', 'Inglaterra tem emprego para Brasileiros.', 'C:\fotos\image03.jpg', '2', '1' );



-- -----------------------------------------------------
-- Table `SiteNoticias`.`comentario`
-- -----------------------------------------------------

INSERT INTO `sitenoticias`.`comentario`
values
('123', '2018-08-10', 'Só pode ser fake!', '100', '1' ),
('125', '2018-08-22', 'Brasil, Brasil!', '200', '1' ),
('129', '2018-08-22', 'Partiu Inglaterra!', '300', '2' );


select * from categoria;
select * from usuario;
select * from noticia;
select * from comentario;


