USE [master]
GO
/****** Object:  Database [matriculas]    Script Date: 6/10/2023 01:10:06 ******/
CREATE DATABASE [matriculas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'matriculas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\matriculas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'matriculas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\matriculas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [matriculas] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [matriculas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [matriculas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [matriculas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [matriculas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [matriculas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [matriculas] SET ARITHABORT OFF 
GO
ALTER DATABASE [matriculas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [matriculas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [matriculas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [matriculas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [matriculas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [matriculas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [matriculas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [matriculas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [matriculas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [matriculas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [matriculas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [matriculas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [matriculas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [matriculas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [matriculas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [matriculas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [matriculas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [matriculas] SET RECOVERY FULL 
GO
ALTER DATABASE [matriculas] SET  MULTI_USER 
GO
ALTER DATABASE [matriculas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [matriculas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [matriculas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [matriculas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [matriculas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [matriculas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'matriculas', N'ON'
GO
ALTER DATABASE [matriculas] SET QUERY_STORE = ON
GO
ALTER DATABASE [matriculas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [matriculas]
GO
/****** Object:  Table [dbo].[administradores]    Script Date: 6/10/2023 01:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administradores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[alumno_datos_basicos]    Script Date: 6/10/2023 01:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alumno_datos_basicos](
	[ID_Alumno] [int] IDENTITY(1,1) NOT NULL,
	[Grado_2023] [varchar](20) NOT NULL,
	[Colegio_Origen] [varchar](100) NOT NULL,
	[Distrito] [varchar](50) NOT NULL,
	[Apellido_Paterno] [varchar](50) NOT NULL,
	[Apellido_Materno] [varchar](50) NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[Lugar_Nacimiento] [varchar](100) NOT NULL,
	[Direccion_Domicilio] [varchar](200) NOT NULL,
	[DNI] [varchar](10) NOT NULL,
	[Religión] [varchar](50) NOT NULL,
	[DNI_Padre] [varchar](10) NOT NULL,
	[DNI_Madre] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[habilidades_alumno]    Script Date: 6/10/2023 01:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[habilidades_alumno](
	[ID_Alumno] [int] NOT NULL,
	[Deporte_Destaca] [varchar](255) NULL,
	[Talento] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matricula]    Script Date: 6/10/2023 01:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matricula](
	[ID_Matricula] [int] IDENTITY(1,1) NOT NULL,
	[ID_Alumno] [int] NOT NULL,
	[Fecha_Matricula] [date] NOT NULL,
	[Grado_Matriculado] [varchar](50) NOT NULL,
	[Estado_Matricula] [varchar](20) NOT NULL,
	[Monto_Pagado] [decimal](10, 2) NULL,
	[Metodo_Pago] [varchar](50) NULL,
	[Observaciones] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[representante]    Script Date: 6/10/2023 01:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[representante](
	[ID_Representante] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](255) NOT NULL,
	[Apellido_Materno] [varchar](255) NOT NULL,
	[Apellido_Paterno] [varchar](255) NOT NULL,
	[DNI] [varchar](10) NOT NULL,
	[Sexo] [varchar](10) NOT NULL,
	[Vive_Con_Estudiante] [varchar](2) NOT NULL,
	[Domicilio] [varchar](255) NULL,
	[Celular] [varchar](20) NULL,
	[Email] [varchar](255) NULL,
	[Facebook] [varchar](255) NULL,
	[Ocupacion_Cargo] [varchar](255) NULL,
	[Lugar_Trabajo] [varchar](255) NULL,
	[Grado_Instruccion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Representante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[representante_alumno]    Script Date: 6/10/2023 01:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[representante_alumno](
	[ID_Representante] [int] NOT NULL,
	[ID_Alumno] [int] NOT NULL,
	[Relacion] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Representante] ASC,
	[ID_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salud_alumno]    Script Date: 6/10/2023 01:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salud_alumno](
	[ID_Alumno] [int] NOT NULL,
	[Alergico] [varchar](2) NOT NULL,
	[Especificacion_Alergia] [varchar](255) NULL,
	[Seguro] [varchar](2) NOT NULL,
	[Especificacion_Seguro] [varchar](255) NULL,
	[Trauma] [varchar](2) NOT NULL,
	[Especificacion_Trauma] [varchar](255) NULL,
	[Tipo_Parto] [varchar](10) NOT NULL,
	[Vacunas] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[habilidades_alumno]  WITH CHECK ADD  CONSTRAINT [FK_habilidades_alumno_alumno] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[alumno_datos_basicos] ([ID_Alumno])
GO
ALTER TABLE [dbo].[habilidades_alumno] CHECK CONSTRAINT [FK_habilidades_alumno_alumno]
GO
ALTER TABLE [dbo].[matricula]  WITH CHECK ADD  CONSTRAINT [FK_matricula_alumno] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[alumno_datos_basicos] ([ID_Alumno])
GO
ALTER TABLE [dbo].[matricula] CHECK CONSTRAINT [FK_matricula_alumno]
GO
ALTER TABLE [dbo].[representante_alumno]  WITH CHECK ADD  CONSTRAINT [FK_representante_alumno_alumno] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[alumno_datos_basicos] ([ID_Alumno])
GO
ALTER TABLE [dbo].[representante_alumno] CHECK CONSTRAINT [FK_representante_alumno_alumno]
GO
ALTER TABLE [dbo].[representante_alumno]  WITH CHECK ADD  CONSTRAINT [FK_representante_alumno_representante] FOREIGN KEY([ID_Representante])
REFERENCES [dbo].[representante] ([ID_Representante])
GO
ALTER TABLE [dbo].[representante_alumno] CHECK CONSTRAINT [FK_representante_alumno_representante]
GO
ALTER TABLE [dbo].[salud_alumno]  WITH CHECK ADD  CONSTRAINT [FK_salud_alumno_alumno] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[alumno_datos_basicos] ([ID_Alumno])
GO
ALTER TABLE [dbo].[salud_alumno] CHECK CONSTRAINT [FK_salud_alumno_alumno]
GO
ALTER TABLE [dbo].[matricula]  WITH CHECK ADD CHECK  (([Estado_Matricula]='Cancelado' OR [Estado_Matricula]='Pendiente' OR [Estado_Matricula]='Pagado'))
GO
ALTER TABLE [dbo].[representante]  WITH CHECK ADD CHECK  (([Vive_Con_Estudiante]='no' OR [Vive_Con_Estudiante]='si'))
GO
ALTER TABLE [dbo].[representante]  WITH CHECK ADD CHECK  (([Sexo]='Femenino' OR [Sexo]='Masculino'))
GO
ALTER TABLE [dbo].[representante_alumno]  WITH CHECK ADD CHECK  (([Relacion]='Madre' OR [Relacion]='Padre'))
GO
ALTER TABLE [dbo].[salud_alumno]  WITH CHECK ADD CHECK  (([Alergico]='no' OR [Alergico]='si'))
GO
ALTER TABLE [dbo].[salud_alumno]  WITH CHECK ADD CHECK  (([Seguro]='no' OR [Seguro]='si'))
GO
ALTER TABLE [dbo].[salud_alumno]  WITH CHECK ADD CHECK  (([Tipo_Parto]='normal' OR [Tipo_Parto]='cesarea'))
GO
ALTER TABLE [dbo].[salud_alumno]  WITH CHECK ADD CHECK  (([Trauma]='no' OR [Trauma]='si'))
GO
ALTER TABLE [dbo].[salud_alumno]  WITH CHECK ADD CHECK  (([Vacunas]='no' OR [Vacunas]='si'))
GO
USE [master]
GO
ALTER DATABASE [matriculas] SET  READ_WRITE 
GO
