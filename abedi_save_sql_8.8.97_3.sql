create database information;
use information;
create table student(
id int(20) not null auto_increment,
person_id int(10) not null,
shomare_daneshjoi varchar(20)null,
major_id varchar(20) not null,
primary key(id)
)
create table teachers (
id int(20) not null auto_increment,
person_id int(20) not null,
student_id varchar(20)null,
grade varchar(20) not null,
primary key(id)
)
create table course(
id int(20) auto_increment not null,
primary key (id),
name_course character(20) not null
)
create table teacher_course(
id int(20) not null auto_increment,
teacher_id int(20) not null,
course_id int(20) not null,
primary key(id)
)
create table student_course(
id int(20) not null auto_increment,
student_id int(20) not null,
course_id int(20) not null,
primary key(id)
)
create table major(
id int(20) auto_increment not null,
name_major text(20) not null,
descriptions text(500) not null,
primary key(id)
)
create table payment(
id int(20) auto_increment not null,
student_id int(20) not null,
amount int(20) not null,
primary key(id)
)
create table person (
id int(20) not null auto_increment,
first_name character(30) null,
last_name character(20) null,
nid varchar(10) not null,
age varchar(3) null,
primary key(id)
)
drop table student
drop table teachers
drop table person
select * from teachers;
insert into person(name_person,family_person,nid,age,madrak) values ("kamiar","sokhango",7895457856,32,"sikl");
insert into `information`.`person`(`name_person`,`family_person`,`nid`,`madrak`,`age`) 
values ('mohsen','barbari','7898586415','sikl','36');
set sql_safe_updates =0;
delete from `information`.`person` where name_person='mohsen';
delete from teachers where name_teacher in ('mohsen');
delete from teachers where family_teacher='barbari';
update person set family_person='karimi' where name_person='kamran';
select * from teachers;
insert into teachers(pid,sid) values (9,3);
insert into student(pid,sid,entry) values (4,10,1379);


ALTER TABLE `information`.`student` 
ADD CONSTRAINT `fk_student_person`
  FOREIGN KEY (`pid`)
  REFERENCES `information`.`person` (`id`);

  
  ALTER TABLE `information`.`teachers` 
ADD CONSTRAINT `fk_teachers_person`
  FOREIGN KEY (`pid`)
  REFERENCES `information`.`person` (`id`);
  
teachers  ALTER TABLE `information`.`person` 
ADD CONSTRAINT `person_teacher`
  FOREIGN KEY (`id`)
  REFERENCES `information`.`teachers` (`person_id`);


