CREATE DATABASE merrimack_school_db;

CREATE SCHEMA  academic;

CREATE TABLE IF NOT EXISTS academic.students(
student_id SERIAL PRIMARY KEY,
first_name VARCHAR (50),
last_name VARCHAR (50),
date_of_birth DATE,
gender VARCHAR (20));

CREATE TABLE IF NOT EXISTS academic.teachers(
teacher_id SERIAL PRIMARY KEY,
first_name VARCHAR (50),
last_name VARCHAR (50),
subject VARCHAR);

CREATE TABLE IF NOT EXISTS academic.courses(
course_id SERIAL PRIMARY KEY,
course_name VARCHAR (50),
teacher_id SERIAL REFERENCES academic.teachers(teacher_id));

CREATE TABLE IF NOT EXISTS academic.enrollments(
enrollment_id SERIAL PRIMARY KEY,
student_id SERIAL REFERENCES academic.students(student_id),
course_id SERIAL REFERENCES academic.courses(course_id));



CREATE SCHEMA admnistration;

CREATE TABLE IF NOT EXISTS admnistration.departments(
dept_id SERIAL PRIMARY KEY,
dept_name VARCHAR (50),
head_teacher_id SERIAL REFERENCES academic.teachers(teacher_id));

INSERT INTO academic.students(
first_name, last_name, date_of_birth, gender)
VALUES 
('Collins', 'Njagi', '28 JAN 95', 'M'),
('Ednah', 'Mwango', '25 MAY 99', 'F'),
('Sylvia', 'Rentas', '18 DEC 03', 'F'),
('Nesh', 'Denno', '17 AUG 97', 'M'),
('Vicky', 'Kaimuri', '09 MAR 89', 'F');
SELECT * FROM academic.students;

INSERT INTO academic.teachers(first_name, last_name,subject)
VALUES 
('Prof Keith', 'Bush', 'Machine Learning'),
('Dr Peter', 'Mwirigi', 'SQL'),
('Prof Val', 'Kerubo', 'Tableau');
SELECT * FROM academic.teachers;

INSERT INTO academic.courses(course_name,
teacher_id)
VALUES
('Data Science', 2),
('Data Analysis', 1),
('Bio Informatics', 3);
SELECT * FROM academic.courses;

INSERT INTO academic.enrollments(student_id, course_id)
VALUES 
(1, 2),
(2, 1),
(3, 3);
SELECT * FROM academic.enrollments;

INSERT INTO admnistration.departments(dept_name, head_teacher_id)
VALUES 
('Computational Sciences', 3),
('Engineering', 1);
SELECT * FROM admnistration.departments;
