USE [master]
GO
/****** Object:  Database [HAS]    Script Date: 04-10-2017 23:09:01 ******/
CREATE DATABASE [HAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HAS', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HAS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HAS_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HAS_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HAS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [HAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HAS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HAS] SET  MULTI_USER 
GO
ALTER DATABASE [HAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HAS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HAS]
GO
/****** Object:  Table [dbo].[CheckLists]    Script Date: 04-10-2017 23:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StagesId] [int] NOT NULL,
	[Item] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CheckLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inquiries]    Script Date: 04-10-2017 23:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inquiries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InquiryCode] [nvarchar](max) NOT NULL,
	[InquiryType] [int] NOT NULL,
	[City] [int] NOT NULL,
	[Region] [nvarchar](max) NOT NULL,
	[ClientName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Comments] [nvarchar](max) NOT NULL,
	[Quotation] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Inquiries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logins]    Script Date: 04-10-2017 23:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 04-10-2017 23:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientCode] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Stage] [nvarchar](max) NOT NULL,
	[StagesId] [int] NOT NULL,
	[Payment] [nvarchar](max) NOT NULL,
	[Material] [nvarchar](max) NOT NULL,
	[MaterialColor] [nvarchar](max) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[Drawing] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectStageCheckLists]    Script Date: 04-10-2017 23:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectStageCheckLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[StagesId] [int] NOT NULL,
	[CheckListId] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProjectStageCheckLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04-10-2017 23:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stages]    Script Date: 04-10-2017 23:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Stages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Owner')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'SubOwner')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Employee')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Stages] ON 

GO
INSERT [dbo].[Stages] ([Id], [Name]) VALUES (1, N'wiring')
GO
INSERT [dbo].[Stages] ([Id], [Name]) VALUES (2, N'Acoustik')
GO
INSERT [dbo].[Stages] ([Id], [Name]) VALUES (3, N'Programming')
GO
INSERT [dbo].[Stages] ([Id], [Name]) VALUES (4, N'Installation')
GO
INSERT [dbo].[Stages] ([Id], [Name]) VALUES (5, N'Completion')
GO
SET IDENTITY_INSERT [dbo].[Stages] OFF
GO
/****** Object:  Index [IX_FK_StagesCheckList]    Script Date: 04-10-2017 23:09:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StagesCheckList] ON [dbo].[CheckLists]
(
	[StagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RoleLogin]    Script Date: 04-10-2017 23:09:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_RoleLogin] ON [dbo].[Logins]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StagesProject]    Script Date: 04-10-2017 23:09:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StagesProject] ON [dbo].[Projects]
(
	[StagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CheckListProjectStageCheckList]    Script Date: 04-10-2017 23:09:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CheckListProjectStageCheckList] ON [dbo].[ProjectStageCheckLists]
(
	[CheckListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProjectProjectStageCheckList]    Script Date: 04-10-2017 23:09:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProjectProjectStageCheckList] ON [dbo].[ProjectStageCheckLists]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StagesProjectStageCheckList]    Script Date: 04-10-2017 23:09:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StagesProjectStageCheckList] ON [dbo].[ProjectStageCheckLists]
(
	[StagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CheckLists]  WITH CHECK ADD  CONSTRAINT [FK_StagesCheckList] FOREIGN KEY([StagesId])
REFERENCES [dbo].[Stages] ([Id])
GO
ALTER TABLE [dbo].[CheckLists] CHECK CONSTRAINT [FK_StagesCheckList]
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_RoleLogin] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_RoleLogin]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_StagesProject] FOREIGN KEY([StagesId])
REFERENCES [dbo].[Stages] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_StagesProject]
GO
ALTER TABLE [dbo].[ProjectStageCheckLists]  WITH CHECK ADD  CONSTRAINT [FK_CheckListProjectStageCheckList] FOREIGN KEY([CheckListId])
REFERENCES [dbo].[CheckLists] ([Id])
GO
ALTER TABLE [dbo].[ProjectStageCheckLists] CHECK CONSTRAINT [FK_CheckListProjectStageCheckList]
GO
ALTER TABLE [dbo].[ProjectStageCheckLists]  WITH CHECK ADD  CONSTRAINT [FK_ProjectProjectStageCheckList] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[ProjectStageCheckLists] CHECK CONSTRAINT [FK_ProjectProjectStageCheckList]
GO
ALTER TABLE [dbo].[ProjectStageCheckLists]  WITH CHECK ADD  CONSTRAINT [FK_StagesProjectStageCheckList] FOREIGN KEY([StagesId])
REFERENCES [dbo].[Stages] ([Id])
GO
ALTER TABLE [dbo].[ProjectStageCheckLists] CHECK CONSTRAINT [FK_StagesProjectStageCheckList]
GO
USE [master]
GO
ALTER DATABASE [HAS] SET  READ_WRITE 
GO
