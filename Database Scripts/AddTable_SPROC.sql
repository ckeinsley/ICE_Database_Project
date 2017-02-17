USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddTable]    Script Date: 2/16/2017 7:48:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/8/17>
-- Description:	<See above>
-- =============================================
Create PROCEDURE [dbo].[AddTable] 

(@Table tinyint,
 @seats tinyint)

AS



BEGIN


DECLARE @result int;
--Validate Parameters

IF(ISNULL(@Table, 0) = 0)
begin
  SET @result = -1
  PRINT 'The TableNumber is NULL'
  Return(@result)
end

IF(ISNULL(@seats, 0) = 0)
begin
  SET @result = -1
  PRINT 'The Seat Number is NULL'
  Return(@result)
end




--Make the insertion

INSERT INTO [Table]
( [TableNumber], [Seats])
VALUES ( @Table, @seats)


END

GO


