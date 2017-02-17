USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddCheck]    Script Date: 2/16/2017 7:45:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/8/17>
-- Description:	<See above>
-- =============================================
CREATE  PROCEDURE [dbo].[AddCheck] 

(@GuestNum int,
 @dt date = getDate,
 @User varchar(35),
 @Table varchar(35) = 0)

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;
--Validate Parameters

IF(ISNULL(@User,'') = '')
begin
  SET @result = -1
  PRINT 'The Username is NULL'
  Return(@result)
end

IF(ISNULL(@GuestNum,0) = 0)
begin
  SET @result = -1
  PRINT 'The GuestNumber is NULL'
  Return(@result)
end



--Make the insertion

INSERT INTO [Check]
( [GuestNumber], [Date/Time], [Username], [TableNumber])
VALUES ( @GuestNum, @dt, @User, @Table)


END

GO


