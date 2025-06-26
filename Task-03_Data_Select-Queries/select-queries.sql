create database student_registration;

use student_registration;

create table students (
    student_id int primary key auto_increment,
    student_name varchar(100),
    email varchar(100),
    dob date,
    gender varchar(50)
);

create table courses (
    course_id int primary key auto_increment,
    course_name varchar(100),
    duration varchar(50)
);

create table registration (
    registration_id int primary key auto_increment,
    student_id int,
    course_id int,
    registration_date date,
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

insert into students (student_name, email, dob, gender) values
('saran', 'saranc@gmail.com', '2002-05-10', 'male'),
('dineshgokul', null, '2001-08-15', 'male'),
('ravi', 'ravi@gmail.com', null, 'male');

insert into courses (course_name, duration) values
('web development', '3 months'),
('data analyst', '6 months'),
('sql developer', '4 months');

insert into registration (student_id, course_id, registration_date) values
(1, 1, '2025-06-01'),
(2, 2, '2025-06-05'),
(3, 3, null);

delete from registration where student_id = 3;

update students set email = 'dineshgokul@gmail.com' where student_name = 'dineshgokul';

select * from students;

select student_name, email from students;

select * from students
where gender = 'male';

select * from students
where dob between '2001-01-01' and '2002-12-31';

select * from students
where student_name like '%sar%';

select * from students
where dob is null;

select s.student_name, c.course_name, r.registration_date
from students s
join registration r on s.student_id = r.student_id
join courses c on c.course_id = r.course_id;

select * from students
order by student_name asc;

select * from registration
order by registration_date asc
limit 2;

select s.student_name, s.email, c.course_name
from students s
join registration r on s.student_id = r.student_id
join courses c on c.course_id = r.course_id;



select * from students;
select * from courses;
select * from registration;

 


