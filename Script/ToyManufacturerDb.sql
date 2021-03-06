USE [master]
GO
/****** Object:  Database [ToyManufacturerDb]    Script Date: 27-03-2020 11:50:16 ******/
CREATE DATABASE [ToyManufacturerDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToyManufacturerDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ToyManufacturerDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToyManufacturerDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ToyManufacturerDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ToyManufacturerDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToyManufacturerDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToyManufacturerDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToyManufacturerDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToyManufacturerDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToyManufacturerDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToyManufacturerDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET RECOVERY FULL 
GO
ALTER DATABASE [ToyManufacturerDb] SET  MULTI_USER 
GO
ALTER DATABASE [ToyManufacturerDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToyManufacturerDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToyManufacturerDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToyManufacturerDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToyManufacturerDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ToyManufacturerDb', N'ON'
GO
ALTER DATABASE [ToyManufacturerDb] SET QUERY_STORE = OFF
GO
USE [ToyManufacturerDb]
GO
/****** Object:  Table [dbo].[Toys]    Script Date: 27-03-2020 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Toys](
	[ToyId] [int] IDENTITY(1,1) NOT NULL,
	[ToyName] [varchar](50) NOT NULL,
	[ToyPrice] [int] NOT NULL,
	[ToyDetail] [varchar](100) NOT NULL,
	[PlantId] [int] NOT NULL,
 CONSTRAINT [PK_Toys] PRIMARY KEY CLUSTERED 
(
	[ToyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 27-03-2020 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerEmail] [varchar](50) NOT NULL,
	[CustomerMobileNumber] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 27-03-2020 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressLocation] [varchar](200) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Pincode] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderInvoice]    Script Date: 27-03-2020 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInvoice](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ToyId] [int] NOT NULL,
	[OrderDetailDate] [date] NOT NULL,
	[OfferId] [int] NOT NULL,
	[FinalPrice] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 27-03-2020 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[OfferId] [int] IDENTITY(1,1) NOT NULL,
	[MinAmount] [int] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[OfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27-03-2020 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vOrderDetails]    Script Date: 27-03-2020 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vOrderDetails]
AS
SELECT dbo.Toys.ToyName, dbo.OrderInvoice.OrderDetailDate, dbo.OrderInvoice.FinalPrice, dbo.Customers.CustomerName, dbo.Customers.CustomerEmail, dbo.Customers.CustomerMobileNumber, 
                  dbo.Addresses.AddressLocation, dbo.Addresses.City, dbo.Addresses.Pincode, dbo.OrderInvoice.OfferId, dbo.OrderInvoice.OrderDetailId
FROM     dbo.OrderInvoice INNER JOIN
                  dbo.Offers ON dbo.OrderInvoice.OfferId = dbo.Offers.OfferId INNER JOIN
                  dbo.Toys ON dbo.OrderInvoice.ToyId = dbo.Toys.ToyId INNER JOIN
                  dbo.Orders ON dbo.OrderInvoice.OrderId = dbo.Orders.OrderId INNER JOIN
                  dbo.Addresses INNER JOIN
                  dbo.Customers ON dbo.Addresses.CustomerId = dbo.Customers.CustomerId ON dbo.Orders.CustomerId = dbo.Customers.CustomerId
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 27-03-2020 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[PlantId] [int] IDENTITY(1,1) NOT NULL,
	[PlantName] [varchar](50) NOT NULL,
	[PlantAddress] [varchar](150) NOT NULL,
	[PlantMobileNumber] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Plants] PRIMARY KEY CLUSTERED 
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderInvoice] ADD  CONSTRAINT [DF_OrderInvoice_OrderDetailDate]  DEFAULT (getdate()) FOR [OrderDetailDate]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Customers]
GO
ALTER TABLE [dbo].[OrderInvoice]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderInvoice] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderInvoice]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Toys] FOREIGN KEY([ToyId])
REFERENCES [dbo].[Toys] ([ToyId])
GO
ALTER TABLE [dbo].[OrderInvoice] CHECK CONSTRAINT [FK_OrderDetails_Toys]
GO
ALTER TABLE [dbo].[OrderInvoice]  WITH CHECK ADD  CONSTRAINT [FK_OrderInvoice_Offers] FOREIGN KEY([OfferId])
REFERENCES [dbo].[Offers] ([OfferId])
GO
ALTER TABLE [dbo].[OrderInvoice] CHECK CONSTRAINT [FK_OrderInvoice_Offers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Addresses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Toys]  WITH CHECK ADD  CONSTRAINT [FK_Toys_Plants] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plants] ([PlantId])
GO
ALTER TABLE [dbo].[Toys] CHECK CONSTRAINT [FK_Toys_Plants]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Addresses"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 7
               Left = 301
               Bottom = 170
               Right = 560
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Offers"
            Begin Extent = 
               Top = 7
               Left = 608
               Bottom = 148
               Right = 802
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderInvoice"
            Begin Extent = 
               Top = 7
               Left = 850
               Bottom = 170
               Right = 1055
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Toys"
            Begin Extent = 
               Top = 7
               Left = 1103
               Bottom = 170
               Right = 1297
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 165
               Left = 608
               Bottom = 284
               Right = 802
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Ali' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'as = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrderDetails'
GO
USE [master]
GO
ALTER DATABASE [ToyManufacturerDb] SET  READ_WRITE 
GO
