create table patients_tbl
(patient_id int identity(1,1) primary key,
patient_name varchar(20),
age int,
disease varchar(20),
doctor_assigned varchar(20));

insert into patients_tbl values('Tony Stark', 35, 'Headache', 'Steve Rogers');
insert into patients_tbl values('Thor', 65, 'Joint Pain', 'Steve Rogers');
insert into patients_tbl values('Bruce Banner', 45, 'Back Pain', 'Steve Rogers');
insert into patients_tbl values('Natasha Romanoff', 32, 'Migraine', 'Steve Rogers');
insert into patients_tbl values('Clint Barton', 40, 'Knee Pain', 'Steve Rogers');
insert into patients_tbl values('Wanda Maximoff', 28, 'Vision Issues', 'Vision');
insert into patients_tbl values('Sam Wilson', 37, 'Fatigue', 'Steve Rogers');
insert into patients_tbl values('James Rhodes', 50, 'Hip Pain', 'Steve Rogers');
insert into patients_tbl values('Scott Lang', 42, 'Allergies', 'Steve Rogers');
insert into patients_tbl values('Stephen Strange', 52, 'Carpal Tunnel', 'Vision');


select * from patients_tbl where age > 60;

select * from patients_tbl where doctor_assigned = 'Vision';

select * from patients_tbl group by disease;

select * from patients_tbl;