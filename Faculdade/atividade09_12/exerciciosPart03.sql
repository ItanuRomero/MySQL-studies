-- ATIVIDADE 7
CREATE VIEW vwPerfilUser AS
SELECT nomeusuario 
     , apelidousuario
     , email
     , estadocivil
     , datanascimento
 FROM usuario U
JOIN perfilsocial PS
  ON U.idusuario = PS.idusuario;

select * from vwPerfilUser;

-- ATIVIDADE 8
-- parte 1
CREATE VIEW vwPerfilProfiss AS
select T1.*, 
nomeusuario, 
t3.nomeprofissao,
t4.nomeempresa,
t5.descricaocargo
  from perfilprofissional T1
inner join usuario T2
on T1.idusuario = T2.idusuario
inner join profissao T3
on t3.idprofissao = t1.idprofissao
inner join empresa t4
on t4.idempresa = t1.idempresa
inner join cargo t5
on t5.idcargo = t1.idcargo;

select * from vwPerfilProfiss;

-- ATIVIDADE 8
-- parte 2
-- Criando a Stored Procedure
DELIMITER $$
CREATE PROCEDURE `ObtemPerfilProfissional`(idusu int)
   BEGIN 
    SELECT * from vwPerfilProfiss        
        where idusuario=idusu;
        
   END$$
DELIMITER ;


call ObtemPerfilProfissional(1);