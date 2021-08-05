DROP DATABASE IF EXISTS SQL_ExtraAssignment_4;
CREATE DATABASE SQL_ExtraAssignment_4;
USE SQL_ExtraAssignment_4;

-- ---- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
-- create table: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	department_number	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name		VARCHAR(60) NOT NULL UNIQUE KEY
);

-- create table: Employee_Table
DROP TABLE IF EXISTS Employee_Table;
CREATE TABLE Employee_Table (
	employee_number		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_name		VARCHAR(20) NOT NULL,
    department_number	TINYINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (department_number) REFERENCES Department (department_number)
);

-- create table: Employee_Skill_Table
DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table (
	employee_number		TINYINT UNSIGNED AUTO_INCREMENT ,
    skill_code			VARCHAR(50) NOT NULL,
    date_registered		DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (employee_number) REFERENCES Employee_Table (employee_number)
);

-- ---- Question 2: Thêm ít nhất 10 bản ghi vào table


-- ---- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT 		ET.employee_name, EST.skill_code
FROM 		Employee_Table ET
RIGHT JOIN 	Employee_Skill_Table EST ON ET.employee_number = EST.employee_number
WHERE		EST.skill_code = 'Java';

-- ---- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có > 3 nhân viên
SELECT 	D.department_name, COUNT(ET.department_number) AS SO_LUONG
FROM	Employee_Table ET
JOIN	Department	D ON D.department_number = ET.department_number
GROUP BY D.department_name
HAVING COUNT(ET.department_number) > 2;

-- ---- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban. 
SELECT 		ET.employee_name, D.department_name
FROM		Employee_Table ET
JOIN		Department	D ON D.department_number = ET.department_number
ORDER BY 	D.department_name ASC;
 
-- ---- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT 		ET.employee_number,ET.employee_name, COUNT(EST.employee_number) AS SO_LUONG_SKILL
FROM		Employee_Table ET 
JOIN		Employee_Skill_Table EST ON ET.employee_number = EST.employee_number
GROUP BY	ET.employee_number
HAVING 		COUNT(EST.employee_number) > 1;

