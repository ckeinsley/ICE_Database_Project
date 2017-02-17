USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delBill]    Script Date: 2/16/2017 7:50:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delBill]
( @guest int )
AS

DECLARE @result smallint

--Validate the input


IF(ISNULL(@guest, 0) = 0)
  begin
  SET @result = -1
  PRINT 'The GuestNumber is null'
  Return(@result)
  end



--Ensure the givden product exists
ELSE IF (select count(GuestNumber) from [Check] where [GuestNumber] = @guest) = 0
  begin
  SET @result = -1
  PRINT 'The GuestNumber ' + CONVERT(varchar(35), @guest ) + ' does not exist.'
  Return(@result)
  end


ELSE 
  begin

  --Delete account
  DELETE [check]
  WHERE ( [GuestNumber] = @guest)
  Set @result = 0
  Return(@result)
  END
GO


