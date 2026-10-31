
-- Start from scratch
DROP DATABASE IF EXISTS school_db;

-- Create database
CREATE DATABASE IF NOT EXISTS school_db;

-- Select database
USE school_db;

-- Create students table
CREATE TABLE students (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    class VARCHAR(10),
    city VARCHAR(30)
);

DESCRIBE students;

-- Create subjects table
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(40) NOT NULL,
    max_marks INT
);

-- Create marks table
CREATE TABLE marks (
    marks_id INT PRIMARY KEY AUTO_INCREMENT,
    roll_no INT,
    subject_id INT,
    marks_obtained INT
);

-- Add email column
ALTER TABLE students
ADD COLUMN email VARCHAR(60);

DESCRIBE students;

-- Widen city column
ALTER TABLE students
MODIFY COLUMN city VARCHAR(50);

DESCRIBE students;

-- Create and drop temporary table
CREATE TABLE temp_notes (
    note_id INT,
    note VARCHAR(100)
);

DROP TABLE temp_notes;

-- Show final tables
SHOW TABLES;
