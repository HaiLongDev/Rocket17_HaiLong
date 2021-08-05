USE SQL_Assignment1;

-- ---- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT		A.account_id, A.email, A.username, A.full_name, A.department_id, A.position_id, A.create_date, D.department_name
FROM		`Account` A
JOIN		Department D ON A.department_id = D.department_id
ORDER BY	A.account_id ASC;


-- ---- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM 	`Account`
WHERE	create_date > '2020-12-20';


-- ---- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT		A.account_id, A.email, A.username, A.full_name, A.position_id, P.position_name
FROM		`Account` A
JOIN 		Position P ON A.position_id = P.position_id
WHERE 		P.position_name = 'Dev'
ORDER BY 	A.account_id ASC;


-- ---- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT 			D.department_name, A.username, COUNT(A.department_id)
FROM 			Department D
INNER JOIN 		`Account` A ON A.department_id = D.department_id
GROUP BY 		A.department_id
HAVING 			COUNT(A.department_id) >= 1;


-- ---- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
-- Cách 1:
SELECT		* ,COUNT(EQ.question_id)
FROM 		Question Q
JOIN		Exam_Question EQ ON Q.question_id = EQ.question_id
GROUP BY	EQ.question_id
HAVING		COUNT(EQ.question_id) = (	SELECT	MAX(COUNT_QUESTID) AS SO_LUONG_CAU_HOI_SU_DUNG_NHIEU_NHAT
										FROM	(	SELECT 		question_id, COUNT(EQ.question_id) AS COUNT_QUESTID 
													FROM			Exam_Question EQ
													GROUP BY		EQ.question_id) AS COUNT_ALL_QUESTID);
-- Cách 2:
SELECT		 Q.question_id, COUNT(EQ.question_id) AS SO_LUONG_CAU_HOI_SU_DUNG_NHIEU_NHAT
FROM		 Exam_Question EQ
JOIN		 Question Q ON Q.question_id = EQ.question_id
GROUP BY	 EQ.question_id
ORDER BY	 COUNT(EQ.question_id) DESC
LIMIT 1;


-- ---- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT		 CQ.category_name, COUNT(CQ.category_id)
FROM		 CategoryQuestion	CQ
JOIN		 Question	Q	ON	Q.category_id = CQ.category_id
GROUP BY	 CQ.category_id;


-- ---- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT			Q.question_id, COUNT(EQ.question_id) AS SỐ_EXAM_SỬ_DỤNG
FROM			Question Q
JOIN			Exam_Question EQ ON Q.question_id = EQ.question_id
GROUP BY		EQ.question_id;


-- ---- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT		 Q.question_id, COUNT(A.question_id) AS QUEST_CO_NHIEU_ANSWER_NHAT
FROM		 Answer A
JOIN		 Question Q ON A.question_id = Q.question_id
GROUP BY	 A.question_id
ORDER BY	 COUNT(A.question_id) DESC
LIMIT 1;


-- ---- Question 9: Thống kê số lượng account trong mỗi group
SELECT		 G.group_name, COUNT(GA.account_id) AS SO_ACC_TRONG_GRP
FROM		 `GroupAcount` GA
JOIN		 `Group` G ON GA.group_id = G.group_id
GROUP BY	 GA.group_id;


-- ---- Question 10: Tìm chức vụ có ít người nhất
SELECT			*, COUNT(A.position_id) 
FROM			Position P
JOIN 			`Account` A ON A.position_id = P.position_id
GROUP BY		A.position_id
HAVING COUNT	(A.position_id) = (	SELECT MIN(POS_COUNT) AS CV_IT_NG_NHAT
									FROM (	SELECT COUNT(A.position_id) AS POS_COUNT
											FROM `Account` A
											GROUP BY A.position_id) AS COUNT_TBLE	);


-- ---- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT	D.department_id,D.department_name,P.position_name, COUNT(P.position_id) AS SO_LUONG
FROM 	`Account` A
JOIN	Position P	ON A.position_id = P.position_id
JOIN	Department D ON D.department_id = A.department_id
GROUP BY D.department_id, P.position_id;


-- ---- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT 	Q.question_id,Q.Content, A.Username AS Creator, ANS.content AS Answer, TQ.type_name AS Type_Question, CQ.category_name AS Category
FROM 	Question Q
JOIN	`Account` A ON A.account_id = Q.creator_id
JOIN	Answer ANS ON ANS.question_id = Q.question_id
JOIN	TypeQuestion TQ ON TQ.type_id = Q.type_id
JOIN	CategoryQuestion CQ ON CQ.category_id = Q.category_id
ORDER BY Q.question_id ;


-- ---- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT	TQ.type_name,TQ.type_id , COUNT(Q.type_id) AS SO_LUONG_CAU_HOI
FROM	Question		Q
JOIN	TypeQuestion	TQ	ON	TQ.type_id = Q.type_id
GROUP BY Q.type_id;


SELECT	TQ.type_name,TQ.type_id , COUNT(TQ.type_id) AS SO_LUONG_CAU_HOI
FROM	Question		Q
JOIN	TypeQuestion	TQ	ON	TQ.type_id = Q.type_id
GROUP BY TQ.type_id;


-- ---- Question 14:Lấy ra group không có account nào
SELECT 		*
FROM 		`Group` G
LEFT JOIN 	GroupAcount GA ON G.creator_id = GA.account_id
WHERE 		GA.account_id IS NULL;


-- ---- Question 15:Lấy ra account không có group nào
SELECT *
FROM GroupAcount GA
LEFT JOIN `Group` G ON G.creator_id = GA.account_id
WHERE G.creator_id IS NULL;


-- ---- Question 16: Lấy ra question không có answer nào
SELECT *
FROM Answer A
RIGHT JOIN Question Q on A.question_id = Q.question_id 
WHERE A.answer_id IS NULL;


--
SELECT G.group_name, A.username
FROM `Group` G
LEFT JOIN `Account` A ON G.creator_id = A.account_id;


-- ---- Question 17: 
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT  * 
FROM `Account` A
JOIN GroupAcount GA ON GA.account_id = A.account_id
WHERE GA.account_id = 1
UNION
SELECT  * 
FROM `Account` A
JOIN GroupAcount GA ON GA.account_id = A.account_id
WHERE GA.account_id = 2;


-- ---- Question 18: 
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 7 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT *, COUNT(GA.account_id)
FROM `Group` G
JOIN GroupAcount GA ON G.group_id = GA.group_id
GROUP BY G.account_id
HAVING COUNT(GA.account_id) >= 2
