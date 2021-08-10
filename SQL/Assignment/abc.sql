USE `sql_assignment1`;

DROP PROCEDURE IF EXISTS `get_info_acc`
DELIMITER $$
CREATE PROCEDURE get_info_acc (IN accID INT, OUT user_name VARCHAR(50),OUT dpID INT)
	BEGIN
		SELECT 	username, department_id INTO user_name, dpID
        FROM 	account 
        WHERE 	account_id = accID;
	END$$
DELIMITER ;

SET @user_name = "";
SET @dpID = 0;
CALL get_info_acc(1, @user_name, @dpID);

SELECT @user_name, @dpID;

SELECT * FROM `Department` WHERE department_name = dpID

-- FUNCTION
DROP FUNCTION IF EXISTS `get_dp_info`
DELIMITER $$
CREATE FUNCTION get_dp_info(accountId INT) RETURNS VARCHAR(50)
	BEGIN
		DECLARE	dp_Name VARCHAR(50);
        DECLARE dp_ID INT;
		SELECT 	department_id INTO dp_ID FROM account WHERE account_id = accountId;
        SELECT 	department_name INTO dp_Name FROM department WHERE department_id = dp_ID;
        
        RETURN 	dp_Name;
	END $$
DELIMITER ;

SELECT get_dp_info(2);

CALL `get_dp_info`(2, @dp_ID,@dp_Name)
