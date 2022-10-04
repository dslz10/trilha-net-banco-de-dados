--SELECT * FROM Clientes order by nome, sobrenome

--SELECT Nome, Sobrenome, Email FROM Clientes order by nome

--SELECT * FROM Clientes where Nome =  'Adam' AND Sobrenome = 'reynolds' order by Nome, Sobrenome desc

--SELECT * FROM Clientes where Nome =  'Adam' or Sobrenome = 'reynolds' order by Nome, Sobrenome desc

--SELECT * FROM Clientes WHERE AceitaComunicados = 1 ORDER BY Nome, Sobrenome

--SELECT * FROM Clientes WHERE Nome LIKE'G%'

--SELECT * FROM Clientes WHERE Nome LIKE'di%'

--INSERT INTO Clientes(Nome, Sobrenome, Email, AceitaComunicados, DataCadastro) VALUES ('Diego', 'Selzzo', 'diegoselzzo@gmail.com', 1, GETDATE())


--SELECT * FROM Clientes WHERE Nome ='DIEGO'


--BEGIN TRAN
--ROLLBACK


--UPDATE Clientes SET Email = 'DI.COM' WHERE Sobrenome = 'SELZZO' 



--DELETE Clientes WHERE Id = 1001


--CREATE TABLE Produtos(
--	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
--	Nome varchar(255) NOT NULL,
--	Cor varchar(50) NULL,
--	Preco decimal(13, 2) NOT NULL,
--	Tamanho varchar(5) NULL,
--	Genero char(1) NULL
--)

--SELECT COUNT(*) FROM Produtos WHERE Nome LIKE 'Mountain Bike Socks%'

--SELECT * FROM Produtos WHERE Nome LIKE 'Mountain Bike Socks%'
--SELECT * FROM Produtos

--SELECT SUM(Preco) FROM Produtos

--SELECT SUM(Preco) PRECO_TOTAL_TAMANHO_M FROM Produtos WHERE Tamanho = 'M'


--SELECT MAX(Preco) FROM Produtos WHERE Tamanho ='M'

--SELECT MIN (Preco) PRODUTO_MAIS_BARATO FROM Produtos WHERE Tamanho ='M'

--SELECT AVG (Preco) MEDIA FROM Produtos WHERE Tamanho ='M'

--SELECT AVG (Preco) MEDIA FROM Produtos

--SELECT Nome + ' '+Cor+' - '+Genero NOME_COMPLETO,
--UPPER(Nome),
--Cor
--FROM Produtos

--SELECT Nome + ' '+Cor+' - '+Genero NOME_COMPLETO,
--lower(Nome),
--Cor
--FROM Produtos

--SELECT * FROM Produtos

--ALTER TABLE Produtos ADD DataCadastro DATETIME2

--UPDATE Produtos SET DataCadastro = GETDATE()

--ALTER TABLE Produtos DROP COLUMN DataCadastro

--SELECT Nome + ' '+Cor+' - '+Genero NOME_COMPLETO,
--	UPPER(Nome) Nome,
--	LOWER(Cor) Cor,
--	FORMAT(DataCadastro, 'dd/MM/yy hh:mm') Data
--FROM Produtos

--SELECT Tamanho, COUNT(*) Quantidade
--FROM Produtos WHERE Tamanho <>''
--GROUP BY Tamanho
--ORDER BY Quantidade DESC

--CREATE TABLE Enderecos(
--	Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	IdCliente INT NULL,
--	Rua varchar(255) NULL,
--	Bairro varchar(255) NULL,
--	Cidade varchar(255) NULL,
--	Estado char(2) NULL

--	CONSTRAINT Fk_Enderecos_Clientes FOREIGN KEY(IdCliente)
--	REFERENCES Clientes(Id)
--)





--INSERT INTO Enderecos Values (4, 'Rua teste', 'Bairro Teste', 'Cidade Teste', 'sp')

--SELECT * FROM Enderecos E, Clientes C WHERE C.Id = E.IdCliente AND c.Id = 4

--SELECT * FROM
--	Clientes
--	INNER JOIN Enderecos ON Clientes.Id = Enderecos.IdCliente
--	WHERE Clientes.Id = 4






--SELECT * FROM Clientes

--SELECT * FROM Enderecos



--ALTER TABLE Produtos
--ADD UNIQUE(Nome)



--ALTER TABLE Produtos
-- ADD CONSTRAINT CHK_ColunaGenero CHECK(Genero ='U' OR Genero ='M' OR Genero ='F')


-- ALTER TABLE Produtos
-- ADD DEFAULT GETDATE() FOR DataCadastro
 
 
 
-- ALTER TABLE Produtos
-- DROP CONSTRAINT UQ__Produtos__7D8FE3B209BA1583



 CREATE PROCEDURE InserirNovoProduto 
 @Nome varchar(255),
 @cor varchar(50),
 @Preco decimal,
 @Tamanho varchar(5),
 @Genero char(1)
 
 AS
 
 INSERT INTO Produtos (Nome, Cor, Preco, Tamanho, Genero)
 VALUES (@Nome, @cor, @Preco, @Tamanho, @Genero)


 EXECUTE InserirNovoProduto 'LATA', 'LARANAJA', 13, G, 'U'


 SELECT * FROM PRODUTOS WHERE Tamanho ='M'



 CREATE PROCEDURE ObterProdutosTamanho
 @Tamanho VARCHAR(5)

 AS

  SELECT * FROM PRODUTOS WHERE Tamanho = @Tamanho




  EXECUTE ObterProdutosTamanho 'G'



  SELECT 
	Nome,
	Preco,
	FORMAT (Preco - Preco /100 *10, 'N2') PrecoDesconto
  FROM PRODUTOS WHERE Tamanho = 'M'

 SELECT 
  	Nome,
	Preco,
	Tamanho,
	dbo.DescontoCalcula(Preco, 10) PrecoDesconto
  FROM PRODUTOS WHERE Tamanho = 'Gg'




  CREATE FUNCTION  DescontoCalcula (@Preco DECIMAL(13, 2), @Porcentagem INT)
  RETURNS DECIMAL (13,2)

  BEGIN
	RETURN @Preco - @Preco /100 * @Porcentagem
  END