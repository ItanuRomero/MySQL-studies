/* cria novo banco */
CREATE DATABASE IF NOT EXISTS teste01;
/* usando o banco que criamos */
USE teste01;
/* mostra databases criados */
SHOW DATABASES;
/* cria nova tabela caso a mesma nao exista*/
CREATE TABLE IF NOT EXISTS fornecedor (
IDFORNECEDOR INT AUTO_INCREMENT,
NOME VARCHAR(45),
ENDERECO VARCHAR(45),
TELEFONE INT,
CIDADE VARCHAR(20) DEFAULT 'SAO PAULO',
EMAIL VARCHAR(25) UNIQUE,
PRIMARY KEY (IDFORNECEDOR)
);

/* mostra tabelas criadas */
SHOW TABLES;

CREATE TABLE IF NOT EXISTS PRODUTO (
IDPRODUTO INT NOT NULL,
DESCRICAO VARCHAR(45),
PRECO DECIMAL(7, 2),
UNIDADE VARCHAR(10),
IDFORNECEDOR INT NOT NULL,
PRIMARY KEY (IDPRODUTO),
FOREIGN KEY (IDFORNECEDOR) REFERENCES FORNECEDOR(IDFORNECEDOR)
);

SHOW TABLES;

/* eliminar banco de dados */
/* DROP DATABASE EXEMPLO -- CUIDADO!! */

/* inserir dados de fornecedor */
INSERT INTO FORNECEDOR VALUES (
1, 'PAPEL RECICLADO', 'RUA BRASIL, 100', 4441212, 'BRAGANCA PAULISTA', 'RECI@MAIL'
);

INSERT INTO FORNECEDOR VALUES (
IDFORNECEDOR, 'CASA BAHIA', 'RUA DO MERCADO, 200', 40338787, 'BRAGANCA PAULISTA', 'CASABAHIA@GMAIL.COM'
),
(IDFORNECEDOR, 'LOJA CEM', 'RUA DO COMERCIO, 2800', 457888776, 'ATIBAIA', 'LOJACEM@GMAIL.COM'),
(IDFORNECEDOR, 'MAGAZINE LUIZA', 'RUA DAS ALEGRIAS, 9000', 87654393, 'ATIBAIA', 'MAGAZINELUIZA@GMAIL.COM');
SELECT * FROM FORNECEDOR; /* seleciona todas as tabelas disponiveis */

INSERT INTO PRODUTO VALUES (
100, 'FOGAO', 800.50, 'PC', 2),
(110, 'GELADEIRA', 200.70, 'PC', 1),
(150, 'FOGAO COOKTOP', 1340.78, 3),
(160, 'AR CONDICIONADO', 1800, 'PC', 4);

SELECT * FROM PRODUTO;
/* atencao para os possiveis erros: */
/* duplicidade */
/*
INSERT INTO FORNECEDOR VALUES (
1, 'TESTE', 'RUA 1', 12121212, 'ATIBAIA', 'TESTE@GMAIL.COM'
); 
-- TODOS OS DADOS DIFERENTES, POREM O FORNECEDOR COM ID 1 JA EXISTE!
* CORRIGINDO *
INSERT INTO FORNECEDOR VALUES (
IDFORNECEDOR, 'TESTE', 'RUA 1', 12121212, 'ATIBAIA', 'TESTE@GMAIL.COM'
); 
-- ADCIONANDO UM ID AUTOMATICO
*/
/* tipo de dado incorreto */
/*
INSERT INTO FORNECEDOR VALUES
('A', 'TESTE', 'RUA 1', 12121212, 'ATIBAIA', 'TESTE@GMAIL.COM' );
O ID EH UM TIPO INTEIRO, SE TENTARMOS COLOCAR UM CHAR O ERRO OCORRE.
*/
/* quantidade de colunas inconsistentes */
/*
INSERT INTO FORNECEDOR VALUES (
IDFORNECEDOR, 'ERRO', 'RUA ERRO', 'ATIBAIA', 'ERRO@GMAIL.COM'
); NAO TEMOS O VALOR DE TELEFONE POR EXEMPLO.
*/
/* DADO EXCEDE O TAMANHO DEFINIDO */
/*
INSERT INTO FORNECEDOR VALUES (
IDFORNECEDOR, 'ERRO', 'RUA ERRO', 87878787, 'ATIBAIA - SAO PAULO - BRASIL - MUNDO - UNIVERSO', 'ERRO@GMAIL.COM'
); TEMOS MAIS CARACTERES DO QUE OS DEFINIDOS EM 'CIDADE'
*/

/* erro chave estrangeira */
/*
INSERT INTO PRODUTO VALUES (
170, 'PANELA ELETRICA', 200.45, 'PC', 9
);
NAO TEMOS O FORNECEDOR 9
*/

/* PODEMOS COLOCAR CONDICOES PARA O COMANDO SELECT*/
SELECT * FROM PRODUTO WHERE IDFORNECEDOR=2; /* SELECIONE (ALGO) ONDE (CONDICAO) */
SELECT * FROM PRODUTO WHERE IDPRODUTO>110;
SELECT * FROM FORNECEDOR WHERE IDFORNECEDOR<>3; /* <> SIGNIFICA DIFERENTE EM SQL */

/* mostra a estrutura da tabela criada */
DESC FORNECEDOR;

/* alterar estrutura de tabela  */
ALTER TABLE FORNECEDOR	/* ALTERANDO DO FORNECEDOR */
ADD COLUMN VALIDADE DATE,	/* ADICIONA UMA COLUNA */
DROP COLUMN EMAIL;	/* DELETA A COLUNA */

/* exercicio da aula */
CREATE TABLE IF NOT EXISTS CLIENTE (
IDCLIENTE INT AUTO_INCREMENT NOT NULL,
NOME VARCHAR(50),
ENDERECO VARCHAR(200),
SEXO ENUM('FEMININO', 'MASCULINO', 'NAO BINARIO'),
CIDADE VARCHAR(30),
CNPJ VARCHAR(11) UNIQUE
);

/*		MINHAS CONCLUSOES SOBRE AS RELACOES SEGUINTES
auto increment e null:
contrarios, ja que se ele for autoincremental, nao sera nulo

auto increment e vazio:
defeituoso pois um valor nao informado pode dar erro como visto acima

auto increment e preencimento:
executam a mesma funcao porem um automaticamente e o outro manualmente

default e null:
se algo tem um valor padrao nao pode ser nulo, a nao ser que o valor padrao seja nulo

default e vazio:
complementares pois se algo for vazio ele recebe um valor padrao ou default

default e preenchimento diferente do default:
normal, pois sempre que fazemos um preenchimento que nao o default nenhum erro acontece

unique e valor repetido:
impossivel, se caso algum campo recebe o valor unique ele nao pode se repetir

** falta de acentos causados por teclado em outro idioma, me desculpe **
*/