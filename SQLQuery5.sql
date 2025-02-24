select * from employees_tbl;


alter table employees_tbl add manager_id int, CONSTRAINT fk_manager_id FOREIGN KEY (manager_id) REFERENCES employees_tbl(emp_id);

create table salaries(emp_id int primary key, base_salary int, bonus int, CONSTRAINT fk_emp_id FOREIGN KEY (emp_id) REFERENCES employees_tbl(emp_id));

insert into  employees_tbl values(2, 'Steve Rogers', 40, 50000, 2, '2025-02-21', 1),
(3, 'Natasha Romanoff', 35, 55000, 3, '2025-02-21', 1),
(4, 'Bruce Banner', 45, 60000, 4, '2025-02-21', 2),
(5, 'Clint Barton', 38, 52000, 5, '2025-02-21', 2),
(6, 'Thor Odinson', 1500, 70000, 6, '2025-02-21', 3),
(7, 'Tony Stark', 48, 100000, 1, '2025-02-21', 3);

select * from departments_tbl;

insert into departments_tbl values(2, 'Testing');
INSERT INTO departments_tbl 
VALUES 
(3, 'Research and Development'),
(4, 'Human Resources'),
(5, 'Marketing'),
(6, 'Sales'),
(7, 'Finance');


--Task 1
SELECT employees_tbl.emp_name, departments_tbl.dept_name 
FROM employees_tbl
INNER JOIN departments_tbl ON employees_tbl.dept_id=departments_tbl.dept_id;

--Task 2
select * from employees_tbl where manager_id = NULL;

--Task 3
SELECT employees_tbl.emp_name, departments_tbl.dept_name 
FROM employees_tbl
LEFT JOIN departments_tbl ON employees_tbl.dept_id=departments_tbl.dept_id;

--Task 4


--Task 5
select emp_name, salary from employees_tbl where salary = (select max(salary) from employees_tbl);

--Task 6
SELECT e1.emp_name ,e1.salary
FROM employees_tbl e1
JOIN employees_tbl e2 ON e1.manager_id = e2.emp_id
WHERE e1.salary > e2.salary;

--Task 7
create view EmployeesalaryDetails as
select employees_tbl.employees_tbl,employees_tbl.emp_name, departments_tbl.dept_name , sal.base_salary, (sal.base_salary + sal.bonus)as totalsalary
from employee123 as emp
inner join departmentid as dept on dept.deptid = emp.empid
inner join tbl_salary as sal on sal.empid = emp.empid;
