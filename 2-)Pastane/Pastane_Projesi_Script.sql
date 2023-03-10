USE [master]
GO
/****** Object:  Database [Pastane_Projesi]    Script Date: 24.12.2022 19:08:21 ******/
CREATE DATABASE [Pastane_Projesi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pastane_Projesi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pastane_Projesi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pastane_Projesi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pastane_Projesi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pastane_Projesi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pastane_Projesi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pastane_Projesi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pastane_Projesi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pastane_Projesi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pastane_Projesi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pastane_Projesi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pastane_Projesi] SET  MULTI_USER 
GO
ALTER DATABASE [Pastane_Projesi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pastane_Projesi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pastane_Projesi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pastane_Projesi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pastane_Projesi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pastane_Projesi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pastane_Projesi', N'ON'
GO
ALTER DATABASE [Pastane_Projesi] SET QUERY_STORE = OFF
GO
USE [Pastane_Projesi]
GO
/****** Object:  Table [dbo].[Giris]    Script Date: 24.12.2022 19:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giris](
	[KullanıcıNo] [int] IDENTITY(1,1) NOT NULL,
	[KullanıcıAdı] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Telefon] [nchar](11) NULL,
 CONSTRAINT [PK_Giris] PRIMARY KEY CLUSTERED 
(
	[KullanıcıNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kargo]    Script Date: 24.12.2022 19:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kargo](
	[KargoNo] [int] IDENTITY(1,1) NOT NULL,
	[UrunNo] [int] NULL,
	[SiparisNo] [int] NULL,
 CONSTRAINT [PK_Kargo] PRIMARY KEY CLUSTERED 
(
	[KargoNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 24.12.2022 19:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[kategorino] [int] NULL,
	[kategoriadi] [varchar](50) NULL,
	[kategoritanimi] [varchar](50) NULL,
	[stoksayisi] [int] NULL,
	[giristarihi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saticilar]    Script Date: 24.12.2022 19:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saticilar](
	[SatıcıNo] [int] IDENTITY(1,1) NOT NULL,
	[SatıcıAdSoyad] [varchar](50) NULL,
	[SatıcıAdres] [varchar](50) NULL,
	[SatıcıIl] [varchar](50) NULL,
 CONSTRAINT [PK_Saticilar] PRIMARY KEY CLUSTERED 
(
	[SatıcıNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 24.12.2022 19:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[SiparisNo] [int] IDENTITY(1,1) NOT NULL,
	[SiparisAdi] [varchar](50) NULL,
	[SiparisAdres] [varchar](50) NULL,
	[SiparisAdet] [int] NULL,
	[SiparisFiyat] [int] NULL,
	[Tutar] [int] NULL,
 CONSTRAINT [PK_Siparisler] PRIMARY KEY CLUSTERED 
(
	[SiparisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tatlı]    Script Date: 24.12.2022 19:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tatlı](
	[TatlıNo] [int] IDENTITY(1,1) NOT NULL,
	[SatıcıNo] [int] NULL,
	[UrunNo] [int] NULL,
 CONSTRAINT [PK_Tatlı] PRIMARY KEY CLUSTERED 
(
	[TatlıNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 24.12.2022 19:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunNo] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdı] [varchar](50) NULL,
	[UrunFiyatı] [int] NULL,
	[KullanımTarihi] [varchar](50) NULL,
	[UretimTarihi] [varchar](50) NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Giris] ON 

INSERT [dbo].[Giris] ([KullanıcıNo], [KullanıcıAdı], [Sifre], [Mail], [Telefon]) VALUES (1, N'Fatma', N'123', N'aysealpsln34@gmail.com', N'05076274420')
INSERT [dbo].[Giris] ([KullanıcıNo], [KullanıcıAdı], [Sifre], [Mail], [Telefon]) VALUES (2, N'Şeyma', N'1234', N'aa@hotmail.com', N'05543107100')
SET IDENTITY_INSERT [dbo].[Giris] OFF
GO
SET IDENTITY_INSERT [dbo].[Saticilar] ON 

INSERT [dbo].[Saticilar] ([SatıcıNo], [SatıcıAdSoyad], [SatıcıAdres], [SatıcıIl]) VALUES (1, N'Fatma Alpaslan', N'Avcılar', N'İstanbul')
INSERT [dbo].[Saticilar] ([SatıcıNo], [SatıcıAdSoyad], [SatıcıAdres], [SatıcıIl]) VALUES (2, N'Şeyma Alpaslan', N'Kuzguncuk', N'İstanbul')
INSERT [dbo].[Saticilar] ([SatıcıNo], [SatıcıAdSoyad], [SatıcıAdres], [SatıcıIl]) VALUES (3, N'Mahmut Sarı', N'Merzifon', N'Amasya')
INSERT [dbo].[Saticilar] ([SatıcıNo], [SatıcıAdSoyad], [SatıcıAdres], [SatıcıIl]) VALUES (4, N'Haluk Kır', N'Akçaabat', N'Trabzon')
INSERT [dbo].[Saticilar] ([SatıcıNo], [SatıcıAdSoyad], [SatıcıAdres], [SatıcıIl]) VALUES (5, N'Ayşe', N'Alpaslan', N'İstanbul')
INSERT [dbo].[Saticilar] ([SatıcıNo], [SatıcıAdSoyad], [SatıcıAdres], [SatıcıIl]) VALUES (6, N'Saliha Alpaslan', N'Meram', N'Konya')
INSERT [dbo].[Saticilar] ([SatıcıNo], [SatıcıAdSoyad], [SatıcıAdres], [SatıcıIl]) VALUES (7, N'Aslı Tuna', N'Üsküdar', N'İstanbul')
SET IDENTITY_INSERT [dbo].[Saticilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Siparisler] ON 

INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (2, N'Pasta', N'Manisa', 2, 350, 700)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (4, N'Pasta', N'İstanbul', 2, 350, 700)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (5, N'Pasta', N'İstanbul', 2, 350, 700)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (6, N'Pasta', N'İstanbul', 2, 350, 700)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (8, N'Makaron', N'Bursa', 5, 40, 200)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (9, N'Makaron', N'Artvin', 5, 40, 200)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (10, N'Kruvasan', N'Erzincan', 10, 40, 400)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (11, N'Çay', N'Üsküdar', 4, 15, 60)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (12, N'Pasta', N'Üsküdar', 3, 350, 1050)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (15, N'Çay', N'İstanbul', 5, 15, 75)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (17, N'Pasta', N'Balıkesir', 4, 350, 1400)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (18, N'Çay', N'Balıkesir', 6, 15, 90)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (19, N'Kahve', N'Kocaeli', 6, 35, 210)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (20, N'Halka Tatlı', N'Balıkesir', 2, 15, 30)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (21, N'Makaron', N'İstanbul', 4, 40, 160)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (22, N'Kahve', N'Bursa', 4, 35, 140)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (23, N'Tartolet', N'Yalova', 5, 35, 175)
INSERT [dbo].[Siparisler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [SiparisAdet], [SiparisFiyat], [Tutar]) VALUES (24, N'Kahve', N'Göztepe', 4, 35, 140)
SET IDENTITY_INSERT [dbo].[Siparisler] OFF
GO
SET IDENTITY_INSERT [dbo].[Tatlı] ON 

INSERT [dbo].[Tatlı] ([TatlıNo], [SatıcıNo], [UrunNo]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[Tatlı] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (1, N'Pasta', 300, N'19.12.2022', N'18.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (2, N'Tartolet', 35, N'19.12.2022', N'.19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (3, N'Çay', 10, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (4, N'Makaron', 40, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (5, N'Kruvasan', 40, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (6, N'Kahve', 30, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (7, N'Kahve', 30, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (8, N'Pasta', 350, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (9, N'Çay', 15, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (10, N'Dilim Pasta', 60, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (11, N'Kahve', 35, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (12, N'Halka Tatlı', 15, N'20.11.2022', N'19.11.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (13, N'Muffin', 25, N'19.12.2022', N'19.12.2022')
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdı], [UrunFiyatı], [KullanımTarihi], [UretimTarihi]) VALUES (14, N'Limonata', 15, N'19.11.2022', N'18.11.2022')
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
ALTER TABLE [dbo].[Kargo]  WITH CHECK ADD  CONSTRAINT [FK_Kargo_Siparisler] FOREIGN KEY([SiparisNo])
REFERENCES [dbo].[Siparisler] ([SiparisNo])
GO
ALTER TABLE [dbo].[Kargo] CHECK CONSTRAINT [FK_Kargo_Siparisler]
GO
ALTER TABLE [dbo].[Kargo]  WITH CHECK ADD  CONSTRAINT [FK_Kargo_Urunler] FOREIGN KEY([UrunNo])
REFERENCES [dbo].[Urunler] ([UrunNo])
GO
ALTER TABLE [dbo].[Kargo] CHECK CONSTRAINT [FK_Kargo_Urunler]
GO
ALTER TABLE [dbo].[Tatlı]  WITH CHECK ADD  CONSTRAINT [FK_Tatlı_Saticilar] FOREIGN KEY([SatıcıNo])
REFERENCES [dbo].[Saticilar] ([SatıcıNo])
GO
ALTER TABLE [dbo].[Tatlı] CHECK CONSTRAINT [FK_Tatlı_Saticilar]
GO
ALTER TABLE [dbo].[Tatlı]  WITH CHECK ADD  CONSTRAINT [FK_Tatlı_Urunler1] FOREIGN KEY([UrunNo])
REFERENCES [dbo].[Urunler] ([UrunNo])
GO
ALTER TABLE [dbo].[Tatlı] CHECK CONSTRAINT [FK_Tatlı_Urunler1]
GO
USE [master]
GO
ALTER DATABASE [Pastane_Projesi] SET  READ_WRITE 
GO
