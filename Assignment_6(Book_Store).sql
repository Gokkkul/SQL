use jibe_main_training;

create table customer_tbl(cust_id int primary key, cust_name varchar(30), cust_age int, cust_city varchar(30));

insert into customer_tbl values(1, 'Tony Stark', 35, 'New York');
INSERT INTO customer_tbl VALUES (2, 'Bruce Wayne', 40, 'Gotham');
INSERT INTO customer_tbl VALUES (3, 'Clark Kent', 33, 'New York');
INSERT INTO customer_tbl VALUES (4, 'Diana Prince', 29, 'Gotham');
INSERT INTO customer_tbl VALUES (5, 'Peter Parker', 21, 'New York');
INSERT INTO customer_tbl VALUES (6, 'Steve Rogers', 30, 'Brooklyn');
INSERT INTO customer_tbl VALUES (7, 'Natasha Romanoff', 28, 'Moscow');
INSERT INTO customer_tbl VALUES (8, 'Barry Allen', 27, 'New York');
INSERT INTO customer_tbl VALUES (9, 'Hal Jordan', 35, 'Gotham');
INSERT INTO customer_tbl VALUES (10, 'Arthur Curry', 32, 'New York');

create table books_tbl(book_id int primary key, book_name varchar(30), stock int);

alter table books_tbl add book_price int;

INSERT INTO books_tbl VALUES (1, 'To Kill a Mockingbird', 15);
INSERT INTO books_tbl VALUES (2, '1984', 0);
INSERT INTO books_tbl VALUES (3, 'The Great Gatsby', 0);
INSERT INTO books_tbl VALUES (4, 'Pride and Prejudice', 25);
INSERT INTO books_tbl VALUES (5, 'Moby Dick', 5);
INSERT INTO books_tbl VALUES (6, 'War and Peace', 8);
INSERT INTO books_tbl VALUES (7, 'The Catcher in the Rye', 0);
INSERT INTO books_tbl VALUES (8, 'Brave New World', 12);
INSERT INTO books_tbl VALUES (9, 'The Lord of the Rings', 22);
INSERT INTO books_tbl VALUES (10, 'Jane Eyre', 30);

UPDATE books_tbl SET book_price = 400 WHERE book_id = 1;
UPDATE books_tbl SET book_price = 300 WHERE book_id = 2;
UPDATE books_tbl SET book_price = 200 WHERE book_id = 3;
UPDATE books_tbl SET book_price = 250 WHERE book_id = 4;
UPDATE books_tbl SET book_price = 350 WHERE book_id = 5;
UPDATE books_tbl SET book_price = 450 WHERE book_id = 6;
UPDATE books_tbl SET book_price = 160 WHERE book_id = 7;
UPDATE books_tbl SET book_price = 280 WHERE book_id = 8;
UPDATE books_tbl SET book_price = 500 WHERE book_id = 9;
UPDATE books_tbl SET book_price = 240 WHERE book_id = 10;


CREATE TABLE orders_details_tbl (
    order_id INT PRIMARY KEY,
    cust_id INT,
    book_id INT,
    CONSTRAINT fk_customers FOREIGN KEY (cust_id) REFERENCES customer_tbl(cust_id),
    CONSTRAINT fk_books FOREIGN KEY (book_id) REFERENCES books_tbl(book_id)
);

insert into orders_details_tbl values(1,1,1);
insert into orders_details_tbl values(2,1,2);
insert into orders_details_tbl values(3,2,1);

select * from orders_details_tbl;


--Task 1
select cust_name from customer_tbl where cust_id in(select distinct cust_id from orders_details_tbl);

--Task 2
select book_name from books_tbl where book_id not in (select book_id from orders_details_tbl);

--Task 3
select book_name from books_tbl where stock = 0;

--Task 5
select book_name, book_price from books_tbl where book_price in (select max(book_price) from books_tbl);

