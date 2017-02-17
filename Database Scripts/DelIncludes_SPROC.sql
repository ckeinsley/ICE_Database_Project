USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delIncludes]    Script Date: 2/16/2017 7:51:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delIncludes]
( @Recname varchar(35),
  @ingname varchar(35))
AS

DECLARE @result smallint

--Validate the input


IF(ISNULL(@RecName, '') = '')
  begin
  SET @result = -1
  PRINT 'The RecipeName is null'
  Return(@result)
  end

  IF(ISNULL(@ingname, '') = '')
  begin
  SET @result = -1
  PRINT 'The IngredientName is null'
  Return(@result)
  end



--Ensure the givden product exists
ELSE IF (select count(RecipeName) from [Contains] where [RecipeName] = @recname AND [IngredientName] = @ingname) = 0
  begin
  SET @result = -1
  PRINT 'There is no recipe ' + CONVERT(varchar(35), @recname ) + ' with ' + CONVERT(varchar(35), @ingname ) + ' in it.'
  Return(@result)
  end


ELSE 
  begin

  --Delete account
  DELETE [contains]
  WHERE ( [RecipeName] = @recName AND [IngredientName] = @ingname)
  Set @result = 0
  Return(@result)
  END
GO


