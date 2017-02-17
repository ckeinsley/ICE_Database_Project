USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[CheckMoney]    Script Date: 2/16/2017 7:48:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[CheckMoney] 

(@user varchar(35),
 @cost int)

AS



BEGIN


DECLARE @result int
DECLARE @bal int


	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@user,'') = '')
begin
  SET @result = -1
  PRINT 'The UserName is NULL'
  Return(@result)
end

IF(ISNULL(@cost,0) = 0)
begin
  SET @result = -1
  PRINT 'The Cost is NULL'
  Return(@result)
end

  --Check for defualt values

  IF (select count(balance) from [Account] where [Username] = @user) = 0
  begin
    SET @result = -1
    PRINT 'The Given Username ' + CONVERT(varchar(30), @user ) + ' does not exist.'
  Return(@result)
  end


--Do the thing

Select @bal = balance from [Account] WHERE Username = @user
 PRINT 'The Current balance is ' + CONVERT(varchar(30), @bal ) + '.'

 if(@bal >= @cost)
 begin
    SET @result = @bal - @cost
	return(@result)
 end
  
 ELSE
 begin
   SET @result = -1
   PRINT 'Insufficent Funds.'
   Return(@result)
 end
END

GO


