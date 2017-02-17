USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Staff]    Script Date: 2/16/2017 7:38:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Staff](
	[EmployeeNumber] [tinyint] NOT NULL,
	[Hours] [tinyint] NOT NULL,
	[Salary] [money] NOT NULL,
	[Name] [varchar](70) NOT NULL,
	[Position] [varchar](35) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [NoLabourViolations] CHECK  (([Hours]>=(0) AND [Hours]<=(60)))
GO

ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [NoLabourViolations]
GO

ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [ValSal] CHECK  (([Salary]>=(0.0)))
GO

ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [ValSal]
GO


