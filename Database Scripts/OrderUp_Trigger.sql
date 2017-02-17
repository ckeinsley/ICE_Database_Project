USE [ICE_Project]
GO

/****** Object:  Trigger [dbo].[orderUp]    Script Date: 2/16/2017 7:37:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[orderUp]
ON [dbo].[Orders] INSTEAD OF INSERT
AS
DECLARE @user varchar(35)
DECLARE @recName varchar(35)
DECLARE @quan INT
DECLARE @cost INT
DECLARE @guest INT
DECLARE @newQuan INT
DECLARE @newBal INT
DECLARE @result INT

DECLARE @ordQuan Int
DECLARE @hasStock Int


--Start

SELECT @guest = GuestNumber from inserted
SELECT @quan = Quantity FROM Inserted 


SELECT @recName = RecipeName from inserted
SELECT @user = Username from [Check] where [GuestNumber] = @guest

SELECT @cost = Price FROM Recipe WHERE RecipeName = @recName


SET @cost = @cost * @quan
EXEC @newbal = CheckMoney @user, @cost

EXEC @hasStock = CheckParts @recName, @quan

if(@newBal < 0)
begin
    PRINT 'Cannot make the order due to price'
end

ELSE IF(@hasStock < 0)
BEGIN
  PRINT 'Cannot make the order'
END

ELSE
begin

  Update [Account]
  SET Balance = @newbal
  Where [Username]= @user


  EXEC @result = DecStock @recName, @quan

  SELECT @ordQuan = Quantity from [Orders] where [GuestNumber] = @Guest AND [RecipeName] = @recName

  IF @ordQuan > 0
  begin

    SET @ordquan = @ordQuan + @quan

    Update [Orders]
    SET Quantity = @ordQuan
    Where [GuestNumber] = @Guest AND [RecipeName] = @recName
  end

  ELSE
  Begin 
    INSERT INTO [ORDERS] SELECT * FROM inserted

  end
end
GO


