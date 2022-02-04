/*
@Author: Farzana Shaikh
@Date: 02-02-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 02-02-2022 04:00PM
@Title : SQL Queries to Implement Indexes on Sales Database.
*/


SELECT * FROM Sales.customer;
ALTER TABLE Sales.customer ADD grade int;

CREATE INDEX custcity ON customer(city);
SELECT * FROM custcity;

DROP INDEX custcity;


