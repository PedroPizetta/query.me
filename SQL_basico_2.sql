SELECT TOP 10 * FROM olist_customers_dataset

SELECT * FROM Customers;

SELECT COUNT (First_name)
From Customers 
Order by age asc;

SELECT C.First_name as Nome, C.Last_name AS [Sobrenome], O.item AS [Items], O. Amount AS VALOR
FROM Customers AS C
INNER JOIN Orders AS O ON C.customer_id = O.customer_id;

SELECT first_name,age, country
FROM Customers
Where country = "USA"
Group by age;

CREATE VIEW VW_PEDIDOS_POR_CLIENTE
AS
SELECT C.First_name as Nome, C.Last_name AS [Sobrenome], O.item AS [Items], O. Amount AS VALOR
FROM Customers AS C
INNER JOIN Orders AS O ON C.customer_id = O.customer_id;


