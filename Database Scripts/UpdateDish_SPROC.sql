USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDish]    Script Date: 2/16/2017 7:54:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
Create PROCEDURE [dbo].[UpdateDish] 

(@RecName varchar(35),
 @price money,
 @cookTime tinyint,
 @NutInfo varchar(100),
 @Des varchar(400),
 @rating tinyint,
 @pic varchar(400))

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@price,0) = 0)
begin
  SELECT @price = [Price] from [Recipe] WHERE [RecipeName] = @RecName
end

IF(ISNULL(@cookTime,0) = 0)
begin
  SELECT @cookTime = [CookTime] from [Recipe] WHERE [RecipeName] = @RecName
end


IF(ISNULL(@rating,0) = 0)
begin
  SELECT @rating = [Rating] from [Recipe] WHERE [RecipeName] = @RecName
end

IF(ISNULL(@NutInfo,'') = '')
begin
  SELECT @NutInfo = [NutritionalInfo] from [Recipe] WHERE [RecipeName] = @RecName
end

IF(ISNULL(@Des,'') = '')
begin
  SELECT @Des = [Description] from [Recipe] WHERE [RecipeName] = @RecName
end

IF(ISNULL(@pic,'') = '')
begin
  SELECT @pic = [PictureURL] from [Recipe] WHERE [RecipeName] = @RecName
end

IF(ISNULL(@recName,'') = '')
begin
  SET @result = -1
  PRINT 'The RecipeName is NULL'
  Return(@result)
end





  --Check for defualt values

  IF (select count(RecipeName) from [Recipe] where [RecipeName] = @RecName) = 0
  begin
    SET @result = -1
    PRINT 'The Recipe ' + CONVERT(varchar(30), @recname) + ' does not exist.'
  Return(@result)
  end



--  If(@dt = '10-25-1776')
--  begin
--	  SELECT @dt = [Date/Time] from [Check] WHERE ( [GuestNumber] = @guest)
--  end


--Make the Change

  Update [Recipe]
  SET [Price] = @price, [CookTime] = @cookTime, [NutritionalInfo] = @NutInfo, [Description] = @Des, [rating] = @rating, [pictureUrl] = @pic 
  where ([RecipeName] = @RecName)

  SET @result = 0
  Return(@result)


END

GO


