USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdateWorker]    Script Date: 2/16/2017 7:56:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/7/17>
-- Description:	<See above>
-- =============================================
Create PROCEDURE [dbo].[UpdateWorker] 

(@EmpNum tinyint,
 @Hrs tinyint,
 @sal money,
 @Name varchar(70),
 @pos varchar(35))

AS



BEGIN


DECLARE @result int



	SET NOCOUNT ON;

--Validate Parameters

IF(ISNULL(@hrs,0) = 0)
begin
  SELECT @hrs = [Hours] from [Staff] WHERE [EmployeeNumber] = @EmpNum
end

IF(ISNULL(@sal,0) = 0)
begin
  SELECT @sal = [Salary] from [Staff] WHERE [EmployeeNumber] = @EmpNum
end

IF(ISNULL(@Name,'') = '')
begin
  SELECT @name = [name] from [Staff] WHERE [EmployeeNumber] = @EmpNum
end

IF(ISNULL(@pos,'') = '')
begin
  SELECT @pos = [Position] from [Staff] WHERE [EmployeeNumber] = @EmpNum
end


IF(ISNULL(@EmpNum,0) = 0)
begin
  SET @result = -1
  PRINT 'The EmployeeNumber is NULL'
  Return(@result)
end





  --Check for defualt values

  IF (select count(EmployeeNumber) from [Staff] where [EmployeeNumber] = @EmpNum) = 0
  begin
    SET @result = -1
    PRINT 'The EmployeeNumber ' + CONVERT(varchar(30), @empnum) + ' does not exist.'
  Return(@result)
  end



--  If(@dt = '10-25-1776')
--  begin
--	  SELECT @dt = [Date/Time] from [Check] WHERE ( [GuestNumber] = @guest)
--  end


--Make the Change

  Update [Staff]
  SET [Hours] = @hrs, [Salary] = @sal, [Name] = @Name, [Position] = @pos 
  where [EmployeeNumber] = @EmpNum

  SET @result = 0
  Return(@result)


END

GO


