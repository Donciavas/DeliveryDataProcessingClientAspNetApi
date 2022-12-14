USE [master]
GO
/****** Object:  Database [DeliveryDataProcessingClientDb]    Script Date: 2022-11-28 14:43:25 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DeliveryDataProcessingClientDb')
BEGIN
CREATE DATABASE [DeliveryDataProcessingClientDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DeliveryDataProcessingClientDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DeliveryDataProcessingClientDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DeliveryDataProcessingClientDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DeliveryDataProcessingClientDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
END
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeliveryDataProcessingClientDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET RECOVERY FULL 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET  MULTI_USER 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DeliveryDataProcessingClientDb', N'ON'
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET QUERY_STORE = OFF
GO
USE [DeliveryDataProcessingClientDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022-11-28 14:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 2022-11-28 14:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clients](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PostCode] [nvarchar](8) NULL,
	[LogId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2022-11-28 14:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Log](
	[Id] [uniqueidentifier] NOT NULL,
	[ClientCreationTime] [datetime2](7) NOT NULL,
	[PostCodeUpdateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221128112451_CreatingDatabase', N'7.0.0')
GO
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'8cba6959-f1f4-4a8f-b87a-0cea41a42e8b', N'UAB "UAB vaistinė" fil. nr. 8', N'Šiltnamių g. 29, Vilnius', N'04130', N'3584e4d4-43fc-4f4d-b6c9-661ce277044e')
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'563c6dac-8748-4b79-8796-0fe2e1bcb868', N'UAB "UAB vaistinė" fil. nr. 3', N'Švenčionių g. 36-2,Nemenčinė, Vilniaus r. sav.', N'15168', N'a3465670-ab4f-4631-97b8-3bb34fc4891c')
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'45b9d948-d149-408f-82a8-1b0de338a7c3', N'UAB "UAB vaistinė" fil. nr. 7', N'Livonijos g. 5, Joniškis', N'84123', N'c325ca6d-63a3-4b22-88bf-47dc8cb34278')
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'1b975a42-c58a-4581-a94b-24182560fe2f', N'UAB "UAB vaistinė" fil. nr. 2', N'Varnių g. 39-9,Kaunas', N'48415', N'682d4299-3ed4-4a5a-b16f-a6669fad5926')
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'346f07ca-a099-43ed-a3ad-4d548357f892', N'UAB "UAB vaistinė" fil. nr. 12', N'Nemuno g. 70, Panevėžys', N'35190', N'7bbe63ac-2ce4-4df8-ab6a-0fb9c404a48e')
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'698468f3-1df1-4a33-8fdb-5bfdce30f8de', N'UAB "UAB vaistinė" fil. nr. 6', N'Vytenio g. 16, Prienai', N'59140', N'c5b44aa4-44d3-4648-aa72-925908378317')
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'79bdb0c4-26d1-415f-931a-7c54d157339f', N'UAB "UAB vaistinė" fil. nr. 9', N'Kniaudiškių g. 6, Panevėžys', N'37106', N'90d1ac1d-db67-4031-aeff-31bb6907e1bf')
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'80b00824-606b-46f5-9e22-892e3850d474', N'UAB "UAB vaistinė" fil. nr. 1', N'Liepų al. 3-1B,Panevėžys', N'35139', N'07f4f0b1-80a0-4fb3-8d03-c366c05c947b')
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'3aba624c-1e36-4e7b-9485-95bf45e43e8c', N'UAB "UAB vaistinė" fil. nr. 5', N'Baltų pr. 7A-1, Kaunas', N'48259', N'd57c4ffe-f737-4bc7-a0e3-ad74eb7aa29f')
INSERT [dbo].[Clients] ([Id], [Name], [Address], [PostCode], [LogId]) VALUES (N'56fe54f1-60c9-48ef-ab00-e8bd7044c3eb', N'UAB "UAB vaistinė" fil. nr. 4', N'Vilniaus g. 220, Šiauliai', N'76302', N'f5220ee9-2fde-4531-ac89-c4b9728f1f57')
GO
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'7bbe63ac-2ce4-4df8-ab6a-0fb9c404a48e', CAST(N'2022-11-28T14:38:47.8446865' AS DateTime2), CAST(N'2022-11-28T14:39:42.5437839' AS DateTime2))
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'90d1ac1d-db67-4031-aeff-31bb6907e1bf', CAST(N'2022-11-28T14:38:47.8369233' AS DateTime2), CAST(N'2022-11-28T14:39:42.6206504' AS DateTime2))
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'a3465670-ab4f-4631-97b8-3bb34fc4891c', CAST(N'2022-11-28T14:38:47.7958275' AS DateTime2), CAST(N'2022-11-28T14:39:42.4197935' AS DateTime2))
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'c325ca6d-63a3-4b22-88bf-47dc8cb34278', CAST(N'2022-11-28T14:38:47.8236638' AS DateTime2), CAST(N'2022-11-28T14:39:42.4596454' AS DateTime2))
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'3584e4d4-43fc-4f4d-b6c9-661ce277044e', CAST(N'2022-11-28T14:38:47.8303025' AS DateTime2), CAST(N'2022-11-28T14:39:42.3784307' AS DateTime2))
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'c5b44aa4-44d3-4648-aa72-925908378317', CAST(N'2022-11-28T14:38:47.8168211' AS DateTime2), CAST(N'2022-11-28T14:39:42.5818444' AS DateTime2))
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'682d4299-3ed4-4a5a-b16f-a6669fad5926', CAST(N'2022-11-28T14:38:47.7811848' AS DateTime2), CAST(N'2022-11-28T14:39:42.5055342' AS DateTime2))
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'd57c4ffe-f737-4bc7-a0e3-ad74eb7aa29f', CAST(N'2022-11-28T14:38:47.8098475' AS DateTime2), CAST(N'2022-11-28T14:39:42.7142463' AS DateTime2))
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'07f4f0b1-80a0-4fb3-8d03-c366c05c947b', CAST(N'2022-11-28T14:38:47.5132718' AS DateTime2), CAST(N'2022-11-28T14:39:42.6613845' AS DateTime2))
INSERT [dbo].[Log] ([Id], [ClientCreationTime], [PostCodeUpdateTime]) VALUES (N'f5220ee9-2fde-4531-ac89-c4b9728f1f57', CAST(N'2022-11-28T14:38:47.8030380' AS DateTime2), CAST(N'2022-11-28T14:39:42.7623078' AS DateTime2))
GO
/****** Object:  Index [IX_Clients_LogId]    Script Date: 2022-11-28 14:43:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND name = N'IX_Clients_LogId')
CREATE NONCLUSTERED INDEX [IX_Clients_LogId] ON [dbo].[Clients]
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clients_Log_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clients]'))
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Log_LogId] FOREIGN KEY([LogId])
REFERENCES [dbo].[Log] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clients_Log_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clients]'))
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Log_LogId]
GO
USE [master]
GO
ALTER DATABASE [DeliveryDataProcessingClientDb] SET  READ_WRITE 
GO
