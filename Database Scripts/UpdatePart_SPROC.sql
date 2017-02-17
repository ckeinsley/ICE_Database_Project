USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdatePart]    Script Date: 2/16/2017 7:55:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
Create PROCEDURE [dbo].[UpdatePart] 

(@IngName varchar(35),
 @NutInfo varchar(100),
 @Units varchar(100))

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@NutInfo,'') = '')
begin
  SELECT @NutInfo = [NutritionalInfo] from [Ingredient] WHERE ( [IngredientName] = @IngName)
end

IF(ISNULL(@Units,'') = '')
begin
  SELECT @Units = [Units] from [Ingredient] WHERE ( [IngredientName] = @IngName)
end

IF(ISNULL(@ingName,'') = '')
begin
  SET @result = -1
  PRINT 'The IngredientName is NULL'
  Return(@result)
end



  --Check for defualt values

  IF (select count(IngredientName) from [Ingredient] where [IngredientName] =  @IngName) = 0
  begin
    SET @result = -1
    PRINT 'The Ingredient ' + CONVERT(varchar(30), @IngName ) + ' does not exist.'
  Return(@result)
  end



--  If(@dt = '10-25-1776')
--  begin
--	  SELECT @dt = [Date/Time] from [Check] WHERE ( [GuestNumber] = @guest)
--  end


--Make the Change

  Update [Ingredient]
  SET [NutritionalInfo] = @NutInfo, [Units] = @Units where [IngredientName] = @IngName

  SET @result = 0
  Return(@result)


END

GO


