------- Create Database
CREATE DATABASE StudentManagement;
USE StudentManagement;
---------  Create Students Table
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15)
);
INSERT INTO Students VALUES
(1,'Rahul','rahul@gmail.com','9876543210'),
(2,'Priya','priya@gmail.com','9876543211'),
(3,'Kiran','kiran@gmail.com','9876543212');
--- Create Courses Table
CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Duration VARCHAR(20)
);
INSERT INTO Courses VALUES
(101,'SQL','2 Months'),
(102,'Python','3 Months'),
(103,'Data Science','6 Months');

------- Create Enrollments Table
CREATE TABLE Enrollments (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    FOREIGN KEY(Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY(Course_ID) REFERENCES Courses(Course_ID)
);
INSERT INTO Enrollments VALUES
(1,1,101),
(2,2,102),
(3,3,103);

------- Create Marks Table
CREATE TABLE Marks (
    Mark_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Marks INT,
    FOREIGN KEY(Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY(Course_ID) REFERENCES Courses(Course_ID)
);
INSERT INTO Marks VALUES
(1,1,101,85),
(2,2,102,90),
(3,3,103,88);
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT AVG(Marks) FROM Marks;

--- Join tables:

SELECT s.Name, c.Course_Name, m.Marks
FROM Students s
JOIN Enrollments e ON s.Student_ID=e.Student_ID
JOIN Courses c ON e.Course_ID=c.Course_ID
JOIN Marks m ON s.Student_ID=m.Student_ID;

--------- Create a View
CREATE VIEW Student_Report AS
SELECT s.Name, c.Course_Name, m.Marks
FROM Students s
JOIN Enrollments e ON s.Student_ID=e.Student_ID
JOIN Courses c ON e.Course_ID=c.Course_ID
JOIN Marks m ON s.Student_ID=m.Student_ID;