create table orders_tbl
(order_id int primary key,
customer_name varchar(20),
product_name varchar(30),
quantity int,
price int,
order_date date);

insert into orders_tbl values(101, 'Tony Stark', 'Iphone', 2, 90000, '2025-02-19');
insert into orders_tbl values(102, 'Steve Roger', 'Macbook', 1, 100000, '2025-02-19');
insert into orders_tbl values(103, 'Thor', 'Airpods', 1, 60000, '2025-02-18');
insert into orders_tbl values(104, 'Peter Parker', 'Macbook', 2, 100000, '2025-02-18');
insert into orders_tbl values(105, 'Natasha Romanoff', 'Iphone', 1, 90000, '2025-02-19');
insert into orders_tbl values(106, 'Bruce Banner', 'Macbook', 1, 100000, '2025-02-19');
insert into orders_tbl values(107, 'Clint Barton', 'Airpods', 2, 60000, '2025-02-18');
insert into orders_tbl values(108, 'Wanda Maximoff', 'Iphone', 1, 90000, '2025-02-19');
insert into orders_tbl values(109, 'Vision', 'Macbook', 1, 100000, '2025-02-18');

update orders_tbl set quantity = 1 where order_id = 101;


delete from orders_tbl where order_id = 107;

select * from orders_tbl;