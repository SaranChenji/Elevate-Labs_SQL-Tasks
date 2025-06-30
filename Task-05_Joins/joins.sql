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
    duration varchar(50),
    fee int
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
('ravi', 'ravi@gmail.com', null, 'male'),
('divya', 'divya@gmail.com', '2003-02-12', 'female'),
('arjun', 'arjun@gmail.com', '2000-11-23', 'male'),
('meena', 'meena@gmail.com', '2002-04-18', 'female');

insert into courses (course_name, duration, fee) values
('web development', '3 months', 10000),
('data analyst', '6 months', 15000),
('sql developer', '4 months', 12000),
('python full stack', '5 months', 18000),
('ui/ux design', '2 months', 9000);

insert into registration (student_id, course_id, registration_date) values
(1, 1, '2025-06-01'),
(2, 2, '2025-06-05'),
(3, 3, null),
(4, 4, '2025-06-15'),
(5, 1, '2025-06-20'),
(6, 5, '2025-06-25');

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

select gender, count(*) as total_students
from students
group by gender;

select c.course_name, count(r.student_id) as total_students_registered
from courses c
left join registration r on c.course_id = r.course_id
group by c.course_name;

select registration_date, count(*) as total_registrations
from registration
group by registration_date;

select c.course_name, count(r.student_id) as total_registrations
from courses c
join registration r on c.course_id = r.course_id
group by c.course_name
having count(r.student_id) > 1;

select c.course_name, count(r.student_id) as total, avg(c.course_id) as avg_id
from courses c
left join registration r on c.course_id = r.course_id
group by c.course_name;

select c.course_name, sum(c.fee) as total_collected_fee
from courses c
join registration r on c.course_id = r.course_id
group by c.course_name;

select s.student_name, c.course_name, r.registration_date
from students s
inner join registration r on s.student_id = r.student_id
inner join courses c on r.course_id = c.course_id;

select s.student_name, c.course_name, r.registration_date
from students s
left join registration r on s.student_id = r.student_id
left join courses c on r.course_id = c.course_id;

select s.student_name, c.course_name, r.registration_date
from students s
right join registration r on s.student_id = r.student_id
right join courses c on r.course_id = c.course_id;

select s.student_name, c.course_name, r.registration_date
from students s
left join registration r on s.student_id = r.student_id
left join courses c on r.course_id = c.course_id

union

select s.student_name, c.course_name, r.registration_date
from students s
right join registration r on s.student_id = r.student_id
right join courses c on r.course_id = c.course_id;
