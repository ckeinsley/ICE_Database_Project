USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdateBill]    Script Date: 2/16/2017 7:54:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
Create PROCEDURE [dbo].[UpdateBill] 

(@Guest int,
 @dt date = '10-25-1776',
 @User varchar(35),
 @Table varchar(35) = -1)

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@User,'') = '')
begin
  SET @result = -1
  PRINT 'The Username is NULL'
  Return(@result)
end

IF(ISNULL(@Guest,0) = 0)
begin
  SET @result = -1
  PRINT 'The GuestNumber is NULL'
  Return(@result)
end

  --Check for defualt values

  IF (select count(GuestNumber) from [Check] where [GuestNumber] = @guest) = 0
  begin
    SET @result = -1
    PRINT 'The GuestNumber ' + CONVERT(varchar(30), @guest ) + ' does not exist'
  Return(@result)
  end



  If(@dt = '10-25-1776')
  begin
	  SELECT @dt = [Date/Time] from [Check] WHERE ( [GuestNumber] = @guest)
  end

  If(@table = -1)
  begin
	  SELECT @table = [TableNumber] from [Check] WHERE ( [GuestNumber] = @guest)
  end

--Make the Change

  Update [Check]
  SET [Date/Time] = @dt, [Username] = @User, [TableNumber] = @Table WHERE ([GuestNumber] = @Guest)

  SET @result = 0
  Return(@result)


END

GO


