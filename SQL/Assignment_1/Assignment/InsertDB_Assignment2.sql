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
VALUES		('HaiLong@gmail.com', 'Long', 'Hai Long', '1' , '1', '2021-07-29'),
			('MinhDuc@gmail.com', 'Duc', 'Minh Duc', '2' , '2', '2021-07-29'),
			('BichNga@gmail.com', 'Nga', 'Bich Nga', '3' , '2', '2021-07-29'),
			('VietHung@gmail.com', 'Hung', 'Viet Hung', '4' , '4', '2021-07-29'),
			('VuHai@gmail.com', 'Hai', 'Vu Hai', '5' , '3', '2021-07-29');
            
INSERT INTO `Group` ( group_name , creator_id , create_date)
VALUES	('Test', 1, '2021-07-28'),
		('Dev' , 2, '2021-07-28'),
		('HR' 	, 3, '2021-07-28'),
		('BRSE', 4, '2021-07-28'),
		('PM'	, 5, '2021-07-28');
 
INSERT INTO `GroupAcount` ( group_id , account_id , join_date )
VALUES	( 1 , 1,'2021-07-29'),
		( 2 , 2,'2021-07-29'),
		( 3 , 3,'2021-07-29'),
		( 4 , 4,'2021-07-29'),
		( 5 , 5,'2021-07-29');
        
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
VALUES	('Java Question' , 1 , '2' , '1' ,'2021-07-28'),
		('SQL Question' , 2 , '1 ', '2' ,'2021-07-28'),
		('Android Question' ,3 , '2' , '3' ,'2021-07-28'),
		('C++ Question' , 4 , '2' , '4' ,'2021-07-28'),
		('HTML Question' , 5 , '1' , '5' ,'2021-07-28');
        
INSERT INTO Answer ( content , question_id , isCorrect )
VALUES	('Answer Java' , 1 , 0),
		('Answer SQL' , 2 , 1),
		('Answer Android', 3 , 0 ),
		('Answer C++', 4 , 1 ),
		('Answer HTML', 5 , 1 );

INSERT INTO Exam (`code` , tilte , category_id, duration , creator_id , create_date )
VALUES	('JAVA' 	, 'Java Exam'	, 1 , 60 , '1' ,'2021-07-30'),
		('SQL'		, 'SQL Exam'	, 2 , 60 , '2' ,'2021-07-30'),
		('ANDROID'	, 'Android Exam', 3 , 90 , '3' ,'2021-07-30'),
		('C++'		, 'C++ Exam'	, 4 , 60 , '4' ,'2021-07-30'),
		('HTML'		, 'HTML Exam'	, 5 , 180, '5' ,'2021-07-30');

INSERT INTO Exam_Question(exam_id , question_id ) 
VALUES	( 1 , 1 ),
		( 2 , 2 ), 
		( 3 , 3 ), 
		( 4 , 4 ), 
		( 5 , 5 );    