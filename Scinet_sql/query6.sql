SELECT
	Owners.owner_name AS owner_name,
    Pets.pet_name AS pet_name,
    Visits.visit_date AS data,
    Visits.reason AS reason,
    Vets.vet_name As vet_name
FROM
	Owners 
LEFT JOIN
	Pets ON Owners.owner_id = Pets.owner_id
LEFT JOIN
	Visits ON Pets.pet_id = Visits.pet_id
LEFT JOIN
	Vets ON Vets.vet_id = Visits.vet_id
;



SELECT
	p1.pet_name AS first_pet,
    p2.pet_name AS second_pet,
    p1.owner_id as owner_id
FROM
	Pets p1
INNER JOIN
	Pets p2 ON p1.owner_id = p2.owner_id AND p1.pet_id < p2.pet_id
;
    
    
    
    
##################################Assignment######################################

SELECT
	c.name AS Course,
	CONCAT(i.first_name, ' ', i.last_name) AS Instructor
FROM 
	Courses AS c
JOIN
    Instructors AS i
    ON c.instructor_id = i.uid    
;

SELECT
	c.name AS Course,
	CONCAT(i.first_name, ' ', i.last_name) AS Instructor
FROM 
	Courses AS c
LEFT JOIN
    Instructors AS i
    ON c.instructor_id = i.uid    
;

SELECT
	c.name AS Course,
	CONCAT(i.first_name, ' ', i.last_name) AS Instructor
FROM 
	Courses AS c
RIGHT JOIN
    Instructors AS i
    ON c.instructor_id = i.uid    
;

SELECT
	c.name AS Course,
	CONCAT(i.first_name, ' ', i.last_name) AS Instructor
FROM 
	Courses AS c
LEFT JOIN
    Instructors AS i
    ON c.instructor_id = i.uid    
UNION
SELECT
	c.name AS Course,
	CONCAT(i.first_name, ' ', i.last_name) AS Instructor
FROM 
	Courses AS c
RIGHT JOIN
    Instructors AS i
    ON c.instructor_id = i.uid    
;


SELECT
	CONCAT(i1.first_name, ' ', i1.last_name) AS Instructor,
    CONCAT(i2.first_name, ' ', i2.last_name) AS Manager
FROM 
	Instructors AS i1
LEFT JOIN
    Instructors AS i2
    ON i1.uid = i2.uid
;


SELECT
	CONCAT(s.first_name, ' ', s.last_name) AS Student,
    c.name AS Course
FROM 
	Students as s
LEFT JOIN
	Enrollments as e ON s.uid = e.student_id
LEFT JOIN    
    Courses as c ON e.course_id = c.uid
Order by Student
;

SELECT
	CONCAT(s.first_name, ' ', s.last_name) AS Student,
    COUNT(c.name) AS Course
FROM 
	Students as s
RIGHT JOIN
	Enrollments as e ON s.uid = e.student_id
LEFT JOIN    
    Courses as c ON e.course_id = c.uid
GROUP BY Student
ORDER BY Student
;

SELECT
	CONCAT(s.first_name, ' ', s.last_name) AS Student
FROM 
	Students as s
WHERE s.uid NOT IN 
	(SELECT DISTINCT e.student_id FROM Enrollments e)
ORDER BY Student
;


SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS student,
    COUNT(e.course_id) AS course_count
FROM Students s
LEFT JOIN Enrollments e
ON s.uid = e.student_id
GROUP BY student
HAVING course_count = 0
ORDER BY student;