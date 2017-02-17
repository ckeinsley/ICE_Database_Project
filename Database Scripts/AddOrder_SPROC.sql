USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 2/16/2017 7:46:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/8/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[AddOrder] 

(@Guest int,
 @RecName varchar(35),
 @quan tinyint,
 @EmpNum tinyint)

AS



BEGIN


DECLARE @result int;
--Validate Parameters

IF(ISNULL(@Guest,0) = 0)
begin
  SET @result = -1
  PRINT 'The GuestNumber is NULL'
  Return(@result)
end

IF(ISNULL(@RecName,'') = '')
begin
  SET @result = -1
  PRINT 'The Recipe Name is NULL'
  Return(@result)
end

IF(ISNULL(@quan,0) = 0)
begin
  SET @result = -1
  PRINT 'The Quantity is NULL'
  Return(@result)
end

IF(ISNULL(@EmpNum, 0) = 0)
begin
  SET @EmpNum = 2
end

--Make the insertion

INSERT INTO [Orders]
( [GuestNumber], [RecipeName], [Quantity], [EmployeeNumber])
VALUES ( @Guest, @RecName, @quan, @EmpNum)


END

GO


