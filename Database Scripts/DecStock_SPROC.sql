USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[DecStock]    Script Date: 2/16/2017 7:50:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[DecStock] 

(@recName varchar(35),
 @quan int)

AS



BEGIN


DECLARE @result int
DECLARE @stock int
DECLARE @curr int

	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@recName,'') = '')
begin
  SET @result = -1
  PRINT 'The RecipeName is NULL'
  Return(@result)
end

IF(ISNULL(@quan,0) = 0)
begin
  SET @result = -1
  PRINT 'The Quantity is NULL'
  Return(@result)
end

  --Check for defualt values

  IF (select count(RecipeName) from [Recipe] where [RecipeName] = @recName) = 0
  begin
    SET @result = -1
    PRINT 'The Given RecipeName ' + CONVERT(varchar(30), @recName ) + ' does not exist.'
  Return(@result)
  end


--Iterate through all ingredients

DECLARE @IngName varchar(35);
DECLARE ingCursor CURSOR LOCAL FOR 
	SELECT IngredientName FROM [Contains] WHERE RecipeName = @recName
OPEN IngCursor
FETCH NEXT FROM IngCursor INTO @IngName
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @curr = (quantity) FROM [contains] WHERE IngredientName = @ingName AND RecipeName = @recName
	SET @curr = @curr * @quan
    EXEC @result = DecPart @ingName, @curr
    --PRINT 'Recipe Contains ' + CONVERT(varchar(30), @IngName ) + ' with a quantity of ' +
	--CONVERT(varchar(30), @curr ) +'. We will have '	+ CONVERT(varchar(30), @sum ) + ' leftover.'

	FETCH NEXT FROM IngCursor INTO @IngName
END



END

GO


