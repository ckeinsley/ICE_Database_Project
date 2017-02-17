USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delPart]    Script Date: 2/16/2017 7:51:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delPart]
( @ingName varchar(35)
  )
AS

DECLARE @result smallint

--Validate the input


IF(ISNULL(@ingName, '') = '')
  begin
  SET @result = -1
  PRINT 'The IngredientName is null'
  Return(@result)
  end




--Ensure the givden product exists
ELSE IF (select count(IngredientName) from [Ingredient] where [IngredientName] = @ingname) = 0
  begin
  SET @result = -1
  PRINT 'There is no ingredient ' + CONVERT(varchar(35), @ingname ) + '.'
  Return(@result)
  end


ELSE 
  begin

  --Delete 
  DELETE [Ingredient]
  WHERE ( [IngredientName] = @ingName)
  Set @result = 0
  Return(@result)
  END
GO


