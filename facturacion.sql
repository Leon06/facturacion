USE [master]
GO
/****** Object:  Database [Facturacion]    Script Date: 03/06/2022 0:56:32 ******/
CREATE DATABASE [Facturacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Facturacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Facturacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Facturacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Facturacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Facturacion] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Facturacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Facturacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Facturacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Facturacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Facturacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Facturacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Facturacion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Facturacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Facturacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Facturacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Facturacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Facturacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Facturacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Facturacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Facturacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Facturacion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Facturacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Facturacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Facturacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Facturacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Facturacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Facturacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Facturacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Facturacion] SET RECOVERY FULL 
GO
ALTER DATABASE [Facturacion] SET  MULTI_USER 
GO
ALTER DATABASE [Facturacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Facturacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Facturacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Facturacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Facturacion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Facturacion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Facturacion', N'ON'
GO
ALTER DATABASE [Facturacion] SET QUERY_STORE = OFF
GO
USE [Facturacion]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 03/06/2022 0:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Cedula] [int] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 03/06/2022 0:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaDetalle]    Script Date: 03/06/2022 0:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaDetalle](
	[IdFacturaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[IdFactura] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_FacturaDetalle] PRIMARY KEY CLUSTERED 
(
	[IdFacturaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 03/06/2022 0:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[IdInventario] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[IdInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 03/06/2022 0:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Factura]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Producto]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Producto]
GO
USE [master]
GO
ALTER DATABASE [Facturacion] SET  READ_WRITE 
GO
