/*
@Author: Farzana Shaikh
@Date: 29-01-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 31-01-2022 04:00PM
@Title : SQL Queries to Implement Union on Sales Database.
*/

#1. From the following tables, write a SQL query to find all salespersons and customer who located in 'London' city.
SELECT salesman_id 'ID', name, 'Salesman' FROM salesman WHERE city = 'London' UNION (SELECT customer_id 'ID', cust_name, 'Customer'FROM customer WHERE city = 'London');

#2. From the following tables, write a SQL query to find distinct salesperson and their cities. Return salesperson ID and city.
SELECT salesman_id, city FROM customer UNION (SELECT salesman_id, city FROM salesman);

#3. From the following tables, write a SQL query to find all those salespersons and customers who involved in inventory management system. Return salesperson ID, customer ID.
SELECT salesman_id, customer_id FROM customer UNION (SELECT salesman_id, customer_id FROM orders);

#4. From the following table, write a SQL query to find those salespersons generated the largest and smallest orders on each date. Return salesperson ID, name, order no., highest on/ lowest on, order date.
SELECT a.salesman_id, name, order_id, 'highest_on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MAX (purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date)
UNION
(SELECT a.salesman_id, name, order_id, 'lowest_on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MIN (purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date));
