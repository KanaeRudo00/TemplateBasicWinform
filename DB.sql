USE [BankAccountType]
GO
ALTER TABLE [dbo].[BankAccounts] DROP CONSTRAINT [FK__BankAccou__TypeI__3B75D760]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/5/2023 3:23:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[BankAccounts]    Script Date: 12/5/2023 3:23:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BankAccounts]') AND type in (N'U'))
DROP TABLE [dbo].[BankAccounts]
GO
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 12/5/2023 3:23:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountTypes]') AND type in (N'U'))
DROP TABLE [dbo].[AccountTypes]
GO
USE [master]
GO
/****** Object:  Database [BankAccountType]    Script Date: 12/5/2023 3:23:56 PM ******/
DROP DATABASE [BankAccountType]
GO
/****** Object:  Database [BankAccountType]    Script Date: 12/5/2023 3:23:56 PM ******/
CREATE DATABASE [BankAccountType]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankAccountType', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BankAccountType.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BankAccountType_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BankAccountType_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BankAccountType] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankAccountType].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankAccountType] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankAccountType] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankAccountType] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankAccountType] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankAccountType] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankAccountType] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BankAccountType] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankAccountType] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankAccountType] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankAccountType] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankAccountType] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankAccountType] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankAccountType] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankAccountType] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankAccountType] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BankAccountType] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankAccountType] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankAccountType] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankAccountType] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankAccountType] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankAccountType] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BankAccountType] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankAccountType] SET RECOVERY FULL 
GO
ALTER DATABASE [BankAccountType] SET  MULTI_USER 
GO
ALTER DATABASE [BankAccountType] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankAccountType] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankAccountType] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankAccountType] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BankAccountType] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BankAccountType] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BankAccountType', N'ON'
GO
ALTER DATABASE [BankAccountType] SET QUERY_STORE = ON
GO
ALTER DATABASE [BankAccountType] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BankAccountType]
GO
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 12/5/2023 3:23:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTypes](
	[TypeID] [nvarchar](20) NOT NULL,
	[TypeName] [nvarchar](80) NOT NULL,
	[TypeDesc] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccounts]    Script Date: 12/5/2023 3:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccounts](
	[AccountID] [nvarchar](20) NOT NULL,
	[AccountName] [nvarchar](120) NOT NULL,
	[OpenDate] [date] NULL,
	[BranchName] [nvarchar](50) NULL,
	[TypeID] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/5/2023 3:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](80) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[UserRole] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountTypes] ([TypeID], [TypeName], [TypeDesc]) VALUES (N'AT0001', N'Saving', N'Saving Account Description')
INSERT [dbo].[AccountTypes] ([TypeID], [TypeName], [TypeDesc]) VALUES (N'AT0002', N'Checking', N'Checking Account Description')
INSERT [dbo].[AccountTypes] ([TypeID], [TypeName], [TypeDesc]) VALUES (N'AT0003', N'Trading', N'Trading Account Description')
INSERT [dbo].[AccountTypes] ([TypeID], [TypeName], [TypeDesc]) VALUES (N'AT0004', N'Forex', N'Money Market Account Description')
GO
INSERT [dbo].[BankAccounts] ([AccountID], [AccountName], [OpenDate], [BranchName], [TypeID]) VALUES (N'ACCT0001', N'Saving For New Customer 1', CAST(N'2001-02-15' AS Date), N'Ha Noi', N'AT0001')
INSERT [dbo].[BankAccounts] ([AccountID], [AccountName], [OpenDate], [BranchName], [TypeID]) VALUES (N'ACCT0002', N'Checking For New Customer 2', CAST(N'2001-06-23' AS Date), N'Ha Noi', N'AT0002')
INSERT [dbo].[BankAccounts] ([AccountID], [AccountName], [OpenDate], [BranchName], [TypeID]) VALUES (N'ACCT0003', N'Trading For New Customer 3', CAST(N'2020-03-15' AS Date), N'Ha Noi', N'AT0003')
GO
INSERT [dbo].[Users] ([UserID], [Password], [UserName], [UserRole]) VALUES (N'admin', N'123', N'Administrator', 1)
INSERT [dbo].[Users] ([UserID], [Password], [UserName], [UserRole]) VALUES (N'manager', N'123', N'Manager', 2)
INSERT [dbo].[Users] ([UserID], [Password], [UserName], [UserRole]) VALUES (N'staff', N'123', N'Staff', 3)
GO
ALTER TABLE [dbo].[BankAccounts]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[AccountTypes] ([TypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [BankAccountType] SET  READ_WRITE 
GO

--------------------------------
--- Just change something
--- P/s: Not Silly