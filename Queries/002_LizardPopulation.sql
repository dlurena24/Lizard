USE [PrjctLizard]
GO

INSERT INTO Admin(Email, Password, Fname, Lname1, Lname2) 
VALUES 
(N'master@master.com', N'Admin', N'Admin', N'Admin', N'Admin'),
(N'masterBU@master.com', N'AdminBU', N'Admin', N'Admin', N'Admin')

select * from dbo.Admin