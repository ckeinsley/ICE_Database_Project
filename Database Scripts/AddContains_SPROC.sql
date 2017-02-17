USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddContains]    Script Date: 2/16/2017 7:45:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/8/17>
-- Description:	<See above>
-- =============================================
CREATE  PROCEDURE [dbo].[AddContains] 

(@RecName varchar(35),
 @IngName varchar(35),
 @Quan tinyint)

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

IF(ISNULL(@IngName,'') = '')
begin
  SET @result = -1
  PRINT 'The IngredientName is NULL'
  Return(@result)
end

IF(ISNULL(@Quan,0) = 0)
begin
  SET @result = -1
  PRINT 'The Quantity is NULL'
  Return(@result)
end



--Make the insertion

INSERT INTO [Contains]
( [RecipeName], [IngredientName], [Quantity])
VALUES ( @RecName, @IngName, @Quan)


END

GO


