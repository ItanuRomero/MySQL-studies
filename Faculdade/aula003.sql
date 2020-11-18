CREATE DATABASE IF NOT EXISTS Aula31Agosto;
USE Aula31Agosto;
/* CRIAR TABELA */
CREATE TABLE IF NOT EXISTS FORNECEDOR (
IDFORNECEDOR INT,
NOME VARCHAR(45),
ENDERECO VARCHAR(45),
TELEFONE INT,
CIDADE VARCHAR(20),
EMAIL VARCHAR(25),
PRIMARY KEY (IDFORNECEDOR)
);
CREATE TABLE IF NOT EXISTS PRODUTO (
IDPRODUTO INT,
DESCRICAO VARCHAR(45),
PRECO DECIMAL(7,2),
UNIDADE VARCHAR(10),
IDFORNECEDOR INT,
PRIMARY KEY (IDPRODUTO),
FOREIGN KEY (IDFORNECEDOR) REFERENCES FORNECEDOR(IDFORNECEDOR)
ON DELETE CASCADE ON UPDATE CASCADE
/* na execução do delete ou update a ação será cascata
  se tiver registro na tabela filha será eliminado ou atualizado  */
);


INSERT INTO FORNECEDOR VALUES
(1,'PAPEL RECICLADO','RUA BRASIL,1000', 4441212, 'BRAGANÇA PAULISTA',
 'RECI@GMAIL.COM'),
(2,'CASA BAHIA','RUA DO MERCADO,200', 40338787, 'BRAGANÇA PAULISTA',
 'CASABAHIA@GMAIL.COM'),
(3,'LOJA CEM','RUA DO COMERCIO,9000', 40334455, 'BRAGANÇA PAULISTA',
 'LOJACEM@GMAIL.COM'),
(4,'MAGAZINE LUIZA','RUA OIER PIMENTEL,500', 40331212, 'BRAGANÇA PAULISTA',
 'LUIZA@GMAIL.COM');

INSERT INTO PRODUTO VALUES
(100,'FOGAO', 800.50, 'PC',2),
(110,'GELADEIRA', 2000.70, 'PC',2),
(150,'FOGAO COOKTOP', 1300.40, 'PC',3),
(160,'AR CONDICIONADO', 1800, 'PC',4),
(170,'IMPRESSORA', 2800, 'PC',2),
(161,'NOTEBOOK', 3400, 'PC',2),
(180,'ASPIRADOR DE PO', 256, 'PC',1),
(181,'TV', 3800, 'PC',1),
(190,'TV', 3900, 'PC',2);

CREATE TABLE IF NOT EXISTS FAMILIA (
IDFAMILIA INT AUTO_INCREMENT,
DESCRICAO VARCHAR(45),
PRIMARY KEY (IDFAMILIA)
);

INSERT INTO FAMILIA VALUES
(1,'Linha Branca'),
(2, 'Informática');

alter table PRODUTO 
add column IDFAMILIA INT,
add QTDE INT,
ADD foreign key(IDFAMILIA) references FAMILIA(IDFAMILIA)
ON DELETE CASCADE ON UPDATE CASCADE;


UPDATE PRODUTO 
SET IDFAMILIA=1,
	QTDE=10
WHERE IDPRODUTO=150;

UPDATE PRODUTO 
SET IDFAMILIA=2,
	QTDE=12
WHERE IDPRODUTO>=160;

UPDATE PRODUTO 
SET IDFAMILIA=1,
	QTDE=8
WHERE IDPRODUTO=100;


UPDATE PRODUTO 
SET IDFAMILIA=1,
	QTDE=17
WHERE IDPRODUTO=110;
/*apos o delete idFornecedor=2, a
como a ação era CASCADE foi eliminado o registro 
na tabela fornecedor e produto*/
SELECT * FROM FORNECEDOR;
SELECT * FROM PRODUTO;
select * from familia;

desc produto;
/* ATUALIZA FORNCEDOR*/

UPDATE FORNECEDOR 
SET CIDADE='SÃO PAULO'
WHERE IDFORNECEDOR=1;

ALTER TABLE produto
ADD COLUMN QTDE INT;

UPDATE produto 
SET QTDE=10
WHERE IDPRODUTO=100;

UPDATE produto 
SET QTDE=7
WHERE IDPRODUTO=110;

UPDATE produto 
SET QTDE=18
WHERE IDPRODUTO=150;

UPDATE produto 
SET QTDE=5
WHERE IDPRODUTO>=160;


# caulcular media:
select avg(preco) from produto;
# o 'as' pode ser utilizado para nome do resultado
select avg(preco) as 'Media dos precos' from produto;
# para formatar casas decimais
select format(avg(preco), 2) as 'Media dos precos' from produto;

# contar
select count(idfornecedor) from fornecedor;
# contar com condicao
select count(idfornecedor) from fornecedor where cidade like 'bra%';
# mudando o nome da cidade do fonecedor de id 3
update fornecedor set cidade='Sao Paulo' where idfornecedor=3;
# para uma cidade que nao comece com bra
select count(idfornecedor) from fornecedor where cidade not like 'bra%';
# somar
select sum(preco) from produto;
# formatando com 1 casa decimal
select format(sum(preco), 1) from produto;
# soma dos precos com id maior que 101
select sum(preco) from produto where idproduto<101;
# exibir os dados descricao, preco, qtde, preco total
# exibir com 1 casa decimal para todos os produtos
select descricao, format(preco, 2), qtde, format(preco * qtde, 1) as 'preco total' from produto;
# maior valor
select max(preco) from produto;
# menor valor
select min(preco) from produto;
# agrupamento
select idfornecedor, sum(preco) from produto
group by idfornecedor
order by idfornecedor;
# contar quantos produtos cadastrados por familia
select idfamilia, count(*) as quantidade_produtos from produto
group by idfamilia
order by idfamilia;