select * from noticia
order by titulo;

select n.titulo, n.data, c.texto, u.nome
from noticia as n
inner join comentario as c
on n.idnoticia = c.noticia_idnoticia
inner join usuario as u
on c.usuario_idusuario = u.idusuario;

-- comentario também
select u.nome, n.titulo
from usuario as u
left outer join noticia as n
on n.usuario_idusuario = u.idusuario;

select u.nome, n.titulo
from usuario as u
right outer join noticia as n
on n.usuario_idusuario = u.idusuario;