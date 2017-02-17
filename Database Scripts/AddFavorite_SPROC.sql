USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddFavorite]    Script Date: 2/16/2017 7:46:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[AddFavorite] 

(@User varchar(35),
 @RecName varchar(35))

AS



BEGIN


DECLARE @result int;
--Validate Parameters

IF(ISNULL(@User,'') = '')
begin
  SET @result = -1
  PRINT 'The Username is NULL'
  Return(@result)
end

IF(ISNULL(@RecName,'') = '')
begin
  SET @result = -1
  PRINT 'The Recipe Name is NULL'
  Return(@result)
end


--Make the insertion

INSERT INTO [Favorite]
( [Username], [RecipeName])
VALUES ( @User, @RecName)


END

GO


