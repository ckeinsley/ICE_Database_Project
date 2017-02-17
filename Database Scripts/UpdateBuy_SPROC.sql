USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdateBuy]    Script Date: 2/16/2017 7:54:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
Create PROCEDURE [dbo].[UpdateBuy] 

(@Guest int,
 @RecName varchar(35),
 @quan tinyint,
 @EmpNum tinyint)

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@EmpNum,0) = 0)
begin
  SELECT @EmpNum = [EmployeeNumber] from [Orders] WHERE ( [GuestNumber] = @Guest AND [RecipeName] = @RecName)
end

IF(ISNULL(@quan,0) = 0)
begin
  SELECT @quan = [Quantity] from [Orders] WHERE ( [GuestNumber] = @Guest AND [RecipeName] = @RecName)
end

IF(ISNULL(@recName,'') = '')
begin
  SET @result = -1
  PRINT 'The RecipeName is NULL'
  Return(@result)
end

IF(ISNULL(@guest,0) = 0)
begin
  SET @result = -1
  PRINT 'The GuestNumber is NULL'
  Return(@result)
end



  --Check for defualt values

  IF (select count(RecipeName) from [Orders] where [GuestNumber] = @Guest AND [RecipeName] = @RecName) = 0
  begin
    SET @result = -1
    PRINT 'The Guest ' + CONVERT(varchar(30), @guest ) + ' did not order ' + CONVERT(varchar(30), @recname) + '.'
  Return(@result)
  end



--  If(@dt = '10-25-1776')
--  begin
--	  SELECT @dt = [Date/Time] from [Check] WHERE ( [GuestNumber] = @guest)
--  end


--Make the Change

  Update [Orders]
  SET [Quantity] = @quan, [EmployeeNumber] = @EmpNum where ( [GuestNumber] = @Guest AND [RecipeName] = @RecName)

  SET @result = 0
  Return(@result)


END

GO


