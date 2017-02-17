USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddIngredient]    Script Date: 2/16/2017 7:46:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/8/17>
-- Description:	<See above>
-- =============================================
CREATE  PROCEDURE [dbo].[AddIngredient] 

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
  SET @result = -1
  PRINT 'The Nutritional Info is NULL'
  Return(@result)
end

IF(ISNULL(@IngName,'') = '')
begin
  SET @result = -1
  PRINT 'The IngredientName is NULL'
  Return(@result)
end

IF(ISNULL(@Units,'') = '')
begin
  SET @result = -1
  PRINT 'The Unit is NULL'
  Return(@result)
end



--Make the insertion

INSERT INTO [Ingredient]
( [IngredientName], [NutritionalInfo], [Units])
VALUES ( @IngName, @NutInfo, @Units)


END

GO


