---------------------------------------------------------------------
-- LAB 02
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Write a script to create a table to store the Competitor data.
---------------------------------------------------------------------
create table DirectMarketing.Competitors (
	CompetitorId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CompetitorName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    CompetitionBrand VARCHAR(50) NOT NULL,
	CompetitionStrength VARCHAR(100) NULL,
    );

---------------------------------------------------------------------
-- Task 2
-- 
-- Write a script to create a table to store the TVAdvertisement data.
---------------------------------------------------------------------

Create table DirectMarketing.TVAdvertisements(
    AdvertisementId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    AdvertisementName VARCHAR(50) NOT NULL,
    AdvertisementBrand VARCHAR(50) NOT NULL,
    ChannelName VARCHAR(50) NOT NULL,
    Cost MONEY NOT NULL,
    AdvertisementTime VARCHAR(50) NOT NULL,
	Date DateTimeOffset(7) NOT NULL,
    );

---------------------------------------------------------------------
-- Task 3
-- 
-- Write a script to create a table to store the CampaignResponse data.
---------------------------------------------------------------------

Create table DirectMarketing.CampaignResponses(
    CampaignId int NOT NULL PRIMARY KEY IDENTITY(1,1),
    CampaignName VARCHAR(50) NOT NULL,
	CampaignResponse VARCHAR(10) NOT NULL,
    CityOfCampaign VARCHAR(50) NOT NULL,
    StartDate DATETIMEOFFSET(7) NOT NULL,
    EndDate DATETIMEOFFSET(7) NOT NULL,
    NumberOfResponse int NOT NULL,
    CampaignLead VARCHAR(30) NOT NULL,
    InterestedTenant VARCHAR(50) NOT NULL,
    ConfirmTenant VARCHAR(50) NOT NULL,
    Invested MONEY NOT NULL,
    Profit MONEY NOT NULL,
    );

