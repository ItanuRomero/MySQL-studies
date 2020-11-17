use cadastro;

# mostrando todos os campos da tabela gafanhotos
select * from gafanhotos;

# mostrando todos os cursos ordenados por nome
select * from cursos
order by nome;

# em ordem decrescente
select * from cursos
order by nome desc; # ou asc

# filtrando colunas
select nome, carga, ano from cursos
order by nome;
# mudando a ordem das colunas
select ano, nome, carga from cursos
order by ano;

# filtrando linhas
select * from cursos
where ano = 2016
order by nome;

# filtrando linhas e colunas
select nome, descricao, carga from cursos
where ano <= 2015
order by nome;

# ordenando por ano e nome
select nome, descricao, ano from cursos
where ano <= 2016
order by ano, nome;

# ordenando com o between  para selecionar faixas de valores
select nome, ano from cursos
where ano between 2014 and 2016
order by ano desc, nome asc; # ano descrescente e nome crescente

# selecionando apenas alguns valores no where
select nome, ano from cursos
where ano in (2015, 2017)
order by ano desc, nome asc;

# escolhendo todos menos 2014
select * from cursos
where ano <> 2014
order by ano, nome;

# utilizando o operador relacional and
select nome, carga, totaulas from cursos
where carga > 35 and totaulas < 30;

# utilizando o operador relacional or
select nome, carga, totaulas from cursos
where carga > 35 or totaulas < 30;