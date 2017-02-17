USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddAccount]    Script Date: 2/16/2017 7:43:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
CREATE PROCEDURE [dbo].[AddAccount] 

(@Username varchar(35),
 @Password varchar(35),
 @Balance money = 0.0,
 @name varchar(35))

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


--Make the insertion

INSERT INTO [Account]
( [Username], [Password], [Balance], [FullName])
VALUES ( @Username, @Password, @Balance, @name)


END

GO


