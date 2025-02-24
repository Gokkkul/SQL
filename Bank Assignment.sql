create table customers_tbl(
cust_id int primary key, 
cust_name varchar(30), 
email varchar(30),
phone_number int);

create table accounts_tbl(
account_id int primary key,
cust_id int foreign key(cust_id) references customers_tbl(cust_id),
account_number int,
balance decimal(10,2),
account_type varchar(30));

create table transactions_tbl(
transaction_id int primary key,
account_id int foreign key(account_id) references accounts_tbl(account_id),
trasaction_type varchar(30),
amount decimal(10,2),
transaction_date date)

create table audit_transactions_tbl(
audit_id int primary key,
account_id int foreign key(account_id) references accounts_tbl(account_id),
amount decimal(10,2),
transaction_date date,
action varchar(30));


--Task 1

create nonclustered index idx_customer_name on customers_tbl(cust_name);

-- Composite index

CREATE INDEX idx_transactionDate_account_index ON transactions_tbl (transaction_date, amount);

-- Unique Index

create index idx_unique_accountNumber on accounts_tbl(account_number);


--Task 2

CREATE FUNCTION fn_interest
(
    @account_id int
)
RETURNS decimal(10,2)
AS
BEGIN
    -- Function logic goes here
    DECLARE @Result decimal(10,2);

    -- Calculate the result
    SET @Result = 0.05 * balance;  -- Your logic here

    RETURN @Result;
END;


