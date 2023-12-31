USE [master]
GO
/****** Object:  Database [StudentBites]    Script Date: 17/11/2023 08:52:59 ******/
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
/****** Object:  User [alumno]    Script Date: 17/11/2023 08:52:59 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ComidaxLocal]    Script Date: 17/11/2023 08:52:59 ******/
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
/****** Object:  Table [dbo].[Imagenes]    Script Date: 17/11/2023 08:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagenes](
	[LocalID] [int] NOT NULL,
	[IDImagen] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Local]    Script Date: 17/11/2023 08:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Local](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Calificacion] [float] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Contacto] [varchar](50) NULL,
	[Precio] [int] NOT NULL,
	[Poblacion] [int] NOT NULL,
	[Tardanza] [int] NOT NULL,
	[PedirPorAdelantado] [bit] NOT NULL,
	[Portada] [varchar](max) NOT NULL,
	[Distancia] [int] NULL,
 CONSTRAINT [PK_Locales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseña]    Script Date: 17/11/2023 08:52:59 ******/
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
/****** Object:  Table [dbo].[SeguidosXUsuario]    Script Date: 17/11/2023 08:52:59 ******/
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
/****** Object:  Table [dbo].[TipoDeComida]    Script Date: 17/11/2023 08:52:59 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/11/2023 08:52:59 ******/
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
	[Edad] [int] NOT NULL,
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

INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada], [Distancia]) VALUES (1, N'Kwom Yuen
', 4.5, N'Yatay 213', N'01149587733', 1300, 2, 2, 1, N'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=uAmIcrGGg16L2EzgVc91Ew&cb_client=maps_sv.tactile.gps&w=203&h=100&yaw=85.36275&pitch=0&thumbfov=100', 120)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada], [Distancia]) VALUES (2, N'Cri Cri', 3, N'Av. Díaz Vélez 4401', NULL, 2500, 1, 1, 0, N'https://lh5.googleusercontent.com/p/AF1QipMzv6nA18eSwCsOgmjcqqWkxV5ZUibFS92hycS0=w203-h152-k-no', 160)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada], [Distancia]) VALUES (3, N'Green Deli', 4, N'Av. Díaz Vélez 4501', NULL, 2000, 4, 3, 0, N'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hwCwLEgjUzWWfP5cqgYDwQ&cb_client=maps_sv.tactile.gps&w=203&h=100&yaw=309.6571&pitch=0&thumbfov=100', 280)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada], [Distancia]) VALUES (5, N'Via Veneto', 2.5, N'Av. Díaz Vélez 4459', N'01149825572', 1200, 3, 2, 1, N'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2n9qXbhsXnGrXPqe0RAV7w&cb_client=maps_sv.tactile.gps&w=203&h=100&yaw=339.5593&pitch=0&thumbfov=100', 190)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada], [Distancia]) VALUES (6, N'Impanato', 4, N'Tte. Gral. Juan Domingo Perón 4402', N'01126112100', 1800, 2, 2, 1, N'https://lh5.googleusercontent.com/p/AF1QipPf1eyidtmnXbnXd_p13sxrtB-0X0VNMgwO-iQ=w203-h114-k-no', 450)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada], [Distancia]) VALUES (11, N'Pollin', 4.5, N'Rio de janeiro 320', N'01149813487', 1200, 3, 1, 1, N'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RP4YOyCJSWZqCI7QHleUqA&cb_client=maps_sv.tactile.gps&w=203&h=100&yaw=308.7785&pitch=0&thumbfov=100', 290)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada], [Distancia]) VALUES (12, N'El Vasquito', 4.5, N'Río de Janeiro 310', N'01149822220', 1600, 4, 2, 0, N'https://lh5.googleusercontent.com/p/AF1QipP_TCq6p2B35km0Fm-qRTz1i6Ges0SQgudAv_Si=w203-h152-k-no', 300)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada], [Distancia]) VALUES (15, N'Mcdonalds', 3, N'Rivadavia 6620', NULL, 2000, 3, 2, 1, N'https://www.google.com/url?sa=i&url=https%3A%2F%2Futopiaurbana.city%2F2022%2F07%2F13%2Fconoce-la-estrategia-de-sostenibilidad-de-mcdonalds%2F&psig=AOvVaw3ifOiC8iBMK0uEp2Yf3V96&ust=1699106162081000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCKDt1Ov9p4IDFQAAAAAdAAAAABAE', 700)
INSERT [dbo].[Local] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado], [Portada], [Distancia]) VALUES (17, N'Mama ines', 4, N'Juan Domingo Perón 4436', N'01123884345', 1300, 1, 2, 0, N'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pKZ-gGZlNN5sJqC5VI8H4g&cb_client=maps_sv.tactile.gps&w=203&h=100&yaw=169.92236&pitch=0&thumbfov=100', 500)
SET IDENTITY_INSERT [dbo].[Local] OFF
GO
SET IDENTITY_INSERT [dbo].[Reseña] ON 

INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (5, 2, 1, 10, 3, 2, 1, N'2', N'Uno de los mejores lugares AASHDSVD cambirrrr')
INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (6, 2, 2, 9, 3, 1, 2, N'1', N'SAQUENME DE ACA AAAAAAAAAAAAAAAAAAAAA')
INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (7, 4, 1, 3, 8, 1, 2, N'1', N'hola soy la nueva descripsipn del update jujyuyuyuyuyuy')
INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (8, 5, 11, 6, 5, 3, 1, N'2', N'proibando spro')
INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (9, 2, 2, 10, 3, 800, 2, N'1', N'ESTA RESEÑA ESTA HECHO CON UN POST JUJUJUJU OJALA ANDE PORFA PORFA')
INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (10, 2, 2, 10, 3, 800, 2, N'1', N'ESTA RESEÑA ESTA HECHO CON UN POST JUJUJUJU OJALA ANDE PORFA PORFA')
INSERT [dbo].[Reseña] ([ID], [UsuarioID], [LocalID], [Calificacion], [ComidaID], [Precio], [Tardanza], [Poblacion], [Descripcion]) VALUES (11, 7, 5, 5, 3, 1, 1, N'1', N'Probando')
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

INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned], [Edad]) VALUES (2, N'agussiro06@gmail.com', N'agussiro06', N'CONTRASEÑA', N'agussiro06.jpg', 0, 17)
INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned], [Edad]) VALUES (4, N'sergiosiro77@gmail.com', N'sergiosiro77', N'CONTRASEÑAPERO2', N'sergiosiro77.jpg', 0, 42)
INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned], [Edad]) VALUES (5, N'jeansimonkevin05@gmail.com
', N'jeansimonkevin05', N'CONTRASEÑAPEROAHORA3JAJARESEGUROVISTE', N'jeansimonkevin05.jpg', 0, 17)
INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned], [Edad]) VALUES (6, N'satnikasses@bbva.com', N'santikasses', N'lacontradesantikasses', N'fotosedantikasses.jpg', 0, 17)
INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned], [Edad]) VALUES (7, N'abt@abt.com', N'Adrian', N'Abtpsb22', N'default.jpg', 0, 34)
INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned], [Edad]) VALUES (9, N'elemail@elemail.com', N'elusuario', N'lacontraseña', N'default.jpg', 0, 4)
INSERT [dbo].[Usuario] ([ID], [Email], [Usuario], [Contraseña], [Foto], [isBanned], [Edad]) VALUES (10, N'mail@gmail.com', N'ParProbarEdad', N'Edad', N'Edad.jpg', 0, 23)
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
