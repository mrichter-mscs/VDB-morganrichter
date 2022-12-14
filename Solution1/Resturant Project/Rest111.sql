USE [master]
GO
/****** Object:  Database [Resturant]    Script Date: 9/25/2022 5:41:45 PM ******/
CREATE DATABASE [Resturant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Resturant', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Resturant.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Resturant_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Resturant_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Resturant] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Resturant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Resturant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Resturant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Resturant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Resturant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Resturant] SET ARITHABORT OFF 
GO
ALTER DATABASE [Resturant] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Resturant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Resturant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Resturant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Resturant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Resturant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Resturant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Resturant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Resturant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Resturant] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Resturant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Resturant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Resturant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Resturant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Resturant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Resturant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Resturant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Resturant] SET RECOVERY FULL 
GO
ALTER DATABASE [Resturant] SET  MULTI_USER 
GO
ALTER DATABASE [Resturant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Resturant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Resturant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Resturant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Resturant] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Resturant] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Resturant', N'ON'
GO
ALTER DATABASE [Resturant] SET QUERY_STORE = OFF
GO
USE [Resturant]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 9/25/2022 5:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[Rent] [smallmoney] NULL,
	[Electricty] [smallmoney] NOT NULL,
	[Water] [smallmoney] NOT NULL,
	[Internet] [smallmoney] NOT NULL,
	[Food and drink Orders] [smallmoney] NOT NULL,
	[General Repairs] [smallmoney] NOT NULL,
	[Staff Payment] [smallmoney] NOT NULL,
	[Total Cost] [smallmoney] NULL,
	[Date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 9/25/2022 5:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Menu Items] [nchar](20) NOT NULL,
	[Price] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordered]    Script Date: 9/25/2022 5:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordered](
	[Food/Drink] [nchar](10) NOT NULL,
	[Amount] [nchar](10) NOT NULL,
	[Cost] [smallmoney] NOT NULL,
	[Date Ordered] [date] NOT NULL,
	[Date Delivered] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/25/2022 5:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [nchar](50) NOT NULL,
	[Payment] [smallmoney] NOT NULL,
	[Server ID] [int] NOT NULL,
	[Date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/25/2022 5:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Staff_ID] [nchar](10) NOT NULL,
	[Staff_Type] [nchar](10) NOT NULL,
	[First Name] [nchar](20) NOT NULL,
	[Last Name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Person_1] PRIMARY KEY CLUSTERED 
(
	[Staff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_ID]    Script Date: 9/25/2022 5:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_ID](
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[Job] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Staff_ID] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Expenses] ([Rent], [Electricty], [Water], [Internet], [Food and drink Orders], [General Repairs], [Staff Payment], [Total Cost], [Date]) VALUES (700.0000, 100.0000, 120.0000, 80.0000, 400.0000, 20.0000, 500.0000, 1920.0000, CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Expenses] ([Rent], [Electricty], [Water], [Internet], [Food and drink Orders], [General Repairs], [Staff Payment], [Total Cost], [Date]) VALUES (700.0000, 110.0000, 110.0000, 80.0000, 385.0000, 0.0000, 600.0000, 1985.0000, CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Expenses] ([Rent], [Electricty], [Water], [Internet], [Food and drink Orders], [General Repairs], [Staff Payment], [Total Cost], [Date]) VALUES (720.0000, 123.0000, 115.0000, 80.0000, 530.0000, 30.0000, 550.0000, 2148.0000, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Expenses] ([Rent], [Electricty], [Water], [Internet], [Food and drink Orders], [General Repairs], [Staff Payment], [Total Cost], [Date]) VALUES (720.0000, 132.0000, 116.0000, 80.0000, 540.0000, 0.0000, 610.0000, 2198.0000, CAST(N'2022-08-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (1, N'Fried Cod           ', 20.0000)
INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (2, N'Steak               ', 25.0000)
INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (3, N'Spagetti            ', 21.0000)
INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (4, N'Buffalo Burger      ', 26.0000)
INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (5, N'Lobster             ', 32.0000)
INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (6, N'Chicken Noodle Soup ', 21.0000)
INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (7, N'Chicken Wings       ', 18.0000)
INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (8, N'Paddymelt           ', 22.0000)
INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (9, N'Sodas               ', 3.0000)
INSERT [dbo].[Menu] ([Order_ID], [Menu Items], [Price]) VALUES (10, N'Wine                ', 15.0000)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[Ordered] ([Food/Drink], [Amount], [Cost], [Date Ordered], [Date Delivered]) VALUES (N'Beef      ', N'20 Pounds ', 260.0000, CAST(N'2022-06-22' AS Date), CAST(N'2022-06-27' AS Date))
INSERT [dbo].[Ordered] ([Food/Drink], [Amount], [Cost], [Date Ordered], [Date Delivered]) VALUES (N'Lettuce   ', N'3 heads   ', 9.0000, CAST(N'2022-06-22' AS Date), CAST(N'2022-06-27' AS Date))
INSERT [dbo].[Ordered] ([Food/Drink], [Amount], [Cost], [Date Ordered], [Date Delivered]) VALUES (N'Cod       ', N'10 Pounds ', 130.0000, CAST(N'2022-06-22' AS Date), CAST(N'2022-06-27' AS Date))
INSERT [dbo].[Ordered] ([Food/Drink], [Amount], [Cost], [Date Ordered], [Date Delivered]) VALUES (N'Wine      ', N'20 bottles', 200.0000, CAST(N'2022-07-06' AS Date), CAST(N'2022-07-10' AS Date))
INSERT [dbo].[Ordered] ([Food/Drink], [Amount], [Cost], [Date Ordered], [Date Delivered]) VALUES (N'Buns      ', N'10 Packs  ', 50.0000, CAST(N'2022-07-16' AS Date), CAST(N'2022-07-22' AS Date))
INSERT [dbo].[Ordered] ([Food/Drink], [Amount], [Cost], [Date Ordered], [Date Delivered]) VALUES (N'Lobster   ', N'20 pounds ', 200.0000, CAST(N'2022-08-05' AS Date), CAST(N'0202-08-11' AS Date))
GO
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N' 1, 9                                             ', 23.0000, 3, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'2, 4, 10, 10                                      ', 81.0000, 4, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'5, 5, 10, 10                                      ', 94.0000, 4, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'8, 7, 9                                           ', 43.0000, 5, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'3, 6                                              ', 42.0000, 3, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'1, 2                                              ', 45.0000, 4, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'3, 3, 1, 4, 9                                     ', 91.0000, 5, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'10, 10                                            ', 30.0000, 3, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'5, 5                                              ', 64.0000, 5, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'7, 3, 9, 9                                        ', 45.0000, 4, CAST(N'2022-09-22' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Payment], [Server ID], [Date]) VALUES (N'8,7,9                                             ', 43.0000, 3, CAST(N'2022-09-22' AS Date))
GO
INSERT [dbo].[Person] ([Staff_ID], [Staff_Type], [First Name], [Last Name]) VALUES (N'1         ', N'1         ', N'Marie               ', N'Krebsbach           ')
INSERT [dbo].[Person] ([Staff_ID], [Staff_Type], [First Name], [Last Name]) VALUES (N'2         ', N'1         ', N'John                ', N'Holl                ')
INSERT [dbo].[Person] ([Staff_ID], [Staff_Type], [First Name], [Last Name]) VALUES (N'3         ', N'2         ', N'Saidi               ', N'Teller              ')
INSERT [dbo].[Person] ([Staff_ID], [Staff_Type], [First Name], [Last Name]) VALUES (N'4         ', N'2         ', N'Crystal             ', N'Holstien            ')
INSERT [dbo].[Person] ([Staff_ID], [Staff_Type], [First Name], [Last Name]) VALUES (N'5         ', N'2         ', N'Sam                 ', N'Hiede               ')
INSERT [dbo].[Person] ([Staff_ID], [Staff_Type], [First Name], [Last Name]) VALUES (N'6         ', N'3         ', N'Jeffery             ', N'Left                ')
INSERT [dbo].[Person] ([Staff_ID], [Staff_Type], [First Name], [Last Name]) VALUES (N'7         ', N'3         ', N'Gordan              ', N'Right               ')
INSERT [dbo].[Person] ([Staff_ID], [Staff_Type], [First Name], [Last Name]) VALUES (N'8         ', N'4         ', N'James               ', N'Cent                ')
INSERT [dbo].[Person] ([Staff_ID], [Staff_Type], [First Name], [Last Name]) VALUES (N'9         ', N'4         ', N'Edward              ', N'King                ')
GO
SET IDENTITY_INSERT [dbo].[Staff_ID] ON 

INSERT [dbo].[Staff_ID] ([Number], [Job]) VALUES (1, N'Owner               ')
INSERT [dbo].[Staff_ID] ([Number], [Job]) VALUES (2, N'Server              ')
INSERT [dbo].[Staff_ID] ([Number], [Job]) VALUES (3, N'Cook                ')
INSERT [dbo].[Staff_ID] ([Number], [Job]) VALUES (4, N'Dish Washer         ')
SET IDENTITY_INSERT [dbo].[Staff_ID] OFF
GO
USE [master]
GO
ALTER DATABASE [Resturant] SET  READ_WRITE 
GO
