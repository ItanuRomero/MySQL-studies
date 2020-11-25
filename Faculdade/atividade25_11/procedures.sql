delimiter &&
create procedure nomeFilme(varidfilme int)
begin
	select concat('O nome do filme e: ', titulo) as Titulo
    from filme
    where idfilme = varidfilme;
end;
&&
-- executando o procedimento
call nomeFilme(101);