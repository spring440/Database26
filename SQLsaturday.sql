USE [master]
GO
/****** Object:  Database [s17guest26]    Script Date: 5/15/2017 11:35:38 PM ******/
CREATE DATABASE [s17guest26]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N's17guest26', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s17guest26.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N's17guest26_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s17guest26_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [s17guest26] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [s17guest26].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [s17guest26] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [s17guest26] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [s17guest26] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [s17guest26] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [s17guest26] SET ARITHABORT OFF 
GO
ALTER DATABASE [s17guest26] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [s17guest26] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [s17guest26] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [s17guest26] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [s17guest26] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [s17guest26] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [s17guest26] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [s17guest26] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [s17guest26] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [s17guest26] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [s17guest26] SET  ENABLE_BROKER 
GO
ALTER DATABASE [s17guest26] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [s17guest26] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [s17guest26] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [s17guest26] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [s17guest26] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [s17guest26] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [s17guest26] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [s17guest26] SET RECOVERY FULL 
GO
ALTER DATABASE [s17guest26] SET  MULTI_USER 
GO
ALTER DATABASE [s17guest26] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [s17guest26] SET DB_CHAINING OFF 
GO
ALTER DATABASE [s17guest26] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [s17guest26] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N's17guest26', N'ON'
GO
USE [s17guest26]
GO
/****** Object:  User [s17guest26]    Script Date: 5/15/2017 11:35:38 PM ******/
CREATE USER [s17guest26] FOR LOGIN [s17guest26] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [s17guest26]
GO
/****** Object:  StoredProcedure [dbo].[SubmitClass]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubmitClass]
@title nvarchar(50),
@description nvarchar(255),
@duration int,
@level int

AS BEGIN

INSERT class
VALUES(@title, @description, @duration, @level, NULL)

END

GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[streetAddress] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[stateID] [int] NOT NULL,
	[zipcode] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attendant_Role]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendant_Role](
	[attendantID] [int] NOT NULL,
	[roleID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attendants]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendants](
	[attendantID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[addressID] [int] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Attendants] PRIMARY KEY CLUSTERED 
(
	[attendantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[duration] [int] NOT NULL,
	[levelID] [int] NOT NULL,
	[trackID] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class_Event]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Event](
	[classID] [int] NOT NULL,
	[eventID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class_Presenter]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Presenter](
	[classID] [int] NOT NULL,
	[attendantID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class_Room]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Room](
	[classID] [int] NOT NULL,
	[roomID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class_Student]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Student](
	[classID] [int] NOT NULL,
	[attendantID] [int] NOT NULL,
	[grade] [nchar](10) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[countryName] [nvarchar](max) NOT NULL,
	[abbreviation] [nchar](10) NOT NULL,
	[countryID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[countryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event_Vendor_Tables]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Vendor_Tables](
	[eventID] [int] NOT NULL,
	[vendorID] [int] NOT NULL,
	[tableID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[eventID] [int] IDENTITY(1,1) NOT NULL,
	[eventDate] [date] NOT NULL,
	[eventName] [nvarchar](50) NOT NULL,
	[regionID] [int] NOT NULL,
	[locationID] [int] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[eventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Levels]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[levelID] [int] IDENTITY(1,1) NOT NULL,
	[difficulty] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[levelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location_Address]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location_Address](
	[locationID] [int] IDENTITY(1,1) NOT NULL,
	[addressID] [int] NOT NULL,
 CONSTRAINT [PK_Location_Address] PRIMARY KEY CLUSTERED 
(
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Raffle_Participant]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raffle_Participant](
	[raffleID] [int] NOT NULL,
	[attendantID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Raffles]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raffles](
	[raffleID] [int] IDENTITY(1,1) NOT NULL,
	[vendorID] [int] NOT NULL,
 CONSTRAINT [PK_Raffles] PRIMARY KEY CLUSTERED 
(
	[raffleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region_Country]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region_Country](
	[regionID] [int] NOT NULL,
	[countryID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Regions]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[regionID] [int] IDENTITY(1,1) NOT NULL,
	[regionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[regionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomID] [int] NOT NULL,
	[capacity] [int] NOT NULL,
	[locationID] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[States]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[stateID] [int] IDENTITY(1,1) NOT NULL,
	[stateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[stateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[potentialStatus] [nvarchar](max) NOT NULL,
	[classID] [int] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tables]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[tableID] [int] IDENTITY(1,1) NOT NULL,
	[tableNumber] [int] NOT NULL,
 CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED 
(
	[tableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracks](
	[trackID] [int] IDENTITY(1,1) NOT NULL,
	[trackName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[trackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 5/15/2017 11:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[vendorID] [int] IDENTITY(1,1) NOT NULL,
	[vendorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[vendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_States] FOREIGN KEY([stateID])
REFERENCES [dbo].[States] ([stateID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_States]
GO
ALTER TABLE [dbo].[Attendant_Role]  WITH CHECK ADD  CONSTRAINT [FK_Attendant_Role_Attendants] FOREIGN KEY([attendantID])
REFERENCES [dbo].[Attendants] ([attendantID])
GO
ALTER TABLE [dbo].[Attendant_Role] CHECK CONSTRAINT [FK_Attendant_Role_Attendants]
GO
ALTER TABLE [dbo].[Attendant_Role]  WITH CHECK ADD  CONSTRAINT [FK_Attendant_Role_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Attendant_Role] CHECK CONSTRAINT [FK_Attendant_Role_Roles]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Levels] FOREIGN KEY([levelID])
REFERENCES [dbo].[Levels] ([levelID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Levels]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Tracks] FOREIGN KEY([trackID])
REFERENCES [dbo].[Tracks] ([trackID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Tracks]
GO
ALTER TABLE [dbo].[Class_Event]  WITH CHECK ADD  CONSTRAINT [FK_Class_Event_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Class_Event] CHECK CONSTRAINT [FK_Class_Event_Class]
GO
ALTER TABLE [dbo].[Class_Event]  WITH CHECK ADD  CONSTRAINT [FK_Class_Event_Events] FOREIGN KEY([eventID])
REFERENCES [dbo].[Events] ([eventID])
GO
ALTER TABLE [dbo].[Class_Event] CHECK CONSTRAINT [FK_Class_Event_Events]
GO
ALTER TABLE [dbo].[Class_Presenter]  WITH CHECK ADD  CONSTRAINT [FK_Class_Presenter_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Class_Presenter] CHECK CONSTRAINT [FK_Class_Presenter_Class]
GO
ALTER TABLE [dbo].[Class_Room]  WITH CHECK ADD  CONSTRAINT [FK_Class_Room_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Class_Room] CHECK CONSTRAINT [FK_Class_Room_Class]
GO
ALTER TABLE [dbo].[Class_Room]  WITH CHECK ADD  CONSTRAINT [FK_Class_Room_Room] FOREIGN KEY([roomID])
REFERENCES [dbo].[Room] ([roomID])
GO
ALTER TABLE [dbo].[Class_Room] CHECK CONSTRAINT [FK_Class_Room_Room]
GO
ALTER TABLE [dbo].[Class_Student]  WITH CHECK ADD  CONSTRAINT [FK_Class_Student_Attendants] FOREIGN KEY([attendantID])
REFERENCES [dbo].[Attendants] ([attendantID])
GO
ALTER TABLE [dbo].[Class_Student] CHECK CONSTRAINT [FK_Class_Student_Attendants]
GO
ALTER TABLE [dbo].[Class_Student]  WITH CHECK ADD  CONSTRAINT [FK_Class_Student_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Class_Student] CHECK CONSTRAINT [FK_Class_Student_Class]
GO
ALTER TABLE [dbo].[Event_Vendor_Tables]  WITH CHECK ADD  CONSTRAINT [FK_Event_Vendor_Tables_Events] FOREIGN KEY([eventID])
REFERENCES [dbo].[Events] ([eventID])
GO
ALTER TABLE [dbo].[Event_Vendor_Tables] CHECK CONSTRAINT [FK_Event_Vendor_Tables_Events]
GO
ALTER TABLE [dbo].[Event_Vendor_Tables]  WITH CHECK ADD  CONSTRAINT [FK_Event_Vendor_Tables_Tables] FOREIGN KEY([tableID])
REFERENCES [dbo].[Tables] ([tableID])
GO
ALTER TABLE [dbo].[Event_Vendor_Tables] CHECK CONSTRAINT [FK_Event_Vendor_Tables_Tables]
GO
ALTER TABLE [dbo].[Event_Vendor_Tables]  WITH CHECK ADD  CONSTRAINT [FK_Event_Vendor_Tables_Vendors] FOREIGN KEY([vendorID])
REFERENCES [dbo].[Vendors] ([vendorID])
GO
ALTER TABLE [dbo].[Event_Vendor_Tables] CHECK CONSTRAINT [FK_Event_Vendor_Tables_Vendors]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Location_Address] FOREIGN KEY([locationID])
REFERENCES [dbo].[Location_Address] ([locationID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Location_Address]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Regions] FOREIGN KEY([regionID])
REFERENCES [dbo].[Regions] ([regionID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Regions]
GO
ALTER TABLE [dbo].[Location_Address]  WITH CHECK ADD  CONSTRAINT [FK_Location_Address_Addresses] FOREIGN KEY([addressID])
REFERENCES [dbo].[Addresses] ([addressID])
GO
ALTER TABLE [dbo].[Location_Address] CHECK CONSTRAINT [FK_Location_Address_Addresses]
GO
ALTER TABLE [dbo].[Raffle_Participant]  WITH CHECK ADD  CONSTRAINT [FK_Raffle_Participant_Attendants] FOREIGN KEY([attendantID])
REFERENCES [dbo].[Attendants] ([attendantID])
GO
ALTER TABLE [dbo].[Raffle_Participant] CHECK CONSTRAINT [FK_Raffle_Participant_Attendants]
GO
ALTER TABLE [dbo].[Raffle_Participant]  WITH CHECK ADD  CONSTRAINT [FK_Raffle_Participant_Raffles] FOREIGN KEY([raffleID])
REFERENCES [dbo].[Raffles] ([raffleID])
GO
ALTER TABLE [dbo].[Raffle_Participant] CHECK CONSTRAINT [FK_Raffle_Participant_Raffles]
GO
ALTER TABLE [dbo].[Raffles]  WITH CHECK ADD  CONSTRAINT [FK_Raffles_Vendors] FOREIGN KEY([vendorID])
REFERENCES [dbo].[Vendors] ([vendorID])
GO
ALTER TABLE [dbo].[Raffles] CHECK CONSTRAINT [FK_Raffles_Vendors]
GO
ALTER TABLE [dbo].[Region_Country]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country_Countries] FOREIGN KEY([countryID])
REFERENCES [dbo].[Countries] ([countryID])
GO
ALTER TABLE [dbo].[Region_Country] CHECK CONSTRAINT [FK_Region_Country_Countries]
GO
ALTER TABLE [dbo].[Region_Country]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country_Regions] FOREIGN KEY([regionID])
REFERENCES [dbo].[Regions] ([regionID])
GO
ALTER TABLE [dbo].[Region_Country] CHECK CONSTRAINT [FK_Region_Country_Regions]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Location_Address] FOREIGN KEY([locationID])
REFERENCES [dbo].[Location_Address] ([locationID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Location_Address]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_Class]
GO
USE [master]
GO
ALTER DATABASE [s17guest26] SET  READ_WRITE 
GO
