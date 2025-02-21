

create table bankAccount_tbl(acc_id int primary key, cust_name varchar(30), account_type varchar(30), balance int);

insert into bankAccount_tbl values(101, 'Tony Stark', 'Savings', 10000);
insert into bankAccount_tbl values(102, 'Bruce Wayne', 'Savings', 20000);
insert into bankAccount_tbl values(103, 'Clark Kent', 'Current', 15000);
insert into bankAccount_tbl values(104, 'Diana Prince', 'Savings', 25000);
insert into bankAccount_tbl values(105, 'Peter Parker', 'Savings', 5000);
insert into bankAccount_tbl values(106, 'Natasha Romanoff', 'Current', 18000);
insert into bankAccount_tbl values(107, 'Steve Rogers', 'Savings', 22000);
insert into bankAccount_tbl values(108, 'Thor Odinson', 'Current', 30000);
insert into bankAccount_tbl values(109, 'Bruce Banner', 'Savings', 12000);
insert into bankAccount_tbl values(110, 'Stephen Strange', 'Current', 28000);


BEGIN TRANSACTION;

UPDATE bankAccount_tbl
SET balance = balance - 5000
WHERE acc_id = 1;

-- Check balance and rollback if less than ₹5000
IF (SELECT balance FROM bankAccount_tbl WHERE acc_id = 105) < 0
BEGIN
    ROLLBACK TRANSACTION;
END
ELSE
BEGIN
    COMMIT TRANSACTION;
END;

select * from bankAccount_tbl;