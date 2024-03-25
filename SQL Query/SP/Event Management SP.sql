select * from sys.tables;
select * from Event_Reg;
select * from User_Mgt;
select * from Report;
select * from C_Room;
select * from organizer



 User_id 
 User_Type
 user_name,mobilenumber,email,password,person_type,created by createdon,updatedby ,updatedon,per_status .

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

create table organizer(
F_Id int primary key identity (1,1),
First_Name varchar(255),
Last_Name varchar(255),
Organizer_Type varchar(50),
Email varchar(255),
Phone bigint,
Org_Image varchar(255)
);

select * from organizer

update organizer set First_Name = "",Last_Name ="",Organizer_Type="",Email="",Phone="" where F_Id=""

--UPDATE User_Mgt
--SET Person_Type = 'Super Admin'

--WHERE User_ID = 1004;

update User_Mgt
set  Person_Type = 'Admin(SA)'
where User_ID = (
    select top  1 User_ID
    from User_Mgt
);

update  User_Mgt set  Password=1234
where User_ID=1023;
drop proc createusers
Create procedure createusers
    @User_Id INT,
    @User_Name varchar(255),
    @Mobile_Number BIGINT,
    @Email varchar(255),
    @Password varchar(255),
	@Confirm_Password varchar(255),
    @Person_type varchar(255),
    @Per_status varchar(255)
as
begin
 UPDATE User_Mgt 
    SET 
        [User_Name] = @User_Name,
        Mobile_Number = @Mobile_Number,
        Email = @Email,
        [Password]= @Password,
		Confirm_Password=@Person_type,
        Person_type = @Confirm_Password,
        Per_status = @Per_status
    WHERE
        [User_Id] = @User_Id;
  end;
  select * from User_Mgt
create procedure selectusers
  @User_Id INT
  as 
  begin
 select * from User_Mgt
 where
 [User_id] =@User_id;
 end;

create procedure selectsponcers
   @S_Id INT
as
begin
  select * from sponcer
  where 
  S_Id=@S_Id;
end;
 

 create procedure updatesponcer
 @S_Id INT,
 @First_name varchar(255),
 @Last_name varchar(255),
 @Description varchar(255),
 @Website varchar(255),
 @Em varchar(255),
 @Phone BIGINT, 
 @Logo varchar(255)
 as
 begin
 UPDATE sponcer 
   SET 
      First_name = @First_name,
	  Last_name = @Last_name, 
	  [Description] = @Description,
	  Website = @Website, 
	  Email = @Em, 
	  Phone = @Phone,
	  Logo = @Logo 
	  WHERE
	  S_Id = @S_Id;
	  end;

create procedure  SelectRoom
 @Room_Id INT
 as 
 begin 
 select * from C_Room
 where 
   Room_ID=@Room_Id
   end;

create procedure updateroom
@Room_ID INT ,
@Name varchar(255),
@Description varchar(255),
@Venue varchar(255),
@Location varchar(255),
@Type varchar(255),
@Equipment varchar(255),
@Seat int,
@Room_Img varchar(255)
as
begin
Update C_Room set
  [Name]=@Name,
  [Description]=@Description,
  Event_Venue =@Venue,
  Location_Link=@Location,
  Event_type=@Type,
  Equipment=@Equipment,
  Seat=@Seat,
  Room_Img=@Room_Img
  WHERE 
    Room_ID=@Room_ID
  END;

create procedure selecteventt
@E_Id INT 
as 
begin 
select * from Event_Reg
where 
E_Id=@E_Id
end;


create procedure updateevent
@E_Id int,
@E_Name varchar(255),
@E_Description varchar(255),
@E_SDate date,
@E_EDate date,
@E_Venue varchar(255),
@E_LocationLink varchar(255),
@E_Type varchar(255),
@E_Mode varchar(255),
@E_Seat int,
@E_RegisterLink varchar(255),
@E_BannerImg varchar(255),
@E_Icon varchar(255),
@E_FloorMap varchar(255),
@E_Stime Time,
@E_Etime Time
as
begin 
update Event_Reg 
set 
E_Name=@E_Name,
E_Description=@E_Description,
E_Sdate=@E_SDate,
E_Edate=@E_EDate,
E_Venue=@E_Venue,
E_LocationLink=@E_LocationLink,
E_Type=@E_Type,
E_Seat=@E_Seat,
E_RegisterLink=@E_RegisterLink,
E_BannerImg=@E_BannerImg,
E_Stime=@E_Stime,
E_Etime=@E_Etime
where
E_Id=@E_Id
end;

drop procedure updateeventt

 Backup database EventManagement
 To Disk = 'E:\New folder\EventManagemnet.bak';