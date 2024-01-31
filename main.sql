-- Activity 1

CREATE TABLE students (id integer PRIMARY KEY,
																								first_name character varying(255) NOT NULL,
																								middle_name character varying(255),
																								last_name character varying(255) NOT NULL,
																								age integer, location text);


INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (1,
									'Juan',
									'Blank',
									'Cruz',
									18,
									'Manila');


INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (2,
									'Anne',
									'Blank',
									'Wall',
									20,
									'Manila');


INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (3,
									'Theresa',
									'Blank',
									'Joseph',
									21,
									'Manila');


INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (4,
									'Isaac',
									'Blank',
									'Gray',
									19,
									'Laguna');


INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (5,
									'Zack',
									'Blank',
									'Matthews',
									22,
									'Marikina');


INSERT INTO students (id, first_name, middle_name,last_name, age, location)
VALUES (6,
									'Finn',
									'Blank',
									'Larn',
									25,
									'Manila');


UPDATE students
SET first_name = 'Ivan',
	middle_name = 'Ingram',
	last_name = 'Howard',
	age = 25,
	location = 'Bulacan'
WHERE id = 1;


SELECT *
FROM students;


DELETE
FROM students
WHERE id = 6;

-- ACTIVITY 2
-- use your previous table students   --ok
-- display the count of all students   --ok
-- select all students with location is manila  -- ok
-- display the average age of all students --ok
-- display all the students by age in descending order --ok

SELECT *
FROM students;


SELECT COUNT(id) AS "Number Of Students"
FROM students;


SELECT *
FROM students
WHERE location = 'Manila';


SELECT ROUND(AVG(age), 2) AS "Students Average Age"
FROM students;


SELECT age,
	first_name,
	middle_name,
	last_name,
	location,
	id
FROM students
GROUP BY students.id
ORDER BY age DESC;

-- JOIN ACTIVITY / ACTIVITY 3
-- Use your previous table students (use the same main.sql file)

SELECT *
FROM students;

-- grade - grades can be "A", "B", "C", "D", "E", "F", or NULL

CREATE TYPE grades_enum AS ENUM ('A', 'B', 'C', 'D', 'E', 'F', 'NULL');

-- Create new table research_papers with the following columns
-- id - primary key
-- student_id - foreign key

CREATE TABLE research_papers (research_paper_id integer PRIMARY KEY,
																															student_id integer NOT NULL,
																															grade grades_enum,
																														FOREIGN KEY (student_id) REFERENCES students(id))
SELECT *
FROM research_papers;

-- Insert 10 records to the new table
-- 2 students should have more than 1 research paper
-- 2 students should have 1 ungraded (NULL) research paper

INSERT INTO research_papers (research_paper_id, student_id, grade)
VALUES (1,
									1,
									'A'), (2,
																	1,
																	'B'), (3,
																									2,
																									NULL), (4,
																																		2,
																																		'C'), (5,
																																										3,
																																										NULL), (6,
																																																			4,
																																																			'F'), (7,
																																																											2,
																																																											'B'), (8,
																																																																			1,
																																																																			'A'), (9,
																																																																											4,
																																																																											'D'), (10,
																																																																																			5,
																																																																																			'D');

-- Query all students with multiple research papers (select first_name, last_name, and number_of_research_papers only)

SELECT students.first_name,
	students.last_name,
	count(research_papers.student_id) as number_of_research_papers
FROM students
INNER JOIN research_papers ON students.id = research_papers.student_id
GROUP BY students.id
HAVING count(research_papers.student_id) > 1;

-- Query all students with ungraded research papers (select first_name, last_name, research_paper_id, and grade only)

SELECT students.first_name,
	students.last_name,
	research_papers.research_paper_id,
	research_papers.grade
FROM students
INNER JOIN research_papers ON students.id = research_papers.student_id
GROUP BY students.id,
	research_papers.research_paper_id
HAVING research_papers.grade IS NULL;