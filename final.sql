create database clege2;

CREATE TABLE `clege2`.`new_table` (
  `ID` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `family` VARCHAR(45) NOT NULL,
  `national_id` INT(20) NOT NULL,
  `age` INT(20) NOT NULL,
  PRIMARY KEY (`ID`));
  
  
CREATE TABLE `clege2`.`teachers` (
  `id` INT(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `family` VARCHAR(45) NOT NULL,
  `person_id` INT(20) NOT NULL,
  `grade` VARCHAR(45) NOT NULL,
  `sabeghe kar` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `person_id_UNIQUE` (`person_id` ASC) VISIBLE);
ALTER TABLE `clege2`.`person` 

ADD CONSTRAINT `person_teachers`
  FOREIGN KEY (`ID`)
  REFERENCES `clege2`.`teachers` (`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
CREATE TABLE `clege2`.`student` (
  `id` INT(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `family` VARCHAR(45) NOT NULL,
  `person_id` INT(20) NOT NULL,
  `shomare_daneshjoii` INT(20) NOT NULL,
  `major` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `person_id_UNIQUE` (`person_id` ASC) VISIBLE);

ALTER TABLE `clege2`.`person` 
ADD CONSTRAINT `person_student`
  FOREIGN KEY (`ID`)
  REFERENCES `clege2`.`student` (`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `clege2`.`student_course` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `family` VARCHAR(45) NOT NULL,
  `course` VARCHAR(45) NOT NULL,
  `student_id` INT(20) NOT NULL,
  `course_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE,
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE);


ALTER TABLE `clege2`.`student` 
ADD CONSTRAINT `student_student-course`
  FOREIGN KEY (`id`)
  REFERENCES `clege2`.`student_course` (`student_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `clege2`.`course` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `code` INT(20) NOT NULL,
  PRIMARY KEY (`id`));


ALTER TABLE `clege2`.`course` 
ADD CONSTRAINT `course_student-course`
  FOREIGN KEY (`id`)
  REFERENCES `clege2`.`student_course` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `clege2`.`teacher_course` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `code` INT(20) NOT NULL,
  `teacher_id` INT(20) NOT NULL,
  `course_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `teacher_id_UNIQUE` (`teacher_id` ASC) VISIBLE,
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE);


ALTER TABLE `clege2`.`teachers` 
ADD CONSTRAINT `teacher_teacher-course`
  FOREIGN KEY (`id`)
  REFERENCES `clege2`.`teacher_course` (`teacher_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `clege2`.`course` 
ADD CONSTRAINT `course_teacher-course`
  FOREIGN KEY (`id`)
  REFERENCES `clege2`.`teacher_course` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `clege2`.`major` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `code` INT(20) NOT NULL,
  `student_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE);

ALTER TABLE `clege2`.`student` 
ADD CONSTRAINT `student_major`
  FOREIGN KEY (`id`)
  REFERENCES `clege2`.`major` (`student_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `clege2`.`payment` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `shomare_peygiri` INT(20) NOT NULL,
  `time` DATETIME NOT NULL,
  `student_id` INT(20) NOT NULL,
  `mablagh` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE);


ALTER TABLE `clege2`.`student` 
ADD CONSTRAINT `student_payment`
  FOREIGN KEY (`id`)
  REFERENCES `clege2`.`payment` (`student_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
insert into person(`name`,`family`,`national_id`,`age`,`student_id`,`teacher_id`) values ('reza','mohammadi',0315412,2364,6451,4513);

insert into teachers(`name`,`family`,`grade`,`sabeghe kar`,`teacher-course_id`) values ('ali','abedi','diplom',2,312);

insert into student(`name`,`family`,`person_id`,`shomare_daneshjoii`,`major`) values ('ali','abedi',0315194,234165,'pc');

insert into course(`name`,`code`) values ('pc',23);

insert into payment(`name`,`shomare_peygiri`,`time`,`student_id`,`mablagh`) values ('ali',165151,13/12/99,23,526);


insert into major(`name`,`code`,`student_id`) values ('ali',0315194,23);

insert into student_course(`name`,`family`,`course`,`student_id`,`course_id`) values ('ali','abedi','riazi',0315194,26543);

insert into teacher_course(`name`,`code`,`course_id`) values ('ali',461184,26453);


select * from teacher_course;
delete from teacher where name='reza';
set SQL_SAFE_UPDATES=0;