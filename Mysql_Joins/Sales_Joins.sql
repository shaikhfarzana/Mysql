/*
@Author: Farzana Shaikh
@Date: 29-01-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 31-01-2022 04:00PM
@Title : SQL Queries to Perform Joins Operations on Sales Database.
*/

use Sales;
#1. From the following tables write a SQL query to find the salesperson and customer who belongs to same city. Return Salesman, cust_name and city.
SELECT salesman.name AS "Salesman",customer.cust_name, customer.city FROM salesman,customer WHERE salesman.city=customer.city;

#2. From the following tables write a SQL query to find those orders where order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city. 
SELECT a.order_id,a.purch_amt,b.cust_name,b.city FROM Sales.orders a,Sales.customer b WHERE a.customer_id=b.customer_id AND a.purch_amt BETWEEN 500 AND 2000;

#3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he handle. Return Customer Name, city, Salesman, commission. 
SELECT a.cust_name AS "Customer_Name", a.city, b.name AS "Salesman", b.commission FROM customer a INNER JOIN salesman b ON a.salesman_id=b.salesman_id;

#4.From the following tables write a SQL query to find those salespersons who received a commission from the company more than 12%. Return Customer Name, customer city, Salesman, commission.
SELECT a.cust_name AS "Customer_Name", a.city, b.name AS "Salesman", b.commission FROM customer a INNER JOIN salesman b ON a.salesman_id=b.salesman_id WHERE b.commission>.12;

#5.From the following tables write a SQL query to find those salespersons do not live in the same city where their customers live and received a commission from the company more than 12%. Return Customer Name, customer city, Salesman, salesman city, commission.
SELECT a.cust_name AS "Customer_Name", a.city, b.name AS "Salesman", b.city,b.commission  FROM customer a  INNER JOIN salesman b  ON a.salesman_id=b.salesman_id WHERE b.commission>.12 AND a.city<>b.city;

#6.From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
SELECT a.order_id,a.ord_date,a.purch_amt,b.cust_name AS "Customer_Name", b.grade, c.name AS "Salesman", c.commission FROM orders a INNER JOIN customer b ON a.customer_id=b.customer_id INNER JOIN salesman c ON a.salesman_id=c.salesman_id;

#7.Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come.
SELECT * FROM orders NATURAL JOIN customer NATURAL JOIN salesman;

#8.From the following tables write a SQL query to display the cust_name, customer city, grade, Salesman, salesman city. The result should be ordered by ascending on customer_id.
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman",b.city FROM customer a LEFT JOIN salesman b ON a.salesman_id=b.salesman_id order by a.customer_id;

#9.From the following tables write a SQL query to find those customers whose grade less than 300. Return cust_name, customer city, grade, Salesman, saleman city. The result should be ordered by ascending customer_id.
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", b.city FROM customer a LEFT OUTER JOIN salesman b ON a.salesman_id=b.salesman_id WHERE a.grade<300 ORDER BY a.customer_id;

#10.Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders.
SELECT a.cust_name,a.city, b.order_id,b.ord_date,b.purch_amt AS "Order_Amount" FROM customer a LEFT OUTER JOIN orders b ON a.customer_id=b.customer_id order by b.ord_date;

#11. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders.
SELECT a.cust_name,a.city, b.order_id,b.ord_date,b.purch_amt FROM customer a LEFT OUTER JOIN orders b ON a.customer_id=b.customer_id order by b.ord_date;

#12. Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers.
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", b.city FROM customer a RIGHT OUTER JOIN salesman b ON b.salesman_id=a.salesman_id ORDER BY b.salesman_id;

#13. From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. Condition for selecting list of salesmen : 1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under any customer, Condition for selecting list of customer : 3. placed one or more orders, or 4. no order placed to their salesman.
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", c.order_id, c.ord_date, c.purch_amt FROM customer a RIGHT OUTER JOIN salesman b ON b.salesman_id=a.salesman_id RIGHT OUTER JOIN orders c ON c.customer_id=a.customer_id;

#14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer, may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", c.order_id, c.ord_date, c.purch_amt FROM customer a RIGHT OUTER JOIN salesman b ON b.salesman_id=a.salesman_id LEFT OUTER JOIN orders c ON c.customer_id=a.customer_id WHERE c.purch_amt>=2000 AND a.grade IS NOT NULL;

#15.Write a SQL statement to make a report with customer name, city, order no., order date, purchase amount for those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list.
SELECT a.cust_name,a.city, b.order_id,b.ord_date,b.purch_amt AS "Order_Amount" FROM customer a  FULL OUTER JOIN orders b ON a.customer_id=b.customer_id;

#16. Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who is neither in the list nor have a grade.
SELECT a.cust_name,a.city, b.order_id, b.ord_date,b.purch_amt AS "Order_Amount" FROM customer a FULL OUTER JOIN orders b ON a.customer_id=b.customer_id WHERE a.grade IS NOT NULL;

#17. Write a SQL query to combine each row of salesman table with each row of customer table.
SELECT * FROM salesman a CROSS JOIN customer b;

#18. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for that salesman who belongs to a city.
SELECT * FROM salesman a CROSS JOIN customer b WHERE a.city IS NOT NULL;

#19. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who belongs to a city and the customers who must have a grade.
SELECT * FROM salesman a CROSS JOIN  customer b WHERE a.city IS NOT NULL AND b.grade IS NOT NULL;

#20. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade.
SELECT * FROM salesman a CROSS JOIN customer b WHERE a.city IS NOT NULL AND b.grade IS NOT NULL AND  a.city<>b.city;

select * from Sales.salesman;
