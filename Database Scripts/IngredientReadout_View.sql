USE [ICE_Project]
GO

/****** Object:  View [dbo].[IngredientReadout]    Script Date: 2/16/2017 7:42:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




Create View [dbo].[IngredientReadout]
AS Select 
i.IngredientName, sum(s.Quantity) AS Stocked
FROM Ingredient i, Stock s
Where i.IngredientName = s.IngredientName
Group BY i.IngredientName

GO


