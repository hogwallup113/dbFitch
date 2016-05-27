//# dbFitch
//experimental database for undisclosed purpose
//The drill was to create a complete schema and I did this, just all in one script because.....why not.

//--This is me creating a database
if exists(select * from sys.databases where name='BookTBLS')
drop database BookTBLS
go
create database BookTBLS
go
--This is me creating various tables
use BookTBLS
create table Book (
BookID int Primary Key not null,
Title nvarchar(50) not null,
PublisherID int not null
)
create table Book_Authors (
BookID int not null,
AuthorName nvarchar(50) not null
)
create table Publisher (
PublisherID int primary key not null,
Name nvarchar(40) not null,
[Address] varchar(40) null
)
create table Book_Copies (
BookID int not null,
BranchID int not null,
Number_Of_Copies int not null
)
create table Book_Loans (
BookID int not null,
BranchID int,
CardNo int,
DateOut date not null,
DueDate date not null
)
create table Library_Branch (
BranchId int primary key,
BranchName nvarchar(40) not null,
[Address] nvarchar(40) not null
)
create table Borrower (
CardNo int primary key not null,
Name nvarchar(40) not null,
[Address] nvarchar(50) not null,
Phone nvarchar(11)
)
go
--This is me adding foreign key constraints
alter table Book_Authors add constraint BookAuthors_BookID_FK
foreign key (BookID) references Book(BookID)
go
alter table Book_Copies add constraint BookCopies_BookID_FK
foreign key (BookID) references Book(BookID)
go
alter table Book_Copies add constraint BookCopies_BranchID_FK
foreign key (BranchID) references Library_Branch(BranchID)
go
alter table Book_Loans add constraint BookLoans_BookID_FK
foreign key (BookID) references Book(BookID)
go
alter table Book_Loans add constraint BookLoans_BranchID_FK
foreign key (BranchID) references Library_Branch(BranchID)
go
alter table Book_Loans add constraint BookLoans_CardNo_FK
foreign key (CardNo) references Borrower(CardNo)
go
alter table Book add constraint Book_PublisherNaID_FK
foreign key (PublisherID) references Publisher(PublisherID)
go

insert into Publisher
values (1, 'Holt Paperbacks', 'USA'),
		(2, 'Sanoma', 'Finland'),
		(3, 'Flammarion', 'France'),
		(4, 'RCS Libri', 'Italy'),
		(5, 'Weka', 'Germany'),
		(6, 'EKSMO', 'Russia'),
		(7, 'AST', 'Russia'),
		(8, 'Perseus', 'USA'),
		(9, 'Harlequin', 'Canada'),
		(10, 'Pearson', 'UK')
go

insert into Book
values (1, 'The Lost Tribe', 1),
		(2, 'A Day in the Life', 1),
		(3, 'When the Levy Breaks', 2),
		(4, 'No Quarter', 2),
		(5, 'Communication Breakdown', 3),
		(6, 'Songs for the Deaf', 3),
		(7, 'The Sky is Falling', 4),
		(8, 'Stay Fly', 4),
		(9, 'Turn in Up', 5),
		(10, 'Hey Hey What Can I Do', 5),
		(11, 'Drown', 6),
		(12, 'Mr. Rager', 6),
		(13, 'Solo Dolo', 7),
		(14, 'Mojo So Dope', 7),
		(15, 'Black Dog', 8),
		(16, 'Achilles Last Stand', 8),
		(17, 'All Things Fall Apart', 9),
		(18, 'Over the Hills and Far Away', 9),
		(19, 'The Shinning', 10),
		(20, 'Babe Im Gonna Leave You', 10)
go
		
insert into Book_Authors
values (1, 'Jane Austin'),
		(2, 'Jane Austin'),
		(3, 'Martin Amis'),
		(4, 'Martin Amis'),
		(5, 'Agatha Christie'),
		(6, 'Agatha Christie'),
		(7, 'Paul Auster'),
		(8, 'Paul Auster'),
		(9, 'Nora Roberts'),
		(10, 'Nora Roberts'),
		(11, 'Jeffery Archer'),
		(12, 'Jeffery Archer'),
		(13, 'Kingsly Amis'),
		(14, 'Kingsly Amis'),
		(15, 'Anne Bronte'),
		(16, 'Anne Bronte'),
		(17, 'Chinua Achebe'),
		(18, 'Chinua Achebe'),
		(19, 'Stephen King'),
		(20, 'Stephen King')
go

insert into Library_Branch
values (1, 'Central Books', '101 DowntheStreet St NY'),
		(2,'Sharpstown Readery', 'TrainWreck Dr MN'),
		(3, 'BrainDump Libray', 'Judas St Israel'),
		(4, 'Reading Light Accessory Outlet', 'MyKingSize CA')
go

insert into Borrower
values (001, 'Sally Smith', '14 21st Street Portland OR', 8182987456),
		(002, 'Jon Doe', '17245 McDonald Ave Tigard OR', 8187364659),
		(003, 'James Buchanan', '10124 Banyan St Rancho Cuamonga CA', 9096477634),
		(004, 'Frank Herbert', '198 Broadway Drive New York City NY', 2187564133),
		(005, 'Mike Wilson', '823 N Channey Ave Lake Elsinor CA', 3106894324),
		(006, 'Robert Watson', '435 E Burnside RD Portland OR', 8189057682), 
		(007, 'Trisha Welstad', '7577 TrainWreck LN Sacramento CA', 6048546934), 
		(008, 'Curtis Shields', '88313 Tutor St Signal CA', 9878768456),
		(009, 'Jordan Derp', '34524 Sideways St Lake Oswego OR', 818745638),
		(010, 'Josiah Fitch', '715 S Marengo Ave Pasadena CA', 9096436892),
		(011, 'Caleb Fitch', '2648 Cape Cod St Moreno Valley CA', 9093164448)
go

insert into Book_Copies
values (1, 1, 4),
		(2, 1, 8),
		(3, 1, 4),
		(4, 1, 5),
		(5, 1, 9),
		(6, 1, 10),
		(7, 1, 5),
		(8, 1, 3),
		(9, 1, 6),
		(10, 1, 5),
		(1, 2, 11),
		(2, 2, 5),
		(3, 2, 7),
		(4, 2, 7),
		(5, 2, 9),
		(6, 2, 12),
		(7, 2, 5),
		(8, 2, 6),
		(9, 2, 8),
		(10, 2, 8),
		(11, 3, 9),
		(12, 3, 9),
		(13, 3, 4),
		(14, 3, 4),
		(15, 3, 7),
		(16, 3, 5),
		(17, 3, 6),
		(18, 3, 8),
		(19, 3, 9),
		(20, 3, 6),
		(11, 4, 4),
		(12, 4, 8),
		(13, 4, 7),
		(14, 4, 4),
		(15, 4, 4),
		(16, 4, 5),
		(17, 4, 6),
		(18, 4, 7),
		(19, 4, 9),
		(20, 4, 13),
		(20, 1, 20)
go

insert into Book_Loans
values (1, 2, 001, '2016-01-01', '2016-12-31'),
		(2, 2, 001, '2016-01-01', '2016-12-31'),
		(3, 2, 001, '2016-01-01', '2016-12-31'),
		(4, 2, 001, '2016-01-01', '2016-12-31'),
		(5, 2, 001, '2016-01-01', '2016-12-31'),
		(1, 3, 002, '2016-01-01', '2016-12-31'),
		(2, 3, 002, '2016-01-01', '2016-12-31'),
		(3, 3, 002, '2016-01-01', '2016-12-31'),
		(4, 3, 002, '2016-01-01', '2016-12-31'),
		(5, 3, 002, '2016-01-01', '2016-12-31'),
		(6, 1, 010, '2016-01-01', '2016-12-31'),
		(6, 2, 004, '2016-01-01', '2016-12-31'),
		(6, 4, 006, '2016-01-01', '2016-12-31'),
		(7, 1, 010, '2016-01-01', '2016-12-31'),
		(7, 4, 003, '2016-01-01', '2016-12-31'),
		(8, 1, 010, '2016-01-01', '2016-12-31'),
		(8, 2, 001, '2016-01-01', '2016-12-31'),
		(8, 4, 005, '2016-01-01', '2016-12-31'),
		(9, 1, 011, '2016-01-01', '2016-12-31'),
		(9, 3, 005, '2016-01-01', '2016-12-31'),
		(9, 4, 003, '2016-01-01', '2016-12-31'),
		(10, 3, 008, '2016-01-01', '2016-12-31'),
		(10, 1, 002, '2016-01-01', '2016-12-31'),
		(11, 2, 008, '2016-01-01', '2016-12-31'),
		(11, 4, 011, '2016-01-01', '2016-12-31'),
		(12, 3, 010, '2016-01-01', '2016-12-31'),
		(12, 1, 004, '2016-01-01', '2016-12-31'),
		(12, 2, 003, '2016-01-01', '2016-12-31'),
		(13, 1, 009, '2016-01-01', '2016-12-31'),
		(13, 2, 006, '2016-01-01', '2016-12-31'),
		(13, 4, 009, '2016-01-01', '2016-12-31'),
		(14, 3, 009, '2016-01-01', '2016-12-31'),
		(14, 1, 008, '2016-01-01', '2016-12-31'),
		(14, 2, 004, '2016-01-01', '2016-12-31'),
		(14, 4, 001, '2016-01-01', '2016-12-31'),
		(15, 2, 002, '2016-01-01', '2016-12-31'),
		(15, 3, 005, '2016-01-01', '2016-12-31'),
		(16, 1, 001, '2016-01-01', '2016-12-31'),
		(16, 3, 002, '2016-01-01', '2016-12-31'),
		(16, 4, 009, '2016-01-01', '2016-12-31'),
		(17, 2, 010, '2016-01-01', '2016-12-31'),
		(17, 4, 011, '2016-01-01', '2016-12-31'),
		(17, 1, 001, '2016-01-01', '2016-12-31'),
		(18, 3, 004, '2016-01-01', '2016-12-31'),
		(18, 2, 006, '2016-01-01', '2016-12-31'),
		(18, 1, 006, '2016-01-01', '2016-12-31'),
		(20, 3, 008, '2016-01-01', '2016-12-31'),
		(20, 1, 002, '2016-01-01', '2016-05-04'),
		(20, 2, 009, '2016-01-01', '2016-12-31'),
		(20, 4, 004, '2016-01-01', '2016-05-04')
