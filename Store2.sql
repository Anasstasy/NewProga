USE [master]
GO
/****** Object:  Database [Store2]    Script Date: 13.05.2023 15:13:33 ******/
CREATE DATABASE [Store2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store2', FILENAME = N'D:\SQL2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\Store2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Store2_log', FILENAME = N'D:\SQL2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\Store2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Store2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Store2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Store2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store2] SET RECOVERY FULL 
GO
ALTER DATABASE [Store2] SET  MULTI_USER 
GO
ALTER DATABASE [Store2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Store2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Store2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Store2', N'ON'
GO
ALTER DATABASE [Store2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Store2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Store2]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NULL,
	[id_city] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[id_supplier] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [datetime] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markup]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[percent] [float] NULL,
 CONSTRAINT [PK_Markup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_measurement] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_producer] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[id_category] [int] NULL,
	[id_country] [int] NULL,
	[id_producer] [int] NULL,
	[id_measurement] [int] NULL,
	[id_markup] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [datetime] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 13.05.2023 15:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (3, N'Прохоровская, 47', 2)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (4, N'Пасео-де-ла-Кастельяна', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (5, N'Фуэнкарраль', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (6, N'Зарічна, 1, Бездрик', 6)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (7, N'Шенкин', 4)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (8, N'Ибн Габироль', 4)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (9, N'Каплан', 4)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (10, N'Фридрихштрассе', 8)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (11, N'Марискаль', 7)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (12, N'Белопольский шоссе, 15', 6)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (13, N'Харьковская улица, 103', 6)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Хлебо-булочные')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Фрукты')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Овощи')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Молочные')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Мясные')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Крупы')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Рыба')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Кулинария')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Заморозка')
INSERT [dbo].[Category] ([id], [name]) VALUES (10, N'Напитки')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (2, N'Одесса', 2)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (3, N'Мадрид', 9)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (4, N'Тель-Авив', 5)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (5, N'Хайфа', 4)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (6, N'Сумы', 8)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (7, N'Кито', 10)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (8, N'Берлин', 11)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (9, N'Анкара', 6)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (10, N'Стамбул', 7)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (11, N'Назарет', 3)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name_country]) VALUES (1, N'Израиль')
INSERT [dbo].[Country] ([id], [name_country]) VALUES (2, N'Испания')
INSERT [dbo].[Country] ([id], [name_country]) VALUES (3, N'Италия')
INSERT [dbo].[Country] ([id], [name_country]) VALUES (4, N'Украина')
INSERT [dbo].[Country] ([id], [name_country]) VALUES (5, N'Турция')
INSERT [dbo].[Country] ([id], [name_country]) VALUES (6, N'Германия')
INSERT [dbo].[Country] ([id], [name_country]) VALUES (7, N'Бразилия')
INSERT [dbo].[Country] ([id], [name_country]) VALUES (8, N'Польша')
INSERT [dbo].[Country] ([id], [name_country]) VALUES (9, N'Франция')
INSERT [dbo].[Country] ([id], [name_country]) VALUES (10, N'Эквадор')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (1, 1, 9, 25, 45, CAST(N'2023-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (2, 2, 10, 15, 35, CAST(N'2023-08-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (3, 3, 11, 20, 47, CAST(N'2023-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (4, 4, 12, 57, 29, CAST(N'2023-08-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (5, 5, 13, 60, 20, CAST(N'2023-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (6, 6, 14, 56, 38, CAST(N'2023-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (7, 7, 15, 40, 90, CAST(N'2023-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (8, 8, 16, 45, 34, CAST(N'2023-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (9, 9, 17, 60, 29, CAST(N'2023-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (10, 10, 18, 39, 52, CAST(N'2023-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (11, 12, 19, 70, 57, CAST(N'2023-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (12, 14, 20, 40, 12, CAST(N'2023-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (13, 15, 20, 80, 380, CAST(N'2023-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (14, 16, 19, 110, 120, CAST(N'2023-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (15, 17, 17, 90, 40, CAST(N'2023-08-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (16, 18, 9, 78, 56, CAST(N'2023-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (17, 19, 9, 150, 70, CAST(N'2023-08-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (18, 20, 10, 126, 65, CAST(N'2023-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (19, 21, 16, 200, 40, CAST(N'2023-07-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Markup] ON 

INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (1, N'Оптовая цена', 5)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (2, N'Розничная цена', 5)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (3, N'Цена закупки', 10)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (4, N'Цена продажи', 20)
SET IDENTITY_INSERT [dbo].[Markup] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurement] ON 

INSERT [dbo].[Measurement] ([id], [name_measurement], [description]) VALUES (1, N'Кг/kg', N'Килограмм')
INSERT [dbo].[Measurement] ([id], [name_measurement], [description]) VALUES (2, N'Т/t', N'Тонна')
INSERT [dbo].[Measurement] ([id], [name_measurement], [description]) VALUES (3, N'Г/g', N'Грамм')
INSERT [dbo].[Measurement] ([id], [name_measurement], [description]) VALUES (4, N'Мл/ml', N'Миллилитр')
INSERT [dbo].[Measurement] ([id], [name_measurement], [description]) VALUES (5, N'Л/L', N'Литр')
SET IDENTITY_INSERT [dbo].[Measurement] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (1, N'Хлібодар', 3)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (2, N'Сумский Мясокомбинат', 13)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (3, N'Сумский Городской Молочный Завод', 12)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (4, N'Сумський Завод Продовольчих Товарів', 6)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (5, N'LeviTrade', 4)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (6, N'NZ Australis', 5)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (7, N'ECUADORIAN GOODS', 11)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (8, N'VEHGRO B.V', 10)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (9, N'NAKO NATURALS GMBH', 10)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (10, N'Agro Active, IE', 7)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (11, N'Ashupulink, IE', 8)
INSERT [dbo].[Producer] ([id], [name_producer], [id_address]) VALUES (12, N'Lextra Food, LLC', 8)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (1, N'Батон Одесский', 25, 1, 1, 1, 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (2, N'Бублик', 15, 1, 1, 1, 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (3, N'Булочка', 20, 1, 1, 1, 3, 2)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (4, N'Яблоки', 57, 2, 1, 11, 1, 2)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (5, N'Персики', 60, 2, 1, 7, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (6, N'Груши', 56, 2, 2, 7, 1, 4)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (7, N'Лук', 40, 3, 2, 9, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (8, N'Огурец', 45, 3, 3, 10, 1, 4)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (9, N'Помидор', 60, 3, 2, 10, 1, 2)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (10, N'Чеснок', 39, 3, 3, 12, 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (12, N'Картофель', 70, 3, 2, 5, 1, 2)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (14, N'Капуста', 40, 3, 1, 6, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (15, N'Финики', 80, 2, 1, 7, 3, 4)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (16, N'Говядина', 110, 5, 4, 2, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (17, N'Телятина', 90, 5, 4, 2, 1, 2)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (18, N'Сыр', 78, 4, 4, 3, 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (19, N'Лосось', 150, 7, 6, 5, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (20, N'Тунец', 126, 7, 6, 6, 3, 4)
INSERT [dbo].[Product] ([id], [name], [price], [id_category], [id_country], [id_producer], [id_measurement], [id_markup]) VALUES (21, N'Вино', 200, 10, 6, 6, 5, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (2, N'Одесская область', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (3, N'Северный округ', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (4, N'Хайфский округ', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (5, N'Тель-Авивский округ', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (6, N'Центральная Анатолия', 5)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (7, N'Мраморноморский регион', 5)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (8, N'Сумская область', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (9, N'Мадрид, регион', 2)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (10, N'Пичинча, провинция', 10)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (11, N'Регенсбург, регион', 6)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (1, 1, 25, 50, CAST(N'2023-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (2, 2, 15, 35, CAST(N'2023-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (3, 3, 20, 100, CAST(N'2023-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (4, 4, 57, 60, CAST(N'2023-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (5, 5, 60, 80, CAST(N'2023-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (6, 6, 56, 40, CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (7, 7, 40, 120, CAST(N'2023-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (8, 8, 45, 34, CAST(N'2023-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (9, 9, 60, 346, CAST(N'2023-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (10, 10, 39, 52, CAST(N'2023-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (11, 12, 70, 74, CAST(N'2023-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (12, 14, 40, 644, CAST(N'2023-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (13, 15, 80, 300, CAST(N'2023-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (14, 16, 110, 200, CAST(N'2023-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (15, 17, 90, 80, CAST(N'2023-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (16, 18, 78, 90, CAST(N'2023-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (17, 19, 150, 100, CAST(N'2023-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (18, 20, 126, 100, CAST(N'2023-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (19, 21, 200, 40, CAST(N'2023-06-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (9, N'ELIT RENTAL', 3)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (10, N'Luximo', 13)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (11, N'Luximo', 12)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (12, N'ELIT RENTAL', 6)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (13, N'ELIT RENTAL', 4)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (14, N'Luximo', 5)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (15, N'Luximo', 11)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (16, N'ELIT RENTAL', 10)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (17, N'Luximo', 10)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (18, N'Luximo', 7)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (19, N'ELIT RENTAL', 8)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (20, N'Luximo', 8)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Supplier] FOREIGN KEY([id_supplier])
REFERENCES [dbo].[Supplier] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Supplier]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Country]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Markup] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Markup] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Markup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Measurement] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurement] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Measurement]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [Store2] SET  READ_WRITE 
GO
