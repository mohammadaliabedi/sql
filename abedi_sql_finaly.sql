create database colege;
use colege;
CREATE TABLE teacher (
  ID INT(20) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  family VARCHAR(45) NOT NULL,
  person_id INT(20) NOT NULL unique,
  teacher_course_id INT(20) NOT NULL,
  grade VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID)
  );
  CREATE TABLE person (
  ID INT(20) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  family VARCHAR(45) NOT NULL,
  national_id INT(20) NOT NULL,
  teacher_id INT(20) NOT NULL,
  PRIMARY KEY (ID));
  
  
ALTER TABLE teacher 
DROP COLUMN teacher_course_id;


ALTER TABLE person 
ADD CONSTRAINT person_teacher
  FOREIGN KEY (ID)
  REFERENCES teacher (person_id);

ALTER TABLE teacher 
ADD CONSTRAINT teacher_person_
  FOREIGN KEY (ID)
  REFERENCES person (teacher_id);

ALTER TABLE person 
ADD COLUMN student_id INT(20) NOT NULL AFTER teacher_id,
ADD UNIQUE INDEX student_id_UNIQUE (`student_id` ASC) VISIBLE;
;

CREATE TABLE student (
  ID INT(20) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  family VARCHAR(45) NOT NULL,
  shomare_daneshjoii int(20) NOT NULL,
  person_id INT(20) NOT NULL,
  major_id INT(20) NOT NULL,
  payment_id INT(20) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE INDEX person_id_UNIQUE (person_id ASC) VISIBLE,
  UNIQUE INDEX major_id_UNIQUE (major_id ASC) VISIBLE,
  UNIQUE INDEX payment_id_UNIQUE (payment_id ASC) VISIBLE);


ALTER TABLE person 
ADD CONSTRAINT person_student
  FOREIGN KEY (ID)
  REFERENCES student (person_id) ;


ALTER TABLE student 
ADD CONSTRAINT student_person
  FOREIGN KEY (ID)
  REFERENCES person (student_id) ;


CREATE TABLE major (
  ID INT(20) NOT NULL AUTO_INCREMENT,
  name reshte VARCHAR(45) NOT NULL,
  code reshte INT(20) NOT NULL,
  student_ID INT(20) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE INDEX student_ID_UNIQUE (student_ID ASC) VISIBLE);


ALTER TABLE student 
ADD CONSTRAINT student_major
  FOREIGN KEY (ID)
  REFERENCES major (student_ID) ;


ALTER TABLE major 
ADD CONSTRAINT major_student
  FOREIGN KEY (student_ID)
  REFERENCES student (ID) ;


CREATE TABLE peyment (
  `ID` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `shomare pardakht` INT(20) NOT NULL,
  `mablagh` INT(20) NOT NULL,
  `student_id` INT(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE);




ALTER TABLE `colege`.`student` 
ADD CONSTRAINT `student_payment`
  FOREIGN KEY (`ID`)
  REFERENCES `colege`.`peyment` (`student_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `colege`.`peyment` 
ADD CONSTRAINT `peymant_id`
  FOREIGN KEY (`ID`)
  REFERENCES `colege`.`student` (`payment_id`)
  INSERT INTO `colege`.`person`
(`ID`,
`name`,
`family`,
`national_id`,
`teacher_id`,
`student_id`)
VALUES
(<{ID: }>,
<{name:ali }>,
<{family: abedi}>,
<{national_id: 6564}>,
<{teacher_id:466 }>,
<{student_id: 65656}>);
;


CREATE TABLE `colege`.`teacher_course` (
  `ID` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `code_course` INT(20) NOT NULL,
  `teacher_id` INT(20) NOT NULL,
  `course_id` INT(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `teacher_id_UNIQUE` (`teacher_id` ASC) VISIBLE,
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE);


ALTER TABLE `colege`.`teacher` 
ADD CONSTRAINT `teacher_teacher_course`
  FOREIGN KEY (`ID`)
  REFERENCES `colege`.`teacher_course` (`teacher_id`);


ALTER TABLE `colege`.`teacher` 
ADD COLUMN `teacher_course_id` INT(20) NOT NULL AFTER `grade`,
ADD UNIQUE INDEX `teacher_course_id_UNIQUE` (`teacher_course_id` ASC) VISIBLE;
;

ALTER TABLE `colege`.`teacher_course` 
ADD CONSTRAINT `teacher course_teacher`
  FOREIGN KEY (`ID`)
  REFERENCES `colege`.`teacher` (`teacher_course_id`);

CREATE TABLE `colege`.`course` (
  `ID` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `code` INT(20) NOT NULL,
  `tedad` INT(20) NOT NULL,
  `student_course_id` INT(20) NOT NULL,
  `teacher_course_id` INT(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `student_course_id_UNIQUE` (`student_course_id` ASC) VISIBLE,
  UNIQUE INDEX `teacher_course_id_UNIQUE` (`teacher_course_id` ASC) VISIBLE);


ALTER TABLE `colege`.`course` 
ADD CONSTRAINT `course_teacher course id`
  FOREIGN KEY (`ID`)
  REFERENCES `colege`.`teacher_course` (`course_id`) ;


ALTER TABLE `colege`.`teacher_course` 
ADD CONSTRAINT `tc_course`
  FOREIGN KEY (`ID`)
  REFERENCES `colege`.`course` (`teacher_course_id`) ;



CREATE TABLE `colege`.`student_course` (
  `ID` INT(20) NOT NULL AUTO_INCREMENT,
  `name_student` VARCHAR(45) NOT NULL,
  `shomare_student` INT(20) NOT NULL,
  `courrse_id` INT(20) NOT NULL,
  `student id` INT(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `courrse_id_UNIQUE` (`courrse_id` ASC) VISIBLE,
  UNIQUE INDEX `student id_UNIQUE` (`student id` ASC) VISIBLE);


ALTER TABLE `colege`.`course` 
ADD CONSTRAINT `course_stucr`
  FOREIGN KEY (`ID`)
  REFERENCES `colege`.`student_course` (`student id`) ;


ALTER TABLE `colege`.`student_course` 
ADD CONSTRAINT `stcr_student`
  FOREIGN KEY (`ID`)
  REFERENCES `colege`.`student` (`student_course_id`);



ALTER TABLE `colege`.`student` 
ADD CONSTRAINT `student_stcr`
  FOREIGN KEY (`ID`)
  REFERENCES `colege`.`student_course` (`student id`) ;
select * from major;

insert into course (`name`,`code`,`tedad`,`student_course_id`,`teacher_course_id`) values ('ali',15264,414,260,215);

delete  from person where name='tt';

update person set name='ali' where name='abas';
SET SQL_SAFE_UPDATES = 0;
