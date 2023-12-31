USE [master]
GO

CREATE DATABASE [QuanLyMiKho]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyMiKho', FILENAME = N'C:\Program Files\Microsoft SQL Server\DESKTOP-POAB7IJ\LENOVO\DATA\QuanLyMiKho.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyMiKho_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\DESKTOP-POAB7IJ\LENOVO\DATA\QuanLyMiKho_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyMiKho] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyMiKho].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyMiKho] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyMiKho] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyMiKho] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyMiKho] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyMiKho] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyMiKho] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyMiKho] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyMiKho] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyMiKho] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyMiKho] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyMiKho] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyMiKho] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyMiKho]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](1000) NOT NULL DEFAULT ((0)),
	[Type] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[type] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL DEFAULT (getdate()),
	[DateCheckOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL DEFAULT ((0)),
	[discount] [int] NULL,
	[totalPrice] [float] NULL,
	[idemployees] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctpn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma_PN] [int] NOT NULL,
	[Ma_SP] [int] NOT NULL,
	[SL] [int] NOT NULL,
	[DVT] [nvarchar](50) NOT NULL,
	[DonGia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[gender] [nvarchar](10) NULL,
	[position] [int] NULL,
	[sdt] [varchar](20) NULL,
	[dayin] [date] NULL,
	[totaltime] [int] NULL,
	[totalsalary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Chưa đặt tên'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[masp] [int] IDENTITY(1,1) NOT NULL,
	[tensp] [nvarchar](50) NOT NULL,
	[dvt] [nvarchar](20) NULL,
	[sl] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[mapn] [int] IDENTITY(1,1) NOT NULL,
	[idnhanvien] [int] NULL,
	[ngaynhap] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[mapn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Bàn chưa có tên'),
	[status] [nvarchar](100) NOT NULL DEFAULT (N'Trống'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [UserName], chuhien[DisplayName], [PassWord], [Type]) VALUES (5, N'phamchau', N'P.Châu', N'123', 1)
INSERT [dbo].[Account] ([id], [UserName], [DisplayName], [PassWord], [Type]) VALUES (6, N'tranyen', N'T.Yến', N'123', 0)
INSERT [dbo].[Account] ([id], [UserName], [DisplayName], [PassWord], [Type]) VALUES (7, N'lehuy', N'T.Huy', N'123', 0)
INSERT [dbo].[Account] ([id], [UserName], [DisplayName], [PassWord], [Type]) VALUES (8, N'', N'C.Hiền', N'123', 1)
INSERT [dbo].[Account] ([id], [UserName], [DisplayName], [PassWord], [Type]) VALUES (12, N'hoangduyen', N'H.Duyên', N'123', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[AccountType] ([type], [name]) VALUES (0, N'Nhân viên')
INSERT [dbo].[AccountType] ([type], [name]) VALUES (1, N'Quản lý')
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (34, CAST(N'2019-11-17' AS Date), CAST(N'2019-11-17' AS Date), 23, 1, 0, 75000, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (35, CAST(N'2019-11-17' AS Date), CAST(N'2019-11-17' AS Date), 24, 1, 0, 330000, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (36, CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date), 23, 1, 0, 170000, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (37, CAST(N'2019-11-19' AS Date), CAST(N'2019-11-20' AS Date), 23, 1, 30, 220500, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (38, CAST(N'2019-11-19' AS Date), NULL, 31, 0, 0, NULL, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (39, CAST(N'2019-11-23' AS Date), CAST(N'2019-11-23' AS Date), 23, 1, 0, 75000, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (40, CAST(N'2019-11-23' AS Date), CAST(N'2019-11-23' AS Date), 23, 1, 0, 75000, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (41, CAST(N'2019-11-23' AS Date), CAST(N'2019-11-23' AS Date), 42, 1, 10, 67500, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (42, CAST(N'2019-11-23' AS Date), CAST(N'2019-11-23' AS Date), 23, 1, 0, 75000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (43, CAST(N'2019-11-23' AS Date), CAST(N'2019-11-23' AS Date), 36, 1, 20, 200000, 11)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (44, CAST(N'2019-11-23' AS Date), CAST(N'2019-11-23' AS Date), 23, 1, 20, 60000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (45, CAST(N'2019-11-23' AS Date), CAST(N'2019-11-25' AS Date), 23, 1, 0, 75000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (46, CAST(N'2019-11-25' AS Date), CAST(N'2019-11-25' AS Date), 36, 1, 0, 75000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (47, CAST(N'2019-11-25' AS Date), CAST(N'2019-11-25' AS Date), 33, 1, 0, 555000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (48, CAST(N'2019-11-27' AS Date), CAST(N'2019-11-27' AS Date), 24, 1, 0, 75000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice], [idemployees]) VALUES (49, CAST(N'2019-11-29' AS Date), CAST(N'2019-11-29' AS Date), 24, 1, 10, 211500, 8)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (44, 34, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (45, 35, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (46, 35, 9, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (47, 36, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (48, 36, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (51, 37, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (52, 37, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (53, 39, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (54, 40, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (55, 41, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (56, 42, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (57, 43, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (58, 43, 9, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (59, 44, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (60, 45, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (61, 46, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (62, 47, 9, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (63, 47, 1, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (64, 48, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (65, 49, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (66, 49, 7, 2)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
SET IDENTITY_INSERT [dbo].[Ctpn] ON 

INSERT [dbo].[Ctpn] ([id], [Ma_PN], [Ma_SP], [SL], [DVT], [DonGia]) VALUES (14, 18, 2, 2, N'Kg', 20000)
INSERT [dbo].[Ctpn] ([id], [Ma_PN], [Ma_SP], [SL], [DVT], [DonGia]) VALUES (15, 18, 5, 2, N'Chai', 30000)
INSERT [dbo].[Ctpn] ([id], [Ma_PN], [Ma_SP], [SL], [DVT], [DonGia]) VALUES (16, 18, 7, 200, N'cái', 20000)
SET IDENTITY_INSERT [dbo].[Ctpn] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([id], [name], [gender], [position], [sdt], [dayin], [totaltime], [totalsalary]) VALUES (8, N'Phạm Thị Minh Châu', N'Nữ', 1, N'0388258452', CAST(N'2018-06-14' AS Date), 0, 0)
INSERT [dbo].[Employees] ([id], [name], [gender], [position], [sdt], [dayin], [totaltime], [totalsalary]) VALUES (11, N'Trần Thị Hải Yến', N'Nữ', 0, N'0388258452', CAST(N'2018-06-14' AS Date), 0, 0)
INSERT [dbo].[Employees] ([id], [name], [gender], [position], [sdt], [dayin], [totaltime], [totalsalary]) VALUES (12, N'Lê Quang Huy', N'Nam', 0, N'0388258452', CAST(N'2018-06-14' AS Date), 0, 0)
INSERT [dbo].[Employees] ([id], [name], [gender], [position], [sdt], [dayin], [totaltime], [totalsalary]) VALUES (13, N'Chu Thị Thái Hiền', N'Nữ', 0, N'2342222222', CAST(N'2019-11-22' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (1, N'Mì khô trứng', 2, 75000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (2, N'Mì khô đặt biệt', 2, 95000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (3, N'Mì khô tô vừa', 2, 65000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (4, N'Mì khô gà rán', 2, 95000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (5, N'Mì khô phô mai', 2, 105000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (6, N'Mì khô trứng cá tuyết', 2, 115000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (7, N'Mì Ramen súp xương heo', 3, 80000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (8, N'Mì Ramen súp xương heo trứng', 3, 90000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (9, N'[combo 1] Mì khô tô vừa + nước ép dưa hấu', 4, 85000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (10, N'[combo 2]  Mì khô đặt biệt + nước cam ép', 4, 105000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (11, N'[combo 3] Mì khô gà rán + nước ép thơm', 4, 115000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (12, N'[combo 4] Cơm chiên nhật + súp miso', 4, 85000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (13, N'Cơm chiên nhật', 1, 75000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (14, N'súp miso rong biển', 1, 12000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (15, N'Coca/Pesi/7up', 5, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (16, N'Nước ép dưa hấu', 5, 20000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (17, N'Nước ép thơm', 5, 20000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (18, N'Nước cam ép', 5, 20000)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Cơm chiên')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Mì khô')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Mì Ramen')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'Combo')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (5, N'Nước uống')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[Kho] ON 

INSERT [dbo].[Kho] ([masp], [tensp], [dvt], [sl]) VALUES (1, N'Mì', N'Vắt', 50)
INSERT [dbo].[Kho] ([masp], [tensp], [dvt], [sl]) VALUES (2, N'Thịt', N'Kg', 3)
INSERT [dbo].[Kho] ([masp], [tensp], [dvt], [sl]) VALUES (3, N'Tare', N'Bịch', 5)
INSERT [dbo].[Kho] ([masp], [tensp], [dvt], [sl]) VALUES (4, N'Mỡ gà', N'Chai', 2)
INSERT [dbo].[Kho] ([masp], [tensp], [dvt], [sl]) VALUES (5, N'Giấm', N'Lít', 5)
INSERT [dbo].[Kho] ([masp], [tensp], [dvt], [sl]) VALUES (6, N'Măng', N'Bình', 2)
INSERT [dbo].[Kho] ([masp], [tensp], [dvt], [sl]) VALUES (7, N'Trứng gà', N'cái', 99)
SET IDENTITY_INSERT [dbo].[Kho] OFF
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([mapn], [idnhanvien], [ngaynhap]) VALUES (18, 12, CAST(N'2019-11-28' AS Date))
INSERT [dbo].[PhieuNhap] ([mapn], [idnhanvien], [ngaynhap]) VALUES (19, 13, CAST(N'2019-11-28' AS Date))
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (23, N'Bàn 0', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (24, N'Bàn 1', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (25, N'Bàn 2', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (26, N'Bàn 3', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (27, N'Bàn 4', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (28, N'Bàn 5', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (29, N'Bàn 6', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (30, N'Bàn 7', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (31, N'Bàn 8', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (32, N'Bàn 9', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (33, N'Bàn 10', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (34, N'Bàn 11', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (35, N'Bàn 12', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (36, N'Bàn 13', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (37, N'Bàn 14', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (38, N'Bàn 15', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (39, N'Bàn 16', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (40, N'Bàn 17', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (41, N'Bàn 18', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (42, N'Bàn 19', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (43, N'Bàn 20', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (44, N'Bàn 21', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (45, N'Bàn 22', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (46, N'Bàn 23', N'Trống')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[AccountType] ([type])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [fk_idemployees] FOREIGN KEY([idemployees])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [fk_idemployees]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Ctpn]  WITH CHECK ADD  CONSTRAINT [fk_mapn] FOREIGN KEY([Ma_PN])
REFERENCES [dbo].[PhieuNhap] ([mapn])
GO
ALTER TABLE [dbo].[Ctpn] CHECK CONSTRAINT [fk_mapn]
GO
ALTER TABLE [dbo].[Ctpn]  WITH CHECK ADD  CONSTRAINT [fk_sp] FOREIGN KEY([Ma_SP])
REFERENCES [dbo].[Kho] ([masp])
GO
ALTER TABLE [dbo].[Ctpn] CHECK CONSTRAINT [fk_sp]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([position])
REFERENCES [dbo].[AccountType] ([type])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [fk_idnhanvien] FOREIGN KEY([idnhanvien])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [fk_idnhanvien]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertBillInfo]
@idBill int,@ifFood int, @count int
as
begin
	declare @isExitBillInfo int;
	declare @foodCount int = 1;
	select @isExitBillInfo = id, @foodCount = count from BillInfo where idBill = @idBill and idFood = @ifFood
	if (@isExitBillInfo > 0)
		begin
			declare @newCount int = @foodCount + @count
			if (@newCount > 0) 
				update BillInfo set count = @foodCount + @count where idFood =@ifFood
			else
				delete BillInfo where idBill =@idBill and idFood= @ifFood
		end
	else
		begin
			insert BillInfo (idBill,idFood,count) values (@idBill,@ifFood,@count);
		end
end

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetListBillDate]
 @checkIn date, @checkOut date
 as
 begin
 select t.name as [Tên bàn], b.totalPrice as [Tổng tiền], DateCheckIn as [Ngày vào], DateCheckOut as [Ngày ra] , discount as [Giảm giá( % )] , e.name as [Nhân viên lập]
 from Bill as b, TableFood as t, Employees as e
 where DateCheckIn >= @checkIn and DateCheckOut <= @checkOut and b.status = 1 and t.id = b.idTable and b.idemployees = e.id
 end 

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetListBillDateForReport]
 @checkIn date, @checkOut date
 as
 begin
 select t.name , b.totalPrice , DateCheckIn , DateCheckOut  , discount , e.name
 from Bill as b, TableFood as t , Employees as e
 where DateCheckIn >= @checkIn and DateCheckOut <= @checkOut and b.status = 1 and t.id = b.idTable and e.id = b.idemployees
 end 

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetListChitietphieunhapReport]
@mapn int
 as
 begin
select ROW_NUMBER() OVER (ORDER BY c.id) , k.tensp  , c.SL , c.DVT , c.DonGia , p.ngaynhap , e.name
 from Ctpn as c , Kho as k , PhieuNhap as p , Employees as e
 where k.masp = c.Ma_SP  and p.idnhanvien = e.id and c.Ma_PN = @mapn and p.mapn=c.Ma_PN
 end
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetListCTPHPhieuNhap]
@mapn int
 as
 begin
 select *
 from Ctpn
 where  Ma_PN= @mapn
 end
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetListFood]

 as
 begin
	select a.id as [ID], a.name as [Tên món], b.name as [Loại món], a.price as [Giá]
	from Food as a , FoodCategory as b
	where a.idCategory = b.id
 end 

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetListPhieuNhap]
 as
 begin
 select *
 from PhieuNhap 

 end 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetTableList]
as select * from TableFood

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBill]
@idTable int , @idEmployees int
as
begin
	insert Bill (DateCheckIn, DateCheckOut, idTable, status,discount,idemployees) values (GETDATE(),null,@idTable,0,0,@idEmployees)
end

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertBillInfo]
@idBill int,@idFood int, @count int
as
begin
	declare @isExitBillInfo int;
	declare @foodCount int = 1;
	select @isExitBillInfo = id, @foodCount = count from BillInfo where idBill = @idBill and idFood = @idFood
	if (@isExitBillInfo > 0)
		begin
			declare @newCount int = @foodCount + @count
			if (@newCount > 0) 
				update BillInfo set count = @foodCount + @count where idFood =@idFood
			else
				delete BillInfo where idBill =@idBill and idFood= @idFood
		end
	else
		begin
			insert BillInfo (idBill,idFood,count) values (@idBill,@idFood,@count);
		end
end

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateAccount]
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE USERName = @userName AND PassWord = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Account SET DisplayName = @displayName WHERE UserName = @userName
		END		
		ELSE
			UPDATE dbo.Account SET DisplayName = @displayName, PassWord = @newPassword WHERE UserName = @userName
	end
END

GO
USE [master]
GO
ALTER DATABASE [QuanLyMiKho] SET  READ_WRITE 
GO
