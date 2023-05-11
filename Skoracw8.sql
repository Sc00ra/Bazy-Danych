--A)
USE AdventureWorks2022;

WITH dane_CTE(BusinessEntityID,Title,FirstName,MiddleName,Lastname,BirthDate,MaritalStatus,Gender,JobTitle,Rate)  
AS
(
SELECT hre.BusinessEntityID,Title,FirstName,MiddleName,Lastname,BirthDate,MaritalStatus,Gender,JobTitle,Rate
FROM HumanResources.EmployeePayHistory AS hre
JOIN Person.Person as pp ON hre.BusinessEntityID = pp.BusinessEntityID
JOIN HumanResources.Employee as em ON hre.BusinessEntityID = em.BusinessEntityID
)
SELECT * FROM dane_CTE
ORDER BY BusinessEntityID 

--B)
USE AdventureWorksLT2022

WITH revenue_CTE(Company,Revenue)
AS 
(
SELECT CompanyName+'('+FirstName+' '+LastName+')',TotalDue 
FROM SalesLT.Customer AS sc
JOIN SalesLT.SalesOrderHeader AS soh on soh.CustomerID= sc.CustomerID
)
SELECT * FROM revenue_CTE
ORDER BY Company

--C)
USE AdventureWorksLT2022

WITH category_CTE(Category,SalesValue)
AS 
(
SELECT pc.Name ,SUM(UnitPrice)
FROM SalesLT.ProductCategory AS pc
JOIN SalesLT.Product as pr on pc.ProductCategoryID = pr.ProductCategoryID
JOIN SalesLT.SalesOrderDetail AS sod on sod.ProductID = pr.ProductID
GROUP BY pc.Name
)
SELECT * FROM category_CTE








