USE [master]
GO
/****** Object:  Database [HAS]    Script Date: 10/23/2017 5:56:29 PM ******/
CREATE DATABASE [HAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HAS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\HAS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HAS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\HAS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [HAS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HAS] SET QUERY_STORE = OFF
GO
USE [HAS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [HAS]
GO
/****** Object:  Table [dbo].[CheckLists]    Script Date: 10/23/2017 5:56:30 PM ******/
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
/****** Object:  Table [dbo].[Inquiries]    Script Date: 10/23/2017 5:56:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inquiries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InquiryCode] [nvarchar](max) NOT NULL,
	[Type] [int] NULL,
	[InquiryType] [int] NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Region] [nvarchar](max) NOT NULL,
	[ClientName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[Quotation] [varbinary](max) NULL,
 CONSTRAINT [PK_Inquiries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logins]    Script Date: 10/23/2017 5:56:30 PM ******/
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
/****** Object:  Table [dbo].[Projects]    Script Date: 10/23/2017 5:56:30 PM ******/
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
/****** Object:  Table [dbo].[ProjectStageCheckLists]    Script Date: 10/23/2017 5:56:30 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 10/23/2017 5:56:30 PM ******/
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
/****** Object:  Table [dbo].[Stages]    Script Date: 10/23/2017 5:56:30 PM ******/
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
/****** Object:  Index [IX_FK_StagesCheckList]    Script Date: 10/23/2017 5:56:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_StagesCheckList] ON [dbo].[CheckLists]
(
	[StagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RoleLogin]    Script Date: 10/23/2017 5:56:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_RoleLogin] ON [dbo].[Logins]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StagesProject]    Script Date: 10/23/2017 5:56:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_StagesProject] ON [dbo].[Projects]
(
	[StagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CheckListProjectStageCheckList]    Script Date: 10/23/2017 5:56:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CheckListProjectStageCheckList] ON [dbo].[ProjectStageCheckLists]
(
	[CheckListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProjectProjectStageCheckList]    Script Date: 10/23/2017 5:56:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProjectProjectStageCheckList] ON [dbo].[ProjectStageCheckLists]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StagesProjectStageCheckList]    Script Date: 10/23/2017 5:56:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_GetInquires]    Script Date: 10/23/2017 5:56:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dhaval Patel>
-- Create date: <10-Oct-17>
-- Description:	<To Get Inquires>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetInquires]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Inquiries
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetInquiry_By_Id]    Script Date: 10/23/2017 5:56:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dhaval Patel>
-- Create date: <22-Oct-17>
-- Description:	<Get the Inquiry by id>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetInquiry_By_Id] 
@InqId INT	
AS
BEGIN
	SELECT * FROM Inquiries WHERE Id=@InqId
END


GO
/****** Object:  StoredProcedure [dbo].[usp_Inqury_INSERT]    Script Date: 10/23/2017 5:56:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dhaval Patel>
-- Create date: <6-Oct-17>
-- Description:	Insert the Inqury 
-- =============================================
CREATE PROCEDURE [dbo].[usp_Inqury_INSERT]
    @UID INT OUTPUT,
	@InquiryCode nvarchar(max),
	@Type INT,
	@InquiryType INT,
	@City nvarchar(max),
	@Region nvarchar(max),
	@ClientName nvarchar(max),
	@Address nvarchar(max),
	@Comments nvarchar(max),
	@Quotation varbinary(max)
AS
BEGIN
	INSERT INTO Inquiries    
(    
 InquiryCode,
 [Type],    
 InquiryType,    
 City,
 Region,
 ClientName,
 [Address],
 Comments,
 Quotation
)    

VALUES    
(    
 @InquiryCode,
 @Type,    
 @InquiryType,    
 @City,
 @Region,
 @ClientName,
 @Address,
 @Comments,
 @Quotation
)    

SELECT @UID = SCOPE_IDENTITY()
SELECT @UID
END


GO
/****** Object:  StoredProcedure [dbo].[usp_LoginCheck]    Script Date: 10/23/2017 5:56:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dhaval,,Patel>
-- Create date: <5-Oct-17>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_LoginCheck] 
	@UserName varchar(max),
	@Password varchar(max)
	

AS
BEGIN
	SELECT * FROM Logins where LOWER(UserName)=LOWER(@UserName) and Password=@Password
END




GO
/****** Object:  StoredProcedure [dbo].[usp_UploadQuatation]    Script Date: 10/23/2017 5:56:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dhaval,,Patel>
-- Create date: <22-Oct-17>
-- Description:	<To Upload the Quatation>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UploadQuatation] 
	@Quotation varbinary(max),
	@Id INT
AS
BEGIN

  UPDATE Inquiries SET Quotation=@Quotation WHERE Id=@Id
	
END

GO
USE [master]
GO
ALTER DATABASE [HAS] SET  READ_WRITE 
GO
