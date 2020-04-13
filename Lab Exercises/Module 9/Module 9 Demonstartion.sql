USE AdventureWorks;

EXEC sp_configure;

exec xp_dirtree 'd:\20762\Allfiles\Demofiles\Microsoft Learnings\DemoFiles\Mod09',0,1;
set nocount off
select * from sys.sql_expression_dependencies

select * from sys.procedures

create proc Production.spGetBlueProducts
AS
SET NOCOUNT ON;
BEGIN
SELECT p.ProductID,p.Name,p.Size,p.ListPrice FROM Production.Product 
AS p
WHERE p.Color = N'Blue'
ORDER BY p.ProductID;
END;

exec Production.spGetBlueProducts


create PROC Production.spGetBlueProductsAndModels
AS
SET NOCOUNT ON;
BEGIN
SELECT p.ProductID,p.Name,p.Size,p.ListPrice FROM Production.Product
AS p
WHERE p.Color = 'Blue'
ORDER BY p.ProductID;
  
SELECT p.ProductID,pm.ProductModelID,pm.Name AS ModelName FROM Production.Product AS p
INNER JOIN Production.ProductModel AS pm
ON p.ProductModelID = pm.ProductModelID
where p.Color='Blue'
ORDER BY p.ProductID, pm.ProductModelID;
END;

exec Production.spGetBlueProductsAndModels

select * from sys.procedures
