USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Contains]    Script Date: 2/16/2017 7:35:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Contains](
	[RecipeName] [varchar](35) NOT NULL,
	[IngredientName] [varchar](35) NOT NULL,
	[Quantity] [tinyint] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Contains]  WITH CHECK ADD FOREIGN KEY([IngredientName])
REFERENCES [dbo].[Ingredient] ([IngredientName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Contains]  WITH CHECK ADD FOREIGN KEY([RecipeName])
REFERENCES [dbo].[Recipe] ([RecipeName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Contains]  WITH CHECK ADD CHECK  (([Quantity]>(0)))
GO

ALTER TABLE [dbo].[Contains]  WITH CHECK ADD  CONSTRAINT [ValQuanCon] CHECK  (([Quantity]>=(0)))
GO

ALTER TABLE [dbo].[Contains] CHECK CONSTRAINT [ValQuanCon]
GO


