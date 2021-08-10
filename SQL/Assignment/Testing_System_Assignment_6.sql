USE `sql_assignment1`;

-- ===== Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS department_account;
DELIMITER $$
CREATE PROCEDURE department_account(IN dp_name VARCHAR(50))
BEGIN
	SELECT 		A.Email, A.Username
    FROM		Department D 
	JOIN 		`Account` A ON D.Department_ID = A.Department_ID
    WHERE		department_name = dp_name;
	
END$$
DELIMITER ;
Call department_account('Sale');

-- =====	Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS count_account_group;
DELIMITER $$
CREATE PROCEDURE count_account_group(IN grp_id VARCHAR(50))
BEGIN
	SELECT 		Group_ID, COUNT(Account_ID)
    FROM		GroupAcount 
    WHERE		Group_ID = grp_id
    GROUP BY	Group_ID;
	
END$$
DELIMITER ;
CALL count_account_group(1);

-- ===== Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS count_question;
DELIMITER $$
CREATE PROCEDURE count_question(IN type_question VARCHAR(50))
BEGIN
	SELECT 		TQ.type_name, COUNT(Q.type_id) AS SO_LUONG
    FROM		question Q
    JOIN		typequestion TQ ON TQ.type_id = Q.type_id
    WHERE		month(Q.create_date) = month(now()) AND year(Q.create_date) = year(now())
    GROUP BY	TQ.type_name
    HAVING		TQ.type_name = 	type_question;
END $$
DELIMITER ;
CALL count_question('Multiple-Choice');

-- ===== Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS count_max_id_typequestion;
DELIMITER $$
CREATE PROCEDURE count_max_id_typequestion()
BEGIN
	SELECT 		COUNT(Q.type_id) AS SO_LUONG_CAU_HOI,	Q.type_id -- INTO 	out_max_id_type_question
    FROM		question Q	
    JOIN 		typequestion TQ ON Q.type_id = TQ.type_id
    GROUP BY	Q.type_id
    HAVING		COUNT(Q.type_id) = (	SELECT 	MAX(COUNT_QUEST_ID)
								FROM	(SELECT COUNT(question_id) AS COUNT_QUEST_ID 
											FROM question
											GROUP BY type_id) AS COUNT_TBL)
    LIMIT 1;                                        								
END $$
DELIMITER ;
CALL count_max_id_typequestion();

-- ===== Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS typeOf_max_id_typequestion;
DELIMITER $$
CREATE PROCEDURE typeOf_max_id_typequestion()
BEGIN
	SELECT 		COUNT(Q.type_id) AS SO_LUONG_CAU_HOI,	Q.type_id, TQ.type_name -- INTO 	out_max_id_type_question
    FROM		question Q	
    JOIN 		typequestion TQ ON Q.type_id = TQ.type_id
    GROUP BY	Q.type_id
    HAVING		COUNT(Q.type_id) = (	SELECT 	MAX(COUNT_QUEST_ID)
								FROM	(SELECT COUNT(question_id) AS COUNT_QUEST_ID 
											FROM question
											GROUP BY type_id) AS COUNT_TBL)
    LIMIT 1;                                        								
END $$
DELIMITER ;
CALL typeOf_max_id_typequestion();

-- ==== Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên 
-- 					chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa 
-- 					chuỗi của người dùng nhập vào

DROP PROCEDURE IF EXISTS search_userName_or_groupName;
DELIMITER $$
CREATE PROCEDURE search_userName_or_groupName(IN input_name VARCHAR(50))
BEGIN
	SELECT G.`group_name` AS NAME
	FROM `Group` G
	WHERE G.`group_name`
	LIKE CONCAT("%",input_name,"%")
    
	UNION
    
	SELECT A.`username` 
    FROM `Account` A 
    WHERE a.`username` 
    LIKE CONCAT("%",input_name,"%");
END$$
DELIMITER ;
Call search_userName_or_groupName('e');

-- ===== Question 7:Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và 
-- 					trong store sẽ tự động gán:
-- 					username sẽ giống email nhưng bỏ phần @..mail đi
-- 					positionID: sẽ có default là developer
-- 					departmentID: sẽ được cho vào 1 phòng chờ
-- 					Sau đó in ra kết quả tạo thành công

DROP PROCEDURE IF EXISTS input_info_fullname_email;
DELIMITER $$
CREATE PROCEDURE input_info_fullname_email(	IN input_email	VARCHAR(50),
											IN input_fullname 		VARCHAR(50))
BEGIN
		DECLARE username 		VARCHAR(50) DEFAULT substring_index(input_email, '@',1);
        DECLARE	positionID		TINYINT UNSIGNED DEFAULT 1;
        DECLARE	departmentID	TINYINT UNSIGNED DEFAULT 5;
        DECLARE	create_date		DATETIME DEFAULT NOW();
        
        INSERT INTO `sql_assignment1`.`account` (`email`,`username`,`full_name`,`department_id`,`position_id`,`create_date`)
		VALUES	(	input_email, username, input_fullname, departmentID, positionID, create_date);

		SELECT * 
        FROM `Account`;
END $$;    

DELIMITER ;


-- ===== Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- 					để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
BEGIN WORK;
DROP PROCEDURE IF EXISTS delete_exam_byId;
DELIMITER $$
CREATE PROCEDURE delete_exam_byId(	IN in_examId TINYINT UNSIGNED)
BEGIN
    DELETE 	
    FROM	`exam`
	WHERE	exam_id = in_examId;
 
END $$;    
DELIMITER ;

CALL delete_exam_byId('1');
ROLLBACK;
COMMIT;













