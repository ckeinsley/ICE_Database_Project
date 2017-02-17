USE [ICE_Project]
GO

/****** Object:  View [dbo].[UserReadout]    Script Date: 2/16/2017 7:42:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create View [dbo].[UserReadout] AS

Select u.fullName as Customer, u.userName AS Account, u.balance as Funds, c.GuestNumber as [Order Number], c.TableNumber as [Table] 
From Account as u, [Check] as c
Where u.Username = c.Username
GO


