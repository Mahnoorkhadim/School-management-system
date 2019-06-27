show databases;
create database SMS;
use SMS;
drop database SMS;
create table Student(
Student_id int(20)primary key not null,
Email varchar(45),
Password varchar(45),
Fname varchar(45),
Lname varchar(45),
DOB date,
Phone varchar(15),
Mobile varchar(15),
Parents_id int(20),
date_of_join date,
Status boolean,
last_login_date date,
last_login_ip varchar(45)
);
select * from Student;
describe student;

create table Parents(
Parents_id int(20) primary key not null,
Email varchar(45),
Password varchar(45),
Fname varchar(45),
Lname varchar(45),
DOB date,
Phone varchar(15),
Mobile varchar(15),
date_of_join date,
Status boolean,
last_login_date date,
last_login_ip varchar(45)
);
select * from Parents;
describe Parents;

alter table Student add constraint `m_Parents_id` foreign key (Parents_id) references Parents (Parents_id);

create table teacher(
teacher_id int(20) primary key not null,
Email varchar(45),
Password varchar(45),
Fname varchar(45),
Lname varchar(45),
DOB date,
Phone varchar(15),
Mobile varchar(15),
date_of_join date,
Status boolean,
last_login_date date,
last_login_ip varchar(45)
);

create table Classroom(
Classroom_id int(20)primary key not null,
Years year,
Grade_id int(20),
section char(2),
status boolean,
remarks varchar(45),
teacher_id int(20)
);
alter table Classroom add constraint `N_teacher_id_fk` foreign key (teacher_id) references teacher(teacher_id);

create table Grade(
Grade_id int(20)primary key not null,
name varchar(45),
description varchar(45)
);
alter table Classroom add constraint `b_Grade_id_fk` foreign key (Grade_id) references Grade(Grade_id);

create table Course(
Course_id int(20)primary key not null,
Grade_id int(20),
name varchar(45),
description varchar(45)
);
alter table Course add constraint `_Grade_id_fk` foreign key (Grade_id) references Grade(Grade_id);

create table Classroom_Student(
Classroom_id int(20),
Student_id int(20)
);

alter table Classroom_Student  add constraint `l_Classroom_id_fk`foreign key (Classroom_id) 
references Classroom(Classroom_id);

alter table Classroom_Student  add constraint `v_Student_id_fk`foreign key(Student_id) 
references Student(Student_id);

create table Attandence(
Present_Date date,
Student_id int(20),
Status boolean,
remark text
);

alter table Attandence  add constraint `mm_Student_id_fk`foreign key(Student_id) 
references Student(Student_id);

create table Exam_Type(
exam_type int(20)primary key not null,
name varchar(45),
description varchar(45)
);

create table Exam(
Exam_id int(20)primary key not null,
exam_type int(20),
name varchar(45),
status_date date
);

alter table Exam add constraint`o_exam_type_fk`foreign key(exam_type) references Exam_type(exam_type);

create table Exam_result(
Exam_id int(20),
Student_id int(20),
Course_id int(20),
marks varchar(45)
);

alter table Exam_result add constraint `e_Exam_id_fk` foreign key(Exam_id)references Exam(Exam_id);
alter table Exam_result add constraint`p_Student_id_fk`foreign key(Student_id) references Student(Student_id);
alter table Exam_result add constraint`k_Course_id_fk` foreign key(Course_id) references Course(Course_id);