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
transaction_id int identity(1,1), primary key,
account_id int foreign key(account_id) references accounts_tbl(account_id),
trasaction_type varchar(30),
amount decimal(10,2),
transaction_date date)

create table audit_transactions_tbl(
audit_id int primary key identity(1,1),
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

---------------------------------------------------------------------------------------------------------------------------------

--Task 2

CREATE FUNCTION fn_interest
(
    @account_id int
)
RETURNS decimal(10,2)
AS
BEGIN
    DECLARE @Result decimal(10,2);
    SET @Result = 0.05 * balance;  

    RETURN @Result;
END;


---------------------------------------------------------------------------------------------------------------------------------


--Task 3

CREATE PROCEDURE sp_transfer_money
@fromAccountId int, 
@toAccountId int,
@Amt int
AS
BEGIN
	declare @fromBalance decimal(10,2);
	
	select @fromBalance = balance from accounts_tbl where account_id = @fromAccountId;

	if @fromBalance > @Amt
	begin 
		print 'Insufficient balance...!'
	end
	else
		update accounts_tbl 
		set balance = balance - @amt 
		where account_id = @fromAccountId;

		update accounts_tbl 
		set balance = balance + @amt 
		where account_id = @toAccountId;
END


----------------------------------------------------------------------------------------------------------------------------------


-- Task 4

create trigger prevent_overdraft on accounts_tbl
instead of update
as
begin
	declare @balance int
	declare @currentBalance
	declare @account_id int
	select @account_id = account_id from inserted
	select @currentBalnce = balance where account_id = @account_id
	select @balance = balance from inserted

	if @balance < 0 and @balance < @currentBalance
		begin
			print 'Insufficient funds! Transaction aborted'
		end;
	else
		begin
			insert into audit_transactions_tbl(audit_id, account_id, amount, transaction_date, action) 
			select  account_id, amount, getdate(), 'Updated' from inserted;
		end;
end;
		
--------------------------------------------------------------------------------------------------------------------------------

--Task 5

create trigger addTransactionLog on transactions_tbl
after insert
as
begin
	insert into audit_transactions_tbl(audit_id, account_id, amount, transaction_date, action) 
	select account_id, amount, getdate(), 'Updated' from inserted;
end;


