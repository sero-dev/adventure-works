--1. From the following table write a query in SQL to retrieve all rows and columns from the employee table in the Adventureworks database. Sort the result set in ascending order on jobtitle.
--Sample table: HumanResources.Employee
SELECT * 
FROM HumanResources.Employee
ORDER BY JobTitle

--2. From the following table write a query in SQL to retrieve all rows and columns from the employee table using table aliasing in the Adventureworks database. Sort the output in ascending order on lastname.
--Sample table: Person.Person
SELECT P.* 
FROM Person.Person P
ORDER BY LastName

--3. From the following table write a query in SQL to return all rows and a subset of the columns (FirstName, LastName, businessentityid) from the person table in the AdventureWorks database. The third column heading is renamed to Employee_id. Arranged the output in ascending order by lastname.
--Sample table: Person.Person
SELECT FirstName, LastName, BusinessEntityID [EmployeeID]
FROM Person.Person
ORDER BY LastName

--4. From the following table write a query in SQL to return only the rows for product that have a sellstartdate that is not NULL and a productline of 'T'. Return productid, productnumber, and name. Arranged the output in ascending order on name.
--Sample table: production.Product
SELECT ProductID, ProductNumber, [Name]
FROM Production.Product
WHERE 1=1
	AND SellStartDate IS NOT NULL
	AND ProductLine = 'T'
ORDER BY [Name]

--5. From the following table write a query in SQL to return all rows from the salesorderheader table in Adventureworks database and calculate the percentage of tax on the subtotal have decided. Return salesorderid, customerid, orderdate, subtotal, percentage of tax column. Arranged the result set in ascending order on subtotal.
--Sample table: sales.salesorderheader
SELECT SalesOrderId, CustomerID, OrderDate, SubTotal
	, TaxAmt / SubTotal * 100 [TaxPercent]
FROM Sales.SalesOrderHeader
ORDER BY SubTotal

--6. From the following table write a query in SQL to create a list of unique jobtitles in the employee table in Adventureworks database. Return jobtitle column and arranged the resultset in ascending order.
--Sample table: HumanResources.Employee
SELECT DISTINCT JobTitle
FROM HumanResources.Employee

--7. From the following table write a query in SQL to calculate the total freight paid by each customer. Return customerid and total freight. Sort the output in ascending order on customerid.
--Sample table: sales.salesorderheader
SELECT CustomerID, SUM(Freight) [TotalFreight]
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID

--8. From the following table write a query in SQL to find the average and the sum of the subtotal for every customer. Return customerid, average and sum of the subtotal. Grouped the result on customerid and salespersonid. Sort the result on customerid column in descending order.
--Sample table: sales.salesorderheader
SELECT CustomerID, SalesPersonID, AVG(SubTotal) [AvgSubTotal], SUM(SubTotal) [SumSubTotal]
FROM Sales.SalesOrderHeader
GROUP BY CustomerID, SalesPersonID
ORDER BY CustomerID DESC

--9. From the following table write a query in SQL to retrieve total quantity of each productid which are in shelf of 'A' or 'C' or 'H'. Filter the results for sum quantity is more than 500. Return productid and sum of the quantity. Sort the results according to the productid in ascending order.
--Sample table: production.productinventory
SELECT ProductID, SUM(Quantity) [TotalQuantity]
FROM Production.ProductInventory
WHERE Shelf IN ('A', 'C', 'H')
GROUP BY ProductID
ORDER BY ProductID

--10. From the following table write a query in SQL to find the total quentity for a group of locationid multiplied by 10.
--Sample table: production.productinventory
SELECT SUM(Quantity) [TotalQuantity]
FROM Production.ProductInventory
GROUP BY (LocationID * 10)

--11. From the following tables write a query in SQL to find the persons whose last name starts with letter 'L'. Return BusinessEntityID, FirstName, LastName, and PhoneNumber. Sort the result on lastname and firstname.
--Sample table: Person.PersonPhone
SELECT Person.BusinessEntityID, Person.FirstName, Person.LastName, Phone.PhoneNumber
FROM Person.PersonPhone Phone
JOIN Person.Person Person
	ON Person.BusinessEntityID = Phone.BusinessEntityID
WHERE Person.LastName LIKE 'L%'
ORDER BY LastName, FirstName

--12. From the following table write a query in SQL to find the sum of subtotal column. Group the sum on distinct salespersonid and customerid. Rolls up the results into subtotal and running total. Return salespersonid, customerid and sum of subtotal column i.e. sum_subtotal.
--Sample table: sales.salesorderheader
SELECT *
FROM Sales.SalesOrderHeader

--13. From the following table write a query in SQL to find the sum of the quantity of all combination of group of distinct locationid and shelf column. Return locationid, shelf and sum of quantity as TotalQuantity.
--Sample table: production.productinventory

--14. From the following table write a query in SQL to find the sum of the quantity with subtotal for each locationid. Group the results for all combination of distinct locationid and shelf column. Rolls up the results into subtotal and running total. Return locationid, shelf and sum of quantity as TotalQuantity.
--Sample table: production.productinventory

--15. From the following table write a query in SQL to find the total quantity for each locationid and calculate the grand-total for all locations. Return locationid and total quantity. Group the results on locationid.
--Sample table: production.productinventory

--16. From the following table write a query in SQL to retrieve the number of employees for each City. Return city and number of employees. Sort the result in ascending order on city.
--Sample table: Person.BusinessEntityAddress

--17. From the following table write a query in SQL to retrieve the total sales for each year. Return the year part of order date and total due amount. Sort the result in ascending order on year part of order date.
--Sample table: Sales.SalesOrderHeader

--18. From the following table write a query in SQL to retrieve the total sales for each year. Filter the result set for those orders where order year is on or before 2016. Return the year part of orderdate and total due amount. Sort the result in ascending order on year part of order date.
--Sample table: Sales.SalesOrderHeader

--19. From the following table write a query in SQL to find the contacts who are designated as a manager in various departments. Returns ContactTypeID, name. Sort the result set in descending order.
--Sample table: Person.ContactType

--20. From the following tables write a query in SQL to make a list of contacts who are designated as 'Purchasing Manager'. Return BusinessEntityID, LastName, and FirstName columns. Sort the result set in ascending order of LastName, and FirstName.
--Sample table: Person.BusinessEntityContact