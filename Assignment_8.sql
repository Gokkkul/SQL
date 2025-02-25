
create table departmentid (deptID int primary key, deptName varchar(30));

create table employee123 (empID int primary key, emp_name varchar(30), FK_deptID2008 int
foreign key references departmentid (deptID));

alter table employee123 
add managerID int foreign key references employee123 ( ), hireDate date, salary int;

create table tbl_salary (empid int foreign key references employee123(empid) primary key, base_salary int, bonus int);
-----------------------------------------------------------------------------------------------------------------------------------
---add department table data

INSERT INTO departmentid (deptID, deptName) VALUES 
(1, 'Human Resources'), 
(2, 'Finance'), 
(3, 'Engineering'), 
(4, 'Marketing'), 
(5, 'Sales');

---add employee123 table data

INSERT INTO employee123 (empID, emp_name, FK_deptID2008, managerID, hireDate, salary) VALUES 
(1, 'Alice Smith', 1, NULL, '2022-01-15', 60000), 
(2, 'Bob Johnson', 2, 1, '2021-03-10', 70000), 
(3, 'Charlie Brown', 3, 1, '2020-05-22', 80000), 
(4, 'David Wilson', 4, 2, '2019-07-01', 65000), 
(5, 'Eve Davis', 5, 3, '2018-09-16', 75000);

---add data in salary table

INSERT INTO tbl_salary (empid, base_salary, bonus) VALUES 
(1, 60000, 5000), 
(2, 70000, 7000), 
(3, 80000, 8000), 
(4, 65000, 6000), 
(5, 75000, 7500);

--------------------------------------------------------------------------------------------------------------------
--task 01

select employee123.emp_name , departmentid.deptName, employee123.hireDate
from employee123
inner join departmentid on employee123.FK_deptID2008 = departmentid.deptID;

---task 02

select emp_name from employee123 
where empid not in (
select emp1.empid
from employee123 as emp1
join employee123 as emp2 on emp1.empID = emp2.managerid);

---task 03

select emp_name from employee123
where FK_deptID2008 not in (select deptid from departmentid);

---task 04

select emp.emp_name, (tbl_salary.base_salary + tbl_salary.bonus) as salary from employee123 as emp
inner join tbl_salary on tbl_salary.empid = emp.empid;

---task 05

select max(tbl_salary.base_salary) from tbl_salary;

--task 06

/*
select emp.emp_name, emp1.salary from employee123 as emp
join employee123 as emp1 on emp.empid = emp1.managerid
where emp1.salary > (select salary from employee123);
*/

SELECT e1.emp_name ,e1.salary
FROM employee123 e1
JOIN employee123 e2 ON e1.managerID = e2.empID
WHERE e1.salary > e2.salary;

--task 07

create view EmployeesalaryDetails as
select emp.empid,emp.emp_name, dept.deptName , sal.base_salary, (sal.base_salary + sal.bonus)as totalsalary
from employee123 as emp
inner join departmentid as dept on dept.deptid = emp.empid
inner join tbl_salary as sal on sal.empid = emp.empid;


select * from EmployeesalaryDetails;

---task 08

SELECT emp_name, DATEDIFF(year, hireDate, GETDATE()) AS YearsWorked
FROM employee123
where datediff(year,hireDate,getdate())>3;

--task 09

SELECT d.deptName, COUNT(e.empID) AS NumberOfEmployees
FROM departmentid d
JOIN employee123 e ON d.deptID = e.FK_deptID2008
GROUP BY d.deptName;