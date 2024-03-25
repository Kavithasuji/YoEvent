
--Created by:B.LOKESH 
--DATE:08-01-2024
--Modified by:
create database EventManagement
use EventManagement

CREATE TABLE User_Mgt (
    User_Id INT IDENTITY(1,1) PRIMARY KEY, 
    User_Type  VARCHAR(255) NOT NULL,
    User_Name VARCHAR(1000) NOT NULL,
    Mobile_Number bigint not null,
    Email VARCHAR(255) NOT NULL,
    Password  VARCHAR(255) NOT NULL,
	Confirm_Password VARCHAR(100) NOT NULL,
    Person_type VARCHAR(100) ,
    Createdby  VARCHAR(255) ,
    Createdon date default getdate(), 
    Updateby VARCHAR(255) ,
    Updatedon date default getdate(),
    Per_status VARCHAR(255),
)


select * from Event_Reg
	select * from User_Mgt

--drop table User_Mgt

-- CREATED A DATABASE FOR REPORT
--BY:B.LOKESH
--DATE:17-01-2024

CREATE TABLE Report (
    Report_Id INT IDENTITY(1,1) PRIMARY KEY,
    Event_Name VARCHAR(50),
    User_Name VARCHAR(50),
    R_description VARCHAR(1000),
    date_column DATE DEFAULT GETDATE()
);

select * from Report

-- CREATED A DATABASE FOR CREATE ROOM 
--BY:B.LOKESH
--DATE:18-01-2024

create table C_Room(
	Room_ID INT IDENTITY(1,1) PRIMARY KEY,
	Name varchar(50),
	Description varchar(2000),
	Event_Venue varchar(100),
	Location_Link varchar(255),
	Event_type varchar(50),
	Equipment varchar(100),
	Seat int,
	Room_Img varchar(255),
	Created_Date DATE DEFAULT GETDATE()
	)

select * from C_Room
update C_Room 
set 
Name=@Name, Description=@Description, Event_Venue=@Venue, Location_Link=@Location, Event_type=@Type, Equipment=@Equipment,Seat=@Seat,Room_Img=@Room_Img
Where
Room_ID=@Room_ID

create table sponcer(
S_Id int primary key identity(1,1),
First_name varchar(255),
Last_name varchar(255),
Description varchar(255),
Website varchar(255),
Email varchar(255),
Phone bigint, 
Logo  varchar(255)
)
;
select * from sponcer
drop table sponcer


	select E_Name,E_Sdate,E_Edate,E_Mode,E_Venue,E_Description,E_BannerImg from Event_Reg where E_Id =2

	select * from Event_Reg


	create table organizer(
F_Id int primary key identity (1,1),
First_Name varchar(255),
Last_Name varchar(255),
Organizer_Type varchar(50),
Email varchar(255),
Phone bigint,
Org_Image varchar(max)
);

select * from organizer

--DELETE FROM organizer;
--drop table organizer


select * from Event_Reg where  E_id = 20

update Event_Reg set E_Name= , E_Description= , E_Sdate= , E_Edate= , E_Venue= , E_LocationLink= ,E_Type= ,E_Mode= ,E_Seat= , E_RegisterLink= , E_BannerImg= , E_Icon= , E_FloorMap= Where E_Id= 



select * from Event_Reg
select * from Schedule_Event

drop proc ValidateUserLogin
select * from Report

CREATE PROCEDURE ValidateUserLogin
    @Email NVARCHAR(255),
    @Password NVARCHAR(255),
    @UserCount INT OUTPUT,
    @Person_type NVARCHAR(200) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Your validation logic here
    SELECT @UserCount = COUNT(*), @Person_type = MAX(Person_type)
    FROM User_Mgt
    WHERE Email = @Email AND Password = @Password
    GROUP BY Person_type;

    -- Additional validation logic if needed

END

select * from  User_Mgt
