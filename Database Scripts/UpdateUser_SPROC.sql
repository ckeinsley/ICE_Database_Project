USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 2/16/2017 7:56:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser] 

(@Username varchar(35),
 @Password varchar(35),
 @NewPass varchar(35),
 @Balance money,
 @name varchar(70))

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;
--Validate Parameters

IF(ISNULL(@Username,'') = '')
begin
  SET @result = -1
  PRINT 'The Username is NULL'
  Return(@result)
end

IF(ISNULL(@Password,'') = '')
begin
  SET @result = -1
  PRINT 'The Password is NULL'
  Return(@result)
end

  --Check for defualt values

  IF(ISNULL(@Balance,0) = 0)
  begin
	  SELECT @Balance = Balance from [Account] WHERE ( [UserName] = @UserName AND [Password]= @Password)
  end

  IF(ISNULL(@Name,'') = '')
  begin
	  SELECT @name = FullName from [Account] WHERE ( [UserName] = @UserName AND [Password]= @Password)
  end

  IF(ISNULL(@NewPass,'') = '')
  begin
    SET @newPass = @password
  end



--Make the Change

  UPDATE [Account]
  SET [Username] = @Username, [Password] = @NewPass,
  [Balance] = @Balance, [FullName] = @name
  WHERE ( [Username] = @Username AND [Password] = @Password)

  SET @result = 0
  Return(@result)


END

GO


