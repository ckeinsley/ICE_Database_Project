USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[DecPart]    Script Date: 2/16/2017 7:49:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[DecPart] 

(@IngName varchar(35),
 @quan int)

AS



BEGIN


DECLARE @result int
DECLARE @stock int
DECLARE @ordUp int
DECLARE @small date


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
While(@quan > 0)
Begin
  select @small = MIN(ExpirationDate) from [stock] where IngredientName = @ingName
  select @ordUp = ShipmentNumber from [stock] where ExpirationDate = @small AND IngredientName = @ingName
  select @stock = Quantity from [stock] where ExpirationDate = @small AND IngredientName = @ingName

  IF(@stock >= @quan)
  Begin
    SET @stock = @stock - @quan
	Update [Stock]
    SET Quantity = @stock
    Where ShipmentNumber = @ordUp AND IngredientName = @ingName
  
    SET @quan = -1
  End
  ELSE
  Begin
    Set @quan = @quan - @stock
	EXEC @result = DelStuff @ordUp
	PRINT 'The stock of ' + CONVERT(varchar(30), @ingName ) + ' in shipment ' + CONVERT(varchar(30), @ordUp ) + ' has been cleared.'
  End

END
SET @result = 0
return(@result)

END

GO


