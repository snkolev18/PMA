USE [master]
GO
/****** Object:  Database [Scalefocus-PMA-db]    Script Date: 7/9/2021 8:15:54 AM ******/
CREATE DATABASE [Scalefocus-PMA-db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scalefocus-PMA-db', FILENAME = N'D:\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Scalefocus-PMA-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Scalefocus-PMA-db_log', FILENAME = N'D:\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Scalefocus-PMA-db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Projects]    Script Date: 7/9/2021 8:15:54 AM ******/
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
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectsTeams]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  Table [dbo].[Tasks]    Script Date: 7/9/2021 8:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] NOT NULL,
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  Table [dbo].[Teams]    Script Date: 7/9/2021 8:15:54 AM ******/
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
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/9/2021 8:15:54 AM ******/
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
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  View [dbo].[vAllProjects]    Script Date: 7/9/2021 8:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vAllProjects]

AS

SELECT	
		p.Id, p.Title, p.[Description], p.DateOfCreation, 
		p.CreatorId, p.LastModifiedById, p.DateOfLastChange, u.Username
FROM Projects p
INNER JOIN Users u
ON
p.CreatorId = u.Id
GO
/****** Object:  View [dbo].[vAllTeams]    Script Date: 7/9/2021 8:15:54 AM ******/
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
GO
/****** Object:  View [dbo].[vTeamsWithUsers]    Script Date: 7/9/2021 8:15:54 AM ******/
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
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById]) VALUES (1, N'Aqua Project', N'Final project', NULL, 8, CAST(N'2021-07-08T19:53:38.0000000' AS DateTime2), 8)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById]) VALUES (2, N'LOLBAS', N'Misconfigured Windows binaries that could potentially bring to privilege escalation', CAST(N'2021-07-08T20:43:28.0000000' AS DateTime2), 8, CAST(N'2021-07-08T20:43:28.0000000' AS DateTime2), 8)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById]) VALUES (6, N'PojarnaBezopasnost', N'Proektna deinost na 9ti klas', CAST(N'2021-07-08T22:28:01.0000000' AS DateTime2), 15, CAST(N'2021-07-08T22:28:01.0000000' AS DateTime2), 15)
GO
INSERT [dbo].[Projects] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById]) VALUES (7, N'GTFObins', N'GTFOBins is a curated list of Unix binaries that can be used to bypass local security restrictions in misconfigured systems.', CAST(N'2021-07-08T22:28:36.0000000' AS DateTime2), 8, CAST(N'2021-07-08T22:28:36.0000000' AS DateTime2), 8)
GO
SET IDENTITY_INSERT [dbo].[Projects] OFF
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
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById]) VALUES (1, N'asddsaads', N'asddasdsa', CAST(N'2021-07-07T18:13:11.0000000' AS DateTime2), 15, CAST(N'2021-07-08T19:51:57.0000000' AS DateTime2), 8)
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById]) VALUES (2, N'TestTeam', N'Desc', CAST(N'2021-07-08T09:53:09.0000000' AS DateTime2), 8, NULL, 8)
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById]) VALUES (3, N'TestTeam2', N'Desc2', CAST(N'2021-07-08T09:53:28.0000000' AS DateTime2), 15, NULL, 16)
GO
INSERT [dbo].[Teams] ([Id], [Title], [Description], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById]) VALUES (4, N'TestTeam3', N'Desc2', CAST(N'2021-07-08T09:53:28.0000000' AS DateTime2), 16, NULL, 17)
GO
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId]) VALUES (8, N'rootcheto', N'$2b$05$7XxCKFCbW5csQnmHWTrqp.2RBxecOq25L47I.U4G2rVKSIiO8k10i', N'$2b$05$7XxCKFCbW5csQnmHWTrqp.', N'Stoyan', N'Kolev', CAST(N'2021-07-07T12:02:19.0000000' AS DateTime2), NULL, CAST(N'2021-07-07T12:02:19.0000000' AS DateTime2), NULL, 2)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId]) VALUES (15, N'rootcheto2', N'$2b$05$7XxCKFCbW5csQnmHWTrqp.2RBxecOq25L47I.U4G2rVKSIiO8k10i', N'$2b$05$7XxCKFCbW5csQnmHWTrqp.', N'Stoyan', N'Kolev', CAST(N'2021-07-07T12:02:19.0000000' AS DateTime2), NULL, CAST(N'2021-07-07T12:02:19.0000000' AS DateTime2), NULL, 2)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId]) VALUES (16, N'georgi_manyacheto', N'$2b$05$Qh2bzLECRu5PvuU4Gu0r1OQ4l9nNiVMKjyiYhj15p7994WDfPdVQO', N'$2b$05$Qh2bzLECRu5PvuU4Gu0r1O', N'Georgi', N'Georgiev', CAST(N'2021-07-08T20:08:46.0000000' AS DateTime2), NULL, CAST(N'2021-07-08T20:08:46.0000000' AS DateTime2), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Username], [PasswordHashWithSalt], [Salt], [Firstname], [Lastname], [DateOfCreation], [CreatorId], [DateOfLastChange], [LastModifiedById], [RoleId]) VALUES (17, N'assdads', N'$2b$05$llXt/B.Bt.1A/FVf5729hOiVmDWH/cKCItHGG2NWIQ70aU/6qZVlO', N'$2b$05$llXt/B.Bt.1A/FVf5729hO', N'sda', N'dsad', CAST(N'2021-07-08T20:12:21.0000000' AS DateTime2), NULL, CAST(N'2021-07-08T20:12:21.0000000' AS DateTime2), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UsersTeams] ([TeamId], [UserId]) VALUES (1, 8)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Projects_Title]    Script Date: 7/9/2021 8:15:54 AM ******/
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [UQ_Projects_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Teams_Title]    Script Date: 7/9/2021 8:15:54 AM ******/
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [UQ_Teams_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Users_Username]    Script Date: 7/9/2021 8:15:54 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_Users_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
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
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_RoleId]  DEFAULT ((1)) FOR [RoleId]
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
/****** Object:  StoredProcedure [dbo].[AssignUserToTeam]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CreateProject]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CreateTeam]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteTeam]    Script Date: 7/9/2021 8:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteTeam]

@Id int

AS

DELETE FROM Teams
	WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 7/9/2021 8:15:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteUser]
@Id int

AS

DELETE FROM Users WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateProject]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateTeam]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 7/9/2021 8:15:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[VerifyLogin]    Script Date: 7/9/2021 8:15:54 AM ******/
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

SELECT @IsVerified = Id, @RoleId = RoleId, @Firstname = Firstname, @Lastname = Lastname, @PasswordHashWithSalt = PasswordHashWithSalt
	FROM [dbo].[Users] 
WHERE Username = @Username;

IF @PasswordHashWithSalt <> @PasswordHashWithSaltIncoming
	SET @IsVerified = 0
GO
USE [master]
GO
ALTER DATABASE [Scalefocus-PMA-db] SET  READ_WRITE 
GO
