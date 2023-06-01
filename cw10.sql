--1
SELECT * FROM Production.Product

BEGIN TRANSACTION TRAN1
UPDATE Production.Product SET ListPrice = ListPrice*1.1 WHERE ProductID = 680
COMMIT TRANSACTION 

--2
BEGIN TRANSACTION TRAN2
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
DELETE FROM Production.Product WHERE ProductID=708
ROLLBACK TRANSACTION

--3

BEGIN TRANSACTION TRAN3
SET IDENTITY_INSERT Production.Product ON
INSERT INTO Production.Product (ProductID,Name,ProductNumber,MakeFlag,FinishedGoodsFlag,SafetyStockLevel,ReorderPoint,StandardCost,ListPrice,DaysToManufacture,SellStartDate,rowguid,ModifiedDate)
VALUES (1001,'bajkS','PP-2223',1,1,100,75,300.21312,600,9,'2013-05-30 00:00:00.000','AE638923-2B67-4679-B90E-ABBAB12DCA32','2014-02-08 10:01:36.827')
SET IDENTITY_INSERT Production.Product OFF
COMMIT TRANSACTION TRAN3

--4
BEGIN TRANSACTION TRAN4
UPDATE Production.Product SET StandardCost = StandardCost * 1.1
IF(SELECT SUM(StandardCost) FROM Production.Product) <=50000
	COMMIT TRANSACTION TRAN4
ELSE
	ROLLBACK TRANSACTION
	
--5
BEGIN TRANSACTION TRAN5
SET IDENTITY_INSERT Production.Product ON
DECLARE 
@productnumber nvarchar(25) = 'ssss'
IF EXISTS (SELECT * FROM Production.Product WHERE ProductNumber = @productnumber)
	ROLLBACK TRANSACTION 
ELSE
	BEGIN
	INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, rowguid, ModifiedDate) VALUES (1001,'bajki',@productnumber,1,1,1000,375,0.00,25.25,2,'2008-04-30 00:00:00.000','694215B7-08F7-4C0D-ACB1-D732BA44C0C8','2008-04-30 00:00:00.000')
	COMMIT TRANSACTION
	END
SET IDENTITY_INSERT Production.Product OFF

SELECT * FROM Production.Product

--6
SELECT * FROM  Sales.SalesOrderDetail

BEGIN TRANSACTION TRAN6
IF EXISTS (SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty = 0) 
	ROLLBACK TRANSACTION
ELSE 
	BEGIN
	UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty - 1
	COMMIT TRANSACTION TRAN6
	END

UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty + 1

--7
select * from Production.Product

BEGIN TRANSACTION TRAN7
DECLARE
	@sr INT = (SELECT AVG(ListPrice) FROM Production.Product),
	@tmp1 INT = (SELECT COUNT(*) FROM Production.Product)
DELETE FROM Production.Product WHERE StandardCost> @sr
DECLARE
@tmp2 INT = (SELECT COUNT(*) FROM Production.Product)

IF @tmp1 - 10 < @tmp2
	ROLLBACK TRANSACTION
ELSE
	COMMIT TRANSACTION
