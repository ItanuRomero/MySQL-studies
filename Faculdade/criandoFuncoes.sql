Delimiter &&
create function fn_teste(a decimal(10,2), b int)
	returns int
begin
	return a * b;
end &&
Delimiter ;

select fn_teste(5.2, 10);

select * from sessao;

alter table sessao
add vl_ingresso decimal(10,2);

update sessao
set vl_ingresso = 30.00;

select sala_idsala, filme_idfilme, fn_teste(vl_ingresso, 6) as ValorTT
from sessao;

-- valor de ingresso de uma sala
select sala_idsala as Sala, 
	filme_idfilme as Filme,
    fn_teste(vl_ingresso, 6) as ValorTT
from sessao
where sala_idsala=100;

-- valor de ingresso de uma sala e filme especifico
select sala_idsala as Sala, 
	filme_idfilme as Filme,
    fn_teste(vl_ingresso, 6) as ValorTT
from sessao
where sala_idsala=100 and filme_idfilme=103;