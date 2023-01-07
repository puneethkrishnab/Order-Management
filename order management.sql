-- DROP DATABASE ECOM;
CREATE DATABASE IF NOT EXISTS ECOM;
USE ECOM;
DESC Product_dtls;
DESC Product_dtls;
DESC Product_info;
DESC Customer_dtls;
DESC Customer_dtls;
DESC Customer_addr;
DESC order_dtls;
DESC Product_purchase;

-- DROP TABLE Product_dtls;
CREATE TABLE Product_dtls(product_id VARCHAR(200) PRIMARY KEY, product_name VARCHAR(200), 
product_desc VARCHAR(200), category VARCHAR(200), subcategory VARCHAR(200), manufacturer VARCHAR(200));


-- DROP TABLE customer_dtls;
CREATE TABLE Customer_dtls(cust_id INT PRIMARY KEY, salution VARCHAR(200), cust_name VARCHAR(200), cust_type VARCHAR(200),
dob DATETIME, mobile VARCHAR(200), email VARCHAR(200), educ VARCHAR(200), profession VARCHAR(200), marital_status VARCHAR(200),
gender VARCHAR(200));

INSERT INTO Product_dtls VALUES('P001', 'Maggie', 'MAGGI 2-Minute Masala Noodles is an instant noodles brand manufactured by Nestle', 'Grocery & Gourmet Foods', 'Fast food', 'Nestle'),
('P002', 'Quaker Oats Muesli', 'POWER OF 5 GRAINS: Delicious Quaker Oats Muesli packed with 5 nutritious grains: rolled oat, rice, corn, barley, and wheat', 'Grocery & Gourmet Foods', 'Cereal & Muesli', 'Quaker'),
('P003', 'Leaf tea', 'Lipton Darjeeling tea is 100% pure and authentic Darjeeling Tea', 'Coffee, Tea & Beverages', 'Tea', 'Lipton'),
('P004', 'Thums Up Soft Drink ', 'STRONG TASTE: Refresh yourself with the strong taste of Thums Up', 'Coffee, Tea & Beverages', 'Soft Drinks', 'Thums Up'),
('P005', 'Green Raisins', 'Seedless Green Raisins are nature little yummy candies, a healthier alternative to sugar rich candies and sweet products', 'Dried Fruits, Nuts & Seeds', 'Dried Fruits', 'Happilo'),
('P006', 'Sonav Foods Mixed Berries', 'IMMUNITY BOOSTER: Our trail mix is a powerhouse of nutrients, especially Vitamins, Protein and Antioxidants, all of which are beneficial in boosting the immunity of the body', 'Dried Fruits, Nuts & Seeds', 'Dried Fruits', 'SONAV FOODS'),
('P007', 'Noise smart watch', 'Massive 1.85" display: See everyday data clearly under the brightest sun on the 1.85'' TFT LCD that sports 550 nits of brightness and the highest screen-to-body ratio', 'Electronics', 'Wearable Technology', 'Noise'),
('P008', 'OnePlus Smart Band', 'Removable main tracker design allows for effortless transition between dynamic dual-color strap combos. Battery life : Up to 14 days, Battery capacity: 100 mAh', 'Electronics', 'Wearable Technology', 'OnePlus');

SELECT * FROM Product_dtls;

INSERT INTO Customer_dtls VALUES(101, 'Mr', 'Ram', 'New customer', '1997-06-14', '8955697812', 'ram.rajan@gmail.com', 'MA', 'Teacher', 'Unmarried', 'M'),
(102, 'Mrs', 'sita', 'Loyal customer', '1999-03-08', '9945697812', 'sita.b@gmail.com', 'LAW', 'Lawyer', 'Unmarried', 'F'),
(103, 'Mr', 'Laksman', 'New customer', '1998-02-22', '7935697813', 'lakshman.ram@gmail.com', 'BE', 'Engineer', 'Unmarried', 'M'),
(104, 'Mrs', 'laksmi', 'old customer', '1994-07-10', '8934696818', 'laksmi.narayan@gmail.com', 'MCOM', 'Manager', 'Married', 'F'),
(105, 'Mr', 'Bantu', 'new customer', '1996-04-06', '7939791815', 'Bantu.a@gmail.com', 'BA', 'Consultent', 'Married', 'M'),
(106, 'Mr', 'Santu', 'new customer', '1992-04-21', '9936741311', 'Santu.b@gmail.com', 'CA', 'CEO', 'Unmarried', 'M'),
(107, 'Mrs', 'Divya', 'old customer', '1988-01-20', '8936641214', 'divya.h@gmail.com', 'Engineer', 'Software Engineer', 'Unmarried', 'F'),
(108, 'Mr', 'Rakesh', 'new customer', '1992-10-12', '7036641519', 'rakesh.l@gmail.com', 'Phd', 'Scientist', 'Unmarried', 'M');

SELECT * FROM Customer_dtls;

TRUNCATE TABLE Product_info;
CREATE TABLE Product_info(product_id VARCHAR(200), FOREIGN KEY (product_id) REFERENCES Product_dtls(product_id), product_ver VARCHAR(200), 
active_status VARCHAR(200), price INT, discount INT, instock VARCHAR(200), current_stock_count INT);

INSERT INTO Product_info VALUES('P001', 'New', 'Yes', 168, 8, 'Yes', 1000), ('P002', 'New', 'Yes', 410, 92, 'Yes', 1000), ('P003', 'New', 'Yes', 495, 32, 'Yes', 1000), ('P004', 'old', 'Yes', 40, 8, 'Yes', 1000), ('P005', 'old', 'Yes', 325, 150, 'Yes', 1000), 
('P006', 'old', 'Yes', 999, 172, 'Yes', 1000), ('P007', 'New', 'Yes', 3299, 1500, 'Yes', 1000), ('P008', 'New', 'yes', 2500, 500, 'Yes', 1000);
SELECT * FROM Product_info;

CREATE TABLE Customer_addr(addr_type VARCHAR(200), add1 VARCHAR(200), add2 VARCHAR(200), city VARCHAR(200),
state VARCHAR(200), pin INT, country VARCHAR(200), landmark VARCHAR(200), cust_id INT, FOREIGN KEY (cust_id) REFERENCES Customer_dtls(cust_id));

INSERT INTO Customer_addr VALUES('Home', '6th cross leggere', '2nd main road silkboard', 'Banglore', 'Karnataka', '576007', 'India', 'Near big bazar', 101),
('Office', '4th cross banashakari', '1st main road silkboard', 'Banglore', 'Karnataka', '576007', 'India', 'Near kfc', 102),
('Home', '7th cross hosa road', '2nd main road konappan agrahara', 'Banglore', 'Karnataka', '576007', 'India', 'Near pes college', 103),
('Office', '5th main road Bommanahalli', '5th main road konappan agrahara', 'Banglore', 'Karnataka', '596002', 'India', 'Near movie teater', 104),
('Home', '8th cross electronic city', 'Konappana agrahara', 'Banglore', 'Karnataka', '556004', 'India', 'Near bus stop', 105),
('Home', '5th main road MG road', 'Near BR school', 'Mumbai', 'Maharastra', '896004', 'India', 'Near BR school', 106),
('office', '6th main road HG raod', 'Near Govt office', 'chennai', 'Tamil Nadu', '792001', 'India', 'Near Govt office', 107),
('Home', '2nd cross JK street', 'Near Govt school', 'chennai', 'Tamil Nadu', '792001', 'India', 'Near JK market', 108);

SELECT * FROM Customer_addr;

CREATE TABLE agent_info(agent_id INT PRIMARY KEY, agent_name VARCHAR(200), agent_type VARCHAR(200), role VARCHAR(200), 
dept_id VARCHAR(200), status VARCHAR(200));
INSERT INTO agent_info VALUES(901, 'Satish', 'M', 'Delivary', 'D900', 'active'), (902, 'suresh', 'M', 'Delivary', 'D900', 'active'), (903, 'Girish', 'M', 'Delivary', 'D900', 'active'),
(904, 'Ramesh', 'M', 'Delivary', 'D900', 'active');
SELECT * from agent_info;


DROP TABLE Product_purchase;
CREATE TABLE Product_purchase(product_id VARCHAR(200), FOREIGN KEY (product_id) REFERENCES Product_dtls(product_id), prod_price INT, 
qty INT, status VARCHAR(200), del_date DATETIME,
del_number VARCHAR(200), install_date DATETIME, order_id INT NOT NULL);
DESC Product_purchase;


DROP TABLE order_dtls;
CREATE TABLE order_dtls(order_id INT PRIMARY KEY, order_name VARCHAR(200), order_desc VARCHAR(200), order_amt INT, order_date DATETIME,
order_type VARCHAR(200), order_exp_dt DATETIME, order_status VARCHAR(200), cust_id INT, FOREIGN KEY (cust_id) REFERENCES Customer_dtls(cust_id), agent_id INT);
DESC order_dtls;


DROP PROCEDURE CART;
delimiter $$
create procedure CART(a VARCHAR(200), c INT, e DATETIME, g INT, i INT, l INT)  -- a: product id, b: price, c:quantity e:installdate  i:order_id g:customer_id
cart:BEGIN
     DECLARE b INT;                                                             -- Price
     DECLARE b1 INT;                                                             -- Discount
     DECLARE d VARCHAR(200);                                                    -- Order status
     DECLARE f DATETIME;                                                        -- Delivary last date
     DECLARE g1 VARCHAR(200);                                                   -- customer mobile number
     DECLARE h INT;                                                             -- Inventory undate
     DECLARE j VARCHAR(200);                                                    -- Product name
     DECLARE k VARCHAR(200);
     SET b = (SELECT price FROM product_info WHERE product_id = a);
     SET b1 = (SELECT discount FROM product_info WHERE product_id = a);
     SET d = 'Order_accepted';
     SET f = DATE_ADD(e, INTERVAL 7 DAY);
     SET g1 = (SELECT mobile FROM Customer_dtls WHERE cust_id = g);
     SET h = (SELECT current_stock_count FROM Product_info WHERE product_id = a);
     SET j = (SELECT product_name FROM Product_dtls WHERE product_id = a); 
	 SET k = (SELECT product_desc FROM Product_dtls WHERE product_id = a);
     
     IF (h - c) <= 0 THEN
          SELECT "Product not available please try after some days" as err_msg;
          leave cart;
	 ELSE
     INSERT INTO Product_purchase(product_id, prod_price, qty, status, del_date, del_number, install_date, order_id)
     VALUES(a, b, c, d, f, g1, e, i);
     UPDATE Product_info SET current_stock_count = current_stock_count - c WHERE product_id = a;
     END IF;
     
     IF i NOT IN (SELECT order_id FROM order_dtls) THEN    -- (i NOT IN (SELECT order_id FROM order_dtls)) OR ((SELECT order_id FROM order_dtls)) IS NULL
		  INSERT INTO order_dtls(order_id, order_name, order_desc, order_amt, order_date, order_type, order_exp_dt, order_status, cust_id, agent_id)
		  VALUES(i, j, k, (b - b1)*c, e, 'new', f, 'Active', g, l);
	 ELSE
         UPDATE order_dtls SET order_amt = order_amt + (b*c) WHERE order_id = i;
	 END IF;
     IF h <=0 THEN
		 UPDATE Product_info SET instock = 'No' WHERE product_id = a;
	 END IF;
     
end $$
delimiter ;

CALL CART('P001', 1, '2021-10-23', 101, 1, 901);
CALL CART('P002', 2, '2021-10-23', 101, 1, 901);
CALL CART('P008', 8, '2021-11-02', 104, 2, 902);
CALL CART('P003', 3, '2021-11-12', 102, 3, 901); --
CALL CART('P001', 5, '2021-11-13', 105, 4, 903);
CALL CART('P004', 3, '2021-11-13', 108, 5, 902);
CALL CART('P002', 8, '2021-11-13', 108, 5, 902);
CALL CART('P008', 9, '2021-11-17', 101, 6, 903);
CALL CART('P006', 15, '2021-11-17', 101, 6, 903);
CALL CART('P004', 6, '2021-11-24', 104, 7, 901);
CALL CART('P001', 12, '2021-11-27', 106, 8, 903);

CALL CART('P005', 5, '2021-11-30', 107, 9, 902);
CALL CART('P005', 9, '2021-11-30', 107, 9, 902);
CALL CART('P004', 5, '2022-01-01', 102, 10, 901); --
CALL CART('P007', 9, '2022-01-03', 103, 11, 902);
CALL CART('P002', 15, '2022-01-07', 106, 12, 904);
CALL CART('P008', 12, '2022-01-07', 106, 12, 904);
CALL CART('P005', 15, '2022-01-15', 102, 13, 901);
CALL CART('P003', 14, '2022-01-15', 102, 13, 903);
CALL CART('P001', 5, '2022-01-22', 103, 14, 904);
CALL CART('P005', 9, '2022-01-25', 104, 15, 903);

CALL CART('P006', 5, '2022-01-26', 101, 16, 901);
CALL CART('P002', 6, '2022-01-26', 101, 16, 901);
CALL CART('P008', 8, '2022-01-27', 103, 17, 904);
CALL CART('P003', 7, '2022-01-29', 106, 18, 901); --
CALL CART('P001', 5, '2022-02-01', 102, 19, 903);
CALL CART('P004', 3, '2022-02-01', 102, 19, 902);
CALL CART('P007', 11, '2022-02-03', 105, 20, 904);
CALL CART('P006', 14, '2022-02-05', 106, 21, 902);
CALL CART('P007', 6, '2022-02-05', 106, 21, 902);
CALL CART('P006', 13, '2022-02-06', 102, 22, 903);
CALL CART('P003', 9, '2022-02-06', 102, 22, 901);

CALL CART('P001', 7, '2022-02-09', 103, 23, 904);
CALL CART('P008', 9, '2022-02-09', 103, 23, 904);
CALL CART('P005', 19, '2022-02-11', 107, 24, 902); --
CALL CART('P004', 11, '2022-02-11', 106, 25, 904);
CALL CART('P006', 5, '2022-02-11', 106, 25, 904);
CALL CART('P003', 12, '2022-02-13', 107, 26, 901);
CALL CART('P001', 14, '2022-02-17', 104, 27, 903);
CALL CART('P006', 7, '2022-02-21', 102, 28, 901);
CALL CART('P001', 15, '2022-02-22', 108, 29, 903);
CALL CART('P002', 13, '2022-02-23', 101, 30, 904);


SELECT * FROM Product_purchase;
SELECT * FROM Product_info;
SELECT * FROM order_dtls;
SELECT * FROM Product_dtls;
SELECT * FROM Customer_dtls;
SELECT * from agent_info;
SELECT * FROM Customer_addr;

/* Q1). What is total revenue generated in each month and number of qunatity sold in each month */
SELECT MONTHNAME(install_date), SUM(DISTINCT(order_amt)), SUM(qty) FROM order_dtls AS OD JOIN Product_purchase AS PP ON OD.order_id = PP.order_id GROUP BY MONTHNAME(install_date);

/* Q2). sum of Highly saled product and there total discount percentage*/
SELECT PP.product_id, PD.product_name, COUNT(PP.product_id) AS PID, (SUM(PI.discount)/sum(PI.price))*100 AS discount_per FROM Product_purchase AS PP 
JOIN Product_info AS PI JOIN Product_dtls AS PD ON PP.product_id = PI.product_id AND PI.product_id = PD.product_id GROUP BY PP.product_id ORDER BY  COUNT(PP.product_id) DESC;

/* Q3). Who has done maximum delivery of products in the delevery department */
SELECT OD.agent_id, AI.agent_name, COUNT(OD.agent_id) AS Agent_id FROM order_dtls AS OD 
JOIN agent_info AS AI ON OD.agent_id = AI.agent_id GROUP BY OD.agent_id ORDER BY COUNT(OD.agent_id) DESC;

/* Q4). Customer from which city has made more orders*/
SELECT city, COUNT(city) FROM order_dtls AS OD JOIN Product_purchase AS PP JOIN Customer_addr AS CA
ON OD.order_id = PP.order_id AND OD.cust_id = CA.cust_id GROUP BY city;

/* Q5). Customers ordered more for what type of address*/
SELECT addr_type, COUNT(addr_type) FROM order_dtls AS OD JOIN Product_purchase AS PP JOIN Customer_addr AS CA
ON OD.order_id = PP.order_id AND OD.cust_id = CA.cust_id GROUP BY addr_type;

/* Q6). Who ordered more product gender wise*/
SELECT gender, COUNT(gender) AS Count FROM order_dtls AS OD JOIN Product_purchase AS PP JOIN Customer_dtls AS CD 
ON OD.order_id = PP.order_id AND OD.cust_id = CD.cust_id GROUP BY gender;

/* Q7). Who ordered more product marital status wise*/
SELECT marital_status, COUNT(marital_status) AS Count FROM order_dtls AS OD JOIN Product_purchase AS PP JOIN Customer_dtls AS CD 
ON OD.order_id = PP.order_id AND OD.cust_id = CD.cust_id GROUP BY marital_status;