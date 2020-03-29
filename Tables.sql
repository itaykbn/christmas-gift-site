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
--select * from UserDetails 

Create Table Cart(
	UserName nvarchar(225) not null  ,
	OrderId int not null IDENTITY(1,1) ,
	OrderName nvarchar(225) not null,
	Price int not null,
	PRIMARY KEY (OrderId),
	FOREIGN KEY (UserName)  REFERENCES UserDetails(UserName),
)
--select * from Cart
Create Table TetrisHighScore(
	UserName nvarchar(225) not null  ,
	Score int not null ,
	PRIMARY KEY (UserName),
)
--select* from TetrisHighScore
--delete from  TetrisHighScore;


--Select * From TetrisHighScore ORDER BY Score DESC 








--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot1','Bot1123','משה', 'כהן', 'bot1@gmail.com', '0000000000', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot2','Bot1123','משה', 'כהן', 'bot2@gmail.com', '0000000001', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot3','Bot1123','משה', 'כהן', 'bot3@gmail.com', '0000000002', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot4','Bot1123','משה', 'כהן', 'bot4@gmail.com', '0000000003', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot5','Bot1123','משה', 'כהן', 'bot5@gmail.com', '0000000004', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot6','Bot1123','משה', 'כהן', 'bot6@gmail.com', '0000000005', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot7','Bot1123','משה', 'כהן', 'bot7@gmail.com', '0000000006', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot8','Bot1123','משה', 'כהן', 'bot8@gmail.com', '0000000007', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot9','Bot1123','משה', 'כהן', 'bot9@gmail.com', '0000000008', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot10','Bot1123','משה', 'כהן', 'bot10@gmail.com', '0000000009', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot11','Bot1123','משה', 'כהן', 'bot11@gmail.com', '0000000010', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot12','Bot1123','משה', 'כהן', 'bot12@gmail.com', '0000000011', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot13','Bot1123','משה', 'כהן', 'bot13@gmail.com', '0000000012', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot14','Bot1123','משה', 'כהן', 'bot14@gmail.com', '0000000013', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot15','Bot1123','משה', 'כהן', 'bot15@gmail.com', '0000000014', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot16','Bot1123','משה', 'כהן', 'bot16@gmail.com', '0000000015', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot17','Bot1123','משה', 'כהן', 'bot17@gmail.com', '0000000016', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot18','Bot1123','משה', 'כהן', 'bot18@gmail.com', '0000000017', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot19','Bot1123','משה', 'כהן', 'bot19@gmail.com', '0000000018', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot20','Bot1123','משה', 'כהן', 'bot20@gmail.com', '0000000019', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot21','Bot1123','משה', 'כהן', 'bot21@gmail.com', '0000000020', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot22','Bot1123','משה', 'כהן', 'bot22@gmail.com', '0000000021', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot23','Bot1123','משה', 'כהן', 'bot23@gmail.com', '0000000022', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot24','Bot1123','משה', 'כהן', 'bot24@gmail.com', '0000000023', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot25','Bot1123','משה', 'כהן', 'bot25@gmail.com', '0000000024', 'No data', 'apachie helicopter','12/2/2004' )
--INSERT INTO UserDetails (UserName, "Password", FirstName, LastName, Mail,Phone,Adress,Gender,DateOfBirth)
--VALUES ('Bot26','Bot1123','משה', 'כהן', 'bot26@gmail.com', '0000000025', 'No data', 'apachie helicopter','12/2/2004' )

            


  

