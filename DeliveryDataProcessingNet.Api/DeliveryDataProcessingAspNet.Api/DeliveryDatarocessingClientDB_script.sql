USE [master]
GO
/****** Object:  Database [DeliveryDataProcessingClientDb]    Script Date: 2022-11-28 14:48:09 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022-11-28 14:48:10 ******/
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
/****** Object:  Table [dbo].[Clients]    Script Date: 2022-11-28 14:48:10 ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 2022-11-28 14:48:10 ******/
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
/****** Object:  Index [IX_Clients_LogId]    Script Date: 2022-11-28 14:48:10 ******/
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
