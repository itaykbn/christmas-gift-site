
Create Table Cart(
	UserName nvarchar(225) not null  ,
	OrderId int not null IDENTITY(1,1) ,
	OrderName nvarchar(225) not null,
	PRIMARY KEY (OrderId),
)
select * from Cart
delete from Cart


