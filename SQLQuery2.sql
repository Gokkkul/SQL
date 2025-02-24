use JIBE_Main_Training;
create table emp_details_tbl(emp_id int primary key, emp_name varchar(30), emp_city varchar(30), emp_salary int);

select * from emp_details_tbl;

INSERT INTO emp_details_tbl VALUES(1, 'Tony Stark', 'New York', 45000);
INSERT INTO emp_details_tbl VALUES (2, 'Steve Rogers', 'Brooklyn', 55000);
INSERT INTO emp_details_tbl VALUES (3, 'Natasha Romanoff', 'Tokyo', 48000);
INSERT INTO emp_details_tbl VALUES (4, 'Bruce Banner', 'Berlin', 52000);
INSERT INTO emp_details_tbl VALUES (5, 'Clint Barton', 'Paris', 47000);
INSERT INTO emp_details_tbl VALUES (6, 'Thor Odinson', 'Sydney', 60000);
INSERT INTO emp_details_tbl VALUES (7, 'Wanda Maximoff', 'London', 49000);
INSERT INTO emp_details_tbl VALUES (8, 'Pietro Maximoff', 'Rome', 49000);
INSERT INTO emp_details_tbl VALUES (9, 'Vision', 'Toronto', 53000);
INSERT INTO emp_details_tbl VALUES (10, 'Stephen Strange', 'New York', 58000);


UPDATE emp_details_tbl 
SET emp_name = 'Steve Rogers', emp_city = 'Brooklyn', emp_salary = 55000 
WHERE emp_id = 2;

UPDATE emp_details_tbl 
SET emp_name = 'Natasha Romanoff', emp_city = 'Tokyo', emp_salary = 48000 
WHERE emp_id = 3;

UPDATE emp_details_tbl 
SET emp_name = 'Bruce Banner', emp_city = 'Berlin', emp_salary = 52000 
WHERE emp_id = 4;

UPDATE emp_details_tbl 
SET emp_name = 'Clint Barton', emp_city = 'Paris', emp_salary = 47000 
WHERE emp_id = 5;

UPDATE emp_details_tbl 
SET emp_name = 'Thor Odinson', emp_city = 'Tokyo', emp_salary = 60000 
WHERE emp_id = 6;

UPDATE emp_details_tbl 
SET emp_name = 'Wanda Maximoff', emp_city = 'London', emp_salary = 49000 
WHERE emp_id = 7;

UPDATE emp_details_tbl 
SET emp_name = 'Pietro Maximoff', emp_city = 'Berlin', emp_salary = 49000 
WHERE emp_id = 8;

UPDATE emp_details_tbl 
SET emp_name = 'Vision', emp_city = 'Toronto', emp_salary = 53000 
WHERE emp_id = 9;

UPDATE emp_details_tbl 
SET emp_name = 'Stephen Strange', emp_city = 'Paris', emp_salary = 58000 
WHERE emp_id = 10;


select emp_name,(select emp_city, max(emp_salary) from emp_details_tbl group by emp_city) from emp_details_tbl ;

select emp_name, emp_city from emp_details_tbl where salary = (select max(emp_salary) from emp_details_tbl);


select emp_city, max(emp_salary) from emp_details_tbl group by emp_city;

select emp_name, emp_salary, emp_city from emp_details_tbl where emp_salary in (select max(emp_salary) from emp_details_tbl group by emp_city);

create view myview as select name from emp_city;
