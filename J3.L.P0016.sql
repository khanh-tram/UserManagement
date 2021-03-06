USE [master]
GO
/****** Object:  Database [J3.L.P0016]    Script Date: 5/30/2021 11:01:01 PM ******/
CREATE DATABASE [J3.L.P0016]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3.L.P0016', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\J3.L.P0016.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'J3.L.P0016_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\J3.L.P0016_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [J3.L.P0016] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3.L.P0016].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3.L.P0016] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3.L.P0016] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3.L.P0016] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3.L.P0016] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3.L.P0016] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3.L.P0016] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3.L.P0016] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3.L.P0016] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3.L.P0016] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3.L.P0016] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3.L.P0016] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3.L.P0016] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3.L.P0016] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3.L.P0016] SET RECOVERY FULL 
GO
ALTER DATABASE [J3.L.P0016] SET  MULTI_USER 
GO
ALTER DATABASE [J3.L.P0016] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3.L.P0016] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3.L.P0016] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3.L.P0016] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [J3.L.P0016] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'J3.L.P0016', N'ON'
GO
USE [J3.L.P0016]
GO
/****** Object:  Table [dbo].[BorrowingDetail]    Script Date: 5/30/2021 11:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowingDetail](
	[borrowingDetailID] [nvarchar](10) NOT NULL,
	[borrowingID] [nvarchar](10) NOT NULL,
	[productID] [nvarchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[borrowingDate] [date] NOT NULL,
	[status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_BorrowingDetail] PRIMARY KEY CLUSTERED 
(
	[borrowingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Borrowings]    Script Date: 5/30/2021 11:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowings](
	[borrowingID] [nvarchar](10) NOT NULL,
	[userID] [nvarchar](100) NOT NULL,
	[orderDate] [date] NULL,
 CONSTRAINT [PK_Borrowings] PRIMARY KEY CLUSTERED 
(
	[borrowingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/30/2021 11:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [nvarchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Levels]    Script Date: 5/30/2021 11:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[levelID] [int] NOT NULL,
	[levelName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[levelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/30/2021 11:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [nvarchar](10) NOT NULL,
	[productName] [nvarchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[color] [nvarchar](50) NOT NULL,
	[imageURL] [nvarchar](500) NOT NULL,
	[categoryID] [nvarchar](10) NOT NULL,
	[levelID] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/30/2021 11:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/30/2021 11:01:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [nvarchar](100) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[roleID] [int] NOT NULL,
	[createDate] [date] NOT NULL,
	[codeActive] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'0720', N'0152', N'BG02', 3, CAST(N'2021-06-01' AS Date), N'Delete')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'1105', N'0152', N'BG03', 2, CAST(N'2021-06-02' AS Date), N'Accept')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'1390', N'3287', N'BG03', 2, CAST(N'2021-06-02' AS Date), N'Accept')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'1622', N'8894', N'BG01', 2, CAST(N'2021-06-03' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'1806', N'6041', N'KD01', 5, CAST(N'2021-06-03' AS Date), N'Accept')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'1947', N'8102', N'BG02', 2, CAST(N'2021-06-24' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'2034', N'1399', N'MC01', 4, CAST(N'2021-05-30' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'2154', N'0525', N'MC01', 4, CAST(N'2021-05-30' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'2343', N'0992', N'BG02', 1, CAST(N'2021-05-30' AS Date), N'Delete')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'2346', N'8894', N'BG02', 1, CAST(N'2021-06-03' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'2979', N'9566', N'MC01', 2, CAST(N'2021-08-31' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'3048', N'9566', N'BG01', 4, CAST(N'2021-05-30' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'3097', N'0525', N'BG01', 2, CAST(N'2021-05-30' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'3254', N'4497', N'BG03', 2, CAST(N'2021-06-02' AS Date), N'Delete')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'3619', N'6041', N'MP02', 4, CAST(N'2021-06-04' AS Date), N'Delete')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'4860', N'6041', N'BG05', 3, CAST(N'2021-06-01' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'5178', N'0152', N'BG01', 1, CAST(N'2021-05-31' AS Date), N'Delete')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'5289', N'3287', N'BG02', 3, CAST(N'2021-06-01' AS Date), N'Delete')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'5763', N'8102', N'MC01', 3, CAST(N'2021-06-23' AS Date), N'Delete')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'5839', N'1399', N'BG02', 3, CAST(N'2021-05-30' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'6248', N'8894', N'MC01', 4, CAST(N'2021-05-30' AS Date), N'Delete')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'7119', N'3287', N'BG01', 1, CAST(N'2021-05-31' AS Date), N'Accept')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'7128', N'6710', N'MC01', 2, CAST(N'2021-07-28' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'7945', N'6041', N'MT01', 3, CAST(N'2021-06-02' AS Date), N'New')
GO
INSERT [dbo].[BorrowingDetail] ([borrowingDetailID], [borrowingID], [productID], [quantity], [borrowingDate], [status]) VALUES (N'9819', N'0525', N'BG02', 2, CAST(N'2021-05-30' AS Date), N'New')
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'0152', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'0525', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'0992', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'1399', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'3287', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'3883', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'4497', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'6041', N'luan@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'6710', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'8102', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'8894', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Borrowings] ([borrowingID], [userID], [orderDate]) VALUES (N'9566', N'khanhtram1812@gmail.com', CAST(N'2021-05-30' AS Date))
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'BG', N'Bộ bàn ghế')
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'KD', N'Keo dán')
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'MC', N'Máy chiếu')
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'MI', N'Máy in')
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'MP', N'Máy photocopy')
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'MT', N'Máy tính')
GO
INSERT [dbo].[Levels] ([levelID], [levelName]) VALUES (1, N'Leader and Employee')
GO
INSERT [dbo].[Levels] ([levelID], [levelName]) VALUES (2, N'Leader')
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'BG01', N'Bàn văn phòng', 12, N'Cụm bàn làm việc 6 chỗ', N'Gỗ, đen, trắng', N'BG01.jpg', N'BG', 1)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'BG02', N'Bàn họp', 7, N'Bàn họp 14 chỗ', N'Gỗ', N'BG02.png', N'BG', 1)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'BG03', N'Bàn làm việc', 24, N'Cụm bàn văn phòng 4 chỗ', N'Gỗ, đỏ, đen', N'BG03.jpg', N'BG', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'BG04', N'Bàn làm việc nhỏ', 12, N'Cụm bàn làm việc 2 người, có học đựng đồ', N'Gỗ, xanh, đen', N'BG04.jpg', N'BG', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'BG05', N'Bàn làm việc', 14, N'Cụm bàn làm việc 3 chỗ, có học đựng đồ', N'Gỗ, xanh, đen', N'BG05.jpg', N'BG', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'KD01', N'Băng keo trong', 10, N'Dùng để dán các vật mỏng, nhẹ', N'Trong suốt, vàng', N'KD01.jpg', N'KD', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'KD02', N'Keo xịt 3M 75', 6, N'Dùng để dán các loại giấy cứng', N'Đen', N'KD02.jpg', N'KD', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'KD03', N'Băng keo giấy màu', 20, N'Chuyên dùng để dán các loại giấy tờ, ghi chú', N'Vàng, hồng, đỏ, xanh, cam', N'KD03.jpg', N'KD', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'KD04', N'Băng keo giấy', 40, N'Chuyên dùng để dán các loại giấy mỏng nhẹ, viết đươc', N'Nâu', N'KD04.jpg', N'KD', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'KD05', N'Băng keo giấy chịu nhiệt', 22, N'Có thể dùng trong các môi trường khi gia nhiệt sẽ không bị bung keo', N'Kem', N'KD05.jpg', N'KD', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MC01', N'Máy chiếu Tyco T7 Plus', 5, N'Sử dụng cho phòng chiếu nhỏ và nhóm ít người tham dự dưới 15 người', N'Đen', N'MC01.jpg', N'MC', 1)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MC02', N'Máy chiếu ViewSonic TS512B
', 2, N'Trình chiếu sắc nét và sống động', N'Trắng', N'MC02.jpg', N'MC', 1)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MC03', N'Máy chiếu Sony VPL-EX435 -3.200 Ansi lumens', 5, N'Có thể được nhìn thấy rõ ràng ngay cả trong phòng sáng và màn chiếu lớn hơn', N'Trắng', N'MC03.jpg', N'MC', 1)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MC04', N'Máy chiếu BenQ MS550-3600 Ansi Lumen
', 5, N'Được sử dung trong các phòng họp lớn hơn với ánh sáng rực rỡ, chứa tối đa 20 người tham gia', N'Trắng', N'MC04.png', N'MC', 1)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MC05', N'Máy chiếu VIEWSONIC PA502S -3500 ANSI lumens', 5, N'Máy chiếu này tạo ra hình ảnh sáng rõ trong hầu hết mọi môi trường', N'Trắng, đen', N'MC05.png', N'MC', 1)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MI01', N'Máy in laser Canon LBP 2900', 5, N'Máy in laser đơn sắc (chỉ in đen trắng)', N'Trắng', N'MI01.jpg', N'MI', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MI02', N'Máy in laser Canon LBP 6030W', 5, N'Chất lượng bản in cực kỳ sắc nét, chân thực và đều mực bởi độ phân giải lên tới 600×600 rât cực kỳ thích hợp để in tài liệu, văn bản hay những giấy tờ trong văn phòng.', N'Trắng', N'MI02.jpg', N'MI', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MI03', N'Máy in màu Epson EcoTank L3110 (in, scan, copy)', 5, N'Cung cấp các bản in chất lượng cao đặc biệt cho mọi nhu cầu của bạn', N'Đen', N'MI03.jpg', N'MI', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MI04', N'Máy in kim Epson LQ350 (máy in hóa đơn) hàng nhập khẩu', 5, N'Tốc độ in cực nhanh, bền, độ phân giải cao', N'Đen', N'MI04.jpg', N'MI', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MI05', N'Máy in màu Canon PIXMA iP2770', 5, N'Máy in phun màu A4, tốc độ in nhanh, độ phân giải cao', N'Đen', N'MI05.jpg', N'MI', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MP01', N'Máy ricoh 5002', 7, N'Tốc độ lên đến 50 bản/ phút đảm bảo khả năng in ấn hoạt động trong thời gian dài ', N'Xám', N'MP01.jpg', N'MP', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MP02', N'Máy photocopy để bàn Ricoh MP 301', 5, N'Tốc độ photocopy vừa phải 30 trang mỗi phút', N'Trắng', N'MP02.jpg', N'MP', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MP03', N'Máy photocopy Ricoh MP 201', 5, N'Tốc độ sao chụp 20 tờ / 1 phút', N'Trắng, xanh', N'MP03.jpg', N'MP', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MP04', N'Máy photocopy Ricoh MP 4001', 5, N'Tốc độ photocopy 40 trang mỗi phút', N'Trắng, xanh', N'MP04.jpg', N'MP', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MP05', N'Máy photocopy Ricoh MP 3500 ', 5, N'Tốc độ in 45 bản/phút', N'Trắng', N'MP05.jpg', N'MP', 2)
GO
INSERT [dbo].[Products] ([productID], [productName], [quantity], [description], [color], [imageURL], [categoryID], [levelID]) VALUES (N'MT01', N'Máy Tính Văn Phòng G3250', 30, N'Cho khả năng xử lý tốt các nhu cầu văn phòng, học tập, làm việc hàng ngày', N'Đen', N'MT01.jpg', N'MT', 1)
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (1, N'manager')
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (2, N'leader')
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (3, N'employee')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'ecanh@gmail.com', N'Canh', N'12345678', N'Bac Ninh', N'0877630999', 1, 3, CAST(N'2020-07-17' AS Date), N'1212')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'eloi@gmail.com', N'Loi', N'12345678', N'Bac Ninh', N'0986866890', 1, 3, CAST(N'2020-01-17' AS Date), N'7548')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'ely@gmail.com', N'Ly', N'12345678', N'Bac Ninh', N'0879917968', 1, 3, CAST(N'2019-05-29' AS Date), N'4532')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'etoan@gmail.com', N'Toan', N'12345678', N'Bac Ninh', N'0877453453', 1, 3, CAST(N'2020-02-14' AS Date), N'3454')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'etrung@gmail.com', N'Trụng', N'12345678', N'Bac Ninh', N'0966668273', 1, 3, CAST(N'2020-05-19' AS Date), N'5468')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'etuan@gmail.com', N'Tuan', N'12345678', N'Bac Ninh', N'0879327799', 1, 3, CAST(N'2020-06-05' AS Date), N'4564')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'khanhtram1812@gmail.com', N'tram', N'12345678', N'HCM City', N'0987654321', 1, 3, CAST(N'2021-05-25' AS Date), N'9732')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'ldo@gmail.com', N'Do', N'12345678', N'Bac Ninh', N'0879732732', 1, 2, CAST(N'2020-06-28' AS Date), N'3456')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'lhoan@gmail.com', N'Hoan', N'12345678', N'Bac Ninh', N'0965736303', 1, 2, CAST(N'2019-12-31' AS Date), N'7885')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'llinh@gmail.com', N'Linh', N'12345678', N'Thua Thien Hue', N'0823447700', 1, 2, CAST(N'2020-02-03' AS Date), N'1586')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'luan@gmail.com', N'Uan', N'12345678', N'Bac Ninh', N'0879074777', 1, 2, CAST(N'2020-03-05' AS Date), N'1589')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'mphuc@gmail.com', N'Phuc', N'12345678', N'Thai Binh', N'0394724444', 1, 1, CAST(N'2019-12-18' AS Date), N'3546')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'mquyen@gmail.com', N'Quyen', N'12345678', N'Thai Binh', N'0878472555', 1, 1, CAST(N'2019-12-14' AS Date), N'2318')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'Tram@gmail.com', N'Tram', N'12345678', N'HCM City', N'0879456123', 1, 1, CAST(N'2021-05-24' AS Date), N'1235')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'tram1@gmail.com', N'Tram', N'12345678', N'asdf', N'0324165412', 0, 3, CAST(N'2021-05-25' AS Date), N'6548')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [status], [roleID], [createDate], [codeActive]) VALUES (N'Tram4@gmail.com', N'Tram', N'123456789', N'321231', N'23132156156', 1, 2, CAST(N'2021-05-25' AS Date), N'1359')
GO
ALTER TABLE [dbo].[BorrowingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BorrowingDetail_Borrowings] FOREIGN KEY([borrowingID])
REFERENCES [dbo].[Borrowings] ([borrowingID])
GO
ALTER TABLE [dbo].[BorrowingDetail] CHECK CONSTRAINT [FK_BorrowingDetail_Borrowings]
GO
ALTER TABLE [dbo].[BorrowingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BorrowingDetail_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[BorrowingDetail] CHECK CONSTRAINT [FK_BorrowingDetail_Products]
GO
ALTER TABLE [dbo].[Borrowings]  WITH CHECK ADD  CONSTRAINT [FK_Borrowings_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Borrowings] CHECK CONSTRAINT [FK_Borrowings_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([categoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Levels] FOREIGN KEY([levelID])
REFERENCES [dbo].[Levels] ([levelID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Levels]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [J3.L.P0016] SET  READ_WRITE 
GO
