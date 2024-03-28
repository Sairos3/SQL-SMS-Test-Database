USE [master]
GO
/****** Object:  Database [UserDB]    Script Date: 3/28/2024 6:50:41 AM ******/
CREATE DATABASE [UserDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MYSERVER\MSSQL\DATA\UserDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UserDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MYSERVER\MSSQL\DATA\UserDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UserDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UserDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UserDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UserDB] SET  MULTI_USER 
GO
ALTER DATABASE [UserDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UserDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UserDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UserDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [UserDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UserDB]
GO
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 3/28/2024 6:50:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter](
	[ID] [int] NOT NULL,
	[RollenID] [int] NULL,
	[Benutzer] [varchar](50) NOT NULL,
	[Vorname] [varchar](50) NULL,
	[Nachname] [varchar](50) NULL,
	[EMail] [varchar](255) NOT NULL,
	[Passwort] [varchar](255) NOT NULL,
	[Aktiv] [bit] NULL,
	[Erstelldatum] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UserView]    Script Date: 3/28/2024 6:50:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Add Views with aliases and true1 false0 showing as Aktiv, Inaktiv
CREATE VIEW [dbo].[UserView] AS
SELECT 
    ID AS Nummer,
    Benutzer AS Anmeldename,
    CONCAT(Vorname, ' ', Nachname) AS Anwender,
	CONCAT('E-Mailadresse: ', EMail) AS Mail,
    CASE 
        WHEN Aktiv = 1 THEN 'Aktiv'
        ELSE 'Inaktiv'
    END AS Anmeldung
FROM Mitarbeiter;
GO
/****** Object:  Table [dbo].[Rollen]    Script Date: 3/28/2024 6:50:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rollen](
	[ID] [int] NOT NULL,
	[Rolle] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Mitarbeiter] ([ID], [RollenID], [Benutzer], [Vorname], [Nachname], [EMail], [Passwort], [Aktiv], [Erstelldatum]) VALUES (1, 1, N'user1', N'Max', N'Mustermann', N'max.mustermann@test.de', N'passwort1', 1, CAST(N'2024-03-30' AS Date))
GO
INSERT [dbo].[Mitarbeiter] ([ID], [RollenID], [Benutzer], [Vorname], [Nachname], [EMail], [Passwort], [Aktiv], [Erstelldatum]) VALUES (2, 1, N'user2', N'Maria', N'Musterfrau', N'maria.musterfrau@test.de', N'passwort2', 1, CAST(N'2024-03-30' AS Date))
GO
INSERT [dbo].[Mitarbeiter] ([ID], [RollenID], [Benutzer], [Vorname], [Nachname], [EMail], [Passwort], [Aktiv], [Erstelldatum]) VALUES (3, 2, N'admin31', N'Admin', N'Administrator', N'admin31@test.de', N'adminpass3', 1, CAST(N'2024-03-30' AS Date))
GO
INSERT [dbo].[Mitarbeiter] ([ID], [RollenID], [Benutzer], [Vorname], [Nachname], [EMail], [Passwort], [Aktiv], [Erstelldatum]) VALUES (4, 3, N'superadmin41', N'Super', N'Admin', N'superadmin41@test.de', N'superadminpass4', 1, CAST(N'2024-03-26' AS Date))
GO
INSERT [dbo].[Mitarbeiter] ([ID], [RollenID], [Benutzer], [Vorname], [Nachname], [EMail], [Passwort], [Aktiv], [Erstelldatum]) VALUES (5, 1, N'user5', N'John', N'Cena', N'john.cena@test.de', N'password5', 0, CAST(N'2024-03-26' AS Date))
GO
INSERT [dbo].[Mitarbeiter] ([ID], [RollenID], [Benutzer], [Vorname], [Nachname], [EMail], [Passwort], [Aktiv], [Erstelldatum]) VALUES (6, 1, N'user6', N'Jane', N'Doe', N'jane.doe@test.de', N'password6', 1, CAST(N'2024-03-26' AS Date))
GO
INSERT [dbo].[Mitarbeiter] ([ID], [RollenID], [Benutzer], [Vorname], [Nachname], [EMail], [Passwort], [Aktiv], [Erstelldatum]) VALUES (7, 2, N'admin72', N'Just', N'Admin', N'just.admin@test.de', N'adminpass7', 1, CAST(N'2024-03-26' AS Date))
GO
INSERT [dbo].[Mitarbeiter] ([ID], [RollenID], [Benutzer], [Vorname], [Nachname], [EMail], [Passwort], [Aktiv], [Erstelldatum]) VALUES (8, 1, N'user8', N'Chris', N'Williams', N'chris.williams@test.de', N'password8', 1, CAST(N'2024-03-26' AS Date))
GO
INSERT [dbo].[Mitarbeiter] ([ID], [RollenID], [Benutzer], [Vorname], [Nachname], [EMail], [Passwort], [Aktiv], [Erstelldatum]) VALUES (9, 1, N'user9', N'Emily', N'Watson', N'emily.watson@test.de', N'password9', 1, CAST(N'2024-03-26' AS Date))
GO
INSERT [dbo].[Rollen] ([ID], [Rolle]) VALUES (1, N'Benutzer')
GO
INSERT [dbo].[Rollen] ([ID], [Rolle]) VALUES (2, N'Administrator')
GO
INSERT [dbo].[Rollen] ([ID], [Rolle]) VALUES (3, N'Superadmin')
GO
ALTER TABLE [dbo].[Mitarbeiter]  WITH CHECK ADD FOREIGN KEY([RollenID])
REFERENCES [dbo].[Rollen] ([ID])
GO
USE [master]
GO
ALTER DATABASE [UserDB] SET  READ_WRITE 
GO
