USE AdventureWorks2016;

CREATE VIEW Production.vOnlineProducts
AS
SELECT p.ProductID, p.Name, p.ProductNumber AS [Product Number], COALESCE(p.Color, 'N/A') AS [Color Name],
CASE p.DaysToManufacture
WHEN 0 THEN 'In stock' 
WHEN 1 THEN 'Overnight'
WHEN 2 THEN '2 to 3 days delivery'
ELSE 'Call us for a quote'
END AS Availability,
p.Size, p.SizeUnitMeasureCode AS [Unit of Measure], p.ListPrice AS Price, p.Weight
FROM Production.Product AS p
WHERE p.SellEndDate IS NULL AND p.SellStartDate IS NOT NULL;

select * from Production.vOnlineProducts


CREATE VIEW Production.vAvailableModels
AS
SELECT pr.ProductID AS [Product Id], pr.Name, pm.ProductModelID AS [Product Model Id], pm.Name as [Product Model Name]
FROM Production.Product AS pr
INNER JOIN Production.ProductModel AS pm
ON pr.ProductModelID = pm.ProductModelID
WHERE pr.SellEndDate IS NULL
AND pr.SellStartDate IS NOT NULL;

select * from Production.vAvailableModels

create view Sales.vNewCustomer as select CustomerID, FirstName, LastName from Sales.CustomerPII; 
select * from Sales.vNewCustomer

select * from Sales.vNewCustomer order by CustomerID

INSERT INTO Sales.vNewCustomer VALUES (10001,'Akash', 'Rupareliya'), (10002, 'Hiren', 'Sojitra'); 