use MarketDev
--exercise 1
create procedure Reports.spGetProductColors
AS
SET NOCOUNT ON;
BEGIN
	SELECT DISTINCT p.Color FROM Marketing.Product AS p
	WHERE p.Color IS NOT NULL
	ORDER BY p.Color;
END

exec Reports.spGetProductColors

CREATE PROCEDURE Reports.spGetProductsAndModels
AS
SET NOCOUNT ON;
BEGIN
	SELECT p.ProductID,p.ProductName,p.ProductNumber,p.SellStartDate,p.SellEndDate,p.Color,pm.ProductModelID,
		   COALESCE(ed.Description,id.Description,p.ProductName) AS EnglishDescription,
		   COALESCE(fd.Description,id.Description,p.ProductName) AS FrenchDescription,
		   COALESCE(cd.Description,id.Description,p.ProductName) AS ChineseDescription
	FROM Marketing.Product AS p
	LEFT OUTER JOIN Marketing.ProductModel AS pm
	ON p.ProductModelID = pm.ProductModelID
	LEFT OUTER JOIN Marketing.ProductDescription AS ed
	ON pm.ProductModelID = ed.ProductModelID 
	AND ed.LanguageID = 'en'
	LEFT OUTER JOIN Marketing.ProductDescription AS fd
	ON pm.ProductModelID = fd.ProductModelID 
	AND fd.LanguageID = 'fr'
	LEFT OUTER JOIN Marketing.ProductDescription AS cd
	ON pm.ProductModelID = cd.ProductModelID 
	AND cd.LanguageID = 'zh-cht'
	LEFT OUTER JOIN Marketing.ProductDescription AS id
	ON pm.ProductModelID = id.ProductModelID 
	AND id.LanguageID = ''
	ORDER BY p.ProductID,pm.ProductModelID;
END
exec Reports.spGetProductsAndModels

-- exercise 2
CREATE PROCEDURE Marketing.spGetProductsByColor
@Color nvarchar(16)
AS
SET NOCOUNT ON;
BEGIN
SELECT p.ProductID,p.ProductName,p.ListPrice AS Price,p.Color,p.Size,p.SizeUnitMeasureCode AS UnitOfMeasure	FROM Marketing.Product AS p
WHERE (p.Color = @Color) OR (p.Color IS NULL AND @Color IS NULL)
ORDER BY ProductName;
END

exec Marketing.spGetProductsByColor 'Black';

exec Marketing.spGetProductsByColor NULL

alter PROCEDURE Reports.spGetProductsAndModels
with execute as owner
AS
SET NOCOUNT ON;
BEGIN
	SELECT p.ProductID,p.ProductName,p.ProductNumber,p.SellStartDate,p.SellEndDate,p.Color,pm.ProductModelID,
		   COALESCE(ed.Description,id.Description,p.ProductName) AS EnglishDescription,
		   COALESCE(fd.Description,id.Description,p.ProductName) AS FrenchDescription,
		   COALESCE(cd.Description,id.Description,p.ProductName) AS ChineseDescription
	FROM Marketing.Product AS p
	LEFT OUTER JOIN Marketing.ProductModel AS pm
	ON p.ProductModelID = pm.ProductModelID
	LEFT OUTER JOIN Marketing.ProductDescription AS ed
	ON pm.ProductModelID = ed.ProductModelID 
	AND ed.LanguageID = 'en'
	LEFT OUTER JOIN Marketing.ProductDescription AS fd
	ON pm.ProductModelID = fd.ProductModelID 
	AND fd.LanguageID = 'fr'
	LEFT OUTER JOIN Marketing.ProductDescription AS cd
	ON pm.ProductModelID = cd.ProductModelID 
	AND cd.LanguageID = 'zh-cht'
	LEFT OUTER JOIN Marketing.ProductDescription AS id
	ON pm.ProductModelID = id.ProductModelID 
	AND id.LanguageID = ''
	ORDER BY p.ProductID,pm.ProductModelID;
END


ALTER PROCEDURE Marketing.spGetProductsByColor
@Color nvarchar(16)
WITH EXECUTE AS OWNER
AS
SET NOCOUNT ON;
BEGIN
	SELECT p.ProductID,
	p.ProductName,
	p.ListPrice AS Price,
	p.Color,
	p.Size,
	p.SizeUnitMeasureCode AS UnitOfMeasure
	FROM Marketing.Product AS p
	WHERE (p.Color = @Color) OR (p.Color IS NULL AND @Color IS NULL)
	ORDER BY ProductName;
END