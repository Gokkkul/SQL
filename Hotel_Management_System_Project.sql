
use jibe_main_training
--Creating tables

create table customers_tbl(
cust_id int identity(1,1) primary key,
cust_name varchar(30),
cust_email varchar(30),
cust_phone int,
cust_address varchar(max));
select * from customers_tbl;

alter table customers_tbl alter column cust_phone bigint;

create table rooms_tbl1(
room_id int identity(1,1) primary key,
room_type varchar(30),
price_per_night int,
status varchar(30));

create table bookings_tbl1(
booking_id int identity(1,1) primary key,
cust_id int foreign key (cust_id) references customers_tbl(cust_id),
room_id int foreign key (room_id) references rooms_tbl1 (room_id),
checkInDate date,
checkOutDate date,
totalAmt int);

alter table bookings_tbl1 drop constraint FK__bookings___room___3FF5698E;
alter table bookings_tbl1 add constraint FK_bookings_room_id foreign key (room_id) references rooms_tbl1 (room_id);

select constraint_name from information_schema.table_constraints where table_name = 'bookings_tbl1' and constraint_type= 'Foreign Key';

create table payments_tbl1(
payments_id int identity(1,1) primary key,
booking_id int foreign key (booking_id) references bookings_tbl1(booking_id),
payment_date date,
amt int,
payment_method varchar(30));

create table employees_tbl1(
emp_id int identity(1,1) primary key,
emp_name varchar(30),
emp_position varchar(30),
emp_salary int,
emp_hire_date date,
manager_id int foreign key (manager_id) references employees_tbl(emp_id));

create table services_tbl1(
service_id int identity(1,1) primary key,
service_name varchar(30),
service_price int);

create table booking_service_tbl(
booking_service_id int identity(1,1) primary key,
booking_id int foreign key (booking_id) references bookings_tbl1(booking_id),
service_id int foreign key (service_id) references services_tbl1(service_id));


-- inserting the values

--Customer table

INSERT INTO customers_tbl (cust_name, cust_email, cust_phone, cust_address) VALUES
('Arjun Mehta', 'arjun.mehta@example.com', 9876543210, 'Mumbai, Maharashtra'),
('Sita Kapoor', 'sita.kapoor@example.com', 9876543211, 'Delhi, Delhi'),
('Ravi Kumar', 'ravi.kumar@example.com', 9876543212, 'Bangalore, Karnataka'),
('Priya Sharma', 'priya.sharma@example.com', 9876543213, 'Chennai, Tamil Nadu'),
('Vikram Singh', 'vikram.singh@example.com', 9876543214, 'Kolkata, West Bengal'),
('Anjali Gupta', 'anjali.gupta@example.com', 9876543215, 'Hyderabad, Telangana'),
('Rohan Verma', 'rohan.verma@example.com', 9876543216, 'Pune, Maharashtra'),
('Sunita Reddy', 'sunita.reddy@example.com', 9876543217, 'Ahmedabad, Gujarat'),
('Kiran Patel', 'kiran.patel@example.com', 9876543218, 'Surat, Gujarat'),
('Deepak Joshi', 'deepak.joshi@example.com', 9876543219, 'Jaipur, Rajasthan');

select * from rooms_tbl1;
--rooms table

INSERT INTO rooms_tbl1 (room_type, price_per_night, status) VALUES
('Single', 1000, 'Available'),
('Double', 2000, 'Available'),
('Suite', 5000, 'Occupied'),
('Single', 1000, 'Occupied'),
('Double', 2000, 'Available'),
('Suite', 5000, 'Available'),
('Single', 1000, 'Occupied'),
('Double', 2000, 'Occupied'),
('Suite', 5000, 'Available'),
('Single', 1000, 'Available');


-- booking table

INSERT INTO bookings_tbl1 (cust_id, room_id, checkInDate, checkOutDate, totalAmt) VALUES
(2, 1, '2025-02-20', '2025-02-22', 2000),
(2, 2, '2025-02-22', '2025-02-25', 6000),
(2, 3, '2025-02-21', '2025-02-24', 15000),
(3, 4, '2025-02-22', '2025-02-25', 3000),
(3, 5, '2025-02-25', '2025-02-28', 6000),
(4, 6, '2025-02-23', '2025-02-26', 15000),
(5, 7, '2025-02-24', '2025-02-27', 3000),
(6, 8, '2025-02-25', '2025-02-28', 6000),
(7, 9, '2025-02-26', '2025-03-01', 15000),
(7, 10, '2025-03-01', '2025-03-04', 3000);

select * from rooms_tbl1;

--payments table

INSERT INTO payments_tbl1 (booking_id, payment_date, amt, payment_method) VALUES
(6, '2025-02-20', 2000, 'Credit Card'),
(15, '2025-02-22', 6000, 'Debit Card'),
(14, '2025-02-21', 15000, 'Cash'),
(13, '2025-02-22', 3000, 'Credit Card'),
(11, '2025-02-25', 6000, 'Debit Card'),
(10, '2025-02-23', 15000, 'Cash'),
(7, '2025-02-24', 3000, 'Credit Card'),
(8, '2025-02-25', 6000, 'Debit Card'),
(9, '2025-02-26', 15000, 'Cash'),
(10, '2025-03-01', 3000, 'Credit Card');

select * from bookings_tbl1;


--employees table


INSERT INTO employees_tbl1 (emp_name, emp_position, emp_salary, emp_hire_date, manager_id) VALUES
('Amit Roy', 'Manager', 50000, '2022-01-01', NULL),
('Bina Iyer', 'Receptionist', 20000, '2022-02-01', 1),
('Chandan Menon', 'Housekeeper', 15000, '2022-03-01', 1),
('Deepak Sharma', 'Chef', 30000, '2022-04-01', 1),
('Esha Banerjee', 'Waiter', 18000, '2022-05-01', 1),
('Farhan Khan', 'Security', 22000, '2022-06-01', 1),
('Gauri Deshmukh', 'Gardener', 16000, '2022-07-01', 1),
('Harish Kumar', 'Electrician', 25000, '2022-08-01', 1),
('Ila Reddy', 'Plumber', 24000, '2022-09-01', 1),
('Jatin Gupta', 'Cleaner', 14000, '2022-10-01', 1);


--services table


INSERT INTO services_tbl1 (service_name, service_price) VALUES
('Spa', 3000),
('Gym', 1500),
('Laundry', 500),
('Room Service', 2000),
('Parking', 800),
('Wi-Fi', 1000),
('Swimming Pool', 2500),
('Breakfast', 600),
('Airport Shuttle', 1800),
('Concierge', 1200);


-- booking services table

INSERT INTO booking_service_tbl (booking_id, service_id) VALUES
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


--Task 2

select * from customers_tbl;


select c.cust_name, r.room_type, b.checkInDate, b.totalAmt
from bookings_tbl1 b
join customers_tbl c ON b.cust_id = c.cust_id
join rooms_tbl1 r ON b.room_id = r.room_id;


select e1.emp_id as Employee_ID, e1.emp_name as Employee_Name, e2.emp_id as Manager_ID, e2.emp_name as Manager_Name
from employees_tbl1 e1
left join employees_tbl1 e2 on e1.manager_id = e2.emp_id;



SELECT r.room_id, r.room_type, r.price_per_night, r.status
FROM rooms_tbl1 r
LEFT JOIN bookings_tbl1 b ON r.room_id = b.room_id
WHERE b.room_id IS NULL;

select * from rooms_tbl1 where status = 'Available';


-- Task 3

select * from customers_tbl where cust_id in ( select * from 

select * from bookings_tbl1 where totalAmt = (select max(totalAmt) from bookings_tbl1);


CREATE VIEW ActiveBookings1 AS
SELECT c.cust_name AS CustomerName, r.room_type AS RoomType, b.checkInDate AS CheckInDate, b.checkOutDate AS CheckOutDate
FROM bookings_tbl1 b
JOIN customers_tbl c ON b.cust_id = c.cust_id
JOIN rooms_tbl1 r ON b.room_id = r.room_id
WHERE r.status = 'Occupied';

select * from ActiveBookings1;


-- Task 5

create index idx_room_type on rooms_tbl1(room_type);

create index idx_checkin_checkout_dates on bookings_tbl1(checkInDate, checkOutDate);



-- Task 6

CREATE PROCEDURE GetTotalRevenueByMonth
    @Month INT,
    @Year INT
AS
BEGIN
    SELECT SUM(p.amt) AS TotalRevenue
    FROM payments_tbl1 p
    JOIN bookings_tbl1 b ON p.booking_id = b.booking_id
    WHERE MONTH(p.payment_date) = @Month AND YEAR(p.payment_date) = @Year;
END


EXEC GetTotalRevenueByMonth @Month = 2, @Year = 2025;



CREATE FUNCTION GetTotalDaysStayed(@CustomerID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalDays INT;

    SELECT @TotalDays = SUM(DATEDIFF(day, checkInDate, checkOutDate))
    FROM bookings_tbl1
    WHERE cust_id = @CustomerID;

    RETURN @TotalDays;
END;


SELECT dbo.GetTotalDaysStayed(2) AS TotalDaysStayed;


-- Task 7

CREATE TRIGGER trg_UpdateRoomStatusOnCancellation1
ON bookings_tbl1
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE rooms_tbl1
    SET status = 'Available'
    WHERE room_id IN (SELECT room_id FROM DELETED);
END


select * from rooms_tbl1;


select * from bookings_tbl1;

INSERT INTO bookings_tbl1 (cust_id, room_id, checkInDate, checkOutDate, totalAmt)
VALUES (2, 1, '2025-02-25', '2025-02-28', 3000);
