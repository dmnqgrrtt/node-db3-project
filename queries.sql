-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.productname,
       c.categoryname
  FROM product AS p
       JOIN
       category AS c ON c.id = p.CategoryId;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id,
       s.companyname
  FROM [order] AS o
       JOIN
       shipper AS s ON s.id = o.ShipVia
 WHERE o.OrderDate < "2012-08-09";


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.productname,
       o.quantity
  FROM product AS p
       JOIN
       orderdetail AS o ON p.id = o.ProductId
 WHERE o.orderid = 10251
 ORDER BY p.productname;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id AS [Order ID],
       c.companyname AS [Company Name],
       e.lastname AS [Employee Last Name]
  FROM [order] AS o
       JOIN
       customer AS c ON o.CustomerId = c.id
       JOIN
       employee AS e ON e.id = o.employeeid;




