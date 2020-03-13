Create Table UserDetails(
	UserName nvarchar(225) not null,
	"Password" nvarchar(225) not null,
	FirstName nvarchar(225) not null,
	LastName nvarchar(225) not null,
	Mail nvarchar(225) not null,
	Phone nvarchar(225)  Null,
	Adress nvarchar(225) Null,
	Gender nvarchar(225) Null,
	DateOfBirth nvarchar(225) not null,
	PRIMARY KEY (UserName),
)
select * from UserDetails 

Create Table Cart(
	UserName nvarchar(225) not null  ,
	OrderId int not null IDENTITY(1,1) ,
	OrderName nvarchar(225) not null,
	Price int not null,
	PRIMARY KEY (OrderId),
	FOREIGN KEY (UserName)  REFERENCES UserDetails(UserName),
)
select * from Cart



  

