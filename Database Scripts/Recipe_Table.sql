USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Recipe]    Script Date: 2/16/2017 7:38:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Recipe](
	[RecipeName] [varchar](35) NOT NULL,
	[Price] [money] NOT NULL,
	[CookTime] [tinyint] NULL,
	[NutritionalInfo] [varchar](100) NOT NULL,
	[Description] [varchar](400) NULL,
	[Rating] [tinyint] NULL,
	[PictureURL] [varchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[RecipeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD CHECK  (([Rating]<=(10)))
GO

ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [PosCashRec] CHECK  (([Price]>=(0.0)))
GO

ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [PosCashRec]
GO

ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [ValidRate] CHECK  (([Rating]>=(0.0) AND [Rating]<=(10)))
GO

ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [ValidRate]
GO


