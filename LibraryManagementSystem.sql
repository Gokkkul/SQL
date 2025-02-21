use JIBE_Main_Training;


create table Authors_tbl(
AuthorId int primary key identity(1,1),
fristname varchar(20) not null,
lastname varchar(20) not null
);

create table Book_tbl(
BookId int primary key identity(1,1),
titel varchar (30) not null,
AuthorId int ,
constraint fk_Author foreign key (AuthorId) references AuthorsTable(AuthorId),
publishedyear date unique,
constraint check_publishyear check (year(publishedyear) between 1900 and year(getdate())),
);

create table Member_tbl(
memberId int primary key identity(1,1),
fristname varchar not null,
lastname varchar not null,
email varchar unique not null,
);

create table loan_tbl(
loanid int primary key identity(1,1),
BookId int,
constraint fk_loan foreign key(BookId) references BookTable(BookId),
loandate date not null,
returndate date ,
constraint check_returndate check (returndate is null or returndate > loandate),
);

insert into Authors_tbl values ('amitabh', 'bachchan');
insert into Authors_tbl values ('narendra', 'modi');
insert into Authors_tbl  values ('ratan', 'tata');

insert into Book_tbl  values ('wings of fire', 1, '1999-07-29');
insert into Book_tbl values ('ignited minds', 2, '2002-05-01');
insert into Book_tbl values ('the secret', 3, '2006-11-26');

insert into Member_tbl values ('Tony', 'Stark', 'tony.stark@example.com');
insert into Member_tbl values ('Steve', 'Rogers', 'steve.rogers@example.com');
insert into Member_tbl values ('Peter', 'Parker', 'peter.parker@example.com');

insert into loan_tbl  values (1, '2025-01-15', '2025-02-15');
insert into loan_tbl values (2, '2025-02-01', '2025-03-01');
insert into loan_tbl values (3, '2025-03-10', '2025-04-10');

select * from authors_tbl;
select * from book_tbl;
select * from member_tbl;
select * from loan_tbl;