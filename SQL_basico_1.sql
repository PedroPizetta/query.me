SELECT * 
FROM Production.Product
Where color = 'Black'or  color = 'silver'

SELECT * 
FROM Production.Product
Where ListPrice > 1200 and ListPrice < 3000

SELECT * 
FROM Production.Product
Where color <> 'RED'

SELECT Name
FROM Production.Product
Where Weight > '500' and Weight <= '700'

SELECT * 
FROM HumanResources.Employee
Where MaritalStatus = 'S' and SalariedFlag = '1'

SELECT * 
FROM HumanResources.Employee
Where MaritalStatus = 'M' and SalariedFlag = '1'

SELECT * 
FROM Person.Person
Where FirstName = 'Peter' and LastName = 'Krebs'


SELECT * 
FROM Person.EmailAddress
Where BusinessEntityID = '26'


--Count
SELECT COUNT(*)
FROM TABELA

SELECT COUNT(DISTINCT coluna1)
FROM TABELA


--Pratica

SELECT *
FROM Person.Person;


SELECT COUNT(*)
FROM Person.Person

SELECT COUNT(Title)
FROM Person.Person

SELECT COUNT(DISTINCT Title)
FROM Person.Person


SELECT COUNT(*)
FROM Person.Person
WHERE Title = 'Ms.'


SELECT *
FROM Production.Product

SELECT COUNT(*)
FROM Production.Product

SELECT COUNT( DISTINCT Size)
FROM Production.Product

-- Aula de TOP

SELECT TOP 10*
FROM TABELA

SELECT TOP 10*
FROM Production.Product

-- Aula de ORDER BY

SELECT coluna1, coluna2
FROM Tabela 
ORDER BY coluna1 asc/desc

SELECT *
FROM Person.Person
ORDER BY FirstName asc;


SELECT *
FROM Person.Person
ORDER BY FirstName desc;

SELECT *
FROM Person.Person
ORDER BY FirstName asc, LastName desc;

SELECT FirstName ,LastName
FROM Person.Person
ORDER BY FirstName asc, LastName desc;

-- Por convesão é bom colocar os paramentros de coluna, porém dá pra ordenar sem como bo exemplo abaixo.
SELECT FirstName ,LastName
FROM Person.Person
ORDER BY MiddleName asc

SELECT TOP 10*
FROM Production.Product
ORDER BY ListPrice asc

SELECT TOP 10*
FROM Production.Product
ORDER BY ListPrice desc


SELECT TOP 4 ProductID
FROM Production.Product
ORDER BY ListPrice desc

SELECT *
FROM person.Person
WHERE FirstName LIKE '%ro'






