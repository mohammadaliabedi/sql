use information;
create table student(
id int(20) not null auto_increment,
pid int(10) not null,
sid varchar(20)null,
entry int(5) null,
primary key(id)
)
create table teachers (
id int(20) not null auto_increment,
pid int(20) not null,
sid varchar(20)null,
primary key(id)
)
create table person (
id int(20) not null auto_increment,
name_person character(30) null,
family_person character(20) null,
nid varchar(10) not null,
age varchar(3) null,
madrak character(20) null,
primary key(id)
)
drop table student
drop table teachers
drop table person
select * from person;
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
insert into student(pid,sid,entry) values (3,9,1380);

ALTER TABLE `information`.`student` 
ADD CONSTRAINT `FK_student_person`
  FOREIGN KEY (`pid`)
  REFERENCES `information`.`person` (`id`);
  
  ALTER TABLE `information`.`teachers` 
ADD CONSTRAINT `fk_teachers_person`
  FOREIGN KEY (`pid`)
  REFERENCES `information`.`person` (`id`);
