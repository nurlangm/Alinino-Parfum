Create database AliNino

use AliNino
create table Settings(
Id int primary key identity,
Logo nvarchar(50),
Menu nvarchar(50),
[Language] nvarchar(50),
[Login] nvarchar(50),
Basket nvarchar(50)
)

create table Books(
Id int primary key identity,
[Name] nvarchar(60),
[Image] nvarchar(60),
ProductCode bigint,
Cover smallint,
[Description] nvarchar(500),
[Page] smallint,
IsAvailable bit,
[Date] datetime2,
Price decimal,
DiscountPercent decimal,
PublisherId int foreign key references Publishers(Id),
CategoryId int foreign key references Categories(Id),
LanguageId int foreign key references Languages(Id),
CommentId int foreign key references Comments(Id)
)

create table Publishers(
Id int primary key identity,
[Name] nvarchar(50)
)
create table Categories(
Id int primary key identity,
[Name] nvarchar(60)
)

create table Languages(
Id int primary key identity,
[Name] nvarchar(60)
)

create table Comments(
Id int primary key identity,
[Date] datetime,
[Message] nvarchar(500)
)

create table Authors(
Id int primary key identity,
Fullname nvarchar(60)
)

create table AuthorBooks(
Id int primary key identity,
BookId int foreign key references Books(Id),
AuthorId int foreign key references Authors(Id),
)

create table Users(
Id int primary key identity,
Fullname nvarchar(50),
Username nvarchar(50),
[Image] nvarchar(50),
Email nvarchar(100) unique
)

create table Orders(
Id int primary key identity,
TotalPrice decimal,
Date datetime,
UserId int foreign key references Users(Id)
)

create table OrderBooks(
Id int primary key identity,
BookId int foreign key references Books(Id),
OrderId int foreign key references Orders(Id),
)

alter table Comments
add UserId int foreign key references Users(Id)