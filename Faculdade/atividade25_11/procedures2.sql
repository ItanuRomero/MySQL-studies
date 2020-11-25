delimiter &&
create procedure nomeFilme(varidfilme int)
begin
        select concat('O nome do filme é - ', titulo) as Título
    from filme
    where idfilme=varidfilme;
end;
&&

-- invocar o procedimento
call nomeFilme(101);

-- 2. sessões de uma determinada sala
DELIMITER $$
CREATE procedure acessaSessao(vardSala int)
        begin
                select * FROM cinema.sessao
        where sala_idsala = vardSala;        
    end$$
DELIMITER ;

call acessaSessao(200);

-- 3. sessão de um determinado filme

-- sessão de filmes
delimiter $$
create procedure sessaoFilme(varFilme int)
begin
        select sessao.sala_idsala,
        sala.nome,
    sessao.filme_idfilme,
    filme.titulo,
    sessao.dataHora,
    sessao.qtdeVendidos    
from cinema.sessao inner join cinema.sala
on sessao.sala_idsala = sala.idsala
inner join cinema.filme
on sessao.filme_idfilme = filme_idfilme
where filme_idfilme = varFilme;
end$$
delimiter ;

call sessaoFilme(103);




-- 4- Filmes de um determinado genero

-- O “MODO” indica a forma como o parâmetro será tratado no procedimento
-- IN: indica que o parâmetro é apenas para entrada/recebimento de dados
-- OUT: usado para parâmetros de saída (deve ser passada uma variável “por referência”)
-- INOUT: como é possível imaginar, este tipo de parâmetro pode ser usado para os dois fins 

DELIMITER &&
CREATE PROCEDURE filmeGenero (IN varNome VARCHAR(45))
 BEGIN
SELECT f.titulo AS Filme,
                s.dataHora
        FROM filme AS f 
        INNER JOIN sessao AS s        
        ON f.idfilme = s.filme_idfilme
        WHERE f.genero_idgenero = (SELECT  idgenero 
                FROM genero
                WHERE descricao = varNome);
        END;
&&

CALL filmeGenero('Ação');



-- 5 inserir uma sala de cinema
DELIMITER $$
CREATE procedure insereSala
(
        idsala integer,
    nome varchar(45),
    qtdeAssento integer
 )
        begin
                insert into cinema.sala
        (idSala, nome, qtdeAssento)
        values (idSala, nome, qtdeAssento);
    end$$
DELIMITER ;

call insereSala (500, 'Sala 500', 100);

select * from sala;

-- 5 inserir uma sala de cinema COM IF
-- Exemplo com insert e if se idSala <=400 70 assento senão 90:
DELIMITER //
CREATE PROCEDURE insereSalaIf
(
idSala INTEGER,
nome VARCHAR(45)
)
BEGIN
  DECLARE varQtde integer;

  IF idSala <= 400 THEN
          SET varQtde = 70;
  ELSE
          SET varQtde = 90;
  END IF;

  INSERT INTO cinema.sala
    (idSala, nome, qtdeAssento)
        VALUES (idSala, nome, varQtde);
END;
//

CALL insereSalaIf(511, 'Sala 511');

select * from sala;


-- 5 inserir informações na tabela sessão
DELIMITER //
CREATE PROCEDURE insereSessao (idSala int, idFilme int, dataHr datetime, qtVendas int)
BEGIN
  INSERT INTO cinema.sessao (sala_idsala, filme_idfilme, dataHora, qtdeVendidos)
  VALUES (idSala, idFilme, dataHr, qtVendas);
END;
//

-- invocar procedure
CALL insereSessao(300, 103, '2020-04-07 14:00', 50 );

select * from sessao;