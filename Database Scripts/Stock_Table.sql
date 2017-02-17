USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Stock]    Script Date: 2/16/2017 7:39:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Stock](
	[ShipmentNumber] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ExpirationDate] [date] NULL,
	[IngredientName] [varchar](35) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipmentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([IngredientName])
REFERENCES [dbo].[Ingredient] ([IngredientName])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [ValQuanSto] CHECK  (([Quantity]>=(0)))
GO

ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [ValQuanSto]
GO


