CREATE DATABASE IF NOT EXISTS cadastro;
use cadastro;
create table if not exists pessoas (
nome varchar(30),
idade tinyint,
sexo char(1),
peso float,
altura float,
nacionalidade varchar(20)
);
# ver como esta montada a tabela
describe pessoas;