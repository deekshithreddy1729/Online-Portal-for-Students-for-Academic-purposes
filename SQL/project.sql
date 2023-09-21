#drop database project;
create database project;
use project;

create table personal_details
(
clg_id varchar(10) primary key,
aadhar_no varchar(15),
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
gender varchar(10),
house_no varchar(40),
street varchar(20),
district varchar(20),
city varchar(20),
pincode varchar(10),
state varchar(20),
date_of_birth varchar(15),
age int,
personal_email varchar(40)
);
#drop table personal_details;
insert into personal_details value("170001015","1234567890","Bhogavalli","Samhit","Chowdary","Male","205","kphb","rangareddy","hyderabad","500085","telngana","1999-11-12","18","samhit102@gmail.com");
insert into personal_details value("170011111","1234567899","Sai","Kumar","Reddy","Male","306","sai nagar","rangareddy","hyderabad","500085","telngana","1980-11-12","38","saireddy306@gmail.com");
insert into personal_details value("170001017","1234567890","Chintaginjala","Sai","Dinesh","Male","205","kphb","rangareddy","hyderabad","500085","telngana","1999-11-12","18","dinesh102@gmail.com");
insert into personal_details value("170002026","12345634343","Kotla","Deekshith","Reddy","Male","4545","kphb","rangareddy","hyderabad","500085","telngana","1999-11-12","18","dinesh102@gmail.com");
insert into personal_details value("170003018","1234563232","Jagu","Harsha","Sai","Male","4543213","kphb","rangareddy","hyderabad","500085","telngana","1999-11-12","18","harsha102@gmail.com");
insert into personal_details value("170031115","123456788459","Devi","Sri","Prasad","Male","306","sai nagar","rangareddy","hyderabad","500085","telngana","1984-11-12","34","dsp@gmail.com");
insert into personal_details value("170004048","123456785100","Samantha","Ruth","Prabhu","Female","205","kphb","rangareddy","hyderabad","500085","telangana","1999-10-12","18","sam143@gmail.com");
insert into personal_details value("170002048","123416785100","Divyanka","Tripati","Singh","Female","205","kphb","rangareddy","hyderabad","500085","telangana","1999-10-9","19","dts@gmail.com");
insert into personal_details value("170011112","123453432","Amogh","Sri","Meena","Male","4543","kphb","rangareddy","hyderabad","500085","telngana","1999-11-11","18","Amogh102@gmail.com");
select * from personal_details ;


create table department
(
dept_id varchar(10) primary key,
dept_name varchar(40),
building varchar(40)
);
insert into department value("CSE","Computer Science","1E-201");
insert into department value("EE","Electrical","1B-201");
insert into department value("ME","Mechanical","1C-201");
insert into department value("CE","Civil","1A-101");
insert into department value("MEMS","Metallurgy","1D-301");
select * from department;

create table teacher
(
teacher_id varchar(10) primary key,
dept_id varchar(10),
college_email varchar(40),
salary varchar(13),
foreign key(dept_id) references department(dept_id) on delete cascade,
foreign key(teacher_id) references personal_details(clg_id) on delete cascade
);
insert into teacher value("170011111","CSE","cse170011111@iiti.ac.in","50000");
insert into teacher value("170031115","ME","me170031115@iiti.ac.in","50000");
insert into teacher value("170011112","EE","ee170011112@iiti.ac.in","50000");
select * from teacher;

create table course
(
course_id varchar(10) primary key,
course_name varchar(40),
department varchar(10),
credits decimal(2,1),
L int,
T int,
P int,
foreign key(department) references department(dept_id) on delete cascade
);
insert into course value("CS101","Computer Science","CSE",5,2,1,0);
insert into course value("MA106","Maths","EE",4,2,1,0);
insert into course value("HS107","English","CSE",2,1,0,0);
insert into course value("PH102","Physics","ME",4,3,2,1);
insert into course value("CS153","Computer Lab","CSE",1.5,0,0,3);
insert into course value("CH108","Chemistry","ME",4,2,1,0);
insert into course value("CH157","Chemistry Lab","ME",2,0,0,3);
insert into course value("IC111","Engineering Drawing","ME",1.5,0,0,3);
select * from course;

#drop table teaches;
create table teaches
(
teacher_id varchar(10),
course_id varchar(10),
primary key(teacher_id,course_id),
foreign key (teacher_id) references personal_details(clg_id) on delete cascade,
foreign key (course_id) references course(course_id) on delete cascade
);
insert into teaches value("170011111","CS101");
insert into teaches value("170031115","IC111");
insert into teaches value("170011112","PH102");
select * from teaches;


#drop table student;
create table student
(
roll_no varchar(10) primary key,
dept_id varchar(10),
teacher_id varchar(10),
college_email varchar(40),
year_of_joining int,
library_registration varchar(3),
blood_grp varchar(7),
height varchar(15),
weight varchar(5),
disability varchar(3),
drug_allergy varchar(5),
past_ill varchar(50),
typhoid varchar(10),
hepatitits_A varchar(10),
mmr varchar(10),
chicken_pox varchar(10),
foreign key(roll_no) references personal_details(clg_id) on delete cascade,
foreign key (dept_id) references department(dept_id) on delete cascade,
foreign key (teacher_id) references personal_details(clg_id) on delete set null
);
insert into student value("170001015","CSE","170011111","cse170001015@iiti.ac.in",2017,"no",null,null,null,null,null,null,null,null,null,null);
insert into student value("170001017","CSE","170011111","cse170001017@iiti.ac.in",2017,"no",null,null,null,null,null,null,null,null,null,null);
insert into student value("170002026","EE","170031115","ee170002026@iiti.ac.in",2017,"no",null,null,null,null,null,null,null,null,null,null);
insert into student value("170003018","ME","170031115","me170003018@iiti.ac.in",2017,"no",null,null,null,null,null,null,null,null,null,null);
insert into student value("170004048","CE","170011112","ce170004048@iiti.ac.in",2017,"no",null,null,null,null,null,null,null,null,null,null);
insert into student value("170002048","EE","170011112","ee170002048@iiti.ac.in",2017,"no",null,null,null,null,null,null,null,null,null,null);
select * from student;
#drop table login;

create table login
(
   roll_no varchar(10) primary key,
   password varchar(20),
   foreign key(roll_no) references personal_details(clg_id) on delete cascade 
);
insert into login value("170001015","samhit");
insert into login value("170003018","harsha");
#insert into login value("170001014","rushya");
#insert into login value("170001016","pavan");
insert into login value("170001017","dinesh");
insert into login value("170002026","deekshith");
insert into login value("170004048","samantha");
insert into login value("170002048","divyanka");
select * from login;
select * from personal_details where clg_id="170001015";
#drop table course_regis;
create table course_regis
(
roll_no varchar(10),
course_id varchar(10),
primary key(roll_no,course_id),
foreign key (roll_no) references personal_details(clg_id) on delete cascade,
foreign key (course_id) references course(course_id) on delete cascade
);
#insert into course_regis values("170001015","cs207");
select * from course_regis;

#create table takes
#(
# roll_no int,
#course_id varchar(10),
#grade varchar(2),
#primary key(teacher_id,course_id),
#foreign key (roll_no) references student(roll_no),
#foreign key (course_id) references course(course_id)
#);



create table room
(
room_no varchar(5),
building_name varchar(40),
floor varchar(3),
primary key(room_no,building_name) 
);
insert into room value("403","APJ Abdul Kalam Hostel","3");
insert into room value("407","APJ Abdul Kalam Hostel","3");
insert into room value("421","APJ Abdul Kalam Hostel","3");
insert into room value("410","APJ Abdul Kalam Hostel","3");
insert into room value("610","APJ Abdul Kalam Hostel","5");
insert into room value("606","APJ Abdul Kalam Hostel","5");
create table room_alloc
(
clg_id varchar(10) primary key,
room_no varchar(5),
building_name varchar(40),
bed char,
foreign key(clg_id) references personal_details(clg_id) on delete cascade,
foreign key(room_no,building_name) references room(room_no,building_name) on delete cascade
#foreign key(building_name) references room(building_name)
);
insert into room_alloc value("170001015","403","APJ Abdul Kalam Hostel","C");
insert into room_alloc value("170001017","407","APJ Abdul Kalam Hostel","A");
insert into room_alloc value("170002026","421","APJ Abdul Kalam Hostel","C");
insert into room_alloc value("170003018","410","APJ Abdul Kalam Hostel","A");
insert into room_alloc value("170004048","610","APJ Abdul Kalam Hostel","A");
insert into room_alloc value("170002048","606","APJ Abdul Kalam Hostel","B");
#drop table room_alloc;
#drop table phone_number;
create table phone_number
(
clg_id varchar(10) ,
phone_number varchar(15),
primary key(clg_id,phone_number),
foreign key(clg_id) references personal_details(clg_id) on delete cascade
);
select * from phone_number;
insert into phone_number value('170001015','9456123780');
insert into phone_number value('170001015','9457123780');
insert into phone_number value('170001017','9032786860');
insert into phone_number value('170001015','9456123781');
insert into phone_number value('170002026','9456123880');
insert into phone_number value('170002026','7456123780');
insert into phone_number value('170003018','9456123700');
insert into phone_number value('170003018','6456123780');
insert into phone_number value('170004048','6456123680');
insert into phone_number value('170002048','6478123780');

create table student_rank
(
roll_no varchar(10) primary key,
category varchar(10),
OC_rank varchar(10),
category_rank varchar(10),
foreign key(roll_no) references personal_details(clg_id) on delete cascade
);
insert into student_rank value('170001015','OC','997',null);
insert into student_rank value('170001017','OBC','3362','529');



create table contact_person
(
clg_id varchar(10),
relation varchar(20),
cp_name varchar(40),
cp_phone_number varchar(15),
primary key(clg_id,relation),
foreign key(clg_id) references personal_details(clg_id) on delete cascade
);
select * from contact_person;





create table admin_login
(
     user varchar(15),
     password varchar(15)
);
select * from admin_login;
insert into admin_login value("admin1","admin1");
insert into admin_login value("admin2","admin2");



#delete from personal_details where clg_id="170011111";





