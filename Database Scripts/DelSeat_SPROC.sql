USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delSeat]    Script Date: 2/16/2017 7:52:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delSeat]
( @TableNum int
  )
AS

DECLARE @result smallint

--Validate the input



IF(ISNULL(@TableNum, 0) = 0)
  begin
  SET @result = -1
  PRINT 'The TableNumber is null'
  Return(@result)
  end




--Ensure the givden product exists
ELSE IF (select count(TableNumber) from [Table] where [TableNumber] = @TableNum) = 0
  begin
  SET @result = -1
  PRINT 'There is no Table with number ' + CONVERT(varchar(35), @tablenum )
  Return(@result)
  end


ELSE 
  begin

  --Delete 
  DELETE [Table]
  WHERE ( [TableNumber] = @TableNum)
  Set @result = 0
  Return(@result)
  END
GO


