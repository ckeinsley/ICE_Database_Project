USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdateIncludes]    Script Date: 2/16/2017 7:55:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
Create PROCEDURE [dbo].[UpdateIncludes] 

(@RecName varchar(35),
 @IngName varchar(35),
 @Quan int)

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@RecName,'') = '')
begin
  SET @result = -1
  PRINT 'The RecipeName is NULL'
  Return(@result)
end

IF(ISNULL(@ingName,'') = '')
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

  IF (select count(RecipeName) from [Contains] where [RecipeName] = @RecName AND [IngredientName] =  @IngName) = 0
  begin
    SET @result = -1
    PRINT 'The Recipe ' + CONVERT(varchar(30), @RecName ) + ' does not contain' + CONVERT(varchar(30), @IngName ) + '.'
  Return(@result)
  end



--  If(@dt = '10-25-1776')
--  begin
--	  SELECT @dt = [Date/Time] from [Check] WHERE ( [GuestNumber] = @guest)
--  end


--Make the Change

  Update [Contains]
  SET [Quantity] = @quan where [RecipeName] = @RecName AND [IngredientName] = @IngName

  SET @result = 0
  Return(@result)


END

GO


