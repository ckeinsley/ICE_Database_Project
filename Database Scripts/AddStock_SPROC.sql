USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddStock]    Script Date: 2/16/2017 7:47:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/8/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[AddStock] 

(@ShipNum int,
 @quan int,
 @ExpDate date,
 @IngName varchar(35))

AS



BEGIN


DECLARE @result int;
--Validate Parameters

IF(ISNULL(@ShipNum,0) = 0)
begin
  SET @result = -1
  PRINT 'The ShipmentNumber is NULL'
  Return(@result)
end

IF(ISNULL(@IngName,'') = '')
begin
  SET @result = -1
  PRINT 'The Ingredient Name is NULL'
  Return(@result)
end

IF(ISNULL(@quan,0) = 0)
begin
  SET @result = -1
  PRINT 'The Quantity is NULL'
  Return(@result)
end


--Make the insertion

INSERT INTO [Stock]
( [ShipmentNumber], [Quantity], [ExpirationDate], [IngredientName])
VALUES ( @ShipNum, @quan, @ExpDate, @IngName)


END

GO


