USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Favorite]    Script Date: 2/16/2017 7:36:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Favorite](
	[UserName] [varchar](35) NOT NULL,
	[RecipeName] [varchar](35) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([RecipeName])
REFERENCES [dbo].[Recipe] ([RecipeName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO


