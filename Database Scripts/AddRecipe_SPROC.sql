USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddRecipe]    Script Date: 2/16/2017 7:47:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/8/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[AddRecipe] 

(@RecName varchar(35),
 @price money,
 @cookTime tinyint,
 @NutInfo varchar(100),
 @Des varchar(400),
 @rating tinyint,
 @pic varchar(400))

AS



BEGIN


DECLARE @result int;
--Validate Parameters

IF(ISNULL(@RecName, '') = '')
begin
  SET @result = -1
  PRINT 'The Recipe Name is NULL'
  Return(@result)
end

IF(ISNULL(@Price, 0) = 0)
begin
  SET @result = -1
  PRINT 'The Price is NULL'
  Return(@result)
end

IF(ISNULL(@NutInfo,'') = '')
begin
  SET @result = -1
  PRINT 'The Nutritional Info is NULL'
  Return(@result)
end



--Make the insertion

INSERT INTO [Recipe]
( [RecipeName], [Price], [CookTime], [NutritionalInfo], [Description], [Rating], [PictureURL])
VALUES ( @RecName, @Price, @CookTime, @NutInfo, @Des, @rating, @pic)


END

GO


