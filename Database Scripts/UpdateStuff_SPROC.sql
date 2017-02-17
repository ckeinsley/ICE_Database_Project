USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStuff]    Script Date: 2/16/2017 7:56:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStuff] 

(@ShipNum int,
 @quan int,
 @ExpDate date,
 @IngName varchar(35))

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@quan,0) = 0)
begin
  SELECT @quan = [Quantity] from [Stock] WHERE [IngredientName] = @IngName AND [ShipmentNumber] = @ShipNum
end

IF(ISNULL(@ExpDate,'') = '')
begin
  SELECT @ExpDate = [ExpirationDate] from [Stock] WHERE [IngredientName] = @IngName AND [ShipmentNumber] = @ShipNum
end

IF(ISNULL(@IngName,'') = '')
begin
  SET @result = -1
  PRINT 'The IngredientName is NULL'
  Return(@result)
end


IF(ISNULL(@ShipNum,0) = 0)
begin
  SET @result = -1
  PRINT 'The ShipmentNumber is NULL'
  Return(@result)
end





  --Check for defualt values

  IF (select count(IngredientName) from [Stock] where [IngredientName] = @IngName AND [ShipmentNumber] = @ShipNum) = 0
  begin
    SET @result = -1
    PRINT 'The Shipment ' + CONVERT(varchar(30), @shipnum) + ' does not contain ' + CONVERT(varchar(35), @IngName) +'.'
  Return(@result)
  end



--  If(@dt = '10-25-1776')
--  begin
--	  SELECT @dt = [Date/Time] from [Check] WHERE ( [GuestNumber] = @guest)
--  end


--Make the Change

  Update [Stock]
  SET [Quantity] = @quan, [ExpirationDate] = @ExpDate
  where [ShipmentNumber] = @ShipNum AND [IngredientName] = @IngName 

  SET @result = 0
  Return(@result)


END

GO


