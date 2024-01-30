-- Activity 1

CREATE TABLE students (
    id integer PRIMARY KEY,
    first_name character varying(255) NOT NULL,
    middle_name character varying(255),
    last_name character varying(255) NOT NULL,
    age integer,
    location text
);

INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (1, 'Juan', 'Blank', 'Cruz', 18, 'Manila');

INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (2, 'Anne', 'Blank', 'Wall', 20, 'Manila');

INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (3, 'Theresa', 'Blank', 'Joseph', 21, 'Manila');

INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (4, 'Isaac', 'Blank', 'Gray', 19, 'Laguna');

INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (5, 'Zack', 'Blank', 'Matthews', 22, 'Marikina');

INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (6, 'Finn', 'Blank', 'Larn', 25, 'Manila');

UPDATE students
SET first_name = 'Ivan', 
	middle_name = 'Ingram',
	last_name = 'Howard',
	age = 25,
	location = 'Bulacan'
WHERE id = 1;

SELECT * FROM students;

DELETE FROM students
WHERE id = 6;

-- Activity 2
-- use your previous table students   --ok
-- display the count of all students   --ok
-- select all students with location is manila  -- ok
-- display the average age of all students --ok
-- display all the students by age in descending order

SELECT * FROM students;
SELECT  COUNT(id) AS "Number Of Students" FROM students;
SELECT * FROM students 
	WHERE location = 'Manila';
SELECT ROUND(AVG(age), 2) AS "Students Average Age" FROM students;
SELECT age, first_name, middle_name, last_name, location, id FROM students
	GROUP BY students.id
	ORDER BY age DESC;