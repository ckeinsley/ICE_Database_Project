USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Account]    Script Date: 2/16/2017 7:29:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Account](
	[Username] [varchar](35) NOT NULL,
	[Password] [varchar](35) NOT NULL,
	[Balance] [money] NOT NULL,
	[FullName] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [PosCashAcc] CHECK  (([Balance]>=(0.0)))
GO

ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [PosCashAcc]
GO


