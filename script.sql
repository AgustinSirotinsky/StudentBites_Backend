USE [master]
GO
/****** Object:  Database [StudentBites]    Script Date: 1/9/2023 08:56:04 ******/
CREATE DATABASE [StudentBites]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentBites', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StudentBites.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentBites_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StudentBites_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StudentBites] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentBites].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentBites] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentBites] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentBites] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentBites] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentBites] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentBites] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentBites] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentBites] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentBites] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentBites] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentBites] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentBites] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentBites] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentBites] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentBites] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentBites] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentBites] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentBites] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentBites] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentBites] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentBites] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentBites] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentBites] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentBites] SET  MULTI_USER 
GO
ALTER DATABASE [StudentBites] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentBites] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentBites] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentBites] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentBites] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentBites', N'ON'
GO
ALTER DATABASE [StudentBites] SET QUERY_STORE = OFF
GO
USE [StudentBites]
GO
/****** Object:  User [alumno]    Script Date: 1/9/2023 08:56:04 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ComidaxLocal]    Script Date: 1/9/2023 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComidaxLocal](
	[ComidaID] [int] NOT NULL,
	[LocalID] [int] NOT NULL,
	[IDComidaXLocal] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ComidaxLocal] PRIMARY KEY CLUSTERED 
(
	[IDComidaXLocal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagenes]    Script Date: 1/9/2023 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagenes](
	[LocalID] [int] NOT NULL,
	[IDImagen] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Local]    Script Date: 1/9/2023 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Local](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Calificacion] [int] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Contacto] [varchar](50) NULL,
	[Precio] [int] NOT NULL,
	[Poblacion] [int] NOT NULL,
	[Tardanza] [int] NOT NULL,
	[PedirPorAdelantado] [bit] NOT NULL,
	[Portada] [varchar](max) NULL,
 CONSTRAINT [PK_Locales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseña]    Script Date: 1/9/2023 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseña](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[LocalID] [int] NOT NULL,
	[Calificacion] [int] NOT NULL,
	[ComidaID] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[Tardanza] [int] NOT NULL,
	[Poblacion] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Reseñas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeguidosXUsuario]    Script Date: 1/9/2023 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeguidosXUsuario](
	[IDSeguidos] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[IDSeguidosXUsuario] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SeguidosXUsuario] PRIMARY KEY CLUSTERED 
(
	[IDSeguidosXUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeComida]    Script Date: 1/9/2023 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeComida](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Comida] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDeComida] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 1/9/2023 08:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Foto] [varchar](max) NOT NULL,
	[isBanned] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ComidaxLocal] ON 

INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID], [IDComidaXLocal]) VALUES (3, 1, 1)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID], [IDComidaXLocal]) VALUES (5, 2, 2)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID], [IDComidaXLocal]) VALUES (7, 2, 3)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID], [IDComidaXLocal]) VALUES (3, 3, 4)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID], [IDComidaXLocal]) VALUES (8, 3, 5)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID], [IDComidaXLocal]) VALUES (6, 5, 6)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID], [IDComidaXLocal]) VALUES (5, 6, 7)
SET IDENTITY_INSERT [dbo].[ComidaxLocal] OFF
GO
INSERT [dbo].[Imagenes] ([LocalID], [IDImagen]) VALUES (1, N'chinojorge1.jpg')
INSERT [dbo].[Imagenes] ([LocalID], [IDImagen]) VALUES (1, N'chinojorge2.jpg')
INSERT [dbo].[Imagenes] ([LocalID], [IDImagen]) VALUES (1, N'chinojorge3.jpg')
GO
SET IDENTITY_INSERT [dbo].[Local] ON 

INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada]) VALUES (1, N'Kwom Yuen
', 9, N'Yatay 213', N'01149587733', 700, 2, 2, 0, NULL)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada]) VALUES (2, N'Cri Cri', 6, N'Av. Díaz Vélez 4401', NULL, 800, 1, 1, 0, NULL)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada]) VALUES (3, N'Green Deli', 8, N'Av. Díaz Vélez 4501', NULL, 1000, 4, 3, 0, NULL)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada]) VALUES (5, N'Via Veneto', 7, N'Av. Díaz Vélez 4459', N'01149825572', 700, 3, 2, 0, NULL)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada]) VALUES (6, N'Impanato', 8, N'Tte. Gral. Juan Domingo Perón 4402', N'01126112100', 1000, 2, 2, 1, NULL)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada]) VALUES (11, N'Pollin', 9, N'Rio de janeiro 320', N'01149813487', 700, 3, 1, 1, NULL)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada]) VALUES (12, N'El Vasquito', 9, N'Río de Janeiro 310', N'01149822220', 900, 4, 2, 0, NULL)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada]) VALUES (15, N'Mcdonalds', 6, N'Rivadavia 6620', NULL, 1000, 3, 2, 1, N'https://utopiaurbana.city/2022/07/13/conoce-la-estrategia-de-sostenibilidad-de-mcdonalds/')
SET IDENTITY_INSERT [dbo].[Local] OFF
GO
SET IDENTITY_INSERT [dbo].[Reseña] ON 

INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (5, 2, 1, 10, 3, 900, 1, N'2', N'Uno de los mejores lugares AASHDSVD cambirrrr')
INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (6, 2, 2, 9, 3, 600, 2, N'1', N'SAQUENME DE ACA AAAAAAAAAAAAAAAAAAAAA')
INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (7, 4, 1, 1, 5, 299483, 10000, N'1', N'MALARDOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO')
SET IDENTITY_INSERT [dbo].[Reseña] OFF
GO
SET IDENTITY_INSERT [dbo].[SeguidosXUsuario] ON 

INSERT [dbo].[SeguidosXUsuario] ([IDSeguidos], [IDUsuario], [IDSeguidosXUsuario]) VALUES (4, 2, 1)
INSERT [dbo].[SeguidosXUsuario] ([IDSeguidos], [IDUsuario], [IDSeguidosXUsuario]) VALUES (5, 2, 2)
INSERT [dbo].[SeguidosXUsuario] ([IDSeguidos], [IDUsuario], [IDSeguidosXUsuario]) VALUES (2, 5, 3)
SET IDENTITY_INSERT [dbo].[SeguidosXUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDeComida] ON 

INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (3, N'Comida china')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (4, N'Pizza')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (5, N'Empanada')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (6, N'Pastas')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (7, N'Sanguches')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (8, N'Vegetariano')
SET IDENTITY_INSERT [dbo].[TipoDeComida] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned]) VALUES (2, N'agussiro06@gmail.com', N'agussiro06', N'CONTRASEÑA', N'agussiro06.jpg', 0)
INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned]) VALUES (4, N'sergiosiro77@gmail.com', N'sergiosiro77', N'CONTRASEÑAPERO2', N'sergiosiro77.jpg', 0)
INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned]) VALUES (5, N'jeansimonkevin05@gmail.com
', N'jeansimonkevin05', N'CONTRASEÑAPEROAHORA3JAJARESEGUROVISTE', N'jeansimonkevin05.jpg', 0)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[ComidaxLocal]  WITH CHECK ADD  CONSTRAINT [FK_ComidaxLocal_Local] FOREIGN KEY([LocalID])
REFERENCES [dbo].[Local] ([ID])
GO
ALTER TABLE [dbo].[ComidaxLocal] CHECK CONSTRAINT [FK_ComidaxLocal_Local]
GO
ALTER TABLE [dbo].[ComidaxLocal]  WITH CHECK ADD  CONSTRAINT [FK_ComidaxLocal_TipoDeComida] FOREIGN KEY([ComidaID])
REFERENCES [dbo].[TipoDeComida] ([ID])
GO
ALTER TABLE [dbo].[ComidaxLocal] CHECK CONSTRAINT [FK_ComidaxLocal_TipoDeComida]
GO
ALTER TABLE [dbo].[Imagenes]  WITH CHECK ADD  CONSTRAINT [FK_Imagenes_Locales] FOREIGN KEY([LocalID])
REFERENCES [dbo].[Local] ([ID])
GO
ALTER TABLE [dbo].[Imagenes] CHECK CONSTRAINT [FK_Imagenes_Locales]
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Local] FOREIGN KEY([LocalID])
REFERENCES [dbo].[Local] ([ID])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseña_Local]
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Locales] FOREIGN KEY([LocalID])
REFERENCES [dbo].[Local] ([ID])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseñas_Locales]
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_TipoDeComida] FOREIGN KEY([ComidaID])
REFERENCES [dbo].[TipoDeComida] ([ID])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseñas_TipoDeComida]
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseñas_Usuario]
GO
ALTER TABLE [dbo].[SeguidosXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_SeguidosXUsuario_Usuario] FOREIGN KEY([IDSeguidos])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[SeguidosXUsuario] CHECK CONSTRAINT [FK_SeguidosXUsuario_Usuario]
GO
USE [master]
GO
ALTER DATABASE [StudentBites] SET  READ_WRITE 
GO
