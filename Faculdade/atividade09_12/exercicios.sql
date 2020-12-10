-- Ativ2
select T1.*, nomeusuario
from perfilprofissional T1
inner join usuario T2
on T1.idusuario = T2.idusuario;


-- Ativ 3
select nomeusuario
        , apelidousuario
    , nomeperfilOperacional
    , email
    , nomenacionalidade
    , nomemunicipio
from usuario U
inner join perfiloperacional PO
on U.idperfilOperacional = PO.idperfilOperacional
inner join perfilsocial PS
on U.idusuario = PS.idusuario
inner join nacionalidade N 
on PS.idnacionalidade=N.idnacionalidade
inner join municipio M
on PS.naturalidade=M.idmunicipio;

-- Ativ 3 - Procedure
delimiter $$
create procedure UserPerfOp(idusu int)
begin
        select nomeusuario
        , apelidousuario
    , nomeperfilOperacional
    , email
    , nomenacionalidade
    , nomemunicipio
from usuario U
inner join perfiloperacional PO
on U.idperfilOperacional = PO.idperfilOperacional
inner join perfilsocial PS
on U.idusuario = PS.idusuario
inner join nacionalidade N 
on PS.idnacionalidade=N.idnacionalidade
inner join municipio M
on PS.naturalidade=M.idmunicipio
where U.idusuario = idusu;

end$$
delimiter ;

call UserPerfOp(2);


