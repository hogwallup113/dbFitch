select * from Library_Branch

select * from Borrower

select * from Book_Copies

select * from Book
--This is Q1
select B.BookID, B.Title, BC.BranchID, BC.Number_Of_Copies 
from Book as B inner join Book_Copies as BC
on B.BookID = BC.BookID
where Title = 'The Lost Tribe' and BranchID = 2
--This is Q2
select B.Title, LB.BranchID, BC.Number_Of_Copies
from Book as B join Book_Copies as BC
on B.BookID = BC.BookID join Library_Branch as LB
on BC.BranchID = LB.BranchId 
where B.BookID = '1'
--This is Q3
select BL.BookID, BL.DateOut, BL.DueDate, BR.CardNo, BR.Name
from Book_Loans as BL full outer join Borrower as BR
on BL.CardNo = BR.CardNo
where BookID is null
--This is Q4
select B.Title, BR.Name, BR.[Address] 
from Book_Loans as BL inner join Book as B
on BL.BookID = B.BookID inner join Borrower as BR
on BL.CardNo = BR.CardNo inner join Library_Branch as LB
on BL.BranchID = LB.BranchId
where LB.BranchId = '004' and BL.DueDate = '2016-05-04'
--This is Q5
select BR.BranchName, count(DueDate) as Total_Copies_Loaned
from Book_Copies as BC join Library_Branch as BR
on BC.BranchID = BR.BranchId join Book_Loans as Bl
on BR.BranchId = BL.BranchID
group by BR.BranchName
--This is Q6 both accomplish same goal, thank you Dylan for second example
select BR.Name, BR.[Address], COUNT(BR.Name) as BooksOut
from Borrower as BR inner join Book_Loans as BL
on BR.CardNo = BL.CardNo
group by BR.Name, BR.[Address]
having COUNT(BR.Name) >= 5
order by BooksOut desc

select BR.Name, BR.[Address], BL.BooksOut
from Borrower as BR inner join 
(select CardNo, COUNT(CardNo) as BooksOut from Book_Loans group by CardNo)
as BL on BL.CardNo = BR.CardNo where BL.BooksOut >= 5

--This is Q7 with the required Stored Proc
create proc GETstephenKingCentral
as
	select B.Title, BC.Number_Of_Copies
	from Book as B inner join Book_Copies as BC
	on B.BookID = BC.BookID join Book_Authors as BA
	on B.BookID = BA.BookID
	where AuthorName = 'Stephen King' and BranchID = 1
	
exec GETstephenKingCentral