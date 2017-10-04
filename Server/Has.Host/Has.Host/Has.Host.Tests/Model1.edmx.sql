
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/04/2017 22:59:48
-- Generated from EDMX file: G:\HAS\Server\Has.Host\Has.Host\Has.Host.Tests\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HAS];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Logins'
CREATE TABLE [dbo].[Logins] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Inquiries'
CREATE TABLE [dbo].[Inquiries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [InquiryCode] nvarchar(max)  NOT NULL,
    [InquiryType] int  NOT NULL,
    [City] int  NOT NULL,
    [Region] nvarchar(max)  NOT NULL,
    [ClientName] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Comments] nvarchar(max)  NOT NULL,
    [Quotation] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClientCode] nvarchar(max)  NOT NULL,
    [Status] nvarchar(max)  NOT NULL,
    [Stage] nvarchar(max)  NOT NULL,
    [StagesId] int  NOT NULL,
    [Payment] nvarchar(max)  NOT NULL,
    [Material] nvarchar(max)  NOT NULL,
    [MaterialColor] nvarchar(max)  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [Drawing] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Stages'
CREATE TABLE [dbo].[Stages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CheckLists'
CREATE TABLE [dbo].[CheckLists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StagesId] int  NOT NULL,
    [Item] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProjectStageCheckLists'
CREATE TABLE [dbo].[ProjectStageCheckLists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProjectId] int  NOT NULL,
    [StagesId] int  NOT NULL,
    [CheckListId] int  NOT NULL,
    [Status] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Logins'
ALTER TABLE [dbo].[Logins]
ADD CONSTRAINT [PK_Logins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Inquiries'
ALTER TABLE [dbo].[Inquiries]
ADD CONSTRAINT [PK_Inquiries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Stages'
ALTER TABLE [dbo].[Stages]
ADD CONSTRAINT [PK_Stages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CheckLists'
ALTER TABLE [dbo].[CheckLists]
ADD CONSTRAINT [PK_CheckLists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectStageCheckLists'
ALTER TABLE [dbo].[ProjectStageCheckLists]
ADD CONSTRAINT [PK_ProjectStageCheckLists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RoleId] in table 'Logins'
ALTER TABLE [dbo].[Logins]
ADD CONSTRAINT [FK_RoleLogin]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleLogin'
CREATE INDEX [IX_FK_RoleLogin]
ON [dbo].[Logins]
    ([RoleId]);
GO

-- Creating foreign key on [StagesId] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_StagesProject]
    FOREIGN KEY ([StagesId])
    REFERENCES [dbo].[Stages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StagesProject'
CREATE INDEX [IX_FK_StagesProject]
ON [dbo].[Projects]
    ([StagesId]);
GO

-- Creating foreign key on [StagesId] in table 'CheckLists'
ALTER TABLE [dbo].[CheckLists]
ADD CONSTRAINT [FK_StagesCheckList]
    FOREIGN KEY ([StagesId])
    REFERENCES [dbo].[Stages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StagesCheckList'
CREATE INDEX [IX_FK_StagesCheckList]
ON [dbo].[CheckLists]
    ([StagesId]);
GO

-- Creating foreign key on [ProjectId] in table 'ProjectStageCheckLists'
ALTER TABLE [dbo].[ProjectStageCheckLists]
ADD CONSTRAINT [FK_ProjectProjectStageCheckList]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectProjectStageCheckList'
CREATE INDEX [IX_FK_ProjectProjectStageCheckList]
ON [dbo].[ProjectStageCheckLists]
    ([ProjectId]);
GO

-- Creating foreign key on [StagesId] in table 'ProjectStageCheckLists'
ALTER TABLE [dbo].[ProjectStageCheckLists]
ADD CONSTRAINT [FK_StagesProjectStageCheckList]
    FOREIGN KEY ([StagesId])
    REFERENCES [dbo].[Stages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StagesProjectStageCheckList'
CREATE INDEX [IX_FK_StagesProjectStageCheckList]
ON [dbo].[ProjectStageCheckLists]
    ([StagesId]);
GO

-- Creating foreign key on [CheckListId] in table 'ProjectStageCheckLists'
ALTER TABLE [dbo].[ProjectStageCheckLists]
ADD CONSTRAINT [FK_CheckListProjectStageCheckList]
    FOREIGN KEY ([CheckListId])
    REFERENCES [dbo].[CheckLists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CheckListProjectStageCheckList'
CREATE INDEX [IX_FK_CheckListProjectStageCheckList]
ON [dbo].[ProjectStageCheckLists]
    ([CheckListId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------