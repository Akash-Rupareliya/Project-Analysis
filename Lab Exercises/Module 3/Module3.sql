USE MASTER
create database HumanResourseDb
alter database HumanResourseDb add filegroup FG0;
alter database HumanResourseDb add filegroup FG1;
alter database HumanResourseDb add filegroup FG2;
alter database HumanResourseDb add filegroup FG3;

use HumanResourseDb
CREATE PARTITION FUNCTION pfHumanResourcesDates(datetime) 
AS RANGE LEFT 
FOR VALUES ('2011-12-31 00:00:00.000');
GO

CREATE PARTITION SCHEME psHumanResources  
AS PARTITION pfHumanResourcesDates 
TO (FG0, FG1, FG2, FG3);
GO


ALTER DATABASE HumanResourseDb 
ADD FILE 
(
    NAME = HumanResourse0,
    FILENAME = 'D:\Microsoft Learning\20762\Allfiles\Labfiles\Lab03\Starter\HumanResourse0.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
TO FILEGROUP FG0;
ALTER DATABASE HumanResourseDb 
ADD FILE 
(
    NAME = HumanResourse1,
    FILENAME = 'D:\Microsoft Learning\20762\Allfiles\Labfiles\Lab03\Starter\HumanResourse1.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
TO FILEGROUP FG1;
ALTER DATABASE HumanResourseDb 
ADD FILE 
(
    NAME = HumanResourse2,
    FILENAME = 'D:\Microsoft Learning\20762\Allfiles\Labfiles\Lab03\Starter\HumanResourse2.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
TO FILEGROUP FG2;
ALTER DATABASE HumanResourseDb 
ADD FILE 
(
    NAME = HumanResourse3,
    FILENAME = 'D:\Microsoft Learning\20762\Allfiles\Labfiles\Lab03\Starter\HumanResourse3.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
TO FILEGROUP FG3;