USE [master]
GO
/****** Object:  Database [DB_BD_Division_District_SubDistrict]    Script Date: 05-Feb-20 10:45:22 PM ******/
CREATE DATABASE [DB_BD_Division_District_SubDistrict]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_BD_Division_District_SubDistrict', FILENAME = N'G:\SQL\SQL SERVER 2017 INSTALL FOLDER\MSSQL14.ROBIN_SQL\MSSQL\DATA\DB_BD_Division_District_SubDistrict.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_BD_Division_District_SubDistrict_log', FILENAME = N'G:\SQL\SQL SERVER 2017 INSTALL FOLDER\MSSQL14.ROBIN_SQL\MSSQL\DATA\DB_BD_Division_District_SubDistrict_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_BD_Division_District_SubDistrict].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET  MULTI_USER 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_BD_Division_District_SubDistrict', N'ON'
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET QUERY_STORE = OFF
GO
USE [DB_BD_Division_District_SubDistrict]
GO
/****** Object:  Table [dbo].[Tbl_District]    Script Date: 05-Feb-20 10:45:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_District](
	[District_Id] [int] IDENTITY(1,1) NOT NULL,
	[Division_Id] [int] NULL,
	[District_Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[District_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Division]    Script Date: 05-Feb-20 10:45:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Division](
	[Division_Id] [int] IDENTITY(1,1) NOT NULL,
	[Division_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_Division] PRIMARY KEY CLUSTERED 
(
	[Division_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SubDistrict]    Script Date: 05-Feb-20 10:45:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SubDistrict](
	[Sub_District_Id] [int] IDENTITY(1,1) NOT NULL,
	[District_ID] [int] NOT NULL,
	[Sub_District_Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tbl_SubDistrict] PRIMARY KEY CLUSTERED 
(
	[Sub_District_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_District]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_District_Tbl_Division] FOREIGN KEY([Division_Id])
REFERENCES [dbo].[Tbl_Division] ([Division_Id])
GO
ALTER TABLE [dbo].[Tbl_District] CHECK CONSTRAINT [FK_Tbl_District_Tbl_Division]
GO
ALTER TABLE [dbo].[Tbl_SubDistrict]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_SubDistrict_Tbl_District] FOREIGN KEY([District_ID])
REFERENCES [dbo].[Tbl_District] ([District_Id])
GO
ALTER TABLE [dbo].[Tbl_SubDistrict] CHECK CONSTRAINT [FK_Tbl_SubDistrict_Tbl_District]
GO
USE [master]
GO
ALTER DATABASE [DB_BD_Division_District_SubDistrict] SET  READ_WRITE 
GO
