-- atividade 4: 
-- parte 2
DELIMITER $$
CREATE PROCEDURE `UsuarioCurso`(idusu int, idCurso int)
   BEGIN 
        select T1.*, nomeusuario, T3.nomecurso
        from perfilacademico T1
        inner join usuario T2
        on T1.idusuario = T2.idusuario
        inner join curso T3
        on T1.idcurso = t3.idcurso
        where t2.idusuario=idusu and
                t3.idcurso = idCurso;        
   END$$
DELIMITER ;

call UsuarioCurso(1, 169);


-- ATIVIDADE 5
alter table curso add vlcurso decimal(10,2);
select * from curso;
update curso set vlcurso = 500.00;

-- função
DELIMITER &&
CREATE FUNCTION fn_desconto(vlcurso decimal (10,2), vldesconto decimal (10,2))
RETURNS int
NO SQL
 BEGIN
     RETURN vlcurso - vldesconto;
 END&&
DELIMITER ;

SELECT fn_desconto(20, 10) as resultado;

-- Ativ 6
DELIMITER $$
CREATE PROCEDURE `UsuarioCursoDesc`(idusu int, idCurso int, vlDesc decimal(10,2))
   BEGIN 
        select T1.*, nomeusuario, T3.nomecurso
    , T3.vlcurso
    , fn_desconto(T3.vlcurso,vlDesc)
        from perfilacademico T1
        inner join usuario T2
        on T1.idusuario = T2.idusuario
        inner join curso T3
        on T1.idcurso = t3.idcurso
        where t2.idusuario=idusu and
                t3.idcurso = idCurso;        
   END$$
DELIMITER ;

call UsuarioCursoDesc(1, 169,15);




