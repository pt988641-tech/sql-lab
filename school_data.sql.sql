
USE school_db;
DELETE FROM marks;
DELETE FROM students;
DELETE FROM subjects;
-- 1. Insert 8 students using one INSERT
INSERT INTO students (roll_no, name, class, city, email)
VALUES
(1, 'Aarav Sharma', '9A', 'Mumbai', 'aarav@gmail.com'),
(2, 'Priya Patel', '9A', 'Ahmedabad', 'priya@gmail.com'),
(3, 'Rohan Verma', '9A', 'Delhi', 'rohan@gmail.com'),
(4, 'Ananya Singh', '9A', 'Jaipur', 'ananya@gmail.com'),
(5, 'Kabir Mehta', '9B', 'Surat', 'kabir@gmail.com'),
(6, 'Ishita Rao', '9B', 'Pune', 'ishita@gmail.com'),
(7, 'Dev Kumar', '9B', 'Lucknow', 'dev@gmail.com'),
(8, 'Meera Joshi', '9B', 'Indore', 'meera@gmail.com');

-- Show students
SELECT * FROM students;

-- Insert 5 subjects using one INSERT
INSERT INTO subjects (subject_id, subject_name, max_marks)
VALUES
(1, 'Maths', 100),
(2, 'Science', 100),
(3, 'English', 100),
(4, 'Hindi', 100),
(5, 'Social Science', 100);

-- Show subjects
SELECT * FROM subjects;

-- 2. Insert 20 marks records (students 1 to 5, subjects 1 to 4)
INSERT INTO marks (roll_no, subject_id, marks_obtained)
VALUES
(1, 1, 85),
(1, 2, 78),
(1, 3, 92),
(1, 4, 88),
(2, 1, 76),
(2, 2, 89),
(2, 3, 81),
(2, 4, 90),
(3, 1, 95),
(3, 2, 87),
(3, 3, 79),
(3, 4, 84),
(4, 1, 68),
(4, 2, 75),
(4, 3, 91),
(4, 4, 82),
(5, 1, 88),
(5, 2, 93),
(5, 3, 86),
(5, 4, 77);

SELECT * FROM marks;

-- 3. Promote all students of 9A to 10A
UPDATE students
SET class = '10A'
WHERE class = '9A';

SELECT * FROM students;

-- Correct one student's city
UPDATE students
SET city = 'Bhopal'
WHERE roll_no = 8;

SELECT * FROM students WHERE roll_no = 8;

-- Add 5 grace marks to one marks row
UPDATE marks
SET marks_obtained = marks_obtained + 5
WHERE marks_id = 1;

SELECT * FROM marks WHERE marks_id = 1;

-- 4. Show first five marks rows before duplicate
SELECT * FROM marks LIMIT 5;

-- Add one duplicate marks row intentionally
INSERT INTO marks (roll_no, subject_id, marks_obtained)
VALUES (1, 1, 85);

-- Remove one duplicate row
DELETE FROM marks
WHERE roll_no = 1
AND subject_id = 1
AND marks_obtained = 85
LIMIT 1;

-- Show first five marks rows after duplicate removal
SELECT * FROM marks LIMIT 5;

-- Show marks before deleting student 5
SELECT * FROM marks LIMIT 5;

-- Delete student's marks first
DELETE FROM marks
WHERE roll_no = 5;

-- Delete student 5
DELETE FROM students
WHERE roll_no = 5;

-- Show first five marks rows after deletion
SELECT * FROM marks LIMIT 5;

-- Show remaining students
SELECT * FROM students;
