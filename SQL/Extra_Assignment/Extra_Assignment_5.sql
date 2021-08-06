USE `adventureworks`;

-- ====== 	EXERCISE 1: SUBQUERY

-- ======	Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'.
WITH PRODUCT_SUB_CATE AS (
	SELECT ProductSubcategoryID 
    FROM productsubcategory
	WHERE `Name` = 'Saddles'
)
	SELECT	`Name`
    FROM	product
	WHERE 	ProductSubcategoryID = (SELECT 	*
									FROM	PRODUCT_SUB_CATE);
                                    
                                    
-- ======	Question 2: Thay đổi câu Query 1
WITH PRODUCT_SUB_CATE AS (
	SELECT 	ProductSubcategoryID 
    FROM 	productsubcategory
	WHERE 	`Name` LIKE '%Bo%'
)
	SELECT	`Name`
    FROM	product
	WHERE 	ProductSubcategoryID	IN	(	SELECT 	*
											FROM	PRODUCT_SUB_CATE)
;
-- ======	Question 3:	Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và 
-- ======				Touring Bike (nghĩa là ProductSubcategoryID = 3)
WITH 
PRODUCT_SUB_CATE_ID AS (
	SELECT 	ProductSubcategoryID 
    FROM 	adventureworks.productsubcategory
	WHERE 	`Name` LIKE 'Touring Bikes'
),
CHEAPEST AS	(
	SELECT 	MIN(ListPrice) AS CHEAPEST
    FROM	product
    WHERE	ProductSubcategoryID IN (SELECT * FROM PRODUCT_SUB_CATE_ID)
)
	SELECT `name`
	FROM	product
	WHERE 	ListPrice IN (SELECT * FROM CHEAPEST)
;
-- ======	EXERCISE 2: JOIN TABLES

-- ======	Question 1: Viết query lấy danh sách tên country và province được lưu trong AdventureWorks2008sample database. 
SELECT 	CR.Name AS COUNTRY, SP.Name AS PROVINCE
FROM 	countryregion CR
JOIN 	stateprovince SP ON CR.CountryRegionCode = SP.CountryRegionCode
;
-- =====	Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada
SELECT 	CR.`Name` AS COUNTRY, SP.`Name` AS PROVINCE
FROM 	countryregion CR
JOIN 	stateprovince SP ON CR.CountryRegionCode = SP.CountryRegionCode
WHERE	CR.`Name` = 'Germany' 
OR 		CR.`Name` = 'Canada'
;

-- =====	Question 3: Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales),
-- =====				Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay)
-- =====				Từ bảng SalesOrderHeader, chúng ta lấy cột SalesOrderID OrderDate

SELECT	SOH.SalesOrderID, SOH.OrderDate, SOH.SalesPersonID, SP.Bonus, SP.SalesYTD
FROM	salesperson SP
JOIN	salesorderheader SOH ON SP.SalesPersonID = SOH.SalesPersonID
;
-- ==== Question 4:	Sử dụng câu query ở question 3, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID.

SELECT	SOH.SalesOrderID, SOH.OrderDate, E.Title, SP.Bonus, SP.SalesYTD
FROM	salesperson SP
JOIN	salesorderheader SOH ON SP.SalesPersonID = SOH.SalesPersonID
JOIN	employee E 			 ON	SP.SalesPersonID = E.EmployeeID;