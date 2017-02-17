USE [ICE_Project]
GO

/****** Object:  View [dbo].[SubBill]    Script Date: 2/16/2017 7:42:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SubBill]
AS
SELECT o.GuestNumber AS Guest, r.RecipeName AS Dish, (r.price * o.Quantity) AS Cost
FROM Orders o, Recipe r
WHERE o.recipeName = r.recipeName
GO


