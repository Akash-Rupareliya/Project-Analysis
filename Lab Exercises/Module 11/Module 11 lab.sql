use AdventureWorks

CREATE TABLE Production.ProductAudit(
ProductID int NOT NULL,
UpdateTime datetime2(7) NOT NULL,
ModifyingUser nvarchar(100) NOT NULL,
OriginalListPrice money NULL,
NewListPrice money NULL
)


UPDATE Production.Product
SET ListPrice=3978.00
WHERE ProductID BETWEEN 749 and 753;

SELECT * FROM Production.Product


CREATE TRIGGER Production.trProductListPrice_Update ON Production.Product AFTER UPDATE
AS BEGIN SET NOCOUNT ON;
	INSERT Production.ProductAudit(ProductID, UpdateTime, ModifyingUser, OriginalListPrice,NewListPrice)
	SELECT Inserted.ProductID,SYSDATETIME(),ORIGINAL_LOGIN(),deleted.ListPrice, inserted.ListPrice
	FROM deleted INNER JOIN inserted ON deleted.ProductID = inserted.ProductID WHERE deleted.ListPrice > 1000 OR inserted.ListPrice > 1000;
END;

UPDATE Production.Product SET ListPrice=3975.00 WHERE ProductID BETWEEN 749 and 753;

--check old price and new price
SELECT * FROM Production.ProductAudit


-- EXCERCISE 2

use MarketDev

ALTER TRIGGER Marketing.TR_CampaignBalance_Update ON Marketing.CampaignBalance 
AFTER UPDATE AS 
BEGIN
SET NOCOUNT ON; 
INSERT Marketing.CampaignAudit  (AuditTime, ModifyingUser, RemainingBalance)
SELECT SYSDATETIME(), ORIGINAL_LOGIN(),inserted.RemainingBalance 
FROM deleted INNER JOIN inserted ON deleted.CampaignID = inserted.CampaignID  
WHERE ABS(deleted.RemainingBalance  - inserted.RemainingBalance) > 10000; 
END; 

DELETE FROM Marketing.CampaignAudit; 

SELECT * FROM Marketing.CampaignBalance; 
EXEC Marketing.MoveCampaignBalance 3,2,10100; 
EXEC Marketing.MoveCampaignBalance 3,2,1010; 
SELECT * FROM Marketing.CampaignAudit;