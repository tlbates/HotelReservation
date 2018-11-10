drop database if exists HotelReservations;
create database HotelReservations;

use HotelReservations;

create table Type (
	ID int not null auto_increment,
    Name varchar(10) not null,
    Rate Decimal not null,
    PersonLimit int,
    primary key (ID)
);

create table Amenity (
	ID int not null auto_increment,
    Name varchar(45) not null,
    Price decimal not null,
    primary key (ID)
);

create table RoomAmenities (
	AmenityID int not null,
    RoomID int not null
);

create table AddOn (
	ID int not null auto_increment,
    Name varchar(30) not null,
    Price double not null,
    primary key (ID)
);

create table RoomAddOns (
	AddOnID int not null,
    RoomID int not null
);

create table Room (
	ID int not null auto_increment,
    Floor int not null,
    TypeID int not null,
    primary key (ID)
);

create table ReservationRooms (
	RoomID int not null,
    ReservationID int not null
);

create table Reservation (
	ID int not null auto_increment,
    CustomerID int not null,
    StartDate datetime,
    EndDate datetime,
    primary key (ID)
);

create table Customer (
	ID int not null auto_increment,
    Name varchar(30),
    Phone varchar(30) not null,
    Email varchar(45),
    Age int,
    primary key (ID)
);

create table Promotion (
	ID int not null auto_increment,
    Name varchar(30),
    DateStart datetime not null,
    DateEnd datetime,
    Percentage double,
    DollarAmount double,
	primary key (ID)
);

create table ReservationPromotions (
	ReservationID int,
    PromotionID int
);

create table Guest (
	ID int not null auto_increment,
    Name varchar(30) not null,
    Age int,
    primary key (ID)
);

create table ReservationGuests (
	ReservationID int,
    GuestID int
);

create table BillDetails (
	ID int not null auto_increment,
    ReservationID int not null,
    AddOnPrice double,
    AmenitiesPrice double,
    RoomPrice double,
    SubTotal double,
    Promotion double,
    Tax double not null,
    Total double not null,
    primary key (ID)
);
 
 alter table RoomAmenities add constraint fk_RARoomID foreign key (RoomID) references Room (ID);
 alter table RoomAmenities add constraint fk_AmenityID foreign key (AmenityID) references Amenity (ID);
 
 alter table RoomAddOns add constraint fk_RAORoomID foreign key (RoomID) references Room (ID);
 alter table RoomAddOns add constraint fk_AddOnID foreign key (AddOnID) references AddOn (ID);
 
 alter table Room add constraint fk_TypeID foreign key (TypeID) references Type (ID);
 
 alter table ReservationRooms add constraint fk_RRRoomID foreign key (RoomID) references Room (ID);
 alter table ReservationRooms add constraint fk_RRReservationID foreign key (ReservationID) references Reservation (ID);
 
 alter table Reservation add constraint fk_CustomerID foreign key (CustomerID) references Customer (ID);
 
 alter table ReservationPromotions add constraint fk_RPReservationID foreign key (ReservationID) references Reservation (ID);
 alter table ReservationPromotions add constraint fk_PromotionID foreign key (PromotionID) references Promotion (ID);
 
 alter table ReservationGuests add constraint fk_RGReservationID foreign key (ReservationID) references Reservation (ID);
 alter table ReservationGuests add constraint fk_GuestID foreign key (GuestID) references Guest (ID);
 
 alter table BillDetails add constraint fk_BDReservationID foreign key (ReservationID) references Reservation (ID);