USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delUser]    Script Date: 2/16/2017 7:53:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delUser]
( @User varchar(35) )
AS

DECLARE @result smallint

--Validate the input


IF(ISNULL(@User, '') = '')
  begin
  SET @result = -1
  PRINT 'The Username is null'
  Return(@result)
  end



--Ensure the givden product exists
ELSE IF (select count(username) from [Account] where [Username] = @user) = 0
  begin
  SET @result = -1
  PRINT 'The Username ' + CONVERT(varchar(35), @user ) + ' does not exist.'
  Return(@result)
  end


ELSE 
  begin

  --Delete account
  DELETE [Account]
  WHERE ( [Username] = @user)
  Set @result = 0
  Return(@result)
  END
GO


