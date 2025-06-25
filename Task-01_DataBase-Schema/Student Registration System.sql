create database Student_Registration;
 
use Student_Registration;


create table Students(
student_id int primary key auto_increment,
student_name varchar(100),
email varchar(100),
DOB date,
gender varchar(50)
);


create table Courses(
course_id int primary key auto_increment,
course_name varchar(100),
duration varchar(50)
);


create table Registration (
registration_id int primary key auto_increment,
student_id int,
course_id int,
registration_date date,
foreign key(student_id) references Students(student_id),
foreign key(course_id) references Courses(course_id)
);



insert into students (student_name, email, dob, gender) values
('saran', 'saranc@gmail.com', '2002-05-10', 'male'),
('dineshgokul', null, '2001-08-15', 'male'),  
('ravi', 'ravi@gmail.com', null, 'male');


insert into courses (course_name, duration) values
('web development', '3 months'),
('data analyst', '6 months'),
('SQL developer', '4 months');

insert into registration (student_id, course_id, registration_date) values
(1, 1, '2025-06-01'),
(2, 2, '2025-06-05'),
(3, 3, null);

delete from registration where student_id = 3;

update students set email = 'dineshgokul@gmail.com' where student_name = 'dineshgokul';


select * from students;
select * from courses;
select * from registration;

 


