USE [ICE_Project]
GO

/****** Object:  View [dbo].[Bill]    Script Date: 2/16/2017 7:41:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create VIEW [dbo].[Bill]
AS
SELECT c.GuestNumber AS Guest, sum(s.cost) AS Cost
FROM [Check] c, SubBill s
WHERE c.GuestNumber = s.Guest
GROUP BY c.GuestNumber
GO


