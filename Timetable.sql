DROP DATABASE IF EXISTS Timetable;

CREATE DATABASE Timetable;

USE Timetable;


CREATE TABLE Discipline
(
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE Teacher
(
    id INT AUTO_INCREMENT,
    PIB VARCHAR(32),
    PRIMARY KEY (id)
);

CREATE TABLE Day
(
    id INT AUTO_INCREMENT,
    name VARCHAR(15),
    PRIMARY KEY (id)
);

CREATE TABLE Reading
(
    id INT AUTO_INCREMENT,
    id_group INT NOT NULL,
    id_teacher INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Groups
(
    id INT AUTO_INCREMENT,
    name VARCHAR(30),
    cipher VARCHAR(15),
    course VARCHAR(10),
    PRIMARY KEY(id)
);

CREATE TABLE Timetable
(
    id INT AUTO_INCREMENT,
    id_reading INT,
    id_day INT,
    PRIMARY KEY (id)
);

ALTER TABLE Reading   ADD FOREIGN KEY(id_group)   REFERENCES Groups(id);
ALTER TABLE Reading   ADD FOREIGN KEY(id_teacher) REFERENCES Teacher(id);
ALTER TABLE Timetable ADD FOREIGN KEY(id_reading) REFERENCES Reading(id);
ALTER TABLE Timetable ADD FOREIGN KEY(id_day)     REFERENCES Day(id);



INSERT INTO `Day` (`name`) VALUES
('Понеділок');
INSERT INTO `Groups` (`name`,`cipher`,`course`) VALUES
('','','');
INSERT INTO `Discipline` (`name`) VALUES
('Бази даних');
INSERT INTO `reading` (`id_group`,`id_teacher`) VALUES
('','');
INSERT INTO `Teacher` (`PIB`) VALUES
('Якубовська Л.Б.');
INSERT INTO `Timetable` (`id_reading`,`id_day`) VALUES
('','');