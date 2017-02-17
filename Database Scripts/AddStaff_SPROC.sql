USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[AddStaff]    Script Date: 2/16/2017 7:47:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Curtis Humm>
-- Create date: <2/8/17>
-- Description:	<See above>
-- =============================================
Create PROCEDURE [dbo].[AddStaff] 

(@EmpNum tinyint,
 @Hrs tinyint,
 @sal money,
 @Name varchar(70),
 @pos varchar(35))

AS



BEGIN


DECLARE @result int;
--Validate Parameters

IF(ISNULL(@EmpNUm, 0) = 0)
begin
  SET @result = -1
  PRINT 'The Employee Number is NULL'
  Return(@result)
end

IF(ISNULL(@Hrs, 0) = 0)
begin
  SET @result = -1
  PRINT 'The Hours are NULL'
  Return(@result)
end

IF(ISNULL(@Sal,0) = 0)
begin
  SET @result = -1
  PRINT 'The Salary is NULL'
  Return(@result)
end

IF(ISNULL(@Name,'') = '')
begin
  SET @result = -1
  PRINT 'The Name is NULL'
  Return(@result)
end

IF(ISNULL(@Pos,'') = '')
begin
  SET @result = -1
  PRINT 'The Position is NULL'
  Return(@result)
end


--Make the insertion

INSERT INTO [Staff]
( [EmployeeNumber], [Hours], [Salary], [Name], [Position])
VALUES ( @EmpNum, @Hrs, @sal, @name, @pos)


END

GO


