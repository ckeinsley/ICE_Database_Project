USE [ICE_Project]
GO

/****** Object:  StoredProcedure [dbo].[delWorker]    Script Date: 2/16/2017 7:53:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[delWorker]
( @EmpNum int
  )
AS

DECLARE @result smallint

--Validate the input



IF(ISNULL(@EmpNum, 0) = 0)
  begin
  SET @result = -1
  PRINT 'The EmployeeNumber is null'
  Return(@result)
  end




--Ensure the givden product exists
ELSE IF (select count(EmployeeNumber) from [Staff] where [EmployeeNumber] = @EmpNum) = 0
  begin
  SET @result = -1
  PRINT 'There is no Employee with number ' + CONVERT(varchar(35), @empnum )
  Return(@result)
  end


ELSE 
  begin

  --Delete 
  DELETE [Staff]
  WHERE ( [EmployeeNumber] = @EmpNum)
  Set @result = 0
  Return(@result)
  END
GO


