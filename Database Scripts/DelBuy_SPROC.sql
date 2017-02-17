USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delBuy]    Script Date: 2/16/2017 7:50:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delBuy]
( @guest int,
  @Recname varchar(35)
  )
AS

DECLARE @result smallint

--Validate the input


IF(ISNULL(@guest, 0) = 0)
  begin
  SET @result = -1
  PRINT 'The GuestNumber is null'
  Return(@result)
  end

IF(ISNULL(@RecName, '') = '')
  begin
  SET @result = -1
  PRINT 'The RecipeName is null'
  Return(@result)
  end




--Ensure the givden product exists
ELSE IF (select count(RecipeName) from [Orders] where [RecipeName] = @Recname AND [GuestNumber] = @guest) = 0
  begin
  SET @result = -1
  PRINT 'There is no order for ' + CONVERT(varchar(35), @recname ) + ' from the customer ' + CONVERT(varchar(35), @guest ) + '.'
  Return(@result)
  end


ELSE 
  begin

  --Delete 
  DELETE [Orders]
  WHERE ( [RecipeName] = @Recname AND [GuestNumber] = @guest)
  Set @result = 0
  Return(@result)
  END
GO


