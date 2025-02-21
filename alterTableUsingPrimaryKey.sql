use JIBE_Main_Training;


create table departments_tbl(dept_id int primary key, dept_name varchar(30));

insert into departments_tbl values(1, 'Development');

select * from departments_tbl;

create table employees_tbl
(emp_id int primary key,
emp_name varchar(30) not null,
age int check(age>=18),
salary decimal(10, 2) default 50000,
dept_id int,
constraint fk_departments foreign key (dept_id) references departments_tbl(dept_id));

insert into employees_tbl values(1, 'Tony Stark', 35, 60000, 1);

select * from employees_tbl;


create table employees_tbl_1(emp_id int, emp_name varchar(20), age int);

alter table employees_tbl_1 alter column emp_id int not null;

insert into employees_tbl_1 values(1, 'Tony Stark',35);

alter table employees_tbl_1 add constraint pk_emp primary key(emp_id);

alter table employees_tbl_1 add constraint fk_department foreign key (dept_id) references departments(dept_id);