/*
@Author: Farzana Shaikh
@Date: 29-01-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 31-01-2022 04:00PM
@Title : SQL Queries to Implement Stored Procedure on Sales Database.
*/

SELECT * FROM customer;

DELIMITER //

CREATE PROCEDURE get_customer()
BEGIN
SELECT * FROM customer;
END //

DELIMITER ;