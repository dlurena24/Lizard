use master
go

-- ..::Creation::..

IF NOT EXISTS(SELECT name FROM master.dbo.sysdatabases WHERE NAME = 'PrjctLizard')
CREATE DATABASE PrjctLizard

GO 

USE PrjctLizard

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Client')
create table Client(
Email nvarchar(30) not null,
BDate DATE,
Password nvarchar(20) not null,
Fname nvarchar(20) not null,
Lname1 nvarchar(20) not null,
Lname2 nvarchar(20) not null,
primary key(Email)
)

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Host')
create table Host(
Email nvarchar(30) not null,
BDate DATE,
Password nvarchar(20) not null,
Fname nvarchar(20) not null,
Lname1 nvarchar(20) not null,
Lname2 nvarchar(20) not null,
primary key(Email)
)

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Client')
create table Client(
Email nvarchar(30) not null,
BDate DATE,
Password nvarchar(20) not null,
Fname nvarchar(20) not null,
Lname1 nvarchar(20) not null,
Lname2 nvarchar(20) not null,
primary key(Email)
)

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Admin')
create table Admin(
Email nvarchar(30) not null,
Password nvarchar(20) not null,
Fname nvarchar(20) not null,
Lname1 nvarchar(20) not null,
Lname2 nvarchar(20) not null,
primary key(Email)
)

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Place')
create table Place(
Id INT not null,
Type nvarchar(20) not null,
Province nvarchar(20) not null,
District nvarchar(20) not null,
Coordinates nvarchar(100) not null,
HostEmail_FK nvarchar(30) not null,
primary key(Id)
)

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Rating')
create table Rating(
Id INT not null,
Stars INT not null,
Comment nvarchar(20),
ClientEmail_FK nvarchar(30) not null,
PlaceId_FK INT not null,
primary key(Id)
)

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VerifyPlace')
create table VerifyPlace(
Id INT not null,
AdminEmail_FK nvarchar(30) not null,
PlaceId_FK INT not null,
State CHAR not null,
primary key(Id)
)

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'VerifyHost')
create table VerifyHost(
Id INT not null,
AdminEmail_FK nvarchar(30) not null,
HostEmail_FK nvarchar(30) not null,
State CHAR not null,
primary key(Id)
)

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ClientPlace')
create table ClientPlace(
Id INT not null,
ClientEmail_FK nvarchar(30) not null,
PlaceId_FK INT not null,
primary key(Id)
)

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Place_Services')
create table Place_Services(
Id INT not null,
PlaceId_FK INT not null,
Service nvarchar(20) not null,
primary key(Id)
)

GO

-- ..::Foreign Keys::..

-- ClientPlace
alter table ClientPlace
add constraint ClientPlace_Client_FK foreign key (ClientEmail_FK)
REFERENCES Client(Email);

alter table ClientPlace
add constraint ClientPlace_Place_FK foreign key (PlaceId_FK)
REFERENCES Place(Id);

-- Rating
alter table Rating
add constraint Rating_Client_FK foreign key (ClientEmail_FK)
REFERENCES Client(Email);

alter table Rating
add constraint Rating_Place_FK foreign key (PlaceId_FK)
REFERENCES Place(Id);

-- Place_Services
alter table Place_Services
add constraint Place_Services_Place_FK foreign key (PlaceId_FK)
REFERENCES Place(Id);

-- Place
alter table Place
add constraint Place_Host_FK foreign key (HostEmail_FK)
REFERENCES Host(Email);

-- VerifyPlace
alter table VerifyPlace
add constraint VerifyPlace_Place_FK foreign key (PlaceId_FK)
REFERENCES Place(Id);

alter table VerifyPlace
add constraint VerifyPlace_Admin_FK foreign key (AdminEmail_FK)
REFERENCES Admin(Email);

-- VerifyHost
alter table VerifyHost
add constraint VerifyHost_Host_FK foreign key (HostEmail_FK)
REFERENCES Host(Email);

alter table VerifyHost
add constraint VerifyHost_Admin_FK foreign key (AdminEmail_FK)
REFERENCES Admin(Email);




