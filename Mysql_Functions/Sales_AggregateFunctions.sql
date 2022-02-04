/*
@Author: Farzana Shaikh
@Date: 29-01-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 31-01-2022 04:00PM
@Title : SQL Queries to Implement Aggregate Functions on Sales Database.
*/


#1.From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.
SELECT SUM(purch_amt) FROM orders;

#2.From the following table, write a SQL query to calculate average purchase amount of all orders. Return average purchase amount.
SELECT AVG (purch_amt) FROM orders;

#3. From the following table, write a SQL query to count the number of unique salespeople. Return number of salespeople.
SELECT COUNT(DISTINCT salesman_id) FROM orders;

#4.From the following table, write a SQL query to count the number of customers. Return number of customers.
SELECT COUNT(*) FROM customer;

#5.From the following table, write a SQL query to find the number of customers who got at least a gradation for his/her activity.
SELECT COUNT(ALL grade) FROM customer;

#6.From the following table, write a SQL query to find the maximum purchase amount.
SELECT MAX(purch_amt) FROM orders;

#7.From the following table, write a SQL query to find the minimum purchase amount.
SELECT MIN(purch_amt) FROM orders;

#8.From the following table, write a SQL query to find the highest grade of the customers for each of the city. Return city, maximum grade.
SELECT city, MAX(grade) FROM customer GROUP BY city;

#9.From the following table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount.
SELECT customer_id, MAX(purch_amt) FROM orders GROUP BY customer_id;

#10.From the following table, write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount.
SELECT customer_id,ord_date,MAX(purch_amt) FROM orders GROUP BY customer_id,ord_date;

#11.From the following table, write a SQL query to find the highest purchase amount on '2012-08-17' by each salesperson. Return salesperson ID, purchase amount.
SELECT salesman_id,MAX(purch_amt) FROM orders WHERE ord_date = '2012-08-17' GROUP BY salesman_id;

#12.From the following table, write a SQL query to find highest order (purchase) amount by each customer in a particular order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.
SELECT customer_id,ord_date,MAX(purch_amt) FROM orders GROUP BY customer_id,ord_date HAVING MAX(purch_amt)>2000.00;

#13.From the following table, write a SQL query to find the maximum order (purchase) amount in the range 2000, 6000 (Begin and end values are included.) by combination of each customer and order date. Return customer id, order date and maximum purchase amount.
SELECT customer_id,ord_date,MAX(purch_amt) FROM orders GROUP BY customer_id,ord_date HAVING MAX(purch_amt) BETWEEN 2000 AND 6000;

#14.From the following table, write a SQL query to find the maximum order (purchase) amount by the combination of each customer and order date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount.
SELECT customer_id,ord_date,MAX(purch_amt) FROM orders GROUP BY customer_id,ord_date HAVING MAX(purch_amt) IN(2000 ,3000,5760, 6000);

#15.From the following table, write a SQL query to find the maximum order (purchase) amount by each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount.
SELECT customer_id,MAX(purch_amt) FROM orders WHERE customer_id BETWEEN 3002 and 3007 GROUP BY customer_id;

select * from sales.order group by purch_amt having (purch_amt)>5000;
select * from sales.order where salesman_id = 5001;