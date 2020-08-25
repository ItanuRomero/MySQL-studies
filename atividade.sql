CREATE DATABASE 24Agosto;
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

CREATE TABLE IF NOT EXISTS FAMILIA (
IDFAMILIA INT AUTO_INCREMENT NOT NULL,
DESCRICAO VARCHAR(45),
PRIMARY KEY (IDFAMILIA)
);

CREATE TABLE IF NOT EXISTS PRODUTO (
IDPRODUTO INT NOT NULL,
DESCRICAO VARCHAR(45),
PRECO DECIMAL(7,2),
UNIDADE VARCHAR(10),
IDFORNECEDOR INT NOT NULL,
PRIMARY KEY (IDPRODUTO),
foreign key (IDFORNECEDOR) references FORNECEDOR(IDFORNECEDOR),
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

INSERT INTO produto VALUES 
(100,'FOGAO',800.50,'PC',2),
(110,'GELADEIRA',2000.70,'PC',2),
(150,'FOGAO COOKTOP',1330.40,'PC',3),
(160,'AR CONDICIONADO',1800,'PC',4),
(161, 'NOTEBOOK', 2499.00, 'PC', 2),
(170, 'IMPRESSORA', 2800.00, 'PC', 2),
(180, 'ASPIRADOR DE PO', 256.00, 'PC', 1),
(181, 'TV', 3800.00, 'PC', 1),
(190, 'TV', 3900.00, 'PC', 2);

INSERT INTO FAMILIA VALUES
(1, 'LINHA BRANCA'),
(2, 'INFORMATICA');

ALTER TABLE PRODUTO
(ADD COLUMN IDFAMILIA INT NOT NULL),
(ADD COLUMN QUANTIDADE INT),
ADD FOREIGN KEY (IDFAMILIA) REFERENCES FAMILIA(IDFAMILIA),
ON DELETE CASCADE ON UPDATE CASCADE;

UPDATE PRODUTO
SET IDFAMILIA=1, QUANTIDADE=8
WHERE IDPRODUTO=100;

UPDATE PRODUTO
SET IDFAMILIA=1, QUANTIDADE=17
WHERE IDPRODUTO=110;

UPDATE PRODUTO
SET IDFAMILIA=1, QUANTIDADE=10
WHERE IDPRODUTO=150;

UPDATE PRODUTO
SET IDFAMILIA=2, QUANTIDADE=12
WHERE IDPRODUTO=160;

UPDATE PRODUTO
SET IDFAMILIA=2, QUANTIDADE=12
WHERE IDPRODUTO=161;

UPDATE PRODUTO
SET IDFAMILIA=2, QUANTIDADE=12
WHERE IDPRODUTO=170;

UPDATE PRODUTO
SET IDFAMILIA=2, QUANTIDADE=12
WHERE IDPRODUTO=180;

UPDATE PRODUTO
SET IDFAMILIA=2, QUANTIDADE=12
WHERE IDPRODUTO=181;

UPDATE PRODUTO
SET IDFAMILIA=2, QUANTIDADE=12
WHERE IDPRODUTO=190;