CREATE DATABASE Sale_Management;
USE Sale_Management;

CREATE TABLE CUSTOMERS (
	customer_id 			INT,
    	first_name				VARCHAR(50),
    	last_name				VARCHAR(50),
    	email					VARCHAR(50),
    	numbers_of_complains 	INT
);

CREATE TABLE SALES (
	purchase_number 	INT,
    date_of_purchase 	DATE,
    customer_id 		INT,
    item_code			VARCHAR(50)
);

CREATE TABLE ITEMS (
	item_code					VARCHAR(50),
	item						VARCHAR(50),
	unit_price_usd				INT,
	company_id					INT,
	company						VARCHAR(50),
    headquarters_phone_number	VARCHAR(50)
)

	