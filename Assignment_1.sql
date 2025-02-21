create table employee_tbl
(emp_id int primary key, 
name varchar(30), 
email varchar(30) unique, 
department varchar(20),
salary decimal,
joiningDate Date);


insert into employee_tbl values(101, 'Tony Stark', 'tonystark@email.com','Development', 25000, '2025-02-19');

select * from employee_tbl;