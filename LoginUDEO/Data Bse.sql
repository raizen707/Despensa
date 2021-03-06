USE [master]
GO
/****** Object:  Database [Despensa]    Script Date: 19/02/2018 9:18:32 p. m. ******/
CREATE DATABASE [Despensa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Despensa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Despensa.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Despensa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Despensa_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Despensa] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Despensa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Despensa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Despensa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Despensa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Despensa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Despensa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Despensa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Despensa] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Despensa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Despensa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Despensa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Despensa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Despensa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Despensa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Despensa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Despensa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Despensa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Despensa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Despensa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Despensa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Despensa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Despensa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Despensa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Despensa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Despensa] SET RECOVERY FULL 
GO
ALTER DATABASE [Despensa] SET  MULTI_USER 
GO
ALTER DATABASE [Despensa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Despensa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Despensa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Despensa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Despensa', N'ON'
GO
USE [Despensa]
GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 19/02/2018 9:18:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bodega](
	[idBodega] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[estado] [int] NULL,
	[telefono] [int] NULL,
	[fax] [int] NULL,
 CONSTRAINT [PK_Bodega] PRIMARY KEY CLUSTERED 
(
	[idBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bodegaProducto]    Script Date: 19/02/2018 9:18:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bodegaProducto](
	[idProducto] [int] NOT NULL,
	[idBodega] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [PK__bodegaPr__6234A82960C25895] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC,
	[idBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estado]    Script Date: 19/02/2018 9:18:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estado](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 19/02/2018 9:18:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Bodega_estado] FOREIGN KEY([estado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[Bodega] CHECK CONSTRAINT [FK_Bodega_estado]
GO
ALTER TABLE [dbo].[bodegaProducto]  WITH CHECK ADD  CONSTRAINT [FK_bodegaProducto_Bodega] FOREIGN KEY([idBodega])
REFERENCES [dbo].[Bodega] ([idBodega])
GO
ALTER TABLE [dbo].[bodegaProducto] CHECK CONSTRAINT [FK_bodegaProducto_Bodega]
GO
ALTER TABLE [dbo].[bodegaProducto]  WITH CHECK ADD  CONSTRAINT [FK_bodegaProducto_estado] FOREIGN KEY([estado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[bodegaProducto] CHECK CONSTRAINT [FK_bodegaProducto_estado]
GO
ALTER TABLE [dbo].[bodegaProducto]  WITH CHECK ADD  CONSTRAINT [FK_bodegaProducto_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[bodegaProducto] CHECK CONSTRAINT [FK_bodegaProducto_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_estado] FOREIGN KEY([estado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_estado]
GO
USE [master]
GO
ALTER DATABASE [Despensa] SET  READ_WRITE 
GO
