CREATE DATABASE IF NOT EXISTS Aula14Setembro;
USE Aula14Setembro;
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

CREATE TABLE IF NOT EXISTS FAMILIA (
IDFAMILIA INT AUTO_INCREMENT,
DESCRICAO VARCHAR(45),
PRIMARY KEY (IDFAMILIA)
);
CREATE TABLE IF NOT EXISTS PRODUTO (
IDPRODUTO INT,
DESCRICAO VARCHAR(45),
PRECO DECIMAL(7,2),
UNIDADE VARCHAR(10),
IDFORNECEDOR INT,
IDFAMILIA INT,
QTDE INT,
PRIMARY KEY (IDPRODUTO),
foreign key(IDFAMILIA) references FAMILIA(IDFAMILIA)
ON DELETE CASCADE ON UPDATE CASCADE, 
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
 'LUIZA@GMAIL.COM'),
 (9,'MERCADO LIVRE','AV PAULISTA,1000', 23121212, 'SÃO PAULO',
 'MC@GMAIL.COM');
 
 INSERT INTO FAMILIA VALUES
(1,'Linha Branca'),
(2, 'Informática'),
(3,'diversos'),
(4,'linha carro');

INSERT INTO PRODUTO VALUES
(100,'FOGAO', 800.50, 'PC',2,1,10),
(110,'GELADEIRA', 2000.70, 'PC',2,1,30),
(150,'FOGAO COOKTOP', 1300.40, 'PC',3,1,24),
(160,'AR CONDICIONADO', 1800, 'PC',4,3,3),
(170,'IMPRESSORA', 2800, 'PC',2,2,5),
(161,'NOTEBOOK', 3400, 'PC',2,2,13),
(180,'ASPIRADOR DE PO', 256, 'PC',1,1,7),
(181,'TV', 3800, 'PC',1,3,3),
(190,'TV', 3900, 'PC',2,3,4);

# corrigindo o script
select produto.idproduto, produto.descricao, familia.idfamilia, familia.descricao
from produto inner join familia
on produto.idfamilia = familia.idfamilia;

# mostrar a descricao e o preco do produto e o nome do fornecedor
select produto.descricao, produto.preco, fornecedor.nome
from produto inner join fornecedor
on produto.idfornecedor = fornecedor.idfornecedor;

# com apelidos
select p.descricao, p.preco, f.nome
from produto as p inner join fornecedor f # pode colocar 'produto as p' ou simplesmente 'produto p'
on p.idfornecedor = f.idfornecedor;

# ligacao mostrando todos os produtos sem familia
select produto. idproduto, produto.descricao,
	familia.idfamilia, familia.descricao
from produto right join familia
on produto.idfamilia = familia.idfamilia;
# mostra todas as familias pois o comando deixa ela como 'mais importante'

select fornecedor.nome, fornecedor.idfornecedor,
		produto.descricao
from fornecedor left join produto
on fornecedor.idfornecedor = produto.idfornecedor;

# mostrar descricao do produto, o valor total (qtde*preco), qual o fornecedor que vende 
# ordenando por fornecedor
select p.descricao, (p.preco * p.qtde) as 'valor total',
		f.nome
from produto p inner join fornecedor f
on p.idfornecedor = f.idfornecedor
order by f.nome;

# repetir a execucao mostrar apenas quando o valor total maior que 10000
select p.descricao, (p.preco * p.qtde) as 'valor total',
		f.nome
from produto p inner join fornecedor f
on p.idfornecedor = f.idfornecedor
where (p.preco * p.qtde)>10000
order by f.nome;

# manipulacao de datas
select now(); # mostra a data e hora atual
select curdate(); # mostra a data corrente
select utc_timestamp(); # mostra data e hora de greenwich
select day(curdate());
select month(curdate());
select year(curdate());

select adddate(curdate(), interval 24 day); # mostra qual dia sera apos o intervalo
select datediff(curdate(), '2020-12-31'); # mostra quanto tempo falta ate essa data