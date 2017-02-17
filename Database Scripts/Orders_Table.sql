USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 2/16/2017 7:37:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Orders](
	[GuestNumber] [int] NOT NULL,
	[RecipeName] [varchar](35) NULL DEFAULT ('Discontiuned Recipe'),
	[Quantity] [tinyint] NOT NULL,
	[EmployeeNumber] [tinyint] NULL DEFAULT ((0))
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([EmployeeNumber])
REFERENCES [dbo].[Staff] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([GuestNumber])
REFERENCES [dbo].[Check] ([GuestNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([RecipeName])
REFERENCES [dbo].[Recipe] ([RecipeName])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [ValQuanOrd] CHECK  (([Quantity]>=(0)))
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [ValQuanOrd]
GO


