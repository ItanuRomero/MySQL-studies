/* aula 24/08/2020 */
CREATE DATABASE aula24Agosto;
use aula24Agosto;

CREATE TABLE IF NOT EXISTS FORNECEDOR (
IDFORNECEDOR INT  auto_increment NOT NULL,
NOME VARCHAR(45),
ENDERECO VARCHAR(45),
TELEFONE INT,
CIDADE VARCHAR(20) DEFAULT 'SÃO PAULO',
EMAIL VARCHAR(25) UNIQUE,
PRIMARY KEY (IDFORNECEDOR)
);

CREATE TABLE IF NOT EXISTS PRODUTO (
IDPRODUTO INT NOT NULL,
DESCRICAO VARCHAR(45),
PRECO DECIMAL(7,2),
UNIDADE VARCHAR(10),
IDFORNECEDOR INT NOT NULL,
PRIMARY KEY (IDPRODUTO),
foreign key (IDFORNECEDOR) references FORNECEDOR(IDFORNECEDOR)
);
INSERT INTO FORNECEDOR VALUES 
(1,'PAPEL RECICLADO','RUA BRASIL,1000',4441212,'BRAGANÇA PAULISTA',
'RECI@GMAIL.COM');

INSERT INTO FORNECEDOR VALUES
(IDFORNECEDOR, 'CASA BAHIA','RUA DO MERCADO,200',40338787,'BRAGANÇA PAULISTA',
'CASABAHIA@GMAIL.COM'),
(IDFORNECEDOR,'LOJA CEM','RUA DO COMERCIO,9000',40334455,'BRAGANÇA PAULISTA',
'LOJACEM@GMAIL.COM'),
(IDFORNECEDOR,'MAGAZINE LUIZA','RUA PIRES PIMENTEL,500',40331212, 'BRAGANÇA PAULISTA',
'LUIZA@GMAIL.COM');
SELECT * FROM FORNECEDOR;

INSERT INTO produto VALUES 
(100,'FOGAO',800.50,'PC',2),
(110,'GELADEIRA',2000.70,'PC',2),
(150,'FOGAO COOKTOP',1330.40,'PC',3),
(160,'AR CONDICIONADO',1800,'PC',4);

select * from fornecedor;
select * from produto;


/* alterar dados */
update fornecedor
set email='luiza@hotmail.com'
where idfornecedor=4; 

select * from fornecedor;

update produto
set preco=2500.00,
	descricao='ar condicionado portatil'
where idproduto=160;

select * from produto where idproduto=160;

/* possiveis erros */
/*
update produto
set preco=1000,
	descricao='ar condicionado LG';
   --erro por nao possuir a condicao 
*/ 

/* erro por incompatibilidade de dado */
/*
update produto
set preco='casa'
where idproduto=160;
	--esperava uma coluna decimal e recebeu um dado em string
*/

/* erro de falha na chave estrangeira */
/*
select * from produto where idproduto=160;
update produto
set idfornecedor=9
where idproduto=160;
	--erro pois nao existe o idfornecedor=9
*/


/* apagar registro */
select * from produto;
/*
delete from produto where idproduto=100;
*/

/* ATENCAO - PROBLEMAS NA EXCLUSAO DE DADOS */
/*
delete from produto;
	--nao e um comando seguro.
delete from fornecedor where idfornecedor=2;
*/
/* mostrar apenas algumas colunas */
select idproduto, descricao from produto;

select idfornecedor, email from fornecedor;

/* mostrar ordenado */
select idfornecedor, email from fornecedor order by idfornecedor;
/* default: asc.			e para fazer descendente: desc*/
select idfornecedor, email from fornecedor order by 1 desc; 
/* exibir todos os dados de produto ordenado por preco de forma ascendente */
select * from produto order by preco;

/* pesquisando por partes de strings */
select * from produto where descricao like 'fog%'; /* comeca com */
select * from produto where descricao not like '%ao'; /* termina com */

/* mostrando todos conteudos de uma coluna */
select all idfornecedor from produto;
/* e para selecionar sem repetir dados */
select distinct idfornecedor from produto;

/*---------------------------------------------------*/
/* efeito cascata na criacao da tabela */
/* alterando comando de criacao nas tabelas aula 24/08/2020 */
CREATE DATABASE aula24AgostoPart2;
use aula24AgostoPart2;

CREATE TABLE IF NOT EXISTS FORNECEDOR (
IDFORNECEDOR INT  auto_increment NOT NULL,
NOME VARCHAR(45),
ENDERECO VARCHAR(45),
TELEFONE INT,
CIDADE VARCHAR(20) DEFAULT 'SÃO PAULO',
EMAIL VARCHAR(25) UNIQUE,
PRIMARY KEY (IDFORNECEDOR)
);

CREATE TABLE IF NOT EXISTS PRODUTO (
IDPRODUTO INT NOT NULL,
DESCRICAO VARCHAR(45),
PRECO DECIMAL(7,2),
UNIDADE VARCHAR(10),
IDFORNECEDOR INT NOT NULL,
PRIMARY KEY (IDPRODUTO),
foreign key (IDFORNECEDOR) references FORNECEDOR(IDFORNECEDOR)
on delete cascade on update cascade /* muda o erro de deletar com chave estrangeira*/
);
/* se tiver registro na tabela filha sera elimnado ou atualizado */
INSERT INTO FORNECEDOR VALUES 
(1,'PAPEL RECICLADO','RUA BRASIL,1000',4441212,'BRAGANÇA PAULISTA',
'RECI@GMAIL.COM');

INSERT INTO FORNECEDOR VALUES
(IDFORNECEDOR, 'CASA BAHIA','RUA DO MERCADO,200',40338787,'BRAGANÇA PAULISTA',
'CASABAHIA@GMAIL.COM'),
(IDFORNECEDOR,'LOJA CEM','RUA DO COMERCIO,9000',40334455,'BRAGANÇA PAULISTA',
'LOJACEM@GMAIL.COM'),
(IDFORNECEDOR,'MAGAZINE LUIZA','RUA PIRES PIMENTEL,500',40331212, 'BRAGANÇA PAULISTA',
'LUIZA@GMAIL.COM');
SELECT * FROM FORNECEDOR;

INSERT INTO produto VALUES 
(100,'FOGAO',800.50,'PC',2),
(110,'GELADEIRA',2000.70,'PC',2),
(150,'FOGAO COOKTOP',1330.40,'PC',3),
(160,'AR CONDICIONADO',1800,'PC',4);

/* agora com o comando on delete on cascade ele executa tanto na tabela pai como na tabela filho */
delete from fornecedor where idfornecedor=2;
select * from fornecedor;
select * from produto;

update produto
set idfornecedor=9 /* precisamos do codigo par apoder gerar a insercao */
where idproduto=160; 