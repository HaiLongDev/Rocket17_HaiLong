USE SQL_Assignment1;

-- ----- Q1
SELECT *
FROM `Account`
WHERE account_id IN (
							SELECT	account_id
							FROM 	groupacount
							WHERE 	group_id = (
													SELECT group_id
                                                    FROM	`Group`
                                                    WHERE group_name = "Dev"));
                                                    
-- ---- Q2
SELECT 		A.email, A.username, COUNT(GA.account_id) AS SO_LUONG
FROM		`Account` AS A
LEFT JOIN	GroupAcount AS GA ON A.account_id =  GA.account_id
GROUP BY	GA.account_id
HAVING		COUNT(GA.account_id) = (SELECT MAX(COUNT_ACCID)
									FROM (	SELECT COUNT(account_id) AS COUNT_ACCID
											FROM sql_assignment1.groupacount
											GROUP BY account_id) AS COUNT_TBL);

-- ---- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban Marketing
CREATE OR REPLACE VIEW NV_MARKETING AS
SELECT 	A.*, D.department_name 
FROM 	`Account` A
JOIN 	Department D ON A.department_id = D.department_id
WHERE 	D.department_name = 'Marketing';
 
SELECT * FROM NV_MARKETING;                                            
-- ---- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
WITH CONTENT_QUA_DAI AS (
	SELECT * 
	FROM sql_assignment1.question
	WHERE char_length(content) >20
)
DELETE
FROM Question
WHERE question_id = (SELECT question_id FROM CONTENT_QUA_DAI);

-- ---- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
-- Cách 1
CREATE OR REPLACE VIEW MAX_NV AS
WITH COUNT_NV AS(
SELECT 			COUNT(department_id) AS COUNT_DID 
FROM 			`Account` 
GROUP BY 		department_id
)
SELECT 			D.department_name, count(A.department_id) AS SO_LUONG 
FROM 			`Account` A
JOIN 			Department D ON D.department_id = A.department_id
GROUP BY 		A.department_id
HAVING 			count(A.department_id) = (SELECT max(COUNT_DID) 
											FROM COUNT_NV);
SELECT * FROM 	MAX_NV;

-- Cách 2:
WITH COUNT_NV AS(
SELECT 			COUNT(department_id) AS COUNT_DID 
FROM 			`Account` 
GROUP BY 		department_id
),
MAX_NV AS(
SELECT max(COUNT_DID) AS MAX_COUNT
FROM COUNT_NV
)
SELECT 			count(department_id) AS SO_LUONG 
FROM 			`Account` 
GROUP BY 		department_id
HAVING 			count(department_id) = (SELECT MAX_COUNT
										FROM MAX_NV);
											
-- ---- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW USER_HO_NGUYEN AS
SELECT 	Q.category_id, Q.Content, A.full_name AS Creator 
FROM 	Question Q
JOIN 	`Account` A ON A.account_id = Q.creator_id 
WHERE 	A.full_name LIKE 'Hai%';
                            