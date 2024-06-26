USE [master]
GO
/****** Object:  Database [InnovateSoft Solutions]    Script Date: 27/4/2024 19:38:37 ******/
CREATE DATABASE [InnovateSoft Solutions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InnovateSoft Solutions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\InnovateSoft Solutions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InnovateSoft Solutions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\InnovateSoft Solutions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InnovateSoft Solutions] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InnovateSoft Solutions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InnovateSoft Solutions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET ARITHABORT OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InnovateSoft Solutions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InnovateSoft Solutions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InnovateSoft Solutions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InnovateSoft Solutions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET RECOVERY FULL 
GO
ALTER DATABASE [InnovateSoft Solutions] SET  MULTI_USER 
GO
ALTER DATABASE [InnovateSoft Solutions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InnovateSoft Solutions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InnovateSoft Solutions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InnovateSoft Solutions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InnovateSoft Solutions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InnovateSoft Solutions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'InnovateSoft Solutions', N'ON'
GO
ALTER DATABASE [InnovateSoft Solutions] SET QUERY_STORE = ON
GO
ALTER DATABASE [InnovateSoft Solutions] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InnovateSoft Solutions]
GO
/****** Object:  Table [dbo].[CuentasBancarias]    Script Date: 27/4/2024 19:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasBancarias](
	[id_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[cuenta_bancaria] [varchar](20) NULL,
	[saldo] [decimal](15, 2) NULL,
	[numero_tarjeta] [varchar](20) NULL,
	[tipo_tarjeta] [varchar](20) NULL,
	[fecha_vencimiento] [date] NULL,
	[CVV] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 27/4/2024 19:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timestamp] [datetime] NULL,
	[username] [varchar](255) NULL,
	[action] [varchar](255) NULL,
	[details] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 27/4/2024 19:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[id_person] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[provincias] [nvarchar](50) NULL,
	[cantones] [nvarchar](50) NULL,
	[distritos] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 27/4/2024 19:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[purchase_id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NULL,
	[username] [varchar](255) NULL,
	[payment_method] [varchar](255) NULL,
	[payment_method_data] [varchar](255) NULL,
	[purchase_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchase_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 27/4/2024 19:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service] [varchar](255) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[purchase_status] [varchar](50) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tokens]    Script Date: 27/4/2024 19:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tokens](
	[id_token] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[token] [nvarchar](100) NOT NULL,
	[expiration_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27/4/2024 19:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[security_question] [nvarchar](100) NOT NULL,
	[security_answer] [nvarchar](255) NOT NULL,
	[status] [varchar](50) NULL,
	[verification] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationAttempts]    Script Date: 27/4/2024 19:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationAttempts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timestamp] [datetime] NULL,
	[username] [nvarchar](255) NOT NULL,
	[action] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CuentasBancarias] ON 

INSERT [dbo].[CuentasBancarias] ([id_cuenta], [nombre], [cuenta_bancaria], [saldo], [numero_tarjeta], [tipo_tarjeta], [fecha_vencimiento], [CVV]) VALUES (1, N'Juan Pérez', N'1234567890123456', CAST(1000.00 AS Decimal(15, 2)), N'1234567812345678', N'Débito', CAST(N'2024-12-31' AS Date), N'956')
INSERT [dbo].[CuentasBancarias] ([id_cuenta], [nombre], [cuenta_bancaria], [saldo], [numero_tarjeta], [tipo_tarjeta], [fecha_vencimiento], [CVV]) VALUES (3, N'María García', N'9876543210987654', CAST(10000.00 AS Decimal(15, 2)), N'9876543298765432', N'Crédito', CAST(N'2026-10-31' AS Date), N'456')
INSERT [dbo].[CuentasBancarias] ([id_cuenta], [nombre], [cuenta_bancaria], [saldo], [numero_tarjeta], [tipo_tarjeta], [fecha_vencimiento], [CVV]) VALUES (4, N'Luis Rodríguez', N'5432167890123456', CAST(3000.00 AS Decimal(15, 2)), N'5432167854321098', N'Débito', CAST(N'2027-05-31' AS Date), N'345')
SET IDENTITY_INSERT [dbo].[CuentasBancarias] OFF
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1, CAST(N'2024-03-07T01:34:08.750' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2, CAST(N'2024-03-07T01:34:18.400' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (3, CAST(N'2024-03-07T01:39:05.933' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (4, CAST(N'2024-03-07T01:39:22.627' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (5, CAST(N'2024-03-07T01:43:48.273' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (6, CAST(N'2024-03-07T01:43:57.287' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (7, CAST(N'2024-03-08T02:42:04.833' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (8, CAST(N'2024-03-08T02:44:17.237' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (9, CAST(N'2024-03-08T02:44:42.590' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (10, CAST(N'2024-03-08T02:44:48.817' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (11, CAST(N'2024-03-08T02:51:55.323' AS DateTime), N'mariibarquero', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (12, CAST(N'2024-03-08T02:52:29.660' AS DateTime), N'mariibarquero', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (13, CAST(N'2024-03-08T02:54:15.577' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (14, CAST(N'2024-03-08T02:54:44.133' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (15, CAST(N'2024-03-08T02:54:55.327' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (16, CAST(N'2024-03-08T02:55:56.663' AS DateTime), N'Sguillen9047', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (17, CAST(N'2024-03-08T03:07:27.547' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (18, CAST(N'2024-03-08T03:07:27.553' AS DateTime), N'Sguillen9047', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (19, CAST(N'2024-03-08T03:08:46.887' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (20, CAST(N'2024-03-08T03:08:46.893' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (21, CAST(N'2024-03-08T03:09:18.047' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (22, CAST(N'2024-03-08T03:09:18.053' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (23, CAST(N'2024-03-08T03:09:20.843' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (24, CAST(N'2024-03-08T03:09:20.847' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (25, CAST(N'2024-03-08T03:12:46.337' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (26, CAST(N'2024-03-08T03:12:46.343' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (27, CAST(N'2024-03-08T03:13:28.700' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (28, CAST(N'2024-03-08T03:13:33.547' AS DateTime), N'Sguillen9047', N'Verificacion', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (29, CAST(N'2024-03-08T03:13:33.553' AS DateTime), N'Sguillen9047', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (30, CAST(N'2024-03-08T03:16:18.340' AS DateTime), N'mariibarquero', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (31, CAST(N'2024-03-08T03:16:26.290' AS DateTime), N'mariibarquero', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (32, CAST(N'2024-03-08T03:16:26.293' AS DateTime), N'mariibarquero', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (33, CAST(N'2024-03-08T03:17:09.430' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (34, CAST(N'2024-03-08T03:17:09.437' AS DateTime), N'Sguillen9047', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (35, CAST(N'2024-03-08T03:18:54.323' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (36, CAST(N'2024-03-08T03:18:54.333' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (37, CAST(N'2024-03-08T03:26:14.567' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (38, CAST(N'2024-03-08T03:26:31.333' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (39, CAST(N'2024-03-08T03:27:04.450' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (40, CAST(N'2024-03-08T03:43:11.657' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (41, CAST(N'2024-03-08T03:43:22.243' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (42, CAST(N'2024-03-08T03:50:21.750' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (43, CAST(N'2024-03-08T03:51:57.783' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (44, CAST(N'2024-03-08T03:52:09.087' AS DateTime), N'iChris11_', N'Verificacion', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (45, CAST(N'2024-03-08T03:52:23.320' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (46, CAST(N'2024-03-08T03:52:41.893' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (47, CAST(N'2024-03-08T03:52:44.223' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (48, CAST(N'2024-03-08T03:52:56.603' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (49, CAST(N'2024-03-08T03:53:24.720' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (50, CAST(N'2024-03-08T03:55:46.923' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (51, CAST(N'2024-03-08T03:57:43.160' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (52, CAST(N'2024-03-08T03:57:48.263' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (53, CAST(N'2024-03-08T03:59:10.640' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (54, CAST(N'2024-03-08T03:59:24.653' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (55, CAST(N'2024-03-08T03:59:36.780' AS DateTime), N'iChris11_', N'Verificacion', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (56, CAST(N'2024-03-08T03:59:49.720' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (57, CAST(N'2024-03-08T04:00:00.547' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (58, CAST(N'2024-03-08T04:06:45.570' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (59, CAST(N'2024-03-08T04:06:50.570' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (60, CAST(N'2024-03-08T04:10:46.790' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (61, CAST(N'2024-03-08T04:11:40.433' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (62, CAST(N'2024-03-08T04:12:37.533' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (63, CAST(N'2024-03-08T04:14:21.973' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (64, CAST(N'2024-03-08T04:14:47.323' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (65, CAST(N'2024-03-08T04:16:14.523' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (66, CAST(N'2024-03-08T04:16:19.113' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (67, CAST(N'2024-03-08T04:22:20.523' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (68, CAST(N'2024-03-08T04:22:30.273' AS DateTime), N'iChris11_', N'Verificacion', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (69, CAST(N'2024-03-08T04:22:32.650' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (70, CAST(N'2024-03-08T04:26:35.883' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (71, CAST(N'2024-03-08T04:30:02.963' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (72, CAST(N'2024-03-08T04:34:11.347' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (73, CAST(N'2024-03-08T04:38:56.163' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (74, CAST(N'2024-03-08T04:58:29.877' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (75, CAST(N'2024-03-08T04:58:46.510' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (76, CAST(N'2024-03-08T04:59:18.763' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (77, CAST(N'2024-03-08T04:59:26.753' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (78, CAST(N'2024-03-08T05:00:13.523' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (79, CAST(N'2024-03-08T05:00:22.383' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (80, CAST(N'2024-03-08T05:44:58.260' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (81, CAST(N'2024-03-08T05:45:46.673' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (82, CAST(N'2024-03-09T18:05:35.157' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (83, CAST(N'2024-03-09T18:05:48.270' AS DateTime), N'iChris11_', N'Verificacion', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (84, CAST(N'2024-03-09T18:05:52.940' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (85, CAST(N'2024-03-09T18:07:35.187' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (86, CAST(N'2024-03-11T11:01:40.280' AS DateTime), N'oscardd', N'Registro', N'Usuario registrado en el sistema')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (87, CAST(N'2024-03-11T11:18:45.417' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (88, CAST(N'2024-03-11T11:20:26.330' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (89, CAST(N'2024-03-11T11:21:46.740' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (90, CAST(N'2024-03-11T11:22:08.053' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (91, CAST(N'2024-03-11T11:46:26.810' AS DateTime), N'oscardd', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (92, CAST(N'2024-03-11T11:46:26.813' AS DateTime), N'oscardd', N'Inicio de sesion', N'No verificado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (93, CAST(N'2024-03-11T11:48:52.353' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (94, CAST(N'2024-03-11T11:49:16.847' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (95, CAST(N'2024-03-11T11:53:40.770' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (96, CAST(N'2024-03-11T11:53:40.773' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (97, CAST(N'2024-03-11T11:54:24.257' AS DateTime), N'iChris11_', N'Verificacion de correo', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (98, CAST(N'2024-03-11T11:54:32.723' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (99, CAST(N'2024-03-11T11:54:45.600' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
GO
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (100, CAST(N'2024-03-11T11:57:32.860' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (101, CAST(N'2024-03-11T11:58:13.260' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (102, CAST(N'2024-03-11T11:58:36.460' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (103, CAST(N'2024-03-11T11:58:36.470' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (104, CAST(N'2024-03-11T11:58:41.993' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (105, CAST(N'2024-03-11T11:59:52.933' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (106, CAST(N'2024-03-11T12:00:04.293' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (107, CAST(N'2024-03-11T12:08:49.537' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (108, CAST(N'2024-03-11T12:08:49.540' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (109, CAST(N'2024-03-11T12:09:30.647' AS DateTime), N'Sguillen9047', N'Verificacion de correo', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (110, CAST(N'2024-03-11T12:09:35.460' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (111, CAST(N'2024-03-11T12:09:55.223' AS DateTime), N'Sguillen9047', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (112, CAST(N'2024-03-11T12:11:05.323' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (113, CAST(N'2024-03-11T12:11:18.820' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (114, CAST(N'2024-03-11T12:11:18.823' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (115, CAST(N'2024-03-11T12:11:42.640' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (116, CAST(N'2024-03-11T12:11:46.113' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (117, CAST(N'2024-03-11T12:11:48.350' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (118, CAST(N'2024-03-11T12:11:48.357' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (119, CAST(N'2024-03-11T14:09:14.597' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (120, CAST(N'2024-03-11T15:25:12.003' AS DateTime), N'null', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (121, CAST(N'2024-03-11T16:34:43.150' AS DateTime), N'null', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (122, CAST(N'2024-03-11T16:35:19.577' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (123, CAST(N'2024-03-11T16:38:51.007' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (124, CAST(N'2024-03-11T16:39:09.307' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (125, CAST(N'2024-03-11T16:40:14.073' AS DateTime), N'mariibarquero', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (126, CAST(N'2024-03-11T16:43:24.827' AS DateTime), N'null', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (127, CAST(N'2024-03-11T16:45:10.263' AS DateTime), N'null', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (128, CAST(N'2024-03-11T16:46:31.257' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (129, CAST(N'2024-03-11T16:48:26.743' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (130, CAST(N'2024-03-11T16:48:34.430' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (131, CAST(N'2024-03-11T17:12:41.420' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (132, CAST(N'2024-03-11T17:12:54.500' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (133, CAST(N'2024-03-11T17:13:34.280' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (134, CAST(N'2024-03-11T17:13:39.780' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (135, CAST(N'2024-03-11T17:15:32.513' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (136, CAST(N'2024-03-11T17:15:39.080' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (137, CAST(N'2024-03-11T17:16:55.650' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (138, CAST(N'2024-03-11T17:17:05.843' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (139, CAST(N'2024-03-11T17:20:41.790' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (140, CAST(N'2024-03-11T17:20:48.263' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (141, CAST(N'2024-03-11T17:49:09.357' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (142, CAST(N'2024-03-11T17:49:39.057' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (143, CAST(N'2024-03-11T17:52:16.710' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (144, CAST(N'2024-03-11T17:52:23.383' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (145, CAST(N'2024-03-11T17:56:17.563' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (146, CAST(N'2024-03-11T17:56:28.013' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (147, CAST(N'2024-03-11T17:59:30.163' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (148, CAST(N'2024-03-11T18:00:10.350' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (149, CAST(N'2024-03-11T18:07:29.187' AS DateTime), N'mariibarquero', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (150, CAST(N'2024-03-11T18:07:38.827' AS DateTime), N'mariibarquero', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (151, CAST(N'2024-03-11T20:13:47.413' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (152, CAST(N'2024-03-11T20:13:59.563' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (153, CAST(N'2024-03-11T20:14:16.337' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (154, CAST(N'2024-03-11T20:35:34.143' AS DateTime), N'Sguillen9047', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (155, CAST(N'2024-03-11T20:35:44.850' AS DateTime), N'Sguillen9047', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (156, CAST(N'2024-03-11T20:36:51.460' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (157, CAST(N'2024-03-11T20:37:03.503' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (158, CAST(N'2024-03-11T20:38:31.837' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (159, CAST(N'2024-03-11T20:38:43.383' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (160, CAST(N'2024-03-11T20:40:07.763' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (161, CAST(N'2024-03-11T20:40:16.180' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (162, CAST(N'2024-03-11T20:40:18.247' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (163, CAST(N'2024-03-11T20:40:27.150' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (164, CAST(N'2024-03-11T20:40:32.723' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (165, CAST(N'2024-03-11T20:40:35.403' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (166, CAST(N'2024-03-11T20:40:40.997' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (167, CAST(N'2024-03-11T20:55:15.843' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (168, CAST(N'2024-03-11T20:55:20.460' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (169, CAST(N'2024-03-11T20:55:29.940' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (170, CAST(N'2024-03-11T20:55:35.300' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (171, CAST(N'2024-03-11T20:56:04.480' AS DateTime), N'iChris11_', N'Recuperar contraseña', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (172, CAST(N'2024-03-11T20:56:10.557' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (173, CAST(N'2024-03-11T20:56:10.563' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (174, CAST(N'2024-03-11T20:56:17.933' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (175, CAST(N'2024-03-11T20:56:33.473' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (176, CAST(N'2024-03-11T20:56:37.517' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (177, CAST(N'2024-03-11T20:56:56.177' AS DateTime), N'iChris11_', N'Recuperar contraseña', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (178, CAST(N'2024-03-11T20:56:58.853' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (179, CAST(N'2024-03-11T20:56:58.857' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (180, CAST(N'2024-03-11T20:58:49.360' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (181, CAST(N'2024-03-11T20:58:59.267' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (182, CAST(N'2024-03-11T20:59:03.977' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (183, CAST(N'2024-03-11T20:59:17.983' AS DateTime), N'iChris11_', N'Recuperar contraseña', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (184, CAST(N'2024-03-11T21:00:17.803' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (185, CAST(N'2024-03-11T21:00:17.807' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (186, CAST(N'2024-03-11T21:00:38.083' AS DateTime), N'iChris11_', N'Verificacion de correo', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (187, CAST(N'2024-03-11T21:00:41.857' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (188, CAST(N'2024-03-11T21:00:58.037' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (189, CAST(N'2024-03-11T21:02:10.713' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (190, CAST(N'2024-03-11T21:02:22.857' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (191, CAST(N'2024-03-11T21:02:25.843' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (192, CAST(N'2024-03-11T21:02:28.587' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (193, CAST(N'2024-03-11T21:02:35.387' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (194, CAST(N'2024-03-12T11:40:21.780' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (195, CAST(N'2024-03-12T11:40:33.760' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (196, CAST(N'2024-03-12T22:11:12.787' AS DateTime), N'TheViruz18', N'Registro', N'Usuario registrado en el sistema')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (197, CAST(N'2024-03-12T22:12:41.687' AS DateTime), N'TheViruz18', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (198, CAST(N'2024-03-12T22:12:41.690' AS DateTime), N'TheViruz18', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (199, CAST(N'2024-03-12T22:12:59.450' AS DateTime), N'TheViruz18', N'Verificacion de correo', N'Exitosa')
GO
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (200, CAST(N'2024-03-12T22:13:03.147' AS DateTime), N'TheViruz18', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (201, CAST(N'2024-03-12T23:42:06.623' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (202, CAST(N'2024-03-12T23:42:09.253' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (203, CAST(N'2024-03-12T23:42:12.507' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (204, CAST(N'2024-03-12T23:42:12.510' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (205, CAST(N'2024-03-12T23:42:23.830' AS DateTime), N'TheViruz18', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (206, CAST(N'2024-03-13T00:47:25.397' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (207, CAST(N'2024-03-13T00:50:03.863' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (208, CAST(N'2024-03-13T00:50:19.157' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (209, CAST(N'2024-03-13T00:50:23.240' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (210, CAST(N'2024-03-13T00:50:54.743' AS DateTime), N'iChris11_', N'Recuperar contraseña', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (211, CAST(N'2024-03-13T00:51:00.297' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (212, CAST(N'2024-03-13T00:51:09.687' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (213, CAST(N'2024-03-13T00:51:16.470' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (214, CAST(N'2024-03-13T00:51:23.897' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (215, CAST(N'2024-03-13T01:05:00.173' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (216, CAST(N'2024-03-13T01:05:52.933' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (217, CAST(N'2024-03-13T01:05:55.200' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (218, CAST(N'2024-03-13T01:05:57.967' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (219, CAST(N'2024-03-13T01:05:57.980' AS DateTime), N'Sguillen9047', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (220, CAST(N'2024-03-13T01:07:30.383' AS DateTime), N'mgarita', N'Registro', N'Usuario registrado en el sistema')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (221, CAST(N'2024-03-13T01:07:52.113' AS DateTime), N'mgarita', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (222, CAST(N'2024-03-13T01:08:23.967' AS DateTime), N'mgarita', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (223, CAST(N'2024-03-13T01:08:23.970' AS DateTime), N'mgarita', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (224, CAST(N'2024-03-13T01:26:18.783' AS DateTime), N'mgarita', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (225, CAST(N'2024-03-13T01:26:18.787' AS DateTime), N'mgarita', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (226, CAST(N'2024-03-13T01:27:08.507' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (227, CAST(N'2024-03-13T01:27:24.580' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (228, CAST(N'2024-03-13T01:27:32.070' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (229, CAST(N'2024-03-13T02:30:43.793' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (230, CAST(N'2024-03-13T02:30:53.983' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (231, CAST(N'2024-03-13T02:30:58.900' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (232, CAST(N'2024-03-13T02:31:01.827' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (233, CAST(N'2024-03-13T02:39:15.060' AS DateTime), N'mgarita', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (234, CAST(N'2024-03-13T02:39:15.063' AS DateTime), N'mgarita', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (235, CAST(N'2024-03-13T12:38:09.857' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (236, CAST(N'2024-03-13T12:38:20.963' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (237, CAST(N'2024-03-13T12:45:39.630' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (238, CAST(N'2024-03-13T12:45:48.527' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (239, CAST(N'2024-03-13T12:59:05.493' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (240, CAST(N'2024-03-13T12:59:14.393' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (241, CAST(N'2024-03-13T13:02:56.693' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (242, CAST(N'2024-03-13T13:03:07.617' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (243, CAST(N'2024-03-13T13:14:07.373' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (244, CAST(N'2024-03-13T13:14:16.217' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (245, CAST(N'2024-03-13T13:26:59.863' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (246, CAST(N'2024-03-13T13:27:09.210' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (247, CAST(N'2024-03-13T13:28:04.713' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (248, CAST(N'2024-03-13T13:29:21.850' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (249, CAST(N'2024-03-13T13:31:18.930' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (250, CAST(N'2024-03-13T13:32:02.923' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (251, CAST(N'2024-03-13T13:36:04.413' AS DateTime), N'iChris11_', N'Añadio a carrito Aplicacion Movil', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (252, CAST(N'2024-03-13T13:36:22.840' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (253, CAST(N'2024-03-13T13:36:33.683' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (254, CAST(N'2024-03-13T13:36:39.523' AS DateTime), N'iChris11_', N'Añadio a carrito Aplicacion Movil', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (255, CAST(N'2024-03-13T13:37:41.250' AS DateTime), N'iChris11_', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (256, CAST(N'2024-03-13T13:38:29.343' AS DateTime), N'iChris11_', N'Compra de 17,18,19', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (257, CAST(N'2024-03-13T13:42:24.157' AS DateTime), N'iChris11_', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (258, CAST(N'2024-03-13T13:43:26.770' AS DateTime), N'iChris11_', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (259, CAST(N'2024-03-13T13:43:34.670' AS DateTime), N'iChris11_', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (260, CAST(N'2024-03-13T13:43:51.297' AS DateTime), N'iChris11_', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (261, CAST(N'2024-03-13T13:44:14.610' AS DateTime), N'iChris11_', N'Compra de 20,21,22,23', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (262, CAST(N'2024-03-13T13:45:41.543' AS DateTime), N'iChris11_', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (263, CAST(N'2024-03-13T13:48:59.460' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (264, CAST(N'2024-03-13T13:49:13.377' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (265, CAST(N'2024-03-13T13:49:23.037' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (266, CAST(N'2024-03-13T13:49:36.707' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (267, CAST(N'2024-03-13T13:50:05.783' AS DateTime), N'iChris11_', N'Recuperar contraseña', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (268, CAST(N'2024-03-13T13:50:09.047' AS DateTime), N'Sguillen9047', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (269, CAST(N'2024-03-13T13:51:01.253' AS DateTime), N'Sguillen9047', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (270, CAST(N'2024-03-13T13:51:09.970' AS DateTime), N'Sguillen9047', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (271, CAST(N'2024-03-13T13:51:15.503' AS DateTime), N'Sguillen9047', N'Pregunta de seguridad', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (272, CAST(N'2024-03-13T13:51:24.540' AS DateTime), N'Sguillen9047', N'Pregunta de seguridad', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (273, CAST(N'2024-03-13T13:52:31.423' AS DateTime), N'jdcarlos', N'Registro', N'Usuario registrado en el sistema')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (274, CAST(N'2024-03-13T13:52:37.180' AS DateTime), N'jdcarlos', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (275, CAST(N'2024-03-13T13:52:37.183' AS DateTime), N'jdcarlos', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (276, CAST(N'2024-03-13T13:52:47.697' AS DateTime), N'jdcarlos', N'Verificacion de correo', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (277, CAST(N'2024-03-13T13:52:53.380' AS DateTime), N'jdcarlos', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (278, CAST(N'2024-03-13T13:53:12.123' AS DateTime), N'jdcarlos', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (279, CAST(N'2024-03-13T13:53:19.600' AS DateTime), N'jdcarlos', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (280, CAST(N'2024-03-13T13:56:03.633' AS DateTime), N'jdcarlos', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (281, CAST(N'2024-03-13T13:56:13.200' AS DateTime), N'jdcarlos', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (282, CAST(N'2024-03-13T13:56:25.330' AS DateTime), N'jdcarlos', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (283, CAST(N'2024-03-13T13:59:48.577' AS DateTime), N'jdcarlos', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (284, CAST(N'2024-03-13T14:04:42.473' AS DateTime), N'jdcarlos', N'Compra de 25,26', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (285, CAST(N'2024-03-13T14:14:38.427' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (286, CAST(N'2024-03-13T14:14:42.820' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (287, CAST(N'2024-03-13T14:14:47.893' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (288, CAST(N'2024-03-13T14:15:00.730' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (289, CAST(N'2024-03-13T14:15:04.470' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (290, CAST(N'2024-03-13T14:15:17.863' AS DateTime), N'iChris11_', N'Recuperar contraseña', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (291, CAST(N'2024-03-13T14:15:20.940' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (292, CAST(N'2024-03-13T14:15:29.070' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (293, CAST(N'2024-03-13T14:22:54.477' AS DateTime), N'iChris11_', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (294, CAST(N'2024-03-13T14:23:04.183' AS DateTime), N'iChris11_', N'Compra de 24,27', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (295, CAST(N'2024-03-13T14:23:32.703' AS DateTime), N'iChris11_', N'Añadio a carrito Soporte Personalizado', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (296, CAST(N'2024-03-13T14:23:37.840' AS DateTime), N'iChris11_', N'Compra de 28', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (297, CAST(N'2024-03-13T18:23:04.430' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (298, CAST(N'2024-03-13T18:23:20.340' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (299, CAST(N'2024-03-13T19:51:41.360' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
GO
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (300, CAST(N'2024-03-13T19:51:43.857' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (301, CAST(N'2024-03-13T19:51:46.783' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (302, CAST(N'2024-03-13T19:51:46.790' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (303, CAST(N'2024-03-13T19:52:25.810' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (304, CAST(N'2024-03-13T20:26:55.910' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Bloqueado')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (305, CAST(N'2024-03-13T20:27:02.823' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (306, CAST(N'2024-03-13T20:27:23.057' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (307, CAST(N'2024-03-13T20:27:32.343' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (308, CAST(N'2024-03-13T20:28:45.170' AS DateTime), N'iChris11_', N'Cambio contraseña', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (309, CAST(N'2024-03-13T20:28:51.287' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (310, CAST(N'2024-03-13T20:28:58.070' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (311, CAST(N'2024-03-13T20:29:04.150' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (312, CAST(N'2024-03-13T20:29:05.690' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (313, CAST(N'2024-03-13T20:29:33.367' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (314, CAST(N'2024-03-13T22:02:48.637' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (315, CAST(N'2024-03-13T22:02:57.583' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (316, CAST(N'2024-03-13T22:03:02.203' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (317, CAST(N'2024-03-14T15:31:50.977' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (318, CAST(N'2024-03-14T15:31:54.820' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (319, CAST(N'2024-03-14T15:31:57.547' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (320, CAST(N'2024-03-14T15:31:57.553' AS DateTime), N'iChris11_', N'Bloqueo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (321, CAST(N'2024-03-14T15:32:04.900' AS DateTime), N'iChris11_', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (322, CAST(N'2024-03-14T15:32:15.387' AS DateTime), N'iChris11_', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (323, CAST(N'2024-03-14T15:32:19.860' AS DateTime), N'iChris11_', N'Pregunta de seguridad', N'Acertada')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (324, CAST(N'2024-03-14T15:32:39.817' AS DateTime), N'iChris11_', N'Cambio contraseña', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (325, CAST(N'2024-03-14T15:32:44.110' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (326, CAST(N'2024-03-14T15:32:55.277' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (327, CAST(N'2024-03-14T15:34:23.373' AS DateTime), N'TheViruz18', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (328, CAST(N'2024-03-15T18:37:01.063' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (329, CAST(N'2024-03-15T18:37:19.510' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (330, CAST(N'2024-03-20T18:01:55.547' AS DateTime), N'aaroncin', N'Registro', N'Usuario registrado en el sistema')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (331, CAST(N'2024-03-21T18:34:59.520' AS DateTime), N'aaroncin', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (332, CAST(N'2024-03-21T18:34:59.523' AS DateTime), N'aaroncin', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (333, CAST(N'2024-03-21T18:35:07.603' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (334, CAST(N'2024-03-21T18:35:20.577' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (335, CAST(N'2024-03-21T18:35:34.593' AS DateTime), N'iChris11_', N'Añadio a carrito Soporte Personalizado', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (336, CAST(N'2024-03-21T18:35:44.430' AS DateTime), N'iChris11_', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (337, CAST(N'2024-03-21T18:35:47.620' AS DateTime), N'iChris11_', N'Añadio a carrito Aplicacion Movil', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (338, CAST(N'2024-03-21T18:36:14.920' AS DateTime), N'iChris11_', N'Compra de 30,32,33', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1330, CAST(N'2024-03-25T16:28:58.563' AS DateTime), N'prueba123', N'Registro', N'Usuario registrado en el sistema')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1331, CAST(N'2024-03-25T21:54:14.393' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1332, CAST(N'2024-03-25T21:54:28.883' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1333, CAST(N'2024-03-27T02:30:32.500' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1334, CAST(N'2024-03-27T02:30:49.357' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1335, CAST(N'2024-03-29T16:57:38.797' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1336, CAST(N'2024-03-29T16:57:51.870' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1337, CAST(N'2024-03-29T16:59:20.747' AS DateTime), N'iChris11_', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1338, CAST(N'2024-03-29T16:59:39.267' AS DateTime), N'iChris11_', N'Compra de 1031', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1339, CAST(N'2024-03-29T17:13:27.027' AS DateTime), N'iChris11_', N'Añadio a carrito Soporte Personalizado', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1340, CAST(N'2024-03-29T17:13:30.553' AS DateTime), N'iChris11_', N'Añadio a carrito Aplicacion Movil', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1341, CAST(N'2024-03-29T17:13:32.553' AS DateTime), N'iChris11_', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1342, CAST(N'2024-03-29T17:13:56.153' AS DateTime), N'iChris11_', N'Compra de 1032,1033,1034', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1343, CAST(N'2024-03-29T17:39:56.793' AS DateTime), N'iChris11_', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1344, CAST(N'2024-03-29T17:58:38.650' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1345, CAST(N'2024-03-29T17:58:50.553' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1346, CAST(N'2024-03-29T18:55:16.667' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1347, CAST(N'2024-03-29T18:55:38.850' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1348, CAST(N'2024-03-29T18:58:39.800' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1349, CAST(N'2024-03-29T18:58:53.003' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1350, CAST(N'2024-03-29T18:59:55.457' AS DateTime), N'iChris11_', N'Añadio a carrito Soporte Personalizado', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1351, CAST(N'2024-03-29T19:01:51.173' AS DateTime), N'iChris11_', N'Añadio a carrito Soporte Personalizado', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1352, CAST(N'2024-03-29T19:08:55.227' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1353, CAST(N'2024-03-29T19:09:04.727' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1354, CAST(N'2024-03-29T19:09:10.013' AS DateTime), N'iChris11_', N'Añadio a carrito Aplicacion Movil', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1355, CAST(N'2024-03-29T19:09:14.160' AS DateTime), N'iChris11_', N'Añadio a carrito Soporte Personalizado', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1356, CAST(N'2024-03-29T19:10:28.673' AS DateTime), N'iChris11_', N'Añadio a carrito Soporte Personalizado', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1357, CAST(N'2024-03-29T19:14:43.090' AS DateTime), N'iChris11_', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1358, CAST(N'2024-03-29T19:42:49.630' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1359, CAST(N'2024-03-29T19:43:12.003' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1360, CAST(N'2024-03-29T19:43:22.170' AS DateTime), N'iChris11_', N'Compra de 1041', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1361, CAST(N'2024-03-29T19:43:50.623' AS DateTime), N'iChris11_', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1362, CAST(N'2024-03-29T19:44:02.343' AS DateTime), N'iChris11_', N'Compra de 1042', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1363, CAST(N'2024-03-29T19:44:12.007' AS DateTime), N'iChris11_', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1364, CAST(N'2024-03-29T19:45:14.980' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1365, CAST(N'2024-03-29T19:46:13.357' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1366, CAST(N'2024-03-29T19:46:28.270' AS DateTime), N'iChris11_', N'Compra de 1043', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1367, CAST(N'2024-03-29T19:47:45.633' AS DateTime), N'iChris11_', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1368, CAST(N'2024-03-29T19:56:42.413' AS DateTime), N'iChris11_', N'Compra de 1044', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1369, CAST(N'2024-03-29T19:57:37.913' AS DateTime), N'iChris11_', N'Añadio a carrito Aplicacion Movil', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1370, CAST(N'2024-03-29T19:58:53.877' AS DateTime), N'mbarquerof', N'Inicio de sesion', N'Fallido')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1371, CAST(N'2024-03-29T19:59:00.683' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1372, CAST(N'2024-03-29T19:59:39.050' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1373, CAST(N'2024-03-29T20:00:15.977' AS DateTime), N'iChris11_', N'Compra de 1045', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1374, CAST(N'2024-03-29T20:00:45.787' AS DateTime), N'iChris11_', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1375, CAST(N'2024-03-29T20:00:59.690' AS DateTime), N'iChris11_', N'Compra de 1046', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1376, CAST(N'2024-03-29T20:30:08.313' AS DateTime), N'iChris11_', N'Añadio a carrito Software a medida', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1377, CAST(N'2024-03-29T20:31:02.360' AS DateTime), N'iChris11_', N'Compra de 1047', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1378, CAST(N'2024-04-03T16:16:58.987' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1379, CAST(N'2024-04-03T16:17:09.883' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1380, CAST(N'2024-04-03T16:17:24.313' AS DateTime), N'iChris11_', N'Añadio a carrito Soporte Personalizado', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1381, CAST(N'2024-04-03T16:25:19.573' AS DateTime), N'iChris11_', N'Compra de 1048', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (1382, CAST(N'2024-04-03T16:27:38.703' AS DateTime), N'iChris11_', N'Añadio a carrito Soporte Personalizado', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2333, CAST(N'2024-04-11T22:12:30.203' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2334, CAST(N'2024-04-11T22:12:41.993' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2335, CAST(N'2024-04-11T22:15:42.287' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2336, CAST(N'2024-04-11T22:15:53.633' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2337, CAST(N'2024-04-17T09:02:48.193' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2338, CAST(N'2024-04-17T09:03:04.720' AS DateTime), N'iChris11_', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2339, CAST(N'2024-04-18T12:49:41.930' AS DateTime), N'iChris11_', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2340, CAST(N'2024-04-18T12:51:37.950' AS DateTime), N'john', N'Inicio de sesion', N'Exitoso')
GO
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2341, CAST(N'2024-04-18T12:51:37.957' AS DateTime), N'john', N'Inicio de sesion', N'Verificacion de correo')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2342, CAST(N'2024-04-18T12:51:47.513' AS DateTime), N'john', N'Verificacion de correo', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2343, CAST(N'2024-04-18T12:51:50.183' AS DateTime), N'john', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2344, CAST(N'2024-04-18T12:51:58.540' AS DateTime), N'john', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2345, CAST(N'2024-04-18T12:52:05.660' AS DateTime), N'john', N'Añadio a carrito Servicio Web', N'Exitosamente')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2346, CAST(N'2024-04-18T12:52:41.723' AS DateTime), N'john', N'Compra de 2030', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2347, CAST(N'2024-04-18T13:19:17.550' AS DateTime), N'john', N'Inicio de sesion', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2348, CAST(N'2024-04-18T13:19:27.753' AS DateTime), N'john', N'Verificacion', N'Exitosa')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2349, CAST(N'2024-04-18T13:19:34.907' AS DateTime), N'john', N'Recuperar ingreso email', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2350, CAST(N'2024-04-18T13:19:43.710' AS DateTime), N'john', N'Recuperar ingreso codigo', N'Exitoso')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2351, CAST(N'2024-04-18T13:19:48.383' AS DateTime), N'john', N'Pregunta de seguridad', N'Fallida')
INSERT [dbo].[Logs] ([id], [timestamp], [username], [action], [details]) VALUES (2352, CAST(N'2024-04-18T13:19:53.470' AS DateTime), N'john', N'Pregunta de seguridad', N'Acertada')
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([id_person], [full_name], [email], [phone], [provincias], [cantones], [distritos]) VALUES (1, N'John', N'john@example.com', N'123456789', N'San Jose', N'Escazu', N'San Rafael')
INSERT [dbo].[Persons] ([id_person], [full_name], [email], [phone], [provincias], [cantones], [distritos]) VALUES (2, N'Jane Smith', N'jane@example.com', N'987654321', N'Heredia', N'Heredia', N'Mercedes')
INSERT [dbo].[Persons] ([id_person], [full_name], [email], [phone], [provincias], [cantones], [distritos]) VALUES (3, N'Michael Johnson', N'michael@example.com', N'456123789', N'Cartago', N'Cartago', N'Oriental')
INSERT [dbo].[Persons] ([id_person], [full_name], [email], [phone], [provincias], [cantones], [distritos]) VALUES (4, N'Emily Davis', N'emily@example.com', N'789456123', N'Alajuela', N'Alajuela', N'Central')
INSERT [dbo].[Persons] ([id_person], [full_name], [email], [phone], [provincias], [cantones], [distritos]) VALUES (5, N'Christian Barquero', N'chrisbf11@gmail.com', N'86159455', N'Cartago', N'Cartago', N'Oriental')
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchases] ON 

INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1, 14, N'iChris11_', N'tarjeta', N'$2b$10$EVo9Eh4KJmDgi85fI.gTDeryjYG/AK.CylV/FpJedo7rKi37Xh8L6', CAST(N'2024-03-13T13:32:17.353' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (2, 15, N'iChris11_', N'tarjeta', N'$2b$10$A5R7.U2mzQNpapYVpRyS5uXP7aN/WcFvPyy39p3JnlEbegteh/tdG', CAST(N'2024-03-13T13:32:17.417' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (3, 16, N'iChris11_', N'tarjeta', N'$2b$10$T/Smn9Ul0XB08lHafMyx0uqNf2LCa5SYkSy12h854OxlE9GGcGiXu', CAST(N'2024-03-13T13:32:17.477' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (4, 17, N'iChris11_', N'transferencia', N'$2b$10$tZKiQY5myf8E2v3iUKUoaeICqincY5fvMQJjye2FnhSA/0Amqggxu', CAST(N'2024-03-13T13:38:29.217' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (5, 18, N'iChris11_', N'transferencia', N'$2b$10$nylxSh4vdsL5XPH.24aAn.LbppxlxxGHlVCO6OvuJRnqS1VBpd/kG', CAST(N'2024-03-13T13:38:29.280' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (6, 19, N'iChris11_', N'transferencia', N'$2b$10$j6QbkGbTLTkNxaVoojZe1ejCFEwqE9YGk2BFRmJcS/b78eb5HljHS', CAST(N'2024-03-13T13:38:29.340' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (7, 20, N'iChris11_', N'paypal', N'$2b$10$C6rqbgvaWzZYHpfbzM1TG.noHQm5jBPpTug0FHAWN16MHR1pbBX8O', CAST(N'2024-03-13T13:44:14.423' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (8, 21, N'iChris11_', N'paypal', N'$2b$10$8bAnJzP.EOQIvQ95oHdAv.4BD.VIVOQbGx6jba.5XcQJ5cDefMx4u', CAST(N'2024-03-13T13:44:14.487' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (9, 22, N'iChris11_', N'paypal', N'$2b$10$qbUwWnRRwcv5ADXbIJQNGOwcvBG8NlgJwYgQvPRG2QW5xE9nTi/2i', CAST(N'2024-03-13T13:44:14.547' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (10, 23, N'iChris11_', N'paypal', N'$2b$10$S80whB1EJXe0ccu3bJuGwubH6pOFYK7/NroFarNcJEbQ8I6IdPmvi', CAST(N'2024-03-13T13:44:14.607' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (11, 25, N'jdcarlos', N'tarjeta', N'$2b$10$WUzZ4tB2UhTxDX3NDgHrzekxm/TCfHybFonfNi/.TdCayI6B69C/S', CAST(N'2024-03-13T14:04:42.400' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (12, 26, N'jdcarlos', N'tarjeta', N'$2b$10$NPIUx9S.T1C8HO7WqEZEqeJsQkmO4rEJ5TD8BIHqP6mTcFjJ3Xmeu', CAST(N'2024-03-13T14:04:42.470' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (13, 24, N'iChris11_', N'tarjeta', N'$2b$10$FwyJYr0s3sZDY9Tht/7aFOh5J5gRzKXa5jmA8xsen4QOkYyA0G29.', CAST(N'2024-03-13T14:23:04.120' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (14, 27, N'iChris11_', N'tarjeta', N'$2b$10$6Ey8oQ4/U0xUNWg8rhGTF.CgnmN0fAn06orzzPKTlJiB0zhJ8smGm', CAST(N'2024-03-13T14:23:04.180' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (15, 28, N'iChris11_', N'paypal', N'$2b$10$Fd98uWR5mRVcI6u5e4pi4OC3zlsVG.Q5w3LKhGJQnCm2kZHysqpjm', CAST(N'2024-03-13T14:23:37.840' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (16, 30, N'iChris11_', N'tarjeta', N'$2b$10$rC6CMCcmtuhb.Hh39H8L.eFfCXEKxkXskGPJLBE6mGWrxW3ucsVhC', CAST(N'2024-03-21T18:36:14.780' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (17, 32, N'iChris11_', N'tarjeta', N'$2b$10$IOCZshrxzx1YcLjlcGJQderkR9vOnszWsw3olFPv4k9ZruAEh8DqS', CAST(N'2024-03-21T18:36:14.843' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (18, 33, N'iChris11_', N'tarjeta', N'$2b$10$jIXrktttBanX8BwNFgN7iuJOUCsRjdU/gSyRM5wuOuVo.mMdiA1Jm', CAST(N'2024-03-21T18:36:14.917' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1016, 1031, N'iChris11_', N'tarjeta', N'$2b$10$zIbkCzuzOakBPs5sfBiV8ehxGcr2Mf2rxEjOuCQtKanUYb3ZceLN2', CAST(N'2024-03-29T16:59:39.263' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1017, 1032, N'iChris11_', N'tarjeta', N'$2b$10$7tE4haVKlBtnN2N.Rbe7QetB7M28wPFe4OIEr0AZaaSqwG6UXtU5G', CAST(N'2024-03-29T17:13:56.027' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1018, 1033, N'iChris11_', N'tarjeta', N'$2b$10$3zD8L5hSg5UUZWPo8wBH8eb8VFvFN2Ct6aAZJ8nPAsrG7/X.U8nOm', CAST(N'2024-03-29T17:13:56.090' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1019, 1034, N'iChris11_', N'tarjeta', N'$2b$10$v5pkzwU5XoUenpbCN8iWS.52KU3xrX/CTy3MUSr51a21Q2RFj4cOy', CAST(N'2024-03-29T17:13:56.150' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1020, 1041, N'iChris11_', N'tarjeta', N'$2b$10$IIMD8rgsHUQ0dYgAfiVtXOjWoenn1tW8Mn2SPWuYVXImPUDNEFVfq', CAST(N'2024-03-29T19:43:22.167' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1021, 1042, N'iChris11_', N'tarjeta', N'$2b$10$rGTNybs3TPPR0bHIXZC35ejJCqV/XZNnjcE0FowdbQKDwwebhQqOa', CAST(N'2024-03-29T19:44:02.340' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1022, 1043, N'iChris11_', N'tarjeta', N'$2b$10$.b5FbHyhNtZqtUV2CXeX8ukztUEUt2b3RTA2UjvOPCo9iw0GuvzD2', CAST(N'2024-03-29T19:46:28.270' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1023, 1044, N'iChris11_', N'tarjeta', N'$2b$10$k6gQqi9Uwgoyen2pEC4.4uN./K.UKExtqrYNzSavMFKaelUGyu35q', CAST(N'2024-03-29T19:56:42.410' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1024, 1045, N'iChris11_', N'tarjeta', N'$2b$10$8vYv6NKHDnr2YthnCwrc5u8OBoDg8LJM/Z5kx5ON.3gtEJxqRjY8O', CAST(N'2024-03-29T20:00:15.970' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1025, 1046, N'iChris11_', N'tarjeta', N'$2b$10$FoA4QvE5ffR0BKeUqbLOCuVderupyyex.Z7Trx5iQc2OIE39Cvs.W', CAST(N'2024-03-29T20:00:59.687' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1026, 1047, N'iChris11_', N'tarjeta', N'$2b$10$D8.6JEKxYe9Sbhhr5ClTsOwmdPPbheFuX40FI1WHQuIDrOm1S8wY.', CAST(N'2024-03-29T20:31:02.357' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (1027, 1048, N'iChris11_', N'tarjeta', N'$2b$10$03f2vSHhDFI/pjzl3NAC8OX0CvkwUd90FtbPchUuI4Ia0PiMk1Lzi', CAST(N'2024-04-03T16:25:19.570' AS DateTime))
INSERT [dbo].[Purchases] ([purchase_id], [service_id], [username], [payment_method], [payment_method_data], [purchase_date]) VALUES (2016, 2030, N'john', N'tarjeta', N'$2b$10$evgRrZS9oR1NijCr10lPRerKqwv.3tsOF5vRkl9oc448uy5Gn7OnO', CAST(N'2024-04-18T12:52:41.720' AS DateTime))
SET IDENTITY_INSERT [dbo].[Purchases] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (8, N'Servicio Web', N'sguillena', N'pending', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (9, N'Software a medida', N'sguillena', N'pending', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (10, N'Soporte Personalizado', N'sguillena', N'pending', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (11, N'Aplicacion Movil', N'sguillena', N'pending', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (12, N'Soporte Personalizado', N'mbarquerof', N'pending', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (13, N'Soporte Personalizado', N'christianbarquero_', N'pending', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (14, N'Soporte Personalizado', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (15, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (16, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (17, N'Aplicacion Movil', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (18, N'Aplicacion Movil', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (19, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (20, N'Software a medida', N'iChris11_', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (21, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (22, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (23, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (24, N'Software a medida', N'iChris11_', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (25, N'Servicio Web', N'jdcarlos', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (26, N'Software a medida', N'jdcarlos', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (27, N'Software a medida', N'iChris11_', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (28, N'Soporte Personalizado', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (30, N'Soporte Personalizado', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (32, N'Software a medida', N'iChris11_', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (33, N'Aplicacion Movil', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1031, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1032, N'Soporte Personalizado', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1033, N'Aplicacion Movil', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1034, N'Software a medida', N'iChris11_', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1035, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1036, N'Soporte Personalizado', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1037, N'Soporte Personalizado', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1038, N'Aplicacion Movil', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1039, N'Soporte Personalizado', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1040, N'Soporte Personalizado', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1041, N'Software a medida', N'iChris11_', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1042, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1043, N'Software a medida', N'iChris11_', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1044, N'Software a medida', N'iChris11_', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1045, N'Aplicacion Movil', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1046, N'Servicio Web', N'iChris11_', N'purchased', 2500)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1047, N'Software a medida', N'iChris11_', N'purchased', 5000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1048, N'Soporte Personalizado', N'iChris11_', N'purchased', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (1049, N'Soporte Personalizado', N'iChris11_', N'pending', 1000)
INSERT [dbo].[Services] ([id], [service], [username], [purchase_status], [price]) VALUES (2030, N'Servicio Web', N'john', N'purchased', 2500)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Tokens] ON 

INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (52, N'oscardd', N'65a244', CAST(N'2024-03-11T17:56:26.797' AS DateTime))
INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (66, N'null', N'70952b', CAST(N'2024-03-11T22:55:10.243' AS DateTime))
INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (78, N'mariibarquero', N'd25c6b', CAST(N'2024-03-12T00:17:29.173' AS DateTime))
INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (102, N'mgarita', N'1a44bf', CAST(N'2024-03-13T08:49:15.047' AS DateTime))
INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (113, N'Sguillen9047', N'48984f', CAST(N'2024-03-13T20:01:01.240' AS DateTime))
INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (116, N'jdcarlos', N'a690b9', CAST(N'2024-03-13T20:06:03.623' AS DateTime))
INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (126, N'TheViruz18', N'13a9cd', CAST(N'2024-03-14T21:44:23.357' AS DateTime))
INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (128, N'aaroncin', N'95da90', CAST(N'2024-03-22T00:44:59.503' AS DateTime))
INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (2132, N'iChris11_', N'a84926', CAST(N'2024-04-18T18:59:41.913' AS DateTime))
INSERT [dbo].[Tokens] ([id_token], [username], [token], [expiration_time]) VALUES (2136, N'john', N'eeee09', CAST(N'2024-04-18T19:29:34.883' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tokens] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (1, N'Sebastian Guillen Guzman', N'sguillenguzman@gmail.com', N'Sguillen9047', N'$2b$10$Biox4wF7LCNJdMxgU4ebienbDUhg4Tu7TCuERLyv7/AFpUzXsikLO', N'+506 8956 0219', N'¿Cuál es el nombre de tu mascota?', N'$2b$10$.BuzSpLeTs9YyqPS9O.xlOLf5vKaNKlok1TnrY2OdpNWdKbx3KfNG', N'inactive', N'verified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (2, N'Christian Barquero Flores', N'chrisbf11@gmail.com', N'iChris11_', N'$2b$10$nn/eUTE4s3jumEQbEItNAugb9LYqs4ptLB2oR.r8lIS85WGsWn3nG', N'+506 8615 9455', N'¿Cuál es el nombre de tu lugar de nacimiento?', N'$2b$10$LGMdxrBw9.c7jXp500CVlONJtX85rZZKpN83.u7ETHseaEH49mMPu', N'active', N'verified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (3, N'Maripaz Barquero Flores', N'b10maripaz23@gmail.com', N'mariibarquero', N'$2b$10$1YcFBylPG7kTHZuAaX272eqbljA0Xm8Ay3Wg/hcpk0qO1wG2LQsT.', N'+506 8615 9564', N'¿Cuál es el nombre de tu mejor amigo/a?', N'$2b$10$rdAdkUdCE/tMDn3klaztcOwDudJxvGL.c.mpl0mShR87CncOJJ5Va', N'active', N'verified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (4, N'Oscar Duarte', N'oscarduarte1283re@gmail.com', N'oscardd', N'$2b$10$BxJd8MRd1yaO6CFoWx//cuhSAp9J.cTKxvFjVXzEzHGdf4reITk3.', N'82737473', N'¿Cuál es la marca de tu primer auto?', N'$2b$10$IWoAC4oS/cqPZxLMTp3cZer2iG06cfdmLD6FnBXAE/0IHP7xuP.Ga', N'active', N'unverified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (6, N'Sergio Monge Montoya', N'serale1804@gmail.com', N'TheViruz18', N'$2b$10$lnS93YxQel667/K2n1kfIe9mycwMX23StRD.JtyflxUWnw0NwA73y', N'+506 8153 8251', N'¿Dónde fue tu primer viaje en avión?', N'$2b$10$bksJ62veZsqIz3ygWMdlee5YT9xIcImubImDsYE4X1MA.QBKF/80m', N'active', N'verified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (7, N'Margarita rBrenes', N'abrenespoew@gmail.com', N'mgarita', N'$2b$10$xQXtlLRYdGCYZuqCPptQkuBgm1utneuYPMJm/TsZTZle4REFnba/G', N'+506 1253 4374', N'¿Cuál es tu serie de televisión favorita?', N'The Witcher', N'active', N'unverified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (8, N'Juan Carlos', N'jdcarlosdsadj1@gmail.com', N'jdcarlos', N'$2b$10$iV9FqQwJ2f6j/ZBi0.dmietedRxlcP6AlcWVuTAVWyW4JkmtCl7cm', N'+506 2321 2141', N'¿Dónde fue tu primer viaje en avión?', N'$2b$10$AJlNBKqXOhejDLhbhBKWV.PAR0Edc14hqvX7KDH0TItpmtD0Z3Aru', N'active', N'verified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (9, N'Aaron', N'aaron56231fe@gmail.com', N'aaroncin', N'$2b$10$vLymrSCZFto9K07Dcnzvg.kAkknkXV1aB1z1XtYi2u2nmDWsot7nK', N'+506 2348 9455', N'¿Cuál es tu comida favorita?', N'$2b$10$ikN9EMSCsFuHPQHQcIZbG.0IMEGcb7arCPj6fPE5gaxN17JxKFYr.', N'active', N'unverified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (1009, N'Prueba', N'chrisbf1105@gmail.com', N'prueba123', N'$2b$10$s.qfdQfU4MIWeqytYKxnA.ncrIZ84MKztBPKZwnqUEJKUgXWOTdTW', N'+50686159455', N'¿Cuál es tu serie de televisión favorita?', N'$2b$10$G9cYTcDoCpVobZ1eggrGpOAa0aCY8TXZQAeRzZFZ/7/RcRZsN4AvC', N'active', N'unverified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (1010, N'Nombre Apellido', N'correo@example.com', N'usuario_prueba', N'contraseña123', N'123456789', N'¿Cuál es tu color favorito?', N'azul', N'active', N'unverified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (1011, N'Prueba', N'chrisbf1105@gmail.com', N'Testeo', N'SADSAD@1', N'+50686159455', N'¿Cuál es tu color favorito?', N'Negro', N'active', N'unverified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (1012, N'asdasds', N'chrisbf11@gmail.com', N'asdasdad', N'$2b$10$OffBhlkkwAiJw9OQgDR.BOUSifAiZvtF6/UwoXg3XM5yG9TnGQ3tm', N'+50686159455', N'¿Cuál es tu deporte favorito?', N'$2b$10$PV6v76rTllQUf/LZcHRYIudBEeDlin/fPTmo6IQ0n8gblF9j.Qi7K', N'active', N'unverified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (1013, N'John', N'john@example.com', N'john', N'$2b$10$88GErnPLEYQmO3wbt43JieI11RujwM03BlB/qdXIB9R.VtNAxQvVm', N'123456789', N'¿Cuál es tu color favorito?', N'$2b$10$BDIsvhBI6wk1lJnGh6fX0e5yqW4dw1YSCoCTZv4D/3WWbQiGWIEnK', N'active', N'verified')
INSERT [dbo].[Users] ([id_user], [full_name], [email], [username], [password], [phone], [security_question], [security_answer], [status], [verification]) VALUES (1014, N'Christian Barquero Flores', N'chrisbf11@gmail.com', N'cbarquerof', N'$2a$10$1RrSZFWLDqhX0.JnmbR4JOal04oYAOIn/wS5Dwm.b2vc76sfKvk0G', N'86159455', N'¿Cuál es el nombre de tu lugar de nacimiento?', N'$2a$10$j10g5zA0OHaJ2BblFCf./uUB1ZOHuQwDzJ1LUy6yVOd4zaD3HKWey', N'active', N'unverified')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationAttempts] ON 

INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (1, CAST(N'2024-03-08T02:44:21.723' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (2, CAST(N'2024-03-08T02:44:33.400' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (3, CAST(N'2024-03-08T02:44:36.200' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (4, CAST(N'2024-03-08T02:52:20.700' AS DateTime), N'mariibarquero', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (5, CAST(N'2024-03-08T02:55:39.473' AS DateTime), N'Sguillen9047', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (6, CAST(N'2024-03-08T02:55:41.930' AS DateTime), N'Sguillen9047', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (7, CAST(N'2024-03-08T03:07:27.543' AS DateTime), N'Sguillen9047', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (8, CAST(N'2024-03-08T03:08:46.883' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (9, CAST(N'2024-03-08T03:09:18.043' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (10, CAST(N'2024-03-08T03:09:20.840' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (11, CAST(N'2024-03-08T03:12:46.333' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (12, CAST(N'2024-03-08T03:13:33.543' AS DateTime), N'Sguillen9047', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (13, CAST(N'2024-03-08T03:16:18.337' AS DateTime), N'mariibarquero', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (14, CAST(N'2024-03-08T03:16:26.287' AS DateTime), N'mariibarquero', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (15, CAST(N'2024-03-08T03:17:09.427' AS DateTime), N'Sguillen9047', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (16, CAST(N'2024-03-08T03:18:54.320' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (17, CAST(N'2024-03-08T03:26:14.560' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (18, CAST(N'2024-03-08T03:26:31.330' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (19, CAST(N'2024-03-08T03:27:04.443' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (20, CAST(N'2024-03-08T03:43:11.653' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (21, CAST(N'2024-03-08T03:43:22.210' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (22, CAST(N'2024-03-08T03:50:21.743' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (23, CAST(N'2024-03-08T03:52:09.083' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (24, CAST(N'2024-03-08T03:52:41.893' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (25, CAST(N'2024-03-08T03:52:44.220' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (26, CAST(N'2024-03-08T03:59:36.777' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (27, CAST(N'2024-03-08T04:22:30.270' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (28, CAST(N'2024-03-09T18:05:48.267' AS DateTime), N'iChris11_', N'Recuperado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (29, CAST(N'2024-03-11T11:57:32.850' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (30, CAST(N'2024-03-11T11:58:13.257' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (31, CAST(N'2024-03-11T11:58:36.457' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (32, CAST(N'2024-03-11T11:58:41.990' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (33, CAST(N'2024-03-11T11:59:52.930' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (34, CAST(N'2024-03-11T12:00:04.290' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (35, CAST(N'2024-03-11T12:11:05.320' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (36, CAST(N'2024-03-11T12:11:42.637' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (37, CAST(N'2024-03-11T12:11:46.110' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (38, CAST(N'2024-03-11T12:11:48.347' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (39, CAST(N'2024-03-11T14:09:14.593' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (40, CAST(N'2024-03-11T20:13:47.410' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (41, CAST(N'2024-03-11T20:55:15.840' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (42, CAST(N'2024-03-11T20:56:10.553' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (43, CAST(N'2024-03-11T20:56:58.850' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (44, CAST(N'2024-03-12T23:42:06.620' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (45, CAST(N'2024-03-12T23:42:09.250' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (46, CAST(N'2024-03-12T23:42:12.503' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (47, CAST(N'2024-03-13T00:47:25.390' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (48, CAST(N'2024-03-13T00:51:23.897' AS DateTime), N'Sguillen9047', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (49, CAST(N'2024-03-13T01:05:52.930' AS DateTime), N'Sguillen9047', N'Fallida')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (50, CAST(N'2024-03-13T01:05:55.200' AS DateTime), N'Sguillen9047', N'Fallida')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (51, CAST(N'2024-03-13T01:05:57.960' AS DateTime), N'Sguillen9047', N'Fallida')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (52, CAST(N'2024-03-13T01:07:52.110' AS DateTime), N'mgarita', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (53, CAST(N'2024-03-13T13:48:59.457' AS DateTime), N'Sguillen9047', N'Fallida')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (54, CAST(N'2024-03-13T13:50:09.043' AS DateTime), N'Sguillen9047', N'Fallida')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (55, CAST(N'2024-03-13T14:14:38.423' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (56, CAST(N'2024-03-13T14:14:42.817' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (57, CAST(N'2024-03-13T19:51:41.357' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (58, CAST(N'2024-03-13T19:51:43.853' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (59, CAST(N'2024-03-13T19:51:46.783' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (60, CAST(N'2024-03-13T19:52:25.807' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (61, CAST(N'2024-03-13T20:26:55.907' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (62, CAST(N'2024-03-13T20:28:51.283' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (63, CAST(N'2024-03-13T20:28:58.067' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (64, CAST(N'2024-03-14T15:31:50.970' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (65, CAST(N'2024-03-14T15:31:54.820' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (66, CAST(N'2024-03-14T15:31:57.547' AS DateTime), N'iChris11_', N'Verificado')
INSERT [dbo].[VerificationAttempts] ([id], [timestamp], [username], [action]) VALUES (67, CAST(N'2024-03-29T19:58:53.873' AS DateTime), N'mbarquerof', N'Fallida')
SET IDENTITY_INSERT [dbo].[VerificationAttempts] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CuentasB__90FF5A615773BA9A]    Script Date: 27/4/2024 19:38:37 ******/
ALTER TABLE [dbo].[CuentasBancarias] ADD UNIQUE NONCLUSTERED 
(
	[numero_tarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CuentasB__FD371C8E76BAD71A]    Script Date: 27/4/2024 19:38:37 ******/
ALTER TABLE [dbo].[CuentasBancarias] ADD UNIQUE NONCLUSTERED 
(
	[cuenta_bancaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CuentasBancarias] ADD  DEFAULT ((0)) FOR [saldo]
GO
ALTER TABLE [dbo].[Logs] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[Purchases] ADD  DEFAULT (getdate()) FOR [purchase_date]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT ('pending') FOR [purchase_status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Status]  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('unverified') FOR [verification]
GO
ALTER TABLE [dbo].[VerificationAttempts] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
USE [master]
GO
ALTER DATABASE [InnovateSoft Solutions] SET  READ_WRITE 
GO
