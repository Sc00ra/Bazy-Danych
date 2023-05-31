--1.Fibonacci(tylko liczba)
CREATE OR ALTER FUNCTION fib(@i BIGINT)
RETURNS @wynik TABLE(Numer BIGINT,Fibonacci BIGINT)
AS
BEGIN
	DECLARE
	@i0 BIGINT	= 0,
	@i1 BIGINT  = 1,
	@id1 BIGINT = 1,
	@id2 BIGINT = 2,
	@rep BIGINT = 0,
	@tmp BIGINT
	INSERT INTO @wynik VALUES(@id1,@i0),(@id2,@i1)
	WHILE(@rep < @i-2)
	BEGIN
	INSERT INTO @WYNIK VALUES(@id2+1,@i1+@i0)
		SET @tmp = @i1
		SET @i1 = @i1 + @i0
		SET @i0 = @tmp
		SET @rep += 1
		SET @id2 +=1
	END	
	RETURN 
END;
--Procedura wywo³ania(dla 1)
CREATE OR ALTER PROCEDURE fibo(@n BIGINT)
AS
BEGIN
SELECT * FROM fib(@n)
WHERE fib.Numer = @n
END;
--exec
EXEC fibo 50;
--Fibonacci(ca³y ci¹g)
CREATE OR ALTER FUNCTION fib(@i BIGINT)
RETURNS @wynik TABLE(Numer BIGINT)
AS
BEGIN
	DECLARE
	@i0 BIGINT	 = 0,
	@i1 BIGINT	 = 1,
	@rep BIGINT = 0,
	@tmp BIGINT
	INSERT INTO @wynik VALUES(@i0),(@i1)
	WHILE(@rep < @i-2)
	BEGIN
	INSERT INTO @WYNIK VALUES(@i1+@i0)
		SET @tmp = @i1
		SET @i1 = @i1 + @i0
		SET @i0 = @tmp
		SET @rep += 1
	END	
	RETURN 
END;
--Procedura wywo³ania(dla 2)
CREATE OR ALTER PROCEDURE fibo(@n BIGINT)
AS
BEGIN
SELECT * FROM fib(@n)
END;
--exec
EXEC fibo 93;


--2.
USE AdventureWorks2022
Select * from Person.Person
select * from person.BusinessEntity
CREATE OR ALTER TRIGGER tr1
	ON person.person 
	AFTER INSERT 
	AS 
		BEGIN
			UPDATE Person.Person  
			SET Person.LastName = UPPER(Person.LastName)
		END;

INSERT INTO  Person.BusinessEntity (rowguid) VALUES (NEWID());
INSERT INTO Person.Person(BusinessEntityID,PersonType,NameStyle,FirstName,MiddleName,LastName,EmailPromotion,ModifiedDate) VALUES (20778,'IN',0,'Bartosz','Mikolaj','Skora',2,2009-01-07);

--3.
CREATE TRIGGER taxRateMonitoring
	ON Sales.SalesTaxRate
	AFTER UPDATE
	AS
		BEGIN
			DECLARE @NewTaxRate int, @TaxRate int
			SELECT @NewTaxRate = TaxRate FROM inserted
			SELECT @TaxRate = TaxRate FROM deleted
			IF @NewTaxRate > 1.3* @TaxRate
			PRINT 'ZA DU¯O'
			END

SELECT * FROM Sales.SalesTaxRate;



UPDATE Sales.SalesTaxRate 
SET TaxRate =  76.00
WHERE SalesTaxRateID = 23;