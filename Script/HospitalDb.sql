USE [master]
GO
/****** Object:  Database [HospitalDb]    Script Date: 26-03-2020 14:19:24 ******/
CREATE DATABASE [HospitalDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HospitalDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HospitalDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HospitalDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalDb] SET RECOVERY FULL 
GO
ALTER DATABASE [HospitalDb] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HospitalDb', N'ON'
GO
ALTER DATABASE [HospitalDb] SET QUERY_STORE = OFF
GO
USE [HospitalDb]
GO
/****** Object:  Table [dbo].[Assigns]    Script Date: 26-03-2020 14:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assigns](
	[AssignId] [int] IDENTITY(1,1) NOT NULL,
	[HealthcareAssistantId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
 CONSTRAINT [PK_Assigns] PRIMARY KEY CLUSTERED 
(
	[AssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 26-03-2020 14:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnosises]    Script Date: 26-03-2020 14:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnosises](
	[DiagnosisId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[DiagnosisDetails] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Diagnosises] PRIMARY KEY CLUSTERED 
(
	[DiagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 26-03-2020 14:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[DoctorPhoneNumber] [varchar](12) NOT NULL,
	[DoctorGender] [varchar](6) NOT NULL,
	[DoctorQualification] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 26-03-2020 14:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drugs](
	[DrugId] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [varchar](50) NOT NULL,
	[DrugDescription] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED 
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugTimes]    Script Date: 26-03-2020 14:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugTimes](
	[DrugTimeId] [int] IDENTITY(1,1) NOT NULL,
	[DrugId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[DrugTime] [varchar](50) NULL,
 CONSTRAINT [PK_DrugTimes] PRIMARY KEY CLUSTERED 
(
	[DrugTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthcareAssistants]    Script Date: 26-03-2020 14:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthcareAssistants](
	[HealthcareAssistantId] [int] IDENTITY(1,1) NOT NULL,
	[HealthcareAssistantName] [varchar](50) NOT NULL,
	[HealthcareAssistantQualification] [varchar](50) NOT NULL,
	[HealthcareAssistantGender] [varchar](6) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_HealthcareAssistants] PRIMARY KEY CLUSTERED 
(
	[HealthcareAssistantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 26-03-2020 14:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](50) NOT NULL,
	[PatientPhoneNumber] [varchar](12) NOT NULL,
	[PatientAge] [int] NOT NULL,
	[PatientAddress] [varchar](200) NOT NULL,
	[PatientGender] [varchar](6) NOT NULL,
	[PatientSymptom] [varchar](100) NOT NULL,
	[RegistrationDate] [date] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescribes]    Script Date: 26-03-2020 14:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescribes](
	[PrescribeId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[PrescribeDetail] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Prescribes] PRIMARY KEY CLUSTERED 
(
	[PrescribeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Patients] ADD  CONSTRAINT [DF_Patients_RegisterationDate]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Assigns]  WITH CHECK ADD  CONSTRAINT [FK_Assigns_HealthcareAssistants] FOREIGN KEY([HealthcareAssistantId])
REFERENCES [dbo].[HealthcareAssistants] ([HealthcareAssistantId])
GO
ALTER TABLE [dbo].[Assigns] CHECK CONSTRAINT [FK_Assigns_HealthcareAssistants]
GO
ALTER TABLE [dbo].[Assigns]  WITH CHECK ADD  CONSTRAINT [FK_Assigns_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Assigns] CHECK CONSTRAINT [FK_Assigns_Patients]
GO
ALTER TABLE [dbo].[Diagnosises]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosises_Diagnosises] FOREIGN KEY([DiagnosisId])
REFERENCES [dbo].[Diagnosises] ([DiagnosisId])
GO
ALTER TABLE [dbo].[Diagnosises] CHECK CONSTRAINT [FK_Diagnosises_Diagnosises]
GO
ALTER TABLE [dbo].[Diagnosises]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosises_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Diagnosises] CHECK CONSTRAINT [FK_Diagnosises_Doctors]
GO
ALTER TABLE [dbo].[Diagnosises]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosises_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Diagnosises] CHECK CONSTRAINT [FK_Diagnosises_Patients]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Departments]
GO
ALTER TABLE [dbo].[DrugTimes]  WITH CHECK ADD  CONSTRAINT [FK_DrugTimes_Drugs] FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drugs] ([DrugId])
GO
ALTER TABLE [dbo].[DrugTimes] CHECK CONSTRAINT [FK_DrugTimes_Drugs]
GO
ALTER TABLE [dbo].[DrugTimes]  WITH CHECK ADD  CONSTRAINT [FK_DrugTimes_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[DrugTimes] CHECK CONSTRAINT [FK_DrugTimes_Patients]
GO
ALTER TABLE [dbo].[HealthcareAssistants]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareAssistants_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[HealthcareAssistants] CHECK CONSTRAINT [FK_HealthcareAssistants_Departments]
GO
ALTER TABLE [dbo].[Prescribes]  WITH CHECK ADD  CONSTRAINT [FK_Prescribes_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Prescribes] CHECK CONSTRAINT [FK_Prescribes_Doctors]
GO
ALTER TABLE [dbo].[Prescribes]  WITH CHECK ADD  CONSTRAINT [FK_Prescribes_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Prescribes] CHECK CONSTRAINT [FK_Prescribes_Patients]
GO
USE [master]
GO
ALTER DATABASE [HospitalDb] SET  READ_WRITE 
GO
