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

----- JOINS ----

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID
FROM Customers
FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID;



-- Exemplo de inserção de dados em uma tabela chamada "MinhaTabela"
INSERT INTO MinhaTabela (Nome, Idade, Cidade)
VALUES ('João', 30, 'São Paulo');

-- Inserir várias linhas em uma tabela
INSERT INTO MinhaTabela (Nome, Idade, Cidade)
VALUES ('João', 30, 'São Paulo'),
       ('Maria', 25, 'Rio de Janeiro'),
       ('Pedro', 35, 'Belo Horizonte');


-- Atualizar o nome do cliente com ID igual a 1
UPDATE Clientes
SET Nome = 'Novo Nome'
WHERE ID = 1;


-- Atualizar a idade de todos os clientes em São Paulo
UPDATE Clientes
SET Idade = 35
WHERE Cidade = 'São Paulo';


-- Atualizar o nome e a idade de um cliente
UPDATE Clientes
SET Nome = 'Novo Nome', Idade = 40
WHERE ID = 2;







