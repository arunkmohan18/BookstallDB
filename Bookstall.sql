USE [master]
GO
/****** Object:  Database [BookStall]    Script Date: 10/30/2021 11:10:53 PM ******/
CREATE DATABASE [BookStall]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStall', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookStall.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookStall_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookStall_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookStall] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStall] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStall] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStall] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStall] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStall] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStall] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStall] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStall] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStall] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStall] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStall] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStall] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStall] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStall] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStall] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStall] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStall] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStall] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStall] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStall] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStall] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStall] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStall] SET  MULTI_USER 
GO
ALTER DATABASE [BookStall] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStall] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStall] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookStall] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BookStall]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 10/30/2021 11:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
	[Price] [numeric](18, 2) NULL,
	[Price_Range] [varchar](20) NULL,
	[ItemID] [int] NULL,
 CONSTRAINT [PK__Books__3DE0C2276EE5E72A] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IDGenerator]    Script Date: 10/30/2021 11:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDGenerator](
	[ItemID] [int] IDENTITY(200000000,1) NOT NULL,
	[status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImageCards]    Script Date: 10/30/2021 11:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImageCards](
	[ID] [int] NOT NULL,
	[ItemID] [char](20) NOT NULL,
	[ItemUrl] [varchar](250) NULL,
	[Description] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Ismain] [bit] NOT NULL,
 CONSTRAINT [PK_ImageCards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ImageCards] UNIQUE NONCLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2021 11:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[PasswordHash] [varbinary](max) NOT NULL CONSTRAINT [DF_Users_PasswordHash]  DEFAULT ((0)),
	[PasswordSalt] [varbinary](max) NOT NULL CONSTRAINT [DF_Users_PasswordSalt]  DEFAULT ((0)),
	[UserType] [char](20) NULL,
	[UserDOB] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[LastActive] [datetime] NULL,
	[Interests] [char](20) NULL,
	[Country] [char](20) NULL,
	[City] [char](20) NULL,
	[ItemID] [int] NULL,
	[userpassword] [char](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [BookStall] SET  READ_WRITE 
GO
