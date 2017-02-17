USE [ICE_Project]
GO

/****** Object:  Table [dbo].[Ingredient]    Script Date: 2/16/2017 7:36:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Ingredient](
	[IngredientName] [varchar](35) NOT NULL,
	[NutritionalInfo] [varchar](100) NOT NULL,
	[Units] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IngredientName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


