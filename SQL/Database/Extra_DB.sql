USE SQL_ExtraAssignment_1_2;

-- ---- Question 1: Thêm ít nhất 10 bản ghi vào table
INSERT INTO Trainee (trainne_id, full_name, birth_date, gender, ET_IQ, ET_Gmath, ET_English, training_class, evaluation_note, VTI_Account)
 VALUES		('1', 'Hai Long', '2000/3/20', 'male', '15', '16', '19', 'Trainning1', 'Kha', 'LongVTI1'),
			('2', 'Minh Duc', '1993/9/24', 'male', '16', '13', '20', 'Trainning2', 'Kha', 'DucVTI2'),
			('3', 'Bich Nga', '1992/4/12', 'female', '17', '18', '20', 'Trainning3', 'Gioi', 'NgaVTI3'),
			('4', 'Viet Hung', '1995/12/13', 'Male', '18', '19', '20', 'Trainning2', 'Gioi', 'HungVTI4'),
			('5', 'Vu Hai', '1991/11/5', 'male', '20', '20', '19', 'Trainning1', 'Suat Xac', 'HaiVTI5'),
			('6', 'Hoang My', '2003/12/11', 'female', '10', '5', '5', 'Trainning3', 'Yeu', 'MyVTI6'),
			('7', 'Anh Cham', '2001/9/8', 'female', '7', '10', '2', 'Trainning2', 'Yeu', 'ChamVTI7'),
			('8', 'Hoang Dung', '2000/8/20', 'female', '20', '20', '50', 'Trainning4', 'Suat Xac', 'DungVTI8'),
			('9', 'Khac Viet', '2000/7/12', 'unknow', '15', '18', '20', 'Trainning4', 'Kha', 'VietVTI9'),
			('10','TuanHung', '2003/8/12', 'male', '20', '19', '20', 'Trainning4', 'Suat Xac', 'HungVTI10');
            
-- ---- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
SELECT * 
FROM Trainee
GROUP BY birth_date;

-- ---- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản
SELECT trainne_id,full_name,birth_date,gender,VTI_Account,MAX(char_length(full_name)) AS FullName_Length
FROM Trainee;
-- WHERE char_length(full_name) = (SELECT MAX(char_length(full_name)) AS FullName_Length FROM Trainee);

-- ---- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET 
-- ET_IQ + ET_Gmath>=20, 
-- ET_IQ>=8,
-- ET_Gmath>=8, 
-- ET_English>=18
SELECT *
FROM Trainee
WHERE (ET_IQ + ET_Gmath >= 20) AND (ET_IQ >= 8) AND (ET_Gmath >= 8) AND (ET_English >= 18);

-- ---- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE
FROM Trainee
WHERE trainne_id = 3;

-- ---- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
UPDATE Trainee
SET training_class = 'Trainning2'
WHERE trainne_id = 5;
