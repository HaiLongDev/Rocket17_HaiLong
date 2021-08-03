USE SQL_Assignment1;

INSERT INTO Department(department_name) 
VALUES	(N'Marketing' ),
		(N'Sale' ),
		(N'Nhân viên' ),
		(N'Kỹ thuật' ),
		(N'Giám đốc' );
        
INSERT INTO Position (position_name ) 
VALUES	('Dev' ),
		('Test' ),
		('Scrum Master'),
		('PM' ); 
        
INSERT INTO `Account`(email , username, full_name , department_id , position_id, create_date)
VALUES		('HaiLong@gmail.com', 'LongVTI1', 'Hai Long', '1' , '1', '2021-06-29'),
			('MinhDuc@gmail.com', 'DucVTI2', 'Minh Duc', '2' , '2', '2021-07-29'),
			('BichNga@gmail.com', 'NgaVTI3', 'Bich Nga', '3' , '2', '2021-08-29'),
			('VietHung@gmail.com', 'HungVTI4', 'Viet Hung', '4' , '4', '2021-09-29'),
			('VuHai@gmail.com', 'HaiVTI5', 'Vu Hai', '5' , '3', '2020-10-28'),
            ('DuHuy@gmail.com', 'HuyVTI6', 'Duc Huy', '1' , '4', '2021-01-29'),
            ('AnhCham@gmail.com', 'ChamVTI7', 'Anh Cham', '2' , '3', '2021-03-23'),
            ('HoangDung@gmail.com', 'DungVTI8', 'Hoang Dung', '3' , '2', '2021-08-05'),
            ('KhacViet@gmail.com', 'VietVTI9', 'Khac Viet', '4' , '1', '2021-12-22'),
            ('TuanHung@gmail.com', 'HungVTI10', 'TuanHung', '5' , '4', '2021-3-29');
            
INSERT INTO `Group` ( group_name , creator_id , create_date)
VALUES	('Test', 1, '2020-07-28'),
		('Dev' , 2, '2021-07-28'),
		('HR' 	, 3, '2019-07-28'),
		('BRSE', 4, '2018-07-28'),
		('PM'	, 5, '2017-07-28');
 
INSERT INTO `GroupAcount` ( group_id , account_id , join_date )
VALUES	( 1 , 1,'2021-07-01'),
		( 2 , 2,'2021-06-29'),
		( 3 , 3,'2021-03-23'),
		( 4 , 4,'2021-01-02'),
		( 5 , 5,'2021-03-02');
        
INSERT INTO TypeQuestion (type_name ) 
VALUES	('Essay' ), 
		('Multiple-Choice' ); 
        
INSERT INTO CategoryQuestion (category_name )
VALUES	('Java'),
		('SQL'),
		('Android'),
		('C++'),
		('HTML');
        
INSERT INTO Question (content , category_id, type_id , creator_id, create_date )
VALUES	('What is Java?' , 1 , '2' , '1' ,'2021-06-28'),
		('Why Use Java?' , 1 , '2' , '1' ,'2021-05-28'),
		('What is OOP?' , 1 , '2' , '1' ,'2021-04-28'),
		('What are Classes and Objects?' , 1 , '2' , '1' ,'2021-03-28'),
		('What is SQL?' , 2 , '1 ', '2' ,'2021-03-22'),
        ('What Can SQL do?' , 2 , '1 ', '2' ,'2021-02-01'),
		('Android Question' ,3 , '2' , '3' ,'2021-02-20'),
		('C++ Question' , 4 , '2' , '4' ,'2021-12-22'),
		('HTML Question' , 5 , '1' , '5' ,'2021-11-11');
        
INSERT INTO Answer ( content , question_id , isCorrect )
VALUES	('Java is a popular programming language, created in 1995.' , 1 , 1),
		('It is one of the most popular programming language in the world' , 1 , 1),
		('OOP stands for Object-Oriented Programming' , 1 , 0),
		('A Class is like an object constructor, or a "blueprint" for creating objects.' , 1 , 1),
		('SQL stands for Structured Query Language' , 2 , 1),
        ('SQL can execute queries against a database' , 2 , 1),
        ('SQL stands for Structured Query Language' , 2 , 1),
		('Answer Android', 3 , 0 ),
		('Answer C++', 4 , 1 ),
		('Answer HTML', 5 , 1 );

INSERT INTO Exam (`code` , tilte , category_id, duration , creator_id , create_date )
VALUES	('JAVA' 	, 'Java Exam'	, 1 , 60 , '1' ,'2021-06-30'),
		('SQL'		, 'SQL Exam'	, 2 , 60 , '2' ,'2021-05-30'),
		('ANDROID'	, 'Android Exam', 3 , 90 , '3' ,'2021-04-30'),
		('C++'		, 'C++ Exam'	, 4 , 60 , '4' ,'2021-02-22'),
		('HTML'		, 'HTML Exam'	, 5 , 180, '5' ,'2021-01-30');

INSERT INTO Exam_Question(exam_id , question_id ) 
VALUES	( 6 , 1 ),
		( 6 , 2 ),
		( 6 , 3 ),
		( 6 , 4 ),
		( 7 , 5 ), 
        ( 7 , 6 ), 
		( 8 , 7 ), 
		( 9 , 8 ), 
		( 10 , 9 );    