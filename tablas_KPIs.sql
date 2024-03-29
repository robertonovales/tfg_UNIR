USE [KPIExternalDB]
GO
/****** Object:  Table [dbo].[KPIs]    Script Date: 13/06/2019 22:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPIs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KeyWord] [nvarchar](50) NOT NULL,
	[ApiUrl] [nvarchar](1000) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_KPIs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPISerialReport]    Script Date: 13/06/2019 22:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPISerialReport](
	[RecId] [int] IDENTITY(1,1) NOT NULL,
	[KeyKpi] [int] NOT NULL,
	[Insertdate] [datetime] NOT NULL,
	[CountryId] [nvarchar](3) NOT NULL,
	[Measure] [nvarchar](500) NULL,
	[TypeMeasure] [nvarchar](500) NULL,
	[CurrencyCode] [nvarchar](3) NULL,
 CONSTRAINT [PK_KPISerialReport] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KPISerialReport]  WITH CHECK ADD  CONSTRAINT [FK_KPISerialReport_KPIs] FOREIGN KEY([KeyKpi])
REFERENCES [dbo].[KPIs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KPISerialReport] CHECK CONSTRAINT [FK_KPISerialReport_KPIs]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [imp].[KpisPeriodsKeys](
	[RecId] [int] IDENTITY(1,1) NOT NULL,
	[KeyKpi] [int] NOT NULL,
	[PeriodType] [nvarchar](50) NOT NULL,
	[Period] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_KpisPeriodsKeys] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [imp].[KpisPeriodsKeys]  WITH CHECK ADD  CONSTRAINT [FK_KpisPeriodsKeys_KPIs] FOREIGN KEY([KeyKpi])
REFERENCES [imp].[KPIs] ([Id])
GO

ALTER TABLE [imp].[KpisPeriodsKeys] CHECK CONSTRAINT [FK_KpisPeriodsKeys_KPIs]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [imp].[LogProgram](
	[RecId] [int] IDENTITY(1,1) NOT NULL,
	[InsertDate] [datetime] NULL,
	[Action] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Message] [nvarchar](1000) NULL,
	[KeyKpi] [int] NULL,
 CONSTRAINT [PK_LogProgram] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [imp].[LogProgram]  WITH CHECK ADD  CONSTRAINT [FK_LogProgram_KPIs] FOREIGN KEY([KeyKpi])
REFERENCES [imp].[KPIs] ([Id])
GO

ALTER TABLE [imp].[LogProgram] CHECK CONSTRAINT [FK_LogProgram_KPIs]
GO