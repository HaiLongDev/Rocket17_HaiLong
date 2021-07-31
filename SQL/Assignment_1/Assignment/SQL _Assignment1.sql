-- create database
DROP DATABASE IF EXISTS SQL_Assignment1;
CREATE DATABASE SQL_Assignment1;
USE SQL_Assignment1;

-- create table: Department
CREATE TABLE Department (
	department_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name	NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table: Position
CREATE TABLE `Position` (
	position_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name	ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE KEY
);

-- create table: Account

CREATE TABLE `Account` (
	account_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email 			NVARCHAR(50) NOT NULL UNIQUE KEY,
    username 		NVARCHAR(50) NOT NULL,
    full_name 		NVARCHAR(50) NOT NULL,
    department_id 	TINYINT UNSIGNED NOT NULL,
    position_id		TINYINT UNSIGNED NOT NULL,
    create_date 	DATETIME DEFAULT NOW(),
    FOREIGN KEY (department_id) REFERENCES Department (department_id),
    FOREIGN KEY (position_id) REFERENCES `Position` (position_id)
);

-- create table: Group
CREATE TABLE `Group` (
	group_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name		NVARCHAR(50) NOT NULL UNIQUE KEY,
    creator_id		TINYINT UNSIGNED NOT NULL UNIQUE KEY,
    create_date		DATETIME DEFAULT NOW(),
    FOREIGN KEY (creator_id) REFERENCES `Account`(account_id)
    
);

-- create table: GroupAcount
CREATE TABLE GroupAcount(
	group_id 	TINYINT UNSIGNED ,
    account_id 	TINYINT UNSIGNED NOT NULL,
    join_date 	DATE,
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `Group` (group_id),
    FOREIGN KEY (account_id) REFERENCES `Account` (account_id)
);

-- create table: TypeQuestion
CREATE TABLE TypeQuestion(
	type_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name 	ENUM('Essay', 'Multiple-Choice') UNIQUE KEY
);	

-- create table: CategoryQuestion
CREATE TABLE CategoryQuestion(
	category_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name 	NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table: Question
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
CREATE TABLE Answer(
    answer_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content 		NVARCHAR(100) NOT NULL,
    question_id 	INT UNSIGNED NOT NULL,
    isCorrect 		BIT  DEFAULT 0,
    FOREIGN KEY (question_id)
        REFERENCES Question(question_id)
);

-- create table: Exam
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
CREATE TABLE Exam_Question(
    exam_id 		TINYINT UNSIGNED NOT NULL,
    question_id 	INT UNSIGNED NOT NULL,
    FOREIGN KEY (question_id)
        REFERENCES Question (question_id),
    FOREIGN KEY (exam_id)
        REFERENCES Exam (exam_id),
        PRIMARY KEY (exam_id,question_id)
);

