create table bookings_tbl(
booking_id int primary key,
customer_name varchar(20),
movie_name varchar(20),
seats_booked varchar(10),
total_price int)

insert into bookings_tbl values(1, 'Tony Stark', 'Inception', 'A1, A2', 500);
insert into bookings_tbl values(2, 'Steve Rogers', 'The Matrix', 'B3, B4', 600);
insert into bookings_tbl values(3, 'Thor Odinson', 'Interstellar', 'C5, C6', 700);
insert into bookings_tbl values(4, 'Natasha Romanoff', 'Avatar', 'D7, D8', 800);
insert into bookings_tbl values(5, 'Bruce Banner', 'Guardians of the Galaxy', 'E1, E2', 900);
insert into bookings_tbl values(6, 'Clint Barton', 'Black Panther', 'F3, F4', 950);
insert into bookings_tbl values(7, 'Wanda Maximoff', 'Doctor Strange', 'G5, G6', 850);
insert into bookings_tbl values(8, 'Vision', 'Avengers: Endgame', 'H7, H8', 1000);


select * from bookings_tbl;

begin transaction;

save transaction bookings;

update bookings_tbl set seats_booked = 'I6, I7' where booking_id = 8;

delete from bookings_tbl where booking_id = 8;

rollback transaction bookings;

commit transaction;
