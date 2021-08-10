-- create database
DROP DATABASE IF EXISTS SQL_Assignment1;
CREATE DATABASE SQL_Assignment1;
USE SQL_Assignment1;

-- create table: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	department_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name	NVARCHAR(50) NOT NULL UNIQUE KEY 
);

-- create table: Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
	position_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name	ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE KEY
);

-- create table: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
	account_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email 			NVARCHAR(50) NOT NULL UNIQUE KEY,
    username 		NVARCHAR(50) NOT NULL,
    full_name 		NVARCHAR(50) NOT NULL,
    department_id 	TINYINT UNSIGNED NOT NULL,
    position_id		TINYINT UNSIGNED NOT NULL,
    create_date 	DATETIME DEFAULT NOW(),
    FOREIGN KEY (department_id) REFERENCES Department (department_id) ON UPDATE CASCADE,
    FOREIGN KEY (position_id) REFERENCES `Position` (position_id)
);

-- create table: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
	group_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name		NVARCHAR(50) NOT NULL UNIQUE KEY,
    creator_id		TINYINT UNSIGNED NOT NULL UNIQUE KEY,
    create_date		DATETIME DEFAULT NOW(),
    FOREIGN KEY (creator_id) REFERENCES `Account`(account_id)
    
);

-- create table: GroupAcount
DROP TABLE IF EXISTS GroupAcount;
CREATE TABLE GroupAcount(
	group_id 	TINYINT UNSIGNED ,
    account_id 	TINYINT UNSIGNED NOT NULL,
    join_date 	DATE,
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `Group` (group_id),
    FOREIGN KEY (account_id) REFERENCES `Account` (account_id)
);

-- create table: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
	type_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name 	ENUM('Essay', 'Multiple-Choice') UNIQUE KEY
);	

-- create table: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
	category_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name 	NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table: Question
DROP TABLE IF EXISTS Question;
CREATE	TABLE Question (
	question_id 	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content 		NVARCHAR(100) NOT NULL,
    category_id 	TINYINT UNSIGNED NOT NULL,
    type_id 		TINYINT UNSIGNED NOT NULL,
    creator_id 		TINYINT UNSIGNED NOT NULL,
    create_date 	DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id)
        REFERENCES CategoryQuestion (category_id),
    FOREIGN KEY (type_id)
        REFERENCES TypeQuestion (type_id),
	FOREIGN KEY (creator_id) 
		REFERENCES `Account`(account_id)
);

-- create table: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    answer_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content 		NVARCHAR(100) NOT NULL,
    question_id 	INT UNSIGNED NOT NULL,
    isCorrect 		BIT  DEFAULT 0,
    FOREIGN KEY (question_id)
        REFERENCES Question(question_id)
);

-- create table: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	exam_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `code` 			CHAR(10) NOT NULL,
    tilte 			NVARCHAR(50) NOT NULL,
    category_id 	TINYINT UNSIGNED NOT NULL,
    duration 		TINYINT UNSIGNED NOT NULL,
    creator_id 		TINYINT UNSIGNED NOT NULL,
    create_date 	DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id)
        REFERENCES CategoryQuestion (category_id),
	FOREIGN KEY (creator_id) 
		REFERENCES `Account`(account_id)
);

-- create table: Question
DROP TABLE IF EXISTS Exam_Question;
CREATE TABLE Exam_Question(
    exam_id 		TINYINT UNSIGNED NOT NULL,
    question_id 	INT UNSIGNED NOT NULL,
    FOREIGN KEY (question_id)
        REFERENCES Question(question_id),
    FOREIGN KEY (exam_id)
        REFERENCES Exam(exam_id)
);

