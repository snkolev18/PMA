USE [master]
GO
/****** Object:  Database [Scalefocus-PMA-db]    Script Date: 7/13/2021 2:57:27 PM ******/
CREATE DATABASE [Scalefocus-PMA-db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scalefocus-PMA-db', FILENAME = N'C:\Users\SNKolev18\Scalefocus-PMA-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Scalefocus-PMA-db_log', FILENAME = N'C:\Users\SNKolev18\Scalefocus-PMA-db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Scalefocus-PMA-db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET  MULTI_USER 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Scalefocus-PMA-db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Scalefocus-PMA-db]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[LastModifiedById] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectsTeams]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectsTeams](
	[TeamId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectsTeams] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Title] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Status] [tinyint] NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[AssignToId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[LastModifiedById] [int] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatus](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TaskStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](45) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[LastModifiedById] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](25) NOT NULL,
	[PasswordHashWithSalt] [nvarchar](100) NOT NULL,
	[Salt] [nvarchar](100) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[DateOfCreation] [datetime2](0) NOT NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NOT NULL,
	[LastModifiedById] [int] NULL,
	[RoleId] [tinyint] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTeams](
	[TeamId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UsersTeams] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkLog]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkLog](
	[Id] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Time] [time](0) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_WorkLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAllProjects]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vAllProjects]

AS

SELECT	
		p.Id, p.Title, p.[Description], p.DateOfCreation, 
		p.CreatorId, p.LastModifiedById, p.DateOfLastChange, u.Username
FROM Projects p
INNER JOIN Users u
ON
p.CreatorId = u.Id
WHERE p.IsDeleted = 0
GO
/****** Object:  View [dbo].[vAllTasks]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vAllTasks]

AS

SELECT t.Id, t.ProjectId, t.AuthorId, t.Title, t.[Description], t.[Status], t.DateOfCreation, t.AssignToId, t.DateOfLastChange, t.LastModifiedById,
	   p.Title AS ProjectTitle, u.Username AS AuthorUsername, u2.Username AS AssigneeUsername 
	
	FROM Tasks t
INNER JOIN Users u ON t.AuthorId = u.Id
INNER JOIN Users u2 ON t.AssignToId = u2.Id
INNER JOIN Projects p ON t.ProjectId = p.Id
GO
/****** Object:  View [dbo].[vAllTeams]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vAllTeams]
AS
SELECT	
		t.Id, t.Title, t.[Description], t.DateOfCreation, 
		t.CreatorId, t.LastModifiedById, t.DateOfLastChange, u.Username
FROM Teams t
INNER JOIN Users u
ON
t.CreatorId = u.Id
WHERE t.IsDeleted = 0

GO
/****** Object:  View [dbo].[vProjectsWithTeams]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vProjectsWithTeams]

AS

SELECT ProjectId, TeamId, p.Title, p.Description, u.Username AS CreatorUsername
FROM ProjectsTeams
INNER JOIN Projects p
ON
p.Id = ProjectId
INNER JOIN Teams t
ON
t.Id = TeamId
INNER JOIN Users u
ON
u.Id = p.CreatorId
WHERE p.IsDeleted = 0 AND t.IsDeleted = 0
GO
/****** Object:  View [dbo].[vTasksWithTeams]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [dbo].[vTasksWithTeams]

AS

SELECT distinct t.Id, t.ProjectId, t.AuthorId, t.Title, t.Description,
	t.Status, t.DateOfCreation, t.AssignToId, t.DateOfLastChange, t.LastModifiedById,
	ut.TeamId, tms.Title as TeamName, ts.Status as StatusName
FROM Tasks t
INNER JOIN Projects p
ON
p.Id = t.ProjectId
INNER JOIN ProjectsTeams pt
ON
pt.ProjectId = p.Id
INNER JOIN UsersTeams ut
ON
ut.TeamId = pt.TeamId
INNER JOIN Teams tms
ON
tms.Id = ut.TeamId
INNER JOIN TaskStatus ts
ON
ts.Id = t.Status
WHERE tms.IsDeleted = 0
GO
/****** Object:  View [dbo].[vTeamsWithUsers]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vTeamsWithUsers]

AS

SELECT TeamId, UserId, t.Title, t.[Description], u.Username FROM UsersTeams
INNER JOIN Teams t
ON
TeamId = t.Id
INNER JOIN Users u
ON
UserId = u.Id
WHERE t.IsDeleted = 0 AND u.IsDeleted = 0
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (1, N'Aqua Project', N'Final project', NULL, 8, CAST(N'2021-07-08T19:53:38.0000000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (2, N'LOLBAS', N'Misconfigured Windows binaries that could potentially bring to privilege escalation', CAST(N'2021-07-08T20:43:28.0000000' AS DateTime2), 8, CAST(N'2021-07-08T20:43:28.0000000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (6, N'PojarnaBezopasnost', N'Proektna deinost na 9ti klas', CAST(N'2021-07-08T22:28:01.0000000' AS DateTime2), 15, CAST(N'2021-07-08T22:28:01.0000000' AS DateTime2), 15, 0)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (7, N'GTFObins', N'GTFOBins is a curated list of UNIX Binaries that can be used to bypass local security restrictions in misconfigured systems.', CAST(N'2021-07-08T22:28:36.0000000' AS DateTime2), 8, CAST(N'2021-07-11T16:32:46.0000000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (8, N'Софи Маринова и Константин', N'Някаква песен', CAST(N'2021-07-09T15:23:45.0000000' AS DateTime2), 8, CAST(N'2021-07-09T18:23:45.0000000' AS DateTime2), NULL, 1)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (9, N'LOLBAS2', N'Misconfiguj]oj', CAST(N'2021-07-10T21:46:30.0000000' AS DateTime2), 8, CAST(N'2021-07-13T10:25:51.0000000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (10, N'Проект', N'Проект описание', CAST(N'2021-07-10T21:46:45.0000000' AS DateTime2), 8, CAST(N'2021-07-10T21:46:45.0000000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (11, N'Nov otbor', N'Tova e nov otbor', CAST(N'2021-07-12T10:21:37.0000000' AS DateTime2), 20, CAST(N'2021-07-12T13:21:37.0000000' AS DateTime2), NULL, 1)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (12, N'Koncert na Azis v Burgas', N'Bileti na kasite na letniya teatur', CAST(N'2021-07-13T07:16:31.0000000' AS DateTime2), 16, CAST(N'2021-07-13T10:16:31.0000000' AS DateTime2), NULL, 0)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (13, N'stoqncho', N'azis ', CAST(N'2021-07-13T10:26:05.0000000' AS DateTime2), 8, CAST(N'2021-07-13T10:26:12.0000000' AS DateTime2), 8, 0)
GO
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
INSERT [dbo].[ProjectsTeams] ([TeamId], [ProjectId]) VALUES (1, 1)
GO
INSERT [dbo].[ProjectsTeams] ([TeamId], [ProjectId]) VALUES (1, 7)
GO
INSERT [dbo].[ProjectsTeams] ([TeamId], [ProjectId]) VALUES (2, 7)
GO
INSERT [dbo].[ProjectsTeams] ([TeamId], [ProjectId]) VALUES (2, 9)
GO
INSERT [dbo].[ProjectsTeams] ([TeamId], [ProjectId]) VALUES (3, 9)
GO
INSERT [dbo].[ProjectsTeams] ([TeamId], [ProjectId]) VALUES (5, 8)
GO
INSERT [dbo].[ProjectsTeams] ([TeamId], [ProjectId]) VALUES (9, 13)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'User')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Admin')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (4, N'')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (1, 8, 16, N'Task1', N'DESC1', 1, CAST(N'2021-07-10T19:04:20.0000000' AS DateTime2), 17, CAST(N'2021-07-10T19:04:20.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (3, 8, 16, N'Task2', N'DESC2', 1, CAST(N'2021-07-10T19:05:00.0000000' AS DateTime2), 17, CAST(N'2021-07-10T19:05:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (4, 8, 17, N'Task3', N'DESC3', 1, CAST(N'2021-07-10T19:05:28.0000000' AS DateTime2), 16, CAST(N'2021-07-10T19:05:28.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (5, 8, 8, N'Task4', N'DESC4', 3, CAST(N'2021-07-10T21:38:43.0000000' AS DateTime2), 8, CAST(N'2021-07-10T21:38:43.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (7, 9, 8, N'Задача5', N'Описание', 3, CAST(N'2021-07-10T21:47:36.0000000' AS DateTime2), 8, CAST(N'2021-07-10T21:47:36.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (8, 9, 8, N'Задача 6', N'Описаниееееее', 1, CAST(N'2021-07-10T21:47:58.0000000' AS DateTime2), 16, CAST(N'2021-07-10T21:47:58.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (12, 7, 8, N'Chichetoooooooooooooooooo', N'Ne znam, no chicheto veroyatno shte znae', 1, CAST(N'2021-07-11T23:07:09.0000000' AS DateTime2), NULL, CAST(N'2021-07-11T23:07:09.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (13, 6, 8, N'Aziskataaa', N'Azis i Vanko 1 peyat na Ivan', 1, CAST(N'2021-07-13T09:49:12.0000000' AS DateTime2), NULL, CAST(N'2021-07-13T09:49:12.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (14, 7, 16, N'AAAAAAAAA', N'AAAAAAAAAAA', 1, CAST(N'2021-07-13T09:56:19.0000000' AS DateTime2), NULL, CAST(N'2021-07-13T09:56:19.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (15, 7, 8, N'Aziseeeeeeeeee', N'Aziseeeeeeeeee', 1, CAST(N'2021-07-13T09:58:02.0000000' AS DateTime2), NULL, CAST(N'2021-07-13T09:58:02.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (16, 9, 8, N'Fiki', N'Ne znam veche', 1, CAST(N'2021-07-13T10:04:09.0000000' AS DateTime2), NULL, CAST(N'2021-07-13T10:04:09.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (17, 7, 8, N'Storaro', N'Storarooooooooooooo', 2, CAST(N'2021-07-13T10:09:48.0000000' AS DateTime2), 8, CAST(N'2021-07-13T10:09:48.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Tasks] ([Id], [ProjectId], [AuthorId], [Title], [Description], [Status], [DateOfCreation], [AssignToId], [DateOfLastChange], [LastModifiedById]) VALUES (18, 12, 8, N'Yeaaaa', N'stoqncho', 1, CAST(N'2021-07-13T14:02:24.0000000' AS DateTime2), 20, CAST(N'2021-07-13T14:02:24.0000000' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskStatus] ON 
GO
INSERT [dbo].[TaskStatus] ([Id], [Status]) VALUES (1, N'Pending')
GO
INSERT [dbo].[TaskStatus] ([Id], [Status]) VALUES (2, N'InProgress')
GO
INSERT [dbo].[TaskStatus] ([Id], [Status]) VALUES (3, N'Completed')
GO
SET IDENTITY_INSERT [dbo].[TaskStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (1, N'asddsaads', N'asddasdsa', CAST(N'2021-07-07T18:13:11.0000000' AS DateTime2), 15, CAST(N'2021-07-08T19:51:57.0000000' AS DateTime2), 8, 0)
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (2, N'TestTeam', N'Desc', CAST(N'2021-07-08T09:53:09.0000000' AS DateTime2), 8, NULL, 8, 0)
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (3, N'TestTeam2', N'Desc2', CAST(N'2021-07-08T09:53:28.0000000' AS DateTime2), 15, NULL, 16, 0)
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (4, N'TestTeam3', N'Desc2', CAST(N'2021-07-08T09:53:28.0000000' AS DateTime2), NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (5, N'Як отбор', N'Chupacabra или Anti???', CAST(N'2021-07-10T18:38:03.0000000' AS DateTime2), 8, NULL, NULL, 1)
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (8, N'Mig Team', N'Migration Team', CAST(N'2021-07-11T16:00:48.0000000' AS DateTime2), 8, NULL, NULL, 1)
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [IsDeleted]) VALUES (9, N'Nov otbor', N'Tova e nov otbor', CAST(N'2021-07-12T09:46:23.0000000' AS DateTime2), 8, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId], [IsDeleted]) VALUES (8, N'rootcheto', N'$2b$05$AZyuKFqNdVl9rOYupBezQODwOxwD./1ODpMT3R//xkCIGauT0JEQe', N'$2b$05$AZyuKFqNdVl9rOYupBezQO', N'Stoyan', N'Kolevvvvvv', CAST(N'2021-07-07T12:02:19.0000000' AS DateTime2), NULL, CAST(N'2021-07-12T14:32:49.0000000' AS DateTime2), 8, 2, 0)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId], [IsDeleted]) VALUES (15, N'rootcheto2222222', N'$2b$05$NOXmiZ3K5lnavRK/aA187uVYNJrGNrGYSN/INQBbnvj/MVhc7j7U6', N'$2b$05$NOXmiZ3K5lnavRK/aA187u', N'Stoyan', N'Kolev', CAST(N'2021-07-07T12:02:19.0000000' AS DateTime2), NULL, CAST(N'2021-07-09T09:33:52.0000000' AS DateTime2), 8, 2, 0)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId], [IsDeleted]) VALUES (16, N'georgi_manyacheto', N'$2b$05$C1SSdgWhHp5HdkcvX2..J.jO8bfjVfdQcCpd9NNg3FnEsd3Z675Pu', N'$2b$05$C1SSdgWhHp5HdkcvX2..J.', N'Georgi', N'Georgiev', CAST(N'2021-07-08T20:08:46.0000000' AS DateTime2), NULL, CAST(N'2021-07-13T14:52:45.0000000' AS DateTime2), 8, 1, 0)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId], [IsDeleted]) VALUES (17, N'assdads', N'$2b$05$llXt/B.Bt.1A/FVf5729hOiVmDWH/cKCItHGG2NWIQ70aU/6qZVlO', N'$2b$05$llXt/B.Bt.1A/FVf5729hO', N'sda', N'dsad', CAST(N'2021-07-08T20:12:21.0000000' AS DateTime2), NULL, CAST(N'2021-07-08T20:12:21.0000000' AS DateTime2), NULL, 1, 0)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId], [IsDeleted]) VALUES (18, N'TestUser', N'$2b$05$XADai8z.ZdJei.5chZ6RoOawqo5pDRUl3zWTGctkrqr6OI5y55CaC', N'$2b$05$XADai8z.ZdJei.5chZ6RoO', N'Test', N'User', CAST(N'2021-07-11T15:25:37.0000000' AS DateTime2), 8, CAST(N'2021-07-11T15:25:37.0000000' AS DateTime2), NULL, 1, 1)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId], [IsDeleted]) VALUES (19, N'USER2', N'$2b$05$b0MXzf0WH6ohvJnQyU2w7.0LGiz7iZAd5Evdcxn2fNQx9EfTo/Lwq', N'$2b$05$b0MXzf0WH6ohvJnQyU2w7.', N'USERCHO', N'USERCHO', CAST(N'2021-07-11T15:39:06.0000000' AS DateTime2), 8, CAST(N'2021-07-11T15:39:06.0000000' AS DateTime2), NULL, 1, 1)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId], [IsDeleted]) VALUES (20, N'root', N'$2b$05$n6bjVyaFOjB1DDEN5SwoAOgcKFyUgmHpsd4jj9sDHgvM3dHRd3rGy', N'$2b$05$n6bjVyaFOjB1DDEN5SwoAO', N'Stoyan', N'Kolev', CAST(N'2021-07-12T13:20:07.0000000' AS DateTime2), 8, CAST(N'2021-07-12T13:49:34.0000000' AS DateTime2), 20, 2, 0)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId], [IsDeleted]) VALUES (21, N'admin', N'$2b$05$ND7n24knUmJUqc0k5iJBtu1AvddQs4Dt5rXLH0yZhGhjx3cTlymTu', N'$2b$05$ND7n24knUmJUqc0k5iJBtu', N'Admin', N'Admin', CAST(N'2021-07-12T14:00:35.0000000' AS DateTime2), 8, CAST(N'2021-07-13T14:52:31.0000000' AS DateTime2), 8, 2, 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (1, 8)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (1, 15)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (1, 16)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (1, 17)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (2, 8)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (2, 16)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (2, 17)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (3, 16)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (5, 8)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (5, 16)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (9, 15)
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (9, 20)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Projects_Title]    Script Date: 7/13/2021 2:57:27 PM ******/
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [UQ_Projects_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Teams_Title]    Script Date: 7/13/2021 2:57:27 PM ******/
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [UQ_Teams_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Users_Username]    Script Date: 7/13/2021 2:57:27 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_Users_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_LastModifiedById]  DEFAULT (NULL) FOR [LastModifiedById]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_RoleId]  DEFAULT ((1)) FOR [RoleId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users_CID] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users_CID]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users_LastModifiedById] FOREIGN KEY([LastModifiedById])
REFERENCES [dbo].[Users] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users_LastModifiedById]
GO
ALTER TABLE [dbo].[ProjectsTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectsTeams_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectsTeams] CHECK CONSTRAINT [FK_ProjectsTeams_Projects]
GO
ALTER TABLE [dbo].[ProjectsTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectsTeams_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[ProjectsTeams] CHECK CONSTRAINT [FK_ProjectsTeams_Teams]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Projects_PID] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Projects_PID]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[TaskStatus] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskStatus]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users_AssignToId] FOREIGN KEY([AssignToId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users_AssignToId]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users_AuthorId]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users_LastModifiedById] FOREIGN KEY([LastModifiedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users_LastModifiedById]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users_CID] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users_CID]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users_LastModifiedById] FOREIGN KEY([LastModifiedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users_LastModifiedById]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([LastModifiedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users1] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users1]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams_Teams]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams_Users]
GO
ALTER TABLE [dbo].[WorkLog]  WITH CHECK ADD  CONSTRAINT [FK_WorkLog_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([Id])
GO
ALTER TABLE [dbo].[WorkLog] CHECK CONSTRAINT [FK_WorkLog_Tasks]
GO
ALTER TABLE [dbo].[WorkLog]  WITH CHECK ADD  CONSTRAINT [FK_WorkLog_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[WorkLog] CHECK CONSTRAINT [FK_WorkLog_Users]
GO
/****** Object:  StoredProcedure [dbo].[AssignProjectToTeam]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AssignProjectToTeam]

@TeamId int,
@ProjectId int

AS

INSERT INTO [dbo].[ProjectsTeams]
	(TeamId, ProjectId)
VALUES(@TeamId, @ProjectId)
GO
/****** Object:  StoredProcedure [dbo].[AssignUserToTeam]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AssignUserToTeam]

@TeamId int,
@UserId int

AS

INSERT INTO [dbo].[UsersTeams]
	(TeamId, UserId)
VALUES(@TeamId, @UserId)
GO
/****** Object:  StoredProcedure [dbo].[CreateProject]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CreateProject]

@Title nvarchar(50),
@Description nvarchar(150),
@CreatorId int

AS

INSERT INTO [dbo].[Projects]
	(Title, [Description], CreatorId, DateOfCreation)
VALUES(@Title, @Description, @CreatorId, GETUTCDATE())
GO
/****** Object:  StoredProcedure [dbo].[CreateTask]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CreateTask]

@ProjectId int,
@AuthorId int,
@Title nvarchar(25),
@Description nvarchar(50),
@Status int,
@AssigneeId int

AS

INSERT INTO [dbo].[Tasks]
	(ProjectId, AuthorId, Title, [Description], [Status], AssignToId)
VALUES(@ProjectId, @AuthorId, @Title, @Description, @Status, @AssigneeId)
GO
/****** Object:  StoredProcedure [dbo].[CreateTeam]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CreateTeam]

@Title nvarchar(45),
@Description nvarchar(200),
@CreatorId int

AS

INSERT INTO [dbo].[Teams]
	(Title, [Description], CreatorId)
VALUES(@Title, @Description, @CreatorId)
GO
/****** Object:  StoredProcedure [dbo].[DeleteProject]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteProject]

@Id int

AS

UPDATE dbo.Projects
	SET IsDeleted = 1
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[DeleteTeam]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteTeam]

@Id int

AS

UPDATE dbo.Teams
	SET IsDeleted = 1
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteUser]
@Id int

AS

UPDATE dbo.Users
	SET IsDeleted = 1
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RegisterUser]

@Username varchar(25),
@HashedPassword varchar(100),
@Salt varchar(100),
@Firstname nvarchar(50),
@Lastname nvarchar(50),
@CreatorId int

AS

INSERT INTO [dbo].[Users]

(Username, PasswordHashWithSalt, Salt, Firstname, Lastname, CreatorId)

VALUES(@Username, @HashedPassword, @Salt, @Firstname, @Lastname, @CreatorId)
GO
/****** Object:  StoredProcedure [dbo].[SetTaskStatus]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SetTaskStatus]

@TaskId int,
@StatusId int

AS

UPDATE Tasks
	SET Status = @StatusId
WHERE Id = @TaskId
GO
/****** Object:  StoredProcedure [dbo].[UpdateProject]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateProject]

@Id int,
@NewTitle nvarchar(50),
@NewDescription nvarchar(150),
@LastModifiedById int

AS

UPDATE Projects
	SET Title = @NewTitle,
		[Description] = @NewDescription,
		LastModifiedById = @LastModifiedById,
		DateOfLastChange = GETUTCDATE()
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UpdateTeam]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateTeam]

@Id int,
@NewTitle nvarchar(45),
@NewDescription nvarchar(200),
@LastModifiedById int

AS

UPDATE Teams
	SET Title = @NewTitle,
		Description = @NewDescription,
		LastModifiedById = @LastModifiedById,
		DateOfLastChange = GETUTCDATE()
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateUser]

@Id int,
@NewUsername varchar(25),
@NewHashedPassword varchar(100),
@NewSalt varchar(100),
@NewFirstname nvarchar(50),
@NewLastname nvarchar(50),
@LastModifiedById int

AS

UPDATE [dbo].[Users]
	SET Username = @NewUsername,
		PasswordHashWithSalt = @NewHashedPassword,
		Salt = @NewSalt,
		Firstname = @NewFirstname,
		Lastname = @NewLastname,
		LastModifiedById = @LastModifiedById,
		DateOfLastChange = GETDATE()
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[VerifyLogin]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[VerifyLogin]

@Username varchar(25),
@PasswordHashWithSaltIncoming varchar(100),
@IsVerified int OUTPUT,
@RoleId tinyint OUTPUT,
@Firstname nvarchar(50) OUTPUT,
@Lastname nvarchar(50) OUTPUT

AS

DECLARE @PasswordHashWithSalt varchar(100)
DECLARE @IsDeleted bit

SELECT @IsVerified = Id, @RoleId = RoleId, @Firstname = Firstname, @Lastname = Lastname, @PasswordHashWithSalt = PasswordHashWithSalt, @IsDeleted = IsDeleted
	FROM [dbo].[Users] 
WHERE Username = @Username;

IF @PasswordHashWithSalt <> @PasswordHashWithSaltIncoming
	SET @IsVerified = 0
IF @IsDeleted = 1
	SET @IsVerified = 0
GO
/****** Object:  Trigger [dbo].[BeforeDeleteTrigger]    Script Date: 7/13/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[BeforeDeleteTrigger]
	ON [dbo].[Users]
	-- Executes everytime before a delete operation
	-- It doesn't check for any constraints or smh
	INSTEAD OF DELETE
AS 
	IF @@ROWCOUNT = 0
		RETURN;
	SET NOCOUNT ON;
	UPDATE Teams
		SET CreatorId = NULL,
			LastModifiedById = NULL
	WHERE CreatorId = (SELECT TOP 1 Id FROM deleted)
GO
ALTER TABLE [dbo].[Users] ENABLE TRIGGER [BeforeDeleteTrigger]
GO
USE [master]
GO
ALTER DATABASE [Scalefocus-PMA-db] SET  READ_WRITE 
GO
