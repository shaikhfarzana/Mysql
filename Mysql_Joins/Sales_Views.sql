/*
@Author: Farzana Shaikh
@Date: 29-01-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 31-01-2022 04:00PM
@Title : SQL Queries to Implement Views on Sales Database.
*/

use Sales;
#1. From the following table, create a view for those salespersons belong to the city 'New York'.
CREATE VIEW Newyorkstaff AS SELECT * FROM salesman WHERE city = 'New York';
SELECT * FROM Newyorkstaff;
UPDATE newyorkstaff SET commission = 20 WHERE salesman_id = 5001;
UPDATE newyorkstaff SET city = 'Mexico'WHERE salesman_id = 5001;
DROP VIEW Newyorkstaff;

#2.From the following table, create a view for all salespersons. Return salesperson ID, name, and city.
CREATE VIEW salesown AS SELECT salesman_id, name, city FROM salesman;
SELECT * FROM salesown;
UPDATE salesown  SET city = 'Amsterdam' WHERE salesman_id = 5001;
DROP VIEW salesown;


#3. From the following table, create a view to find the salespersons whose commision is more than 13.
CREATE VIEW SalesmanCom AS SELECT * FROM salesman WHERE  commission > 13;
SELECT * FROM SalesmanCom;

#4. From the following table, create a view to count the number of customers in each grade.
CREATE VIEW gradecount (grade, number) AS SELECT grade, COUNT(*) FROM customer GROUP BY grade;
SELECT * FROM gradecount;

#5. From the following table, create a view to count the number of unique customer, compute average and total purchase amount of customer orders by each date.
CREATE VIEW totalforday AS SELECT ord_date, COUNT(DISTINCT customer_id), AVG(purch_amt), SUM(purch_amt) FROM orders GROUP BY ord_date;
SELECT * FROM totalforday;

#6. From the following tables, create a view to get the salesperson and customer by name. Return order name, purchase amount, salesperson ID, name, customer name.
CREATE VIEW nameorders AS SELECT order_id, purch_amt, a.salesman_id, name, cust_name FROM orders a, customer b, salesman c WHERE a.customer_id = b.customer_id AND a.salesman_id = c.salesman_id;
SELECT * FROM nameorders;

#7. From the following tables, create a view to find the salesperson who handles a customer who makes the highest order of a day. Return order date, salesperson ID, name.
CREATE VIEW elitsalesman AS SELECT b.ord_date, a.salesman_id, a.name FROM salesman a, orders b WHERE a.salesman_id = b.salesman_id AND b.purch_amt = (SELECT MAX(purch_amt) FROM orders c WHERE c.ord_date = b.ord_date);
SELECT * FROM elitsalesman; 

#8. From the following tables, create a view to find the salesperson who handles the customer with the highest order, at least 3 times on a day. Return salesperson ID and name.
CREATE VIEW incentive AS SELECT DISTINCT salesman_id, name FROM elitsalesman a WHERE 3 <= (SELECT COUNT(*) FROM elitsalesman b WHERE a.salesman_id = b.salesman_id);
SELECT * FROM incentive;     
    
#9. From the following table, create a view to find all the customers who have the highest grade. Return all the fields of customer.
CREATE VIEW highgrade AS SELECT * FROM customer WHERE grade = (SELECT MAX(grade) FROM customer);
SELECT * FROM highgrade;

#10. From the following table, create a view to count number of the salesperson in each city. Return city, number of salespersons.
CREATE VIEW citynum AS SELECT city, COUNT(DISTINCT salesman_id)FROM salesman GROUP BY city;
SELECT * FROM citynum;

#11. From the following table, create a view to compute average purchase amount and total purchase amount for each salesperson. Return name, average purchase and total purchase amount. (Assume all names are unique).
CREATE VIEW norders AS SELECT name, AVG(purch_amt), SUM(purch_amt) FROM salesman, orders WHERE salesman.salesman_id = orders.salesman_id GROUP BY name;
SELECT * FROM norders;

#12. From the following tables, create a view to find those salespeople who handle more than one customer. Return all the fields of salesperson.
CREATE VIEW mcustomer AS SELECT * FROM salesman a WHERE 1 < (SELECT COUNT(*) FROM customer b WHERE a.salesman_id = b.salesman_id);
SELECT * FROM mcustomer;

#13. From the following tables, create a view that shows all matches of customers with salesperson such that at least one customer in the city of customer served by a salesperson in the city of the salesperson.
CREATE VIEW citymatch(custcity, salescity) AS SELECT DISTINCT a.city, b.city FROM customer a, salesman b WHERE a.salesman_id = b.salesman_id;
SELECT * FROM citymatch;

#14. From the following table, create a view to get number of orders in each day. Return order date and number of orders.
CREATE VIEW dateord(ord_date, odcount) AS SELECT ord_date, COUNT(*) FROM orders  GROUP BY ord_date;
SELECT * FROM dateord;

#15. From the following tables, create a view to find the salespersons who issued orders on October 10th, 2012. Return all the fields of salesperson.
CREATE VIEW salesmanonoct AS SELECT * FROM salesman WHERE salesman_id IN (SELECT salesman_id FROM orders WHERE ord_date = '2012-10-10');
SELECT * FROM salesmanonoct;

#16. From the following table, create a view to find the salespersons who issued orders on either August 17th, 2012 or October 10th, 2012. Return salesperson ID, order number and customer ID.
CREATE VIEW sorder AS SELECT salesman_id, order_id, customer_id FROM orders WHERE ord_date IN('2012-08-17', '2012-10-10');
SELECT * FROM sorder;

