USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdateSeat]    Script Date: 2/16/2017 7:55:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSeat] 

(@Table tinyint,
 @seats tinyint)

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@seats,0) = 0)
begin
  SELECT @seats = [Seats] from [Table] WHERE [TableNumber] = @Table
end


IF(ISNULL(@Table,0) = 0)
begin
  SET @result = -1
  PRINT 'The TableNumber is NULL'
  Return(@result)
end






  --Check for defualt values

  IF (select count(seats) from [Table] where [TableNumber] = @Table) = 0
  begin
    SET @result = -1
    PRINT 'Table ' + CONVERT(varchar(30), @table) + ' does not exist.'
  Return(@result)
  end



--  If(@dt = '10-25-1776')
--  begin
--	  SELECT @dt = [Date/Time] from [Check] WHERE ( [GuestNumber] = @guest)
--  end


--Make the Change

  Update [Table]
  SET [Seats] = @seats
  where [TableNumber] = @Table

  SET @result = 0
  Return(@result)


END

GO


