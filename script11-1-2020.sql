USE [master]
GO
/****** Object:  Database [online_superMarket_system]    Script Date: 11/1/2020 1:07:43 AM ******/
CREATE DATABASE [online_superMarket_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'online_superMarket_system', FILENAME = N'E:\sqlServerDBs\online_superMarket_system.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'online_superMarket_system_log', FILENAME = N'E:\sqlServerDBs\online_superMarket_system_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [online_superMarket_system] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [online_superMarket_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [online_superMarket_system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [online_superMarket_system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [online_superMarket_system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [online_superMarket_system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [online_superMarket_system] SET ARITHABORT OFF 
GO
ALTER DATABASE [online_superMarket_system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [online_superMarket_system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [online_superMarket_system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [online_superMarket_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [online_superMarket_system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [online_superMarket_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [online_superMarket_system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [online_superMarket_system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [online_superMarket_system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [online_superMarket_system] SET  DISABLE_BROKER 
GO
ALTER DATABASE [online_superMarket_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [online_superMarket_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [online_superMarket_system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [online_superMarket_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [online_superMarket_system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [online_superMarket_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [online_superMarket_system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [online_superMarket_system] SET RECOVERY FULL 
GO
ALTER DATABASE [online_superMarket_system] SET  MULTI_USER 
GO
ALTER DATABASE [online_superMarket_system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [online_superMarket_system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [online_superMarket_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [online_superMarket_system] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [online_superMarket_system] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'online_superMarket_system', N'ON'
GO
USE [online_superMarket_system]
GO
/****** Object:  Table [dbo].[AddToCart]    Script Date: 11/1/2020 1:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddToCart](
	[AddToCart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id_] [int] NULL,
	[Product_ID] [int] NULL,
	[category_ID] [int] NOT NULL,
	[brand_ID] [int] NULL,
	[Product_name] [varchar](50) NOT NULL,
	[Product_disc] [varchar](100) NOT NULL,
	[Product_code] [int] NULL,
	[whole_sale_price] [int] NOT NULL,
	[retail_price] [int] NOT NULL,
	[stock] [int] NULL,
	[imgPath] [varchar](2000) NULL,
	[create_at] [datetime] NOT NULL,
	[update_at] [datetime] NULL,
	[is_active] [bit] NULL,
	[makeorder] [bit] NULL,
 CONSTRAINT [PK_AddToCart] PRIMARY KEY CLUSTERED 
(
	[AddToCart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_ID] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [varchar](50) NOT NULL,
	[brand_code] [int] NULL,
	[create_at] [datetime] NOT NULL,
	[update_at] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[brand_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[category_ID] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NULL,
	[category_disc] [varchar](100) NOT NULL,
	[category_code] [varchar](50) NULL,
	[img_path] [varchar](2000) NULL,
	[create_at] [datetime] NOT NULL,
	[update_at] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discounts](
	[Discount_ID] [int] IDENTITY(1,1) NOT NULL,
	[Discount_Code] [varchar](11) NULL,
	[Product_ID] [int] NULL,
	[Category_ID] [int] NULL,
	[Brand_Code] [int] NULL,
	[Upto_percent] [int] NULL,
	[Upto_RS] [int] NULL,
	[Get_One_By_One] [bit] NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[Discount_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[Location_ID] [int] IDENTITY(1,1) NOT NULL,
	[Store_Code] [varchar](100) NULL,
	[Location] [varchar](50) NULL,
	[Create_at] [datetime] NULL,
	[Update_at] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Location_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[venderid] [int] NULL,
	[categoryid] [int] NULL,
	[productsid] [int] NULL,
	[createAt] [datetime] NULL,
	[productsAmount] [bigint] NULL,
	[prductsname] [varchar](50) NULL,
	[categoryname] [varchar](50) NULL,
	[venderoname] [varchar](50) NULL,
	[customerid] [int] NULL,
	[customernam] [varchar](50) NULL,
	[isDispatch] [bit] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payement_Type]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payement_Type](
	[Pay_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pay_Type] [varchar](10) NULL,
	[Create_at] [datetime] NULL,
	[Update_at] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_Payement_Type] PRIMARY KEY CLUSTERED 
(
	[Pay_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[sellorID] [int] NULL,
	[sellorName] [varchar](50) NULL,
	[category_ID] [int] NOT NULL,
	[brand_ID] [int] NULL,
	[Product_name] [varchar](50) NOT NULL,
	[Product_disc] [varchar](100) NOT NULL,
	[Product_code] [int] NULL,
	[whole_sale_price] [int] NOT NULL,
	[retail_price] [int] NOT NULL,
	[stock] [int] NULL,
	[imgPath] [varchar](2000) NULL,
	[create_at] [datetime] NOT NULL,
	[update_at] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_Product_1] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[statement]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statement](
	[Stmt_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pay_Type_ID] [int] NULL,
	[User_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Quantity] [int] NULL,
	[Amount] [int] NULL,
	[Create_AT] [datetime] NULL,
	[Update_At] [datetime] NULL,
	[is_Active] [bit] NULL,
 CONSTRAINT [PK_statement] PRIMARY KEY CLUSTERED 
(
	[Stmt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userRoles]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userRoles](
	[role_ID] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](20) NULL,
 CONSTRAINT [PK_userRoles] PRIMARY KEY CLUSTERED 
(
	[role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[City_ID] [int] NULL,
	[State_ID] [int] NULL,
	[Country_ID] [int] NULL,
	[Home_phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Credit_card_number] [bigint] NULL,
	[Credit_card_expiry] [bigint] NULL,
	[img_path] [varchar](1000) NULL,
	[role_ID] [int] NOT NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[is_active] [bit] NOT NULL,
	[Address] [varchar](255) NULL,
	[shopname] [varchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AddToCart] ON 

INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (39, 1, 10, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'192916019.png', CAST(N'2019-11-27 20:29:16.020' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (41, 1, 4, 1056, 1004, N'popcorn', N'new dis', NULL, 500, 750, 5, N'195156868.png', CAST(N'2019-12-02 21:51:56.887' AS DateTime), CAST(N'2019-12-02 21:51:56.887' AS DateTime), 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (42, 1, 5, 1055, 1006, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 55, 6, N'193912921.png', CAST(N'2019-11-25 19:39:12.947' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (43, 1, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (44, 1, 3, 1055, 1006, N'pepsi', N'ramdan offer', NULL, 51, 80, 62, N'190532344.png', CAST(N'2019-12-02 22:05:32.350' AS DateTime), CAST(N'2019-12-02 22:05:32.350' AS DateTime), 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (1002, 1014, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (1003, 1014, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (1004, 1, 4, 1056, 1004, N'popcorn', N'new dis', NULL, 500, 750, 5, N'195156868.png', CAST(N'2019-12-02 21:51:56.887' AS DateTime), CAST(N'2019-12-02 21:51:56.887' AS DateTime), 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (2002, 4, 1012, 2063, 1002, N'cat ab', N'cat ab', 12, 1222, 1221, 12, N'200624830.png', CAST(N'2020-10-01 07:06:24.853' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (2003, 4, 5, 1055, 1006, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 55, 6, N'193912921.png', CAST(N'2019-11-25 19:39:12.947' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (2005, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (2006, 2026, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (3012, 1, 10, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'192916019.png', CAST(N'2019-11-27 20:29:16.020' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4011, 2026, 1012, 2063, 1002, N'cat ab', N'cat ab', 12, 1222, 1221, 12, N'200624830.png', CAST(N'2020-10-01 07:06:24.853' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4012, 2030, 11, 1057, 1006, N'juice', N'suger free', NULL, 45, 55, 45, N'190850461.png', CAST(N'2019-11-29 01:08:50.467' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4013, 2030, 5, 1055, 1006, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 55, 6, N'193912921.png', CAST(N'2019-11-25 19:39:12.947' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4014, 2030, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4015, 2030, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4016, 2030, 10, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'192916019.png', CAST(N'2019-11-27 20:29:16.020' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4017, 2030, 11, 1057, 1006, N'juice', N'suger free', NULL, 45, 55, 45, N'190850461.png', CAST(N'2019-11-29 01:08:50.467' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4018, 2030, 1014, 1057, 1004, N'cat food', N'cat ab', 12, 1222, 1221, 12, N'200952156.png', CAST(N'2020-10-04 15:09:52.163' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4019, 2030, 1013, 1055, 1003, N'cat food', N'for healthy cat', 12, 1222, 1000, 12, N'204151955.png', CAST(N'2020-10-04 14:43:35.977' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4020, 2030, 1012, 2063, 1002, N'cat ab', N'cat ab', 12, 1222, 1221, 12, N'200624830.png', CAST(N'2020-10-01 07:06:24.853' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4021, 2030, 12, 1065, 1004, N'popcorn', N'for  winter moisturizing lotion', NULL, 51, 45, 45, N'195039673.png', CAST(N'2019-12-04 07:50:39.720' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4028, 2026, 1013, 1055, 1003, N'cat food', N'for healthy cat', 12, 1222, 1000, 12, N'204151955.png', CAST(N'2020-10-04 14:43:35.977' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4029, 2026, 1013, 1055, 1003, N'cat food', N'for healthy cat', 12, 1222, 1000, 12, N'204151955.png', CAST(N'2020-10-04 14:43:35.977' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4030, 2026, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4031, 2026, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4032, 2026, 10, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'192916019.png', CAST(N'2019-11-27 20:29:16.020' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4033, 2026, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4034, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4035, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4036, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4037, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4038, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4039, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4040, 2026, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4041, 2026, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4042, 2026, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4043, 2026, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4044, 2026, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4045, 2026, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4046, 2026, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4047, 2026, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4048, 2026, 10, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'192916019.png', CAST(N'2019-11-27 20:29:16.020' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4049, 2026, 10, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'192916019.png', CAST(N'2019-11-27 20:29:16.020' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4050, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4051, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4052, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4053, 2026, 5, 1055, 1006, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 55, 0, N'193912921.png', CAST(N'2019-11-25 19:39:12.947' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4054, 2026, 5, 1055, 1006, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 55, 0, N'193912921.png', CAST(N'2019-11-25 19:39:12.947' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4055, 2026, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4056, 2026, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4057, 2026, 10, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'192916019.png', CAST(N'2019-11-27 20:29:16.020' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4058, 2026, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4059, 2026, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4080, 2041, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4081, 2041, 9, 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4082, 2041, 8, 1056, 1003, N'egg', N'dis', NULL, 45, 45, 45, N'202737442.png', CAST(N'2020-10-24 00:27:37.447' AS DateTime), CAST(N'2020-10-24 00:27:37.447' AS DateTime), 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4083, 2041, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4084, 2041, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 0)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4085, 2026, 1015, 1062, 1011, N'Inez Cohen', N'In possimus consect', 2, 623, 819, 2, N'200939018.png', CAST(N'2020-10-17 11:09:39.033' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4086, 2026, 1014, 1057, 1004, N'cat food', N'cat ab', 12, 1222, 1221, 12, N'200952156.png', CAST(N'2020-10-04 15:09:52.163' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4088, 2026, 1020, 1060, 1006, N'Illana Leblanc', N'Et non iure id non ', NULL, 4, 561, 23, N'202234004.png', CAST(N'2020-10-24 00:22:34.010' AS DateTime), CAST(N'2020-10-24 00:22:34.010' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4089, 2026, 1022, 2064, 1003, N'Lucius Hanson', N'Eum ullam saepe quis', 12, 710, 729, 121, N'205641815.png', CAST(N'2020-10-23 23:57:28.827' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4090, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4092, 2026, 8, 1056, 1003, N'egg111', N'dis', NULL, 45, 45, 45, N'205459732.png', CAST(N'2020-10-31 05:54:59.733' AS DateTime), CAST(N'2020-10-31 05:54:59.733' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4093, 2026, 12, 1065, 1004, N'popcorn', N'for  winter moisturizing lotion', NULL, 51, 45, 45, N'195039673.png', CAST(N'2019-12-04 07:50:39.720' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4094, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 43, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4095, 2026, 7, 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 43, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4096, 2026, 8, 1056, 1003, N'egg111', N'dis', NULL, 45, 45, 43, N'205459732.png', CAST(N'2020-10-31 05:54:59.733' AS DateTime), CAST(N'2020-10-31 05:54:59.733' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4097, 2026, 12, 1065, 1004, N'popcorn', N'for  winter moisturizing lotion', NULL, 51, 45, 43, N'195039673.png', CAST(N'2019-12-04 07:50:39.720' AS DateTime), NULL, 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4098, 2026, 1019, 1059, 1011, N'Ivana Hall', N'Sunt nisi accusamus', NULL, 8, 812, 21, N'202123707.png', CAST(N'2020-10-24 00:22:13.767' AS DateTime), CAST(N'2020-10-24 00:22:13.767' AS DateTime), 1, 1)
INSERT [dbo].[AddToCart] ([AddToCart_id], [user_id_], [Product_ID], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [makeorder]) VALUES (4099, 2026, 8, 1056, 1003, N'egg111', N'dis', NULL, 45, 45, 42, N'205459732.png', CAST(N'2020-10-31 05:54:59.733' AS DateTime), CAST(N'2020-10-31 05:54:59.733' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[AddToCart] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1002, N'The Krogerwwwww', 0, CAST(N'2019-11-11 20:21:27.917' AS DateTime), CAST(N'2020-10-06 12:11:16.837' AS DateTime), 1)
INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1003, N'Albertsons', 0, CAST(N'2019-11-11 20:21:28.190' AS DateTime), NULL, 1)
INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1004, N'Royal Ahold Delhaize USA', 0, CAST(N'2019-11-11 20:21:28.447' AS DateTime), NULL, 1)
INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1005, N'Publix Super Markets', 0, CAST(N'2019-11-11 20:21:28.763' AS DateTime), NULL, 1)
INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1006, N'Aldi', 0, CAST(N'2019-11-11 20:21:29.020' AS DateTime), CAST(N'2019-11-27 22:09:31.657' AS DateTime), 1)
INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1007, N'H-E-Butt Grocery', 0, CAST(N'2019-11-11 20:21:29.277' AS DateTime), NULL, 1)
INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1008, N'Whole Foods Market', 0, CAST(N'2019-11-11 20:21:29.537' AS DateTime), NULL, 1)
INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1009, N'Southeastern Grocers', 0, CAST(N'2019-11-11 20:21:29.793' AS DateTime), NULL, 1)
INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1010, N'health', 0, CAST(N'2020-10-11 01:31:08.513' AS DateTime), NULL, 1)
INSERT [dbo].[Brand] ([brand_ID], [brand_name], [brand_code], [create_at], [update_at], [is_active]) VALUES (1011, N'beauty', 0, CAST(N'2020-10-11 01:31:08.930' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1054, N'Branded Foods', N'null', NULL, NULL, CAST(N'2019-11-11 20:16:08.560' AS DateTime), CAST(N'2020-10-04 20:44:03.543' AS DateTime), 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1055, N'Households', N'null', NULL, NULL, CAST(N'2019-11-27 21:39:14.723' AS DateTime), CAST(N'2019-11-27 22:08:29.117' AS DateTime), 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1056, N'Veggies', N'null', NULL, NULL, CAST(N'2019-11-11 20:16:09.157' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1057, N'Fruits', N'null', NULL, NULL, CAST(N'2019-11-11 20:16:09.413' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1058, N'Kitchen', N'null', NULL, NULL, CAST(N'2019-11-11 20:16:09.673' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1059, N'Pet Foods', N'null', NULL, NULL, CAST(N'2019-11-11 20:16:09.930' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1060, N'Frozen Foods', N'null', NULL, NULL, CAST(N'2019-11-11 20:16:10.187' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1061, N'Bakery', N'null', NULL, NULL, CAST(N'2019-11-11 20:16:10.447' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1062, N'Beverages', N'null', NULL, NULL, CAST(N'2019-11-11 20:16:10.703' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1063, N'category1', N'null', NULL, NULL, CAST(N'2019-12-03 23:48:27.413' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1064, N'category2', N'null', NULL, NULL, CAST(N'2019-12-03 23:48:28.120' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1065, N'cat123', N'null', NULL, NULL, CAST(N'2019-12-04 07:49:56.243' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (1066, N'cat213', N'null', NULL, NULL, CAST(N'2019-12-04 07:49:56.570' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (2063, N'cat ab', N'null', NULL, NULL, CAST(N'2020-10-01 07:04:00.303' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (2064, N'cat 123', N'null', NULL, NULL, CAST(N'2020-10-01 07:04:00.817' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (2065, N'health', N'null', NULL, NULL, CAST(N'2020-10-11 01:31:21.507' AS DateTime), NULL, 1)
INSERT [dbo].[Category] ([category_ID], [category_name], [category_disc], [category_code], [img_path], [create_at], [update_at], [is_active]) VALUES (2066, N'beauty', N'null', NULL, NULL, CAST(N'2020-10-11 01:31:21.870' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([Discount_ID], [Discount_Code], [Product_ID], [Category_ID], [Brand_Code], [Upto_percent], [Upto_RS], [Get_One_By_One], [create_at], [update_at], [is_active]) VALUES (16, NULL, NULL, 1054, NULL, NULL, NULL, 1, CAST(N'2019-11-14 22:22:27.547' AS DateTime), NULL, 1)
INSERT [dbo].[Discounts] ([Discount_ID], [Discount_Code], [Product_ID], [Category_ID], [Brand_Code], [Upto_percent], [Upto_RS], [Get_One_By_One], [create_at], [update_at], [is_active]) VALUES (17, NULL, NULL, NULL, 1004, 10, NULL, 0, CAST(N'2019-11-14 22:22:48.930' AS DateTime), NULL, 1)
INSERT [dbo].[Discounts] ([Discount_ID], [Discount_Code], [Product_ID], [Category_ID], [Brand_Code], [Upto_percent], [Upto_RS], [Get_One_By_One], [create_at], [update_at], [is_active]) VALUES (19, NULL, 3, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-24 02:11:43.130' AS DateTime), NULL, 1)
INSERT [dbo].[Discounts] ([Discount_ID], [Discount_Code], [Product_ID], [Category_ID], [Brand_Code], [Upto_percent], [Upto_RS], [Get_One_By_One], [create_at], [update_at], [is_active]) VALUES (20, NULL, 3, NULL, NULL, 50, NULL, 0, CAST(N'2019-12-03 23:49:43.400' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Discounts] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1, 2024, 1055, 5, CAST(N'2020-10-06 01:06:56.560' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2, 2024, 1056, 7, CAST(N'2020-10-06 01:07:06.553' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (3, 2025, 1056, 9, CAST(N'2020-10-06 01:07:13.250' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 1)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (4, 2024, 1055, 5, CAST(N'2020-10-06 01:12:40.010' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (5, 2024, 1056, 7, CAST(N'2020-10-06 01:13:00.750' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (6, 2025, 1056, 9, CAST(N'2020-10-06 01:13:03.730' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 1)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (7, 2024, 1055, 5, CAST(N'2020-10-06 01:13:42.467' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (8, 2024, 1056, 7, CAST(N'2020-10-06 01:13:45.627' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (9, 2025, 1056, 9, CAST(N'2020-10-06 01:13:48.627' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (10, 2024, 1055, 5, CAST(N'2020-10-06 12:20:47.587' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (11, 2024, 1055, 5, CAST(N'2020-10-06 12:20:51.220' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (12, 2024, 1056, 7, CAST(N'2020-10-06 12:20:54.403' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (13, 2025, 1056, 9, CAST(N'2020-10-06 12:20:57.453' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1002, 2024, 1055, 5, CAST(N'2020-10-07 19:25:08.090' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1003, 2024, 1056, 7, CAST(N'2020-10-07 19:25:13.503' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1004, 2025, 1056, 9, CAST(N'2020-10-07 19:25:16.453' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 1)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1005, 2025, 1056, 10, CAST(N'2020-10-07 19:25:19.450' AS DateTime), 45, N'vaslien', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1006, 2025, 1055, 1013, CAST(N'2020-10-07 19:25:22.370' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 1)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1007, 2024, 1057, 1014, CAST(N'2020-10-07 19:25:25.283' AS DateTime), 1221, N'cat food', N'Fruits', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1011, 2024, 1055, 5, CAST(N'2020-10-07 23:20:51.870' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1012, 2024, 1056, 7, CAST(N'2020-10-07 23:20:57.270' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1013, 2025, 1056, 9, CAST(N'2020-10-07 23:21:00.340' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1014, 2025, 1056, 10, CAST(N'2020-10-07 23:21:03.340' AS DateTime), 45, N'vaslien', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1015, 2025, 1055, 1013, CAST(N'2020-10-07 23:21:06.293' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 1)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (1016, 2024, 1057, 1014, CAST(N'2020-10-07 23:21:09.280' AS DateTime), 1221, N'cat food', N'Fruits', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2008, 2024, 1055, 5, CAST(N'2020-10-10 12:07:45.370' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2009, 2024, 1056, 7, CAST(N'2020-10-10 12:07:47.310' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2010, 2025, 1056, 9, CAST(N'2020-10-10 12:07:48.703' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2011, 2025, 1056, 10, CAST(N'2020-10-10 12:07:50.087' AS DateTime), 45, N'vaslien', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2012, 2025, 1055, 1013, CAST(N'2020-10-10 12:07:51.520' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 1)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2013, 2024, 1057, 1014, CAST(N'2020-10-10 12:07:52.937' AS DateTime), 1221, N'cat food', N'Fruits', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2014, 2024, 1056, 7, CAST(N'2020-10-10 13:29:12.223' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2015, 2025, 1056, 9, CAST(N'2020-10-10 13:29:14.273' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2016, 2025, 1055, 1013, CAST(N'2020-10-10 13:29:15.703' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2017, 2024, 1056, 7, CAST(N'2020-10-10 13:29:40.713' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2018, 2025, 1056, 9, CAST(N'2020-10-10 13:29:42.577' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2019, 2025, 1055, 1013, CAST(N'2020-10-10 13:29:43.973' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2020, 2024, 1056, 7, CAST(N'2020-10-10 15:10:45.893' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2021, 2025, 1056, 9, CAST(N'2020-10-10 15:10:47.350' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2022, 2025, 1055, 1013, CAST(N'2020-10-10 15:10:48.770' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2023, 2024, 1056, 7, CAST(N'2020-10-10 15:11:56.037' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2024, 2025, 1056, 9, CAST(N'2020-10-10 15:11:57.490' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2025, 2025, 1055, 1013, CAST(N'2020-10-10 15:11:58.980' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2026, 2024, 1056, 7, CAST(N'2020-10-10 15:15:21.917' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2027, 2025, 1056, 9, CAST(N'2020-10-10 15:15:25.167' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2028, 2025, 1055, 1013, CAST(N'2020-10-10 15:15:26.557' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2029, 2024, 1056, 7, CAST(N'2020-10-10 15:18:49.340' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2030, 2025, 1056, 9, CAST(N'2020-10-10 15:18:50.773' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2031, 2025, 1055, 1013, CAST(N'2020-10-10 15:18:52.150' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2032, 2024, 1056, 7, CAST(N'2020-10-10 15:26:12.787' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2033, 2025, 1056, 9, CAST(N'2020-10-10 15:26:14.767' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2034, 2025, 1055, 1013, CAST(N'2020-10-10 15:26:16.177' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2035, 2024, 1055, 5, CAST(N'2020-10-10 15:27:18.473' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2036, 2024, 1056, 7, CAST(N'2020-10-10 15:27:19.900' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2037, 2025, 1056, 9, CAST(N'2020-10-10 15:27:21.343' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2038, 2025, 1056, 9, CAST(N'2020-10-10 15:27:22.730' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2039, 2025, 2063, 1012, CAST(N'2020-10-10 15:27:24.177' AS DateTime), 1221, N'cat ab', N'cat ab', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 1)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2040, 2024, 1055, 5, CAST(N'2020-10-10 15:27:29.217' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2041, 2024, 1056, 7, CAST(N'2020-10-10 15:27:30.640' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2042, 2025, 1056, 9, CAST(N'2020-10-10 15:27:32.037' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2043, 2025, 1056, 9, CAST(N'2020-10-10 15:27:33.447' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2044, 2025, 2063, 1012, CAST(N'2020-10-10 15:27:34.857' AS DateTime), 1221, N'cat ab', N'cat ab', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2045, 2024, 1055, 5, CAST(N'2020-10-10 15:27:54.903' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2046, 2024, 1056, 7, CAST(N'2020-10-10 15:27:56.317' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2047, 2025, 1056, 9, CAST(N'2020-10-10 15:27:57.753' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2048, 2025, 1056, 9, CAST(N'2020-10-10 15:27:59.237' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2049, 2025, 2063, 1012, CAST(N'2020-10-10 15:28:00.630' AS DateTime), 1221, N'cat ab', N'cat ab', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2050, 2024, 1055, 5, CAST(N'2020-10-10 15:29:37.633' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2051, 2024, 1056, 7, CAST(N'2020-10-10 15:29:39.037' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2052, 2025, 1056, 9, CAST(N'2020-10-10 15:29:40.507' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2053, 2025, 1056, 9, CAST(N'2020-10-10 15:29:41.920' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2054, 2025, 2063, 1012, CAST(N'2020-10-10 15:29:43.340' AS DateTime), 1221, N'cat ab', N'cat ab', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2055, 2024, 1055, 5, CAST(N'2020-10-10 23:35:38.447' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2056, 2024, 1056, 7, CAST(N'2020-10-10 23:35:40.647' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2057, 2025, 1056, 9, CAST(N'2020-10-10 23:35:42.087' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2058, 2025, 2063, 1012, CAST(N'2020-10-10 23:35:43.507' AS DateTime), 1221, N'cat ab', N'cat ab', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2059, 2024, 1055, 5, CAST(N'2020-10-11 00:37:17.590' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2060, 2024, 1056, 7, CAST(N'2020-10-11 00:37:19.170' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2061, 2025, 1056, 9, CAST(N'2020-10-11 00:37:20.710' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2062, 2025, 1056, 10, CAST(N'2020-10-11 00:37:22.177' AS DateTime), 45, N'vaslien', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2063, 2025, 1057, 11, CAST(N'2020-10-11 00:37:23.680' AS DateTime), 55, N'juice', N'Fruits', N'muhammadnomankhalid480@gmail.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2064, 2025, 1057, 11, CAST(N'2020-10-11 00:37:26.400' AS DateTime), 55, N'juice', N'Fruits', N'muhammadnomankhalid480@gmail.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2065, 2025, 1065, 12, CAST(N'2020-10-11 00:37:27.897' AS DateTime), 45, N'popcorn', N'cat123', N'muhammadnomankhalid480@gmail.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2066, 2025, 2063, 1012, CAST(N'2020-10-11 00:37:29.883' AS DateTime), 1221, N'cat ab', N'cat ab', N'muhammadnomankhalid480@gmail.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2067, 2025, 1055, 1013, CAST(N'2020-10-11 00:37:31.313' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2068, 2024, 1057, 1014, CAST(N'2020-10-11 00:37:32.793' AS DateTime), 1221, N'cat food', N'Fruits', N'nowuh@mailinator.com', 2030, N'qywobiwav@mailinator.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2069, 2024, 1055, 5, CAST(N'2020-10-24 07:43:39.277' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2070, 2024, 1056, 7, CAST(N'2020-10-24 07:43:41.823' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2071, 2025, 1056, 8, CAST(N'2020-10-24 07:43:43.267' AS DateTime), 45, N'egg', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2072, 2025, 1056, 9, CAST(N'2020-10-24 07:43:44.737' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2073, 2025, 1056, 9, CAST(N'2020-10-24 07:43:46.177' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2074, 2025, 1056, 10, CAST(N'2020-10-24 07:43:47.643' AS DateTime), 45, N'vaslien', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2075, 2025, 2063, 1012, CAST(N'2020-10-24 07:43:49.117' AS DateTime), 1221, N'cat ab', N'cat ab', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2076, 2025, 1055, 1013, CAST(N'2020-10-24 07:43:50.590' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2077, 2025, 1055, 1013, CAST(N'2020-10-24 07:43:52.030' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2078, 2024, 1055, 5, CAST(N'2020-10-24 07:46:48.697' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2079, 2024, 1056, 7, CAST(N'2020-10-24 07:46:50.210' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2080, 2025, 1056, 8, CAST(N'2020-10-24 07:46:51.657' AS DateTime), 45, N'egg', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2081, 2025, 1056, 9, CAST(N'2020-10-24 07:46:53.093' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
GO
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2082, 2025, 1056, 9, CAST(N'2020-10-24 07:46:54.537' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2083, 2025, 1056, 10, CAST(N'2020-10-24 07:46:56.023' AS DateTime), 45, N'vaslien', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2084, 2025, 2063, 1012, CAST(N'2020-10-24 07:46:57.493' AS DateTime), 1221, N'cat ab', N'cat ab', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2085, 2025, 1055, 1013, CAST(N'2020-10-24 07:46:58.953' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2086, 2025, 1055, 1013, CAST(N'2020-10-24 07:47:00.427' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2087, 2024, 1056, 7, CAST(N'2020-10-24 08:07:04.577' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2088, 2025, 1056, 8, CAST(N'2020-10-24 08:07:06.667' AS DateTime), 45, N'egg', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2089, 2025, 1056, 9, CAST(N'2020-10-24 08:07:08.127' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2090, 2025, 1056, 9, CAST(N'2020-10-24 08:07:09.583' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2091, 2025, 1056, 10, CAST(N'2020-10-24 08:07:11.460' AS DateTime), 45, N'vaslien', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2092, 2025, 2063, 1012, CAST(N'2020-10-24 08:07:12.937' AS DateTime), 1221, N'cat ab', N'cat ab', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2093, 2025, 1055, 1013, CAST(N'2020-10-24 08:07:14.397' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2094, 2025, 1055, 1013, CAST(N'2020-10-24 08:07:15.910' AS DateTime), 1000, N'cat food', N'Households', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2095, 2024, 1055, 5, CAST(N'2020-10-24 10:10:22.103' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2096, 2024, 1055, 5, CAST(N'2020-10-24 10:10:24.717' AS DateTime), 55, N'vaslien', N'Households', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2097, 2024, 1056, 7, CAST(N'2020-10-24 10:10:26.717' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2098, 2024, 1056, 7, CAST(N'2020-10-24 10:10:30.013' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2099, 2024, 1056, 7, CAST(N'2020-10-24 10:10:32.390' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2100, 2024, 1056, 7, CAST(N'2020-10-24 10:10:35.707' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2101, 2024, 1056, 7, CAST(N'2020-10-24 10:10:39.097' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2102, 2024, 1056, 7, CAST(N'2020-10-24 10:10:41.650' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2103, 2024, 1056, 7, CAST(N'2020-10-24 10:10:45.270' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2104, 2024, 1056, 7, CAST(N'2020-10-24 10:10:47.100' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2105, 2025, 1056, 8, CAST(N'2020-10-24 10:35:06.347' AS DateTime), 45, N'egg', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2106, 2025, 1056, 9, CAST(N'2020-10-24 10:35:08.013' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2107, 2025, 1056, 10, CAST(N'2020-10-24 10:35:09.520' AS DateTime), 45, N'vaslien', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2108, 2025, 1056, 8, CAST(N'2020-10-24 11:17:39.910' AS DateTime), 45, N'egg', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2109, 2025, 1056, 9, CAST(N'2020-10-24 11:17:41.493' AS DateTime), 45, N'name', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2110, 2025, 1062, 1015, CAST(N'2020-10-31 22:37:46.357' AS DateTime), 819, N'Inez Cohen', N'Beverages', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2111, 2024, 1057, 1014, CAST(N'2020-10-31 22:38:50.627' AS DateTime), 1221, N'cat food', N'Fruits', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2112, 2025, 1060, 1020, CAST(N'2020-10-31 22:38:56.473' AS DateTime), 561, N'Illana Leblanc', N'Frozen Foods', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2113, 2025, 2064, 1022, CAST(N'2020-10-31 22:39:02.377' AS DateTime), 729, N'Lucius Hanson', N'cat 123', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2114, 2024, 1056, 7, CAST(N'2020-10-31 22:43:00.760' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2115, 2025, 1056, 8, CAST(N'2020-10-31 22:43:06.793' AS DateTime), 45, N'egg111', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2116, 2025, 1065, 12, CAST(N'2020-10-31 22:43:14.953' AS DateTime), 45, N'popcorn', N'cat123', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2117, 2024, 1056, 7, CAST(N'2020-10-31 23:21:22.680' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2118, 2024, 1056, 7, CAST(N'2020-10-31 23:21:24.673' AS DateTime), 45, N'vaslien', N'Veggies', N'nowuh@mailinator.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2119, 2025, 1056, 8, CAST(N'2020-10-31 23:21:26.213' AS DateTime), 45, N'egg111', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2120, 2025, 1065, 12, CAST(N'2020-10-31 23:21:27.730' AS DateTime), 45, N'popcorn', N'cat123', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2121, 2025, 1059, 1019, CAST(N'2020-10-31 23:21:29.250' AS DateTime), 812, N'Ivana Hall', N'Pet Foods', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
INSERT [dbo].[orders] ([orderID], [venderid], [categoryid], [productsid], [createAt], [productsAmount], [prductsname], [categoryname], [venderoname], [customerid], [customernam], [isDispatch]) VALUES (2122, 2025, 1056, 8, CAST(N'2020-11-01 00:28:11.170' AS DateTime), 45, N'egg111', N'Veggies', N'muhammadnomankhalid480@gmail.com', 2026, N'technicalghori@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[Payement_Type] ON 

INSERT [dbo].[Payement_Type] ([Pay_Type_ID], [Pay_Type], [Create_at], [Update_at], [is_active]) VALUES (1, N'cheque', NULL, NULL, 1)
INSERT [dbo].[Payement_Type] ([Pay_Type_ID], [Pay_Type], [Create_at], [Update_at], [is_active]) VALUES (2, N'cash', NULL, NULL, 1)
INSERT [dbo].[Payement_Type] ([Pay_Type_ID], [Pay_Type], [Create_at], [Update_at], [is_active]) VALUES (3, N'card', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Payement_Type] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (3, 2024, N'nowuh@mailinator.com', 1055, 1006, N'pepsi', N'ramdan offer', NULL, 51, 80, 62, N'190532344.png', CAST(N'2019-12-02 22:05:32.350' AS DateTime), CAST(N'2019-12-02 22:05:32.350' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (4, 2024, N'nowuh@mailinator.com', 1056, 1004, N'popcorn', N'new dis', NULL, 500, 750, 5, N'195156868.png', CAST(N'2019-12-02 21:51:56.887' AS DateTime), CAST(N'2019-12-02 21:51:56.887' AS DateTime), 0, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (5, 2024, N'nowuh@mailinator.com', 1055, 1006, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 55, 0, N'193912921.png', CAST(N'2019-11-25 19:39:12.947' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (7, 2024, N'nowuh@mailinator.com', 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 41, N'190629538.png', CAST(N'2019-11-27 00:06:29.543' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (8, 2025, N'muhammadnomankhalid480@gmail.com', 1056, 1003, N'egg111', N'dis', NULL, 45, 45, 41, N'205459732.png', CAST(N'2020-10-31 05:54:59.733' AS DateTime), CAST(N'2020-10-31 05:54:59.733' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (9, 2025, N'muhammadnomankhalid480@gmail.com', 1056, 1003, N'name', N'dis', NULL, 51, 45, 45, N'190149747.jpg', CAST(N'2019-11-27 20:01:49.750' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (10, 2025, N'muhammadnomankhalid480@gmail.com', 1056, 1004, N'vaslien', N'for  winter moisturizing lotion', NULL, 45, 45, 45, N'192916019.png', CAST(N'2019-11-27 20:29:16.020' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (11, 2025, N'muhammadnomankhalid480@gmail.com', 1057, 1006, N'juice', N'suger free', NULL, 45, 55, 45, N'190850461.png', CAST(N'2019-11-29 01:08:50.467' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (12, 2025, N'muhammadnomankhalid480@gmail.com', 1065, 1004, N'popcorn', N'for  winter moisturizing lotion', NULL, 51, 45, 42, N'195039673.png', CAST(N'2019-12-04 07:50:39.720' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1012, 2025, N'muhammadnomankhalid480@gmail.com', 2063, 1002, N'cat ab', N'cat ab', 12, 1222, 1221, 12, N'200624830.png', CAST(N'2020-10-01 07:06:24.853' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1013, 2025, N'muhammadnomankhalid480@gmail.com', 1055, 1003, N'cat food', N'for healthy cat', 12, 1222, 1000, 12, N'204151955.png', CAST(N'2020-10-04 14:43:35.977' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1014, 2024, N'nowuh@mailinator.com', 1057, 1004, N'cat food', N'cat ab', 12, 1222, 1221, 11, N'200952156.png', CAST(N'2020-10-04 15:09:52.163' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1015, 2025, N'muhammadnomankhalid480@gmail.com', 1062, 1011, N'Inez Cohen', N'In possimus consect', 2, 623, 819, 1, N'200939018.png', CAST(N'2020-10-17 11:09:39.033' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1019, 2025, N'muhammadnomankhalid480@gmail.com', 1059, 1011, N'Ivana Hall', N'Sunt nisi accusamus', NULL, 8, 812, 20, N'202123707.png', CAST(N'2020-10-24 00:22:13.767' AS DateTime), CAST(N'2020-10-24 00:22:13.767' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1020, 2025, N'muhammadnomankhalid480@gmail.com', 1060, 1006, N'Illana Leblanc', N'Et non iure id non ', NULL, 4, 561, 22, N'202234004.png', CAST(N'2020-10-24 00:22:34.010' AS DateTime), CAST(N'2020-10-24 00:22:34.010' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1021, 2025, N'muhammadnomankhalid480@gmail.com', 2063, 1007, N'Jada Howe', N'Reiciendis ipsam qui', 11, 870, 58, 121, N'204910235.png', CAST(N'2020-10-23 23:50:56.537' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1022, 2025, N'muhammadnomankhalid480@gmail.com', 2064, 1003, N'Lucius Hanson', N'Eum ullam saepe quis', 12, 710, 729, 120, N'205641815.png', CAST(N'2020-10-23 23:57:28.827' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1023, 2025, N'muhammadnomankhalid480@gmail.com', 1060, 1006, N'Herman Carter', N'Exercitationem dicta', 12, 976, 79, 121, N'202544614.jpg', CAST(N'2020-10-24 00:27:13.343' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1024, 2025, N'muhammadnomankhalid480@gmail.com', 1060, 1004, N'Maryam Peck', N'Dolore autem ipsum p', 12, 337, 523, 121, N'202805003.png', CAST(N'2020-10-24 00:28:05.007' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [sellorID], [sellorName], [category_ID], [brand_ID], [Product_name], [Product_disc], [Product_code], [whole_sale_price], [retail_price], [stock], [imgPath], [create_at], [update_at], [is_active], [is_deleted]) VALUES (1025, 2025, N'muhammadnomankhalid480@gmail.com', 1063, 1003, N'Azalia Hodges', N'Tempor veniam susci', 21, 322, 805, 213, N'201214157.jpg', CAST(N'2020-10-31 02:12:14.423' AS DateTime), NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[userRoles] ON 

INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (1, N'vendor')
INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (2, N' update')
INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (3, N'delete')
INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (4, N'customer')
INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (5, N'add')
INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (6, N'update/delete')
INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (7, N'add/update')
INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (8, N'add/delete')
INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (9, N'add/update/delete')
INSERT [dbo].[userRoles] ([role_ID], [role_name]) VALUES (1009, N'admin')
SET IDENTITY_INSERT [dbo].[userRoles] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (1, N'noman', N'khan', N'nhr146@gmail.com', N'admin123', NULL, NULL, NULL, NULL, N'03158684507', NULL, NULL, NULL, 1009, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (3, N'marin', N'khan', N'mairn@gmail.com', N'admin321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1009, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (4, N'noman', N'khan', N'online123@gmail.com', N'ljdflsj', NULL, NULL, NULL, NULL, N'334', 1234123, 6464, NULL, 4, CAST(N'2019-11-06 22:11:12.967' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (5, N'jhone', N'doe', N'doe@gmail.com', N'sdlfjjd', NULL, NULL, NULL, NULL, N'6465456', 64646, 6464, NULL, 4, CAST(N'2019-11-06 22:17:00.500' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (6, N'noor', N'hassan', N'noor@yahoo.com', N'lsjdflsjdf', NULL, NULL, NULL, NULL, N'465646', 464646, 644646, NULL, 4, CAST(N'2019-11-06 22:48:33.610' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (7, N'customer!', N'abs', N'cust@gmail.com', N'lsdjfljs', NULL, NULL, NULL, NULL, N'03158684507', 46464646, 6464646, NULL, 4, CAST(N'2019-11-08 03:04:43.953' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (9, N'customer!', N'abc', N'cust1@gmail.com', N'644456', NULL, NULL, NULL, NULL, N'0315456456', 4545454, 466464, NULL, 4, CAST(N'2019-11-08 03:11:50.360' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (10, N'customer2', N'abd', N'cust2@gmail.com', N'64645646', NULL, NULL, NULL, NULL, N'54664565', 44646465, 64646, NULL, 4, CAST(N'2019-11-08 03:15:14.700' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (11, N'haider', N'khan', N'haider@gmail.com', N'fsfsfs313123123', NULL, NULL, NULL, NULL, N'654654654', 45644, 646464654, NULL, 4, CAST(N'2019-11-10 05:35:12.830' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (12, N'khan', N'imran', N'user@gmail.com', N'564545', NULL, NULL, NULL, NULL, N'', 0, 0, NULL, 2, CAST(N'2019-11-29 20:37:44.783' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (13, N'df', N'dsfsd', N'online@gmail.com', N'ljdflsj', NULL, NULL, NULL, NULL, N'', 0, 0, NULL, 5, CAST(N'2019-11-29 21:11:40.350' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (14, N'-----------', N'------------', N'add@gmail.com', N'sldjfl', NULL, NULL, NULL, NULL, N'null', 0, 0, NULL, 5, CAST(N'2019-11-29 21:48:37.933' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (15, N'-----------', N'------------', N'update@gmail.com', N'31313', NULL, NULL, NULL, NULL, N'null', 0, 0, NULL, 2, CAST(N'2019-11-29 21:49:02.507' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (16, N'-----------', N'------------', N'delete@gmail.com', N'ldfjs', NULL, NULL, NULL, NULL, N'null', 0, 0, NULL, 3, CAST(N'2019-11-29 21:49:16.243' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (17, N'-----------', N'------------', N'update/delete@gmail.com', N'dlfjljds', NULL, NULL, NULL, NULL, N'null', 0, 0, NULL, 6, CAST(N'2019-11-29 21:49:43.267' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (18, N'-----------', N'------------', N'add/update@gmail.com', N'sdfljsdlf', NULL, NULL, NULL, NULL, N'null', 0, 0, NULL, 7, CAST(N'2019-11-29 21:50:15.383' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (19, N'-----------', N'------------', N'add/delete@gmail.com', N'dsljfljdsf', NULL, NULL, NULL, NULL, N'null', 0, 0, NULL, 8, CAST(N'2019-11-29 21:51:35.627' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (20, N'-----------', N'------------', N'add/update/delete@gmail.com', N'ldfjlsfls', NULL, NULL, NULL, NULL, N'null', 0, 0, NULL, 9, CAST(N'2019-11-29 21:53:54.350' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (21, N'customer2', N'doe', N'cust3@gmail.com', N'sfdsf', NULL, NULL, NULL, NULL, N'6465456', 44446431, 3131313, NULL, 4, CAST(N'2019-11-29 21:55:13.250' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (1014, N'noman', N'khan', N'n@gmail.com', N'123456', NULL, NULL, NULL, NULL, N'23432432432', 234234324, 234324234, NULL, 4, CAST(N'2020-09-29 07:46:54.800' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2014, N'not req', N'not req', N'online111@gmail.com', N'1234567', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 4, CAST(N'2020-10-01 20:34:52.237' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2015, N'noman', N'khan', N'superadmin@gtr.com', N'123456', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 1, CAST(N'2020-10-01 20:47:16.803' AS DateTime), NULL, 0, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', N'shop 1')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2016, N'noman', N'khan', N'sss@gmail.com', N'dsfsdf', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 4, CAST(N'2020-10-02 06:47:09.873' AS DateTime), NULL, 1, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', N'shop2')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2017, N'noman', N'khan', N'ssselor@gmail.com', N'jgjgjgjh', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 1, CAST(N'2020-10-02 06:53:15.623' AS DateTime), NULL, 0, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', N'shop3')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2018, N'noman', N'khan', N'superadmin@viftech.com.pk', N'dfssdfs', NULL, NULL, NULL, NULL, N'sdfsdfsdfs', 1234123, 6464, NULL, 1, CAST(N'2020-10-02 07:06:15.213' AS DateTime), NULL, 0, N'8832 Ohio St. Inner Nunavut, NU X0C 0N8', N'shop4')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2019, N'noman', N'khan', N'sssdfsdfs@gmail.com', N'sdfsdf', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 1, CAST(N'2020-10-02 07:09:14.737' AS DateTime), NULL, 1, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', N'shop5')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2020, N'noman', N'khan', N'sssdfsdfs3s@gmail.com', N'sdfsdf', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 4, CAST(N'2020-10-02 07:58:37.940' AS DateTime), NULL, 1, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2021, N'noman', N'khan', N'sssdfdsfsdfs@gmail.com', N'sdfsdf', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 1, CAST(N'2020-10-02 08:14:40.590' AS DateTime), NULL, 0, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', N'shop6')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2022, N'noman', N'khan', N'ss12sdfdsfsdfs@gmail.com', N'asdasd', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 1, CAST(N'2020-10-02 08:19:56.163' AS DateTime), NULL, 0, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', N'shop7')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2023, N'Mariam', N'Cross', N'saworo@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'35345345345', 1234123, 6464, NULL, 1, CAST(N'2020-10-02 21:11:11.580' AS DateTime), NULL, 0, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', N'shop8')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2024, N'Tamara', N'Johns', N'nowuh@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'344535334534', 1234123, 6464, NULL, 1, CAST(N'2020-10-03 09:51:29.887' AS DateTime), NULL, 1, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', N'shop9')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2025, N'vendor ', N'one', N'muhammadnomankhalid480@gmail.com', N'123456', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 1, CAST(N'2020-10-03 14:30:37.127' AS DateTime), NULL, 1, N'8832 Ohio St. Inner Nunavut, NU X0C 0N8', N'shop10')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2026, N'Hilel', N'Guerra', N'technicalghori@gmail.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 4, CAST(N'2020-10-03 16:40:55.730' AS DateTime), NULL, 1, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2027, N'Nelle', N'Chandler', N'nuvemyzu@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, NULL, 1234123, 6464, NULL, 1, CAST(N'2020-10-10 22:38:31.517' AS DateTime), NULL, 0, N'34 W. Wild Horse Dr. Listowel, ON N4W 2A6', N'Ira Rodgers')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2028, N'Rose', N'Bryan', N'nuvemyzu11@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, NULL, 1234123, 6464, NULL, 1, CAST(N'2020-10-10 22:49:55.500' AS DateTime), NULL, 0, N'Adipisicing eos mai', N'Daniel Spence')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2029, N'Zane', N'Cox', N'qaxevo@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'Aute voluptas odit e', 1234123, 6464, NULL, 4, CAST(N'2020-10-10 23:53:02.033' AS DateTime), NULL, 1, N'Temporibus quia labo', NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2030, N'Fiona', N'Stanley', N'qywobiwav@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'23432432432', 1234123, 6464, NULL, 4, CAST(N'2020-10-11 00:10:07.670' AS DateTime), NULL, 1, N'Odit proident beata', NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2031, N'Kasimir', N'Becker', N'kiqawijely@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'Molestias in rerum n', 1234123, 6464, NULL, 1, CAST(N'2020-10-23 22:46:03.077' AS DateTime), NULL, 1, N'Voluptas deleniti do house # 5555 canada', N'Daniel Reeves shop')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2032, N'Regan', N'Mullen', N'tulu@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'234234324234', 1234123, 6464, NULL, 1, CAST(N'2020-10-23 22:49:40.707' AS DateTime), NULL, 0, N'Dolore harum volupta ', N'May Horton')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2033, N'Remedios', N'Cardenas', N'fuvetirof@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'234234234234', 1234123, 6464, NULL, 1, CAST(N'2020-10-23 23:05:17.313' AS DateTime), NULL, 0, N'Corporis id omnis nu', N'Raya Barnett')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2034, N'Hamilton', N'Reynolds', N'zutubomiq@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'21321321323', 1234123, 6464, NULL, 1, CAST(N'2020-10-30 23:38:21.927' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Mary Hall')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2035, N'Hillary', N'Mooney', N'niwel@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'324324324324', 1234123, 6464, NULL, 1, CAST(N'2020-10-30 23:47:54.590' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Wesley Bender')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2036, N'Dieter', N'Fitzgerald', N'sufozanyf@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'34234324', 1234123, 6464, NULL, 1, CAST(N'2020-10-31 00:01:56.993' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Alana Lindsey')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2037, N'Pearl', N'Nixon', N'ranykox@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'23432423423432', 1234123, 6464, NULL, 1, CAST(N'2020-10-31 00:13:39.820' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Ignacia Johnson')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2038, N'Sigourney', N'Parks', N'mulakume@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'232131231231', 1234123, 6464, NULL, 1, CAST(N'2020-10-31 00:19:55.520' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Jordan Wood')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2039, N'Hayes', N'Montgomery', N'qoxir@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'233424324', 1234123, 6464, NULL, 1, CAST(N'2020-10-31 00:26:11.627' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Clinton Guy')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2040, N'Graiden', N'Mason', N'netyxy@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'234234324234', 1234123, 6464, NULL, 1, CAST(N'2020-10-31 00:33:53.593' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Rebekah Mejia')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2041, N'Fatima', N'Chandler', N'makivuso@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'324324324', 1234123, 6464, NULL, 1, CAST(N'2020-10-31 00:40:54.373' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Gisela Heath')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2042, N'Jaime', N'Mccarty', N'zuwul@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'234234324234', 1234123, 6464, NULL, 1, CAST(N'2020-10-31 00:51:40.370' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Chantale Powers')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2043, N'Ivor', N'Randall', N'vehyzizeh@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'3453534', 1234123, 6464, NULL, 4, CAST(N'2020-11-01 00:53:02.330' AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2044, N'Forrest', N'Glover', N'symeharery@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'324234234324', 1234123, 6464, NULL, 1, CAST(N'2020-11-01 00:55:29.153' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Lance Holland')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2045, N'Chantale', N'Durham', N'qywu@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'324234', 1234123, 6464, NULL, 1, CAST(N'2020-11-01 00:57:47.413' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'sdfsdfsdf')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (2046, N'Merrill', N'Berg', N'xyjovy@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'324324', 1234123, 6464, NULL, 1, CAST(N'2020-11-01 01:01:36.530' AS DateTime), NULL, 0, N'Dolore dolore ea id ', N'Ignacia Holland')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (3034, N'Rae', N'Lane', N'figo@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'646465', 1234123, 6464, NULL, 4, CAST(N'2020-11-01 01:46:20.403' AS DateTime), NULL, 1, N'Dolores et iusto aut', NULL)
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (3035, N'Walter', N'Bentley', N'faqelipor@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'24332432423', 1234123, 6464, NULL, 1, CAST(N'2020-11-01 01:48:11.153' AS DateTime), NULL, 0, N'Voluptas deleniti do house # 5555 canada', N'Jayme Salazar')
INSERT [dbo].[users] ([userID], [first_name], [last_name], [email], [password], [City_ID], [State_ID], [Country_ID], [Home_phone], [Mobile], [Credit_card_number], [Credit_card_expiry], [img_path], [role_ID], [create_at], [update_at], [is_active], [Address], [shopname]) VALUES (3036, N'Emily', N'Joseph', N'rygid@mailinator.com', N'Pa$$w0rd!', NULL, NULL, NULL, NULL, N'324324432', 1234123, 6464, NULL, 4, CAST(N'2020-11-01 01:48:41.590' AS DateTime), NULL, 1, N'Aspernatur possimus', NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Brand] FOREIGN KEY([Brand_Code])
REFERENCES [dbo].[Brand] ([brand_ID])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Brand]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([category_ID])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Category]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_ID])
REFERENCES [dbo].[Brand] ([brand_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_ID])
REFERENCES [dbo].[Category] ([category_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[statement]  WITH CHECK ADD  CONSTRAINT [FK_statement_Payement_Type] FOREIGN KEY([Pay_Type_ID])
REFERENCES [dbo].[Payement_Type] ([Pay_Type_ID])
GO
ALTER TABLE [dbo].[statement] CHECK CONSTRAINT [FK_statement_Payement_Type]
GO
ALTER TABLE [dbo].[statement]  WITH CHECK ADD  CONSTRAINT [FK_statement_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[statement] CHECK CONSTRAINT [FK_statement_Product]
GO
ALTER TABLE [dbo].[statement]  WITH CHECK ADD  CONSTRAINT [FK_statement_users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[statement] CHECK CONSTRAINT [FK_statement_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_userRoles] FOREIGN KEY([role_ID])
REFERENCES [dbo].[userRoles] ([role_ID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_userRoles]
GO
/****** Object:  StoredProcedure [dbo].[ActiveProducts]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ActiveProducts]
  (
   @id INTEGER 
  
 
    )
 
AS  
  
  
UPDATE  [Product]  SET  
[Product].is_active = 1
WHERE [Product].Product_ID  = @id


GO
/****** Object:  StoredProcedure [dbo].[ActiveVendor]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ActiveVendor]
  (
   @id INTEGER 
  
 
    )
 
AS  
  
  
UPDATE  users  SET  
users.is_active = 1 
WHERE users.userID  = @id


GO
/****** Object:  StoredProcedure [dbo].[completeOrder]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[completeOrder]
(
   @vendrid INTEGER ,
   @orderid int
  
 
    )
 
AS  

update orders set isDispatch = 1 where venderid  = @vendrid and orderID = @orderid
GO
/****** Object:  StoredProcedure [dbo].[customerDetails]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[customerDetails]
(
   @id INTEGER 
  
 
    )
 
AS  
select * from users where userID = @id 
GO
/****** Object:  StoredProcedure [dbo].[deletCart]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[deletCart]
(  

   @Product_ID INTEGER  
     
)  
AS  
  
DELETE FROM 
AddToCart WHERE 
AddToCart_id=@Product_ID

GO
/****** Object:  StoredProcedure [dbo].[deleteproducts]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[deleteproducts]
  (
   @id INTEGER 
  
 
    )
 
AS  
  
  
UPDATE  Product  SET  
product.is_deleted = 1 
WHERE Product.Product_ID = @id

GO
/****** Object:  StoredProcedure [dbo].[InActiveProducts]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InActiveProducts]
  (
   @id INTEGER 
  
 
    )
 
AS  
  
  
UPDATE  [Product]  SET  
[Product].is_active = 0 
WHERE [Product].Product_ID  = @id


GO
/****** Object:  StoredProcedure [dbo].[InActiveVendor]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InActiveVendor]
  (
   @id INTEGER 
  
 
    )
 
AS  
  
  
UPDATE  users  SET  
users.is_active = 0 
WHERE users.userID  = @id


GO
/****** Object:  StoredProcedure [dbo].[makeorder]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[makeorder]
  (
   @id INTEGER 
  
 
    )
 
AS  
  
UPDATE  AddToCart  SET  
AddToCart.makeorder = 1 
WHERE AddToCart.user_id_  = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_ActiveProductsAgainstVendorID]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_ActiveProductsAgainstVendorID] 
@isActive bit,
@sellorID int
 AS  

SELECT p.Product_ID,p.sellorID,p.sellorName,p.is_active,p.retail_price,p.Product_disc,p.stock,p.whole_sale_price,p.imgPath,p.Product_name,br.brand_name,br.brand_ID,c.category_ID,c.category_name   
FROM Brand br
INNER JOIN Product p
    on p.brand_ID = br.brand_ID
INNER JOIN Category c
    on p.category_ID = c.category_ID
	where p.is_active = @isActive and p.sellorID = @sellorID and p.is_deleted  = 0
GO
/****** Object:  StoredProcedure [dbo].[sp_CategryVisProducts]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_CategryVisProducts]
(
   @id INTEGER 
  
 
    )
 
AS  

SELECT p.Product_ID,p.is_active,p.sellorID,p.sellorName, p.retail_price,p.Product_disc,p.stock,p.whole_sale_price,p.imgPath,p.Product_name,br.brand_name,br.brand_ID,c.category_ID,c.category_name   
FROM Brand br
INNER JOIN Product p
    on p.brand_ID = br.brand_ID
INNER JOIN Category c
    on p.category_ID = c.category_ID
	where p.category_ID = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_CategryVisProductsForVendor]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_CategryVisProductsForVendor]
(
   @id INTEGER 
  ,@cetegoryID INT
 
    )
 
AS  

SELECT p.Product_ID,p.is_active,p.sellorID,p.sellorName, p.retail_price,p.Product_disc,p.stock,p.whole_sale_price,p.imgPath,p.Product_name,br.brand_name,br.brand_ID,c.category_ID,c.category_name   
FROM Brand br
INNER JOIN Product p
    on p.brand_ID = br.brand_ID
INNER JOIN Category c
    on p.category_ID = c.category_ID
	where p.category_ID = @id AND P.category_ID = @cetegoryID
GO
/****** Object:  StoredProcedure [dbo].[sp_CountofTotalCategory]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[sp_CountofTotalCategory]
@idAdmin bit,
@id int
AS  

   IF @idAdmin = 1
    BEGIN
        
  SELECT  COUNT(Categoryid) countt,  categoryname 
  FROM orders
  GROUP BY categoryname

    END
    ELSE
    BEGIN
        
  SELECT  COUNT(Categoryid) countt,  categoryname 
  FROM orders
  where venderid = @id
  GROUP BY categoryname

    END

GO
/****** Object:  StoredProcedure [dbo].[sp_CountofTotalProducts]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[sp_CountofTotalProducts] 
@idAdmin bit,
@id int
AS  

   IF @idAdmin = 1
    BEGIN
        
  SELECT  COUNT(productsid) countt,  prductsname 
  FROM orders
  GROUP BY prductsname


    END
    ELSE
    BEGIN
        
   SELECT  COUNT(productsid) countt,  prductsname 
  FROM orders
  where venderid = @id
  GROUP BY prductsname

    END

GO
/****** Object:  StoredProcedure [dbo].[sp_CountofTotalVendor]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_CountofTotalVendor]

AS  

SELECT  COUNT(venderid) countt,  venderid 
  FROM orders
  GROUP BY venderid
GO
/****** Object:  StoredProcedure [dbo].[sp_Products]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_Products]
(
   @id INTEGER 
  
 
    )
 
AS  

SELECT p.Product_ID,p.is_active,p.retail_price,p.Product_disc,p.stock,p.whole_sale_price,p.imgPath,p.Product_name,br.brand_name,br.brand_ID,c.category_ID,c.category_name   
FROM Brand br
INNER JOIN Product p
    on p.brand_ID = br.brand_ID
INNER JOIN Category c
    on p.category_ID = c.category_ID
	where p.sellorID = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductsAll]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_ProductsAll] 
@isActive bit
 AS  

SELECT p.Product_ID,p.sellorID,p.sellorName,p.is_active,p.retail_price,p.Product_disc,p.stock,p.whole_sale_price,p.imgPath,p.Product_name,br.brand_name,br.brand_ID,c.category_ID,c.category_name   
FROM Brand br
INNER JOIN Product p
    on p.brand_ID = br.brand_ID
INNER JOIN Category c
    on p.category_ID = c.category_ID
	where p.is_active = @isActive
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductsAll_]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_ProductsAll_]
 
AS  

SELECT p.Product_ID,p.is_active,p.sellorID,p.sellorName,p.retail_price,p.Product_disc,p.stock,p.whole_sale_price,p.imgPath,p.Product_name,br.brand_name,br.brand_ID,c.category_ID,c.category_name   
FROM Brand br
INNER JOIN Product p
    on p.brand_ID = br.brand_ID
INNER JOIN Category c
    on p.category_ID = c.category_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_sellAcctoCategory]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_sellAcctoCategory]

AS  

SELECT   SUM(productsAmount) countt,  categoryname 
  FROM orders
  GROUP BY categoryname
GO
/****** Object:  StoredProcedure [dbo].[sp_sellAcctocategoryforVender]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_sellAcctocategoryforVender]
@id int
AS  

  SELECT   SUM(productsAmount) countt,  categoryname 
  FROM orders
  where venderid =@id
  GROUP BY categoryname
GO
/****** Object:  StoredProcedure [dbo].[sp_sellAcctoproducts]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_sellAcctoproducts]

AS  

   SELECT   SUM(productsAmount) countt,  prductsname 
  FROM orders
  GROUP BY prductsname
GO
/****** Object:  StoredProcedure [dbo].[sp_sellAcctoproductsforVender]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_sellAcctoproductsforVender]
@id int
AS  

  SELECT   SUM(productsAmount) countt,  prductsname 
  FROM orders
  where venderid =@id
  GROUP BY prductsname
GO
/****** Object:  StoredProcedure [dbo].[sp_sellAcctoVendor]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  PROCEDURE [dbo].[sp_sellAcctoVendor]

AS  
SELECT  SUM(productsAmount) countt,  venderid 
  FROM orders
  GROUP BY venderid
GO
/****** Object:  StoredProcedure [dbo].[sp_sellAcctoVendorforVender]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  PROCEDURE [dbo].[sp_sellAcctoVendorforVender]
@id int
AS  

SELECT  SUM(productsAmount) countt,  [venderoname] 
  FROM orders
  where venderid =@id
  GROUP BY [venderoname]
GO
/****** Object:  StoredProcedure [dbo].[sp_updateProduct]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_updateProduct]  
(  



   @Product_ID INTEGER,  
   @category_ID INTEGER,  
   @brand_ID INTEGER,  
   @Product_name varchar(50),  
   @Product_disc VARCHAR(100),  
   @whole_sale_price INTEGER,
   @Product_code INTEGER, 
   @retail_price INTEGER,  
   @stock INTEGER,  
   @imgPath VARCHAR(2000),  
   @create_at datetime,  
   @update_at datetime,  
   @is_active bit 

    
)  
AS  
  
UPDATE  Product  SET  
product.brand_ID=@brand_ID,
product.category_ID=@category_ID,
Product.Product_name = @Product_name, 
Product.Product_disc  = @Product_disc,
Product.Product_code  = @Product_code,  
Product.whole_sale_price  = @whole_sale_price,  
Product.retail_price = @retail_price, 
Product.stock  = @stock,
Product.imgPath  = @imgPath,  
Product.create_at  = @create_at , 
Product.update_at = @update_at, 
Product.is_active  = @is_active
WHERE Product.Product_ID  = @Product_ID

GO
/****** Object:  StoredProcedure [dbo].[sp_VendorVisProducts]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[sp_VendorVisProducts]
(
   @id INTEGER 
  
 
    )
 
AS  

SELECT p.Product_ID,p.is_active,p.sellorID,p.sellorName, p.retail_price,p.Product_disc,p.stock,p.whole_sale_price,p.imgPath,p.Product_name,br.brand_name,br.brand_ID,c.category_ID,c.category_name   
FROM Brand br
INNER JOIN Product p
    on p.brand_ID = br.brand_ID
INNER JOIN Category c
    on p.category_ID = c.category_ID
	where p.sellorID = @id
GO
/****** Object:  StoredProcedure [dbo].[update_brand]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_brand]
  (
   @brand_ID1 INTEGER,  
   @brand_name varchar(50),  
   @update_at1 datetime 
 
    )
 
AS  
  
UPDATE  Brand  SET  
Brand.brand_name=@brand_name,
Brand.update_at = @update_at1 
WHERE Brand.brand_ID  = @brand_ID1


GO
/****** Object:  StoredProcedure [dbo].[update_category]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_category]
  (
   @category_ID1 INTEGER,  
   @category1_name varchar(50),  
   @update_at1 datetime 
 
    )
 
AS  
  
UPDATE  Category  SET  
Category.category_name=@category1_name,
Category.update_at = @update_at1 
WHERE Category.category_ID  = @category_ID1


GO
/****** Object:  StoredProcedure [dbo].[updatStock]    Script Date: 11/1/2020 1:07:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[updatStock]
  (
   @id INTEGER ,
   @stock int
  
 
    )
 
AS  
  
UPDATE  [Product]  SET  
[Product].stock = @stock 
WHERE [Product].Product_ID  = @id

GO
USE [master]
GO
ALTER DATABASE [online_superMarket_system] SET  READ_WRITE 
GO
