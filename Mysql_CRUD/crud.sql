show databases ;
select * from school.students;
use school;
select * from students where name like '%n';
select * from students where name like 'S%';
select * from students order by class;
select * from students order by class asc;
select * from students order by student_id desc;
select * from students order by student_id asc;
select * from students where name like 'S%'and section ='A';
select * from students where section ='A';
select * from students where student_id=3;
INSERT INTO students (student_id,name,class,section) VALUES (06,'Raj',8,'B');
INSERT INTO students (student_id,name,class,section) VALUES (07,'Veena',8,'A');
ALTER TABLE students ADD last_name VARCHAR(255)
ALTER TABLE students DROP COLUMN last_name; 
ALTER TABLE students ADD last_name VARCHAR(255) AFTER name ;
ALTER TABLE students RENAME COLUMN name To first_name ;
UPDATE students SET last_name = 'Roy' WHERE student_id = 3;
DELETE FROM students WHERE student_id=7; 
ALTER TABLE students RENAME COLUMN class To standard ;
show tables;
select * from Persons;
ALTER TABLE Persons DROP COLUMN Address; 
ALTER TABLE Persons ADD Phone_no VARCHAR(255) AFTER LastName ;
ALTER TABLE Persons DROP COLUMN FirstName; 
ALTER TABLE Persons ADD FirstName VARCHAR(255) AFTER PersonId ;
