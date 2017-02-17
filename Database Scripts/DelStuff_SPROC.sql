USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delStuff]    Script Date: 2/16/2017 7:52:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delStuff]
( @ShipNum int
  )
AS

DECLARE @result smallint

--Validate the input



IF(ISNULL(@ShipNum, 0) = 0)
  begin
  SET @result = -1
  PRINT 'The ShipmentNumber is null'
  Return(@result)
  end




--Ensure the givden product exists
ELSE IF (select count(ShipmentNumber) from [Stock] where [ShipmentNumber] = @ShipNum) = 0
  begin
  SET @result = -1
  PRINT 'There is no Shipment with number ' + CONVERT(varchar(35), @shipnum )
  Return(@result)
  end


ELSE 
  begin

  --Delete 
  DELETE [Stock]
  WHERE ( [ShipmentNumber] = @shipNum)
  Set @result = 0
  Return(@result)
  END
GO


