USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delDish]    Script Date: 2/16/2017 7:51:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delDish]
( @Recname varchar(35)
  )
AS

DECLARE @result smallint

--Validate the input



IF(ISNULL(@RecName, '') = '')
  begin
  SET @result = -1
  PRINT 'The RecipeName is null'
  Return(@result)
  end




--Ensure the givden product exists
ELSE IF (select count(RecipeName) from [Recipe] where [RecipeName] = @Recname) = 0
  begin
  SET @result = -1
  PRINT 'There is no recipe ' + CONVERT(varchar(35), @recname )
  Return(@result)
  end


ELSE 
  begin

  --Delete 
  DELETE [Recipe]
  WHERE ( [RecipeName] = @Recname)
  Set @result = 0
  Return(@result)
  END
GO


