
USE school_db;

-- 1. Students of class 10A sorted by name
SELECT roll_no, name AS student_name, class
FROM students
WHERE class = '10A'
ORDER BY name ASC;

-- Marks of 80 or more, highest first
SELECT marks_id, roll_no, subject_id,
       marks_obtained AS obtained_marks
FROM marks
WHERE marks_obtained >= 80
ORDER BY marks_obtained DESC;

-- Three highest marks
SELECT roll_no, marks_obtained
FROM marks
ORDER BY marks_obtained DESC
LIMIT 3;

-- All student names with alias
SELECT name AS student_name
FROM students;

-- 2. SUM, AVG and COUNT
SELECT SUM(marks_obtained) AS total_marks
FROM marks
WHERE roll_no = 1;

SELECT ROUND(AVG(marks_obtained), 2) AS average_marks
FROM marks
WHERE subject_id = 1;

SELECT COUNT(*) AS total_students
FROM students
WHERE class = '10A';

-- 3. GROUP BY queries
SELECT subject_id,
       ROUND(AVG(marks_obtained), 2) AS average_marks
FROM marks
GROUP BY subject_id;

SELECT roll_no,
       SUM(marks_obtained) AS total_marks
FROM marks
GROUP BY roll_no
ORDER BY total_marks DESC;

SELECT subject_id,
       COUNT(*) AS total_records
FROM marks
GROUP BY subject_id;

-- 4. Topper query
SELECT roll_no,
       SUM(marks_obtained) AS total
FROM marks
GROUP BY roll_no
ORDER BY total DESC
LIMIT 1;
