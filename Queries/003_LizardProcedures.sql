use PrjctLizard
GO

-- ..::REGISTER CLIENT::..
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'p'  AND name = 'usp_registerClient')
DROP PROCEDURE usp_registerClient
GO

CREATE PROCEDURE usp_registerClient(
@Email nvarchar(30),
@BDate DATE,
@Password nvarchar(20),
@FName nvarchar(20),
@LName1 nvarchar(20),
@LName2 nvarchar(20)
)
AS 
BEGIN

INSERT INTO Client(Email, BDate, Password, Fname, Lname1, Lname2)
VALUES (@Email, @BDate, @Password, @FName, @LName1, @LName2)
END

-- ..::REGISTER HOST::..
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'p'  AND name = 'usp_registerHost')
DROP PROCEDURE usp_registerHost
GO

CREATE PROCEDURE usp_registerHost(
@Email nvarchar(30),
@BDate DATE,
@Password nvarchar(20),
@FName nvarchar(20),
@LName1 nvarchar(20),
@LName2 nvarchar(20)
)
AS 
BEGIN

INSERT INTO Host(Email, BDate, Password, Fname, Lname1, Lname2)
VALUES (@Email, @BDate, @Password, @FName, @LName1, @LName2)
END

-- ..::REGISTER PLACE::..
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'p'  AND name = 'usp_registerPlace')
DROP PROCEDURE usp_registerPlace
GO

CREATE PROCEDURE usp_registerPlace(
@Email nvarchar(30),
@BDate DATE,
@Password nvarchar(20),
@FName nvarchar(20),
@LName1 nvarchar(20),
@LName2 nvarchar(20)
)
AS 
BEGIN

INSERT INTO Host(Email, BDate, Password, Fname, Lname1, Lname2)
VALUES (@Email, @BDate, @Password, @FName, @LName1, @LName2)
END