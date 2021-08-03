CREATE DATABASE SQL_ExtraAssignment_1_2;
USE SQL_ExtraAssignment_1_2;

-- ---- Exercise 1 ---- --
-- ---- QUESTION 1 ---- --
CREATE TABLE Trainee (
	trainne_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name		VARCHAR(50) NOT NULL,
    birth_date		DATE NOT NULL,
    gender			ENUM('male', 'female', 'unknow'),
    ET_IQ			TINYINT UNSIGNED NOT NULL CHECK (ET_IQ <= 20),
    ET_Gmath		TINYINT UNSIGNED NOT NULL CHECK (ET_Gmath <= 20),
    ET_English		TINYINT UNSIGNED NOT NULL CHECK (ET_English <= 50),
    training_class	VARCHAR(10) NOT NULL,
    evaluation_note	NVARCHAR(500) NOT NULL 
);

-- ---- QUESTION 2 ---- --
ALTER TABLE Trainee ADD COLUMN VTI_Account VARCHAR(15) NOT NULL UNIQUE KEY;

-- ---- Exercise 2 ---- --
CREATE TABLE Exercise_2 (
	id		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`	VARCHAR(20) NOT  NULL,
    code	CHAR(5) NOT NULL,
    modified_date DATETIME DEFAULT NOW()    
);
    
-- ---- Exercise 3 ---- --
CREATE TABLE Exercise_3(
	id 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`			VARCHAR(20) NOT NULL,
    birth_date		DATE NOT NULL,
    gender			ENUM('0','1','Null'),
    is_deletedFlag	ENUM('0','1') 
);