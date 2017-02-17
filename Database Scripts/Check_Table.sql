USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Check]    Script Date: 2/16/2017 7:32:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Check](
	[GuestNumber] [int] NOT NULL,
	[Date/Time] [date] NOT NULL,
	[Username] [varchar](35) NOT NULL,
	[TableNumber] [tinyint] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[GuestNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Check]  WITH CHECK ADD FOREIGN KEY([TableNumber])
REFERENCES [dbo].[Table] ([TableNumber])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO

ALTER TABLE [dbo].[Check]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO

ALTER TABLE [dbo].[Check]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO

ALTER TABLE [dbo].[Check]  WITH CHECK ADD  CONSTRAINT [ValTimeCheck] CHECK  (([Date/Time]<getdate()))
GO

ALTER TABLE [dbo].[Check] CHECK CONSTRAINT [ValTimeCheck]
GO


