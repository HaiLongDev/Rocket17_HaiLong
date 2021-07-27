CREATE TABLE SQL_Assignment1;
USE SQL_Assignment1;

CREATE TABLE Department (
	department_id 	INT AUTO_INCREMENT,
    department_name	VARCHAR(50)
);

CREATE TABLE Position (
	position_id		INT AUTO_INCREMENT,
    position_name	VARCHAR(50)
);

CREATE TABLE User_account (
	account_id 		INT AUTO_INCREMENT,
    email 			VARCHAR(50),
    username 		VARCHAR(50),
    full_name 		VARCHAR(50),
    department_id 	INT,
    position_id		INT,
    create_date 	DATE
);

CREATE TABLE `Group` (
	group_id 		INT AUTO_INCREMENT,
    group_name		VARCHAR(50),
    creator_id		INT,
    create_date		DATE
);

CREATE TABLE GroupAcount(
	group_id 	INT,
    account_id 	INT,
    join_date 	DATE
);
CREATE TABLE TypeQuestion(
	type_id 	INT,
    type_name 	NVARCHAR(50)
);	
CREATE TABLE CategoryQuestion(
	catogory_id 	INT,
    catogory_name 	NVARCHAR(50)
);
CREATE	TABLE Question(
	question_id 	INT,
    content 		NVARCHAR(50),
    category_id 	INT,
    type_id 		INT,
    creator_id 		INT,
    create_date 	DATE
);
CREATE TABLE Answer(
	answer_id 	INT,
    content 	NVARCHAR(50),
    question_id INT,
    isCorrect 	BIT
);
CREATE TABLE Exam(
	exam_id 	INT,
		code 		INT,
    tilte 		NVARCHAR(10),
    category_id INT,
    duration 	TIME,
    create_date DATE
);

CREATE TABLE Question(
	exam_id 	INT,
    question_id INT
);
    
    
    
