CREATE DATABASE SScase_IT;
use SScase_IT;
CREATE TABLE students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Marks INT,
    Age INT,
    City VARCHAR(50),
    Admission_Date DATE,
    Fee DECIMAL(10,2)
);
INSERT INTO students VALUES
(1, 'Ali Khan', 'Computer Science', 85, 21, 'Lahore', '2022-09-01', 55000),
(2, 'Sara Ahmed', 'Mathematics', 76, 19, 'Karachi', '2021-08-15', 48000),
(3, 'Bilal Iqbal', 'Physics', 64, 22, 'Islamabad', '2023-01-10', 50000),
(4, 'Ayesha Noor', 'Computer Science', 59, 17, 'Lahore', '2020-07-05', 45000),
(5, 'Usman Raza', 'Chemistry', 92, 24, 'Faisalabad', '2021-12-20', 60000),
(6, 'Fatima Zahra', 'Mathematics', 40, 18, 'Multan', '2023-03-01', 30000);
select * from students
WHERE Department = 'Computer Science';
select * from students
WHERE city <> 'Karachi';
select * from students
WHERE Marks > 70;
select * from students
WHERE Age > 18;
select * from students
WHERE Fee >= 50000;
select * from students
WHERE Marks <= 60;
select * from students
WHERE Age between 18 and 20;
select * from students
WHERE Name LIKE 'C%';
select * from students
WHERE Department IN ('Computer Science','Mathematics','Physics');
select * from students
WHERE Department = 'Computer Science'
AND Marks > 60;
select * from students
WHERE city = 'Karachi'
OR city = 'Lahore';
select * from students
WHERE (Department= 'Computer Science' or Department = 'Mathematics')
and Marks >= 75;
select * from students
WHERE not City = 'Islamabad';
select * from students
WHERE Department NOT IN ('Physics');