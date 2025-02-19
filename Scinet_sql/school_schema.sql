USE coss24;

DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Assignments;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Instructors;

CREATE TABLE Instructors (
    uid INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Instructors(uid)
);

CREATE TABLE Students (
    uid INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    advisor_id INT,
    FOREIGN KEY (advisor_id) REFERENCES Instructors(uid)
);

CREATE TABLE Courses (
    uid INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(uid)
);

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(uid),
    FOREIGN KEY (course_id) REFERENCES Courses(uid)
);

CREATE TABLE Assignments (
	uid int PRIMARY KEY,
    course_id INT NOT NULL,
    max_grade INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(uid)
);

CREATE TABLE Grades (
    student_id INT NOT NULL,
    assignment_id INT NOT NULL,
    grade INT,
    PRIMARY KEY (student_id, assignment_id)
);

INSERT INTO Instructors (uid, first_name, last_name, email, manager_id) VALUES 
(1, 'Dr. Adam', 'Lee', 'adam.lee@example.com', NULL),
(2, 'Dr. Beth', 'Kim', 'beth.kim@example.com', 1),
(3, 'Dr. Carl', 'Nguyen', 'carl.nguyen@example.com', 1),
(4, 'Dr. Diana', 'Perez', 'diana.perez@example.com', 2);

INSERT INTO Students (uid, first_name, last_name, email, advisor_id) VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', null),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 2),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 3),
(4, 'Bob', 'Brown', 'bob.brown@example.com', 2),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', null),
(6, 'Dave', 'Miller', 'dave.miller@example.com', 2),
(7, 'Eve', 'Wilson', 'eve.wilson@example.com', 3),
(8, 'Frank', 'Moore', 'frank.moore@example.com', 4),
(9, 'Grace', 'Taylor', 'grace.taylor@example.com', null),
(10, 'Hank', 'Anderson', 'hank.anderson@example.com', 2),
(11, 'Phill', 'Phillerson', 'phil.phillerson@example.com', null);

INSERT INTO Courses (uid, name, date, instructor_id) VALUES 
(1, 'Math 101', '2024-01-15', 1),
(2, 'History 201', '2024-02-20', 2),
(3, 'Science 301', '2024-03-10', null),
(4, 'Art 401', '2024-04-25', 4),
(5, 'Music 501', '2024-05-30', 1),
(6, 'Math 205', '2024-05-30', null);

INSERT INTO Enrollments (student_id, course_id) VALUES
(1, 1), (1, 3), (2, 2), (2, 4), (2, 5), (3, 1),
(3, 3), (5, 1), (5, 2), (5, 4), (6, 1), (6, 3),
(6, 5), (7, 2), (8, 4), (8, 5), (9, 1), (10, 2),
(10, 3), (10, 5), (10, 1);

INSERT INTO Assignments (uid, course_id, max_grade) VALUES 
(1, 1, 100), (2, 1, 50), (3, 2, 75),
(4, 2, 80), (5, 3, 100), (6, 3, 60),
(7, 4, 90), (8, 4, 85), (9, 5, 100),
(10, 5, 70), (11, 1, 95), (12, 2, 65),
(13, 3, 80), (14, 4, 50), (15, 5, 75);

INSERT INTO Grades (student_id, assignment_id, grade) VALUES
(1, 1, 94), (1, 2, 0), (1, 5, 31), (1, 6, 2), (1, 11, 80),
(1, 13, 75), (2, 3, 34), (2, 4, 44), (2, 7, 7), (2, 8, 71),
(2, 9, 58), (2, 10, 62), (2, 12, 53), (2, 14, 48), (2, 15, 30),
(3, 1, 72), (3, 2, 44), (3, 5, 19), (3, 6, 17), (3, 11, 18),
(3, 13, 63), (5, 1, 78), (5, 2, 18), (5, 3, 62), (5, 4, 51),
(5, 7, 86), (5, 8, 46), (5, 11, 42), (5, 12, 3), (5, 14, 2),
(6, 1, 73), (6, 2, 9), (6, 5, 4), (6, 6, 20), (6, 9, 18),
(6, 10, 44), (6, 11, 59), (6, 13, 10), (6, 15, 6), (7, 3, 57),
(7, 4, 43), (7, 12, 49), (8, 7, 48), (8, 8, 21), (8, 9, 16),
(8, 10, 36), (8, 14, 15), (8, 15, 17), (9, 1, 31), (9, 2, 44),
(9, 11, 74), (10, 1, 39), (10, 2, 41), (10, 3, 28), (10, 4, 62),
(10, 5, 63), (10, 6, 49), (10, 9, 27), (10, 10, 47), (10, 11, 3),
(10, 12, 41), (10, 13, 21), (10, 15, 67);