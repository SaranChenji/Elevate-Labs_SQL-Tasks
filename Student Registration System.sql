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



