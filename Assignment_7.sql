select * from Authors2008;
select * from Books2008;
select * from Member2008;
---------------------------------------------
create table orderbooks2008 (oderID int primary key, 
memberID int foreign key references Member2008(memberid),
bookid int foreign key references books2008(bookid));


select * from Books2008;

--add authors
INSERT INTO Authors2008 (authorID, firstName, lastName) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Emily', 'Johnson'),
(4, 'Michael', 'Brown'),
(5, 'Sarah', 'Davis'),
(6, 'David', 'Wilson'),
(7, 'Laura', 'Martinez'),
(8, 'Robert', 'Garcia'),
(9, 'Linda', 'Anderson'),
(10, 'James', 'Taylor'),
(11, 'Patricia', 'Thomas'),
(12, 'Charles', 'Hernandez'),
(13, 'Barbara', 'Moore'),
(14, 'Daniel', 'Martin'),
(15, 'Susan', 'Jackson');

---add books
alter table books2008 alter column title varchar(30) not null;

INSERT INTO Books2008 (bookID, title, PublishedYear, authorID) VALUES
(1, 'Book_One', '2001', 1),
(2, 'Book Two', '2002', 2),
(3, 'Book Three', '2003', 3),
(4, 'Book Four', '2004', 4),
(5, 'Book Five', '2005', 5),
(6, 'Book Six', '2006', 6),
(7, 'Book Seven', '2007', 7),
(8, 'Book Eight', '2008', 8),
(9, 'Book Nine', '2009', 9),
(10, 'Book Ten', '2010', 10),
(11, 'Book Eleven', '2011', 11),
(12, 'Book Twelve', '2012', 12),
(13, 'Book Thirteen', '2013', 13),
(14, 'Book Fourteen', '2014', 14),
(15, 'Book Fifteen', '2015', 15);


---add members
alter table member2008 alter column f_Name varchar(30) not null;
alter table member2008 alter column L_name varchar(30) not null;

ALTER TABLE member2008
ALTER COLUMN email varchar(30);

alter table member2008 drop constraint unique_email;

alter table member2008
ADD CONSTRAINT unique_email UNIQUE (email);

select * from member2008;

INSERT INTO Member2008 (memberID, f_Name, l_Name, email) VALUES
(1, 'Alice', 'Walker', 'alice@example.com'),
(2, 'Bob', 'Hall', 'bob@example.com'),
(3, 'Carol', 'Allen', 'carol@example.com'),
(4, 'Dave', 'Young', 'dave@example.com'),
(5, 'Eve', 'King', 'eve@example.com'),
(6, 'Frank', 'Wright', 'frank@example.com'),
(7, 'Grace', 'Scott', 'grace@example.com'),
(8, 'Hank', 'Green', 'hank@example.com'),
(9, 'Ivy', 'Adams', 'ivy@example.com'),
(10, 'Jack', 'Baker', 'jack@example.com'),
(11, 'Kathy', 'Nelson', 'kathy@example.com'),
(12, 'Leo', 'Carter', 'leo@example.com'),
(13, 'Mia', 'Mitchell', 'mia@example.com'),
(14, 'Nick', 'Perez', 'nick@example.com'),
(15, 'Olivia', 'Roberts', 'olivia@example.com');

---------------------------------------------------------------------------------------------------------------
--add order table
alter TABLE	 orderbooks2008 
add orderstatus varchar(30);

INSERT INTO OrderBooks2008 (oderID, memberID, bookID, orderstatus) VALUES
(1, 1, 1, 'Pending'),
(2, 2, 2, 'Delivered'),
(3, 3, 3, 'Pending'),
(4, 4, 4, 'Delivered'),
(5, 5, 5, 'Pending'),
(6, 6, 6, 'Delivered'),
(7, 7, 7, 'Pending'),
(8, 8, 8, 'Delivered'),
(9, 9, 9, 'Pending'),
(10, 10, 10, 'Delivered');

----------------------------------------------------------------------
--task 01

select * from member2008
where memberid in (select memberid from OrderBooks2008);

-----------------------------------------------------------------------------
--task 2

select title from books2008 
where bookID in (select bookid from OrderBooks2008);

-----------------------------------------------------------------------------
--task 3

select title from books2008
where bookid not in (select bookid from OrderBooks2008);

---------------------------------------------------------------------------
-- task 4

CREATE VIEW Ordersummary AS
SELECT OrderBooks2008.oderid, member2008.f_Name, books2008.title
FROM OrderBooks2008
INNER JOIN member2008 ON member2008.memberID = OrderBooks2008.memberID
INNER JOIN books2008 ON books2008.bookid = OrderBooks2008.bookid;

select * from Ordersummary;
---------------------------------------------------------------------------------------------------