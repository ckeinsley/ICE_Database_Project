USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[CheckStock]    Script Date: 2/16/2017 7:49:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[CheckStock] 

(@IngName varchar(35),
 @quan int)

AS



BEGIN


DECLARE @result int
DECLARE @stock int


	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@IngName,'') = '')
begin
  SET @result = -1
  PRINT 'The IngredientName is NULL'
  Return(@result)
end

IF(ISNULL(@quan,0) = 0)
begin
  SET @result = -1
  PRINT 'The Quantity is NULL'
  Return(@result)
end

  --Check for defualt values

  IF (select count(IngredientName) from [Stock] where [IngredientName] = @IngName) = 0
  begin
    SET @result = -1
    PRINT 'The Given Ingredient ' + CONVERT(varchar(30), @IngName ) + ' is not stocked'
  Return(@result)
  end


--Do the thing

Select @stock = sum(Quantity) from [Stock] WHERE IngredientName = @IngName

 if(@stock >= @quan)
 begin
    SET @result = @stock - @quan
	return(@result)
 end
  
 ELSE
 begin
   SET @result = -1
   Return(@result)
 end
END

GO


