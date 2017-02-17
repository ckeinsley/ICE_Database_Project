USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delLike]    Script Date: 2/16/2017 7:51:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delLike]
( @user varchar(35),
  @recname varchar(35))
AS

DECLARE @result smallint

--Validate the input


IF(ISNULL(@RecName, '') = '')
  begin
  SET @result = -1
  PRINT 'The RecipeName is null'
  Return(@result)
  end

  IF(ISNULL(@user, '') = '')
  begin
  SET @result = -1
  PRINT 'The UserName is null'
  Return(@result)
  end



--Ensure the givden product exists
ELSE IF (select count(RecipeName) from [Favorite] where [RecipeName] = @recname AND [UserName] = @user) = 0
  begin
  SET @result = -1
  PRINT 'There is no recipe ' + CONVERT(varchar(35), @recname ) + ' liked by ' + CONVERT(varchar(35), @user ) + '.'
  Return(@result)
  end


ELSE 
  begin

  --Delete 
  DELETE [Favorite]
  WHERE ( [RecipeName] = @recName AND [UserName] = @user)
  Set @result = 0
  Return(@result)
  END
GO


