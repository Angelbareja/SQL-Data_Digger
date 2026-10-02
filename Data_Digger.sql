SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS Data_Digger;

USE Data_Digger;

SHOW DATABASES;

CREATE TABLE Customers (
	CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Address VARCHAR(300)
);

CREATE TABLE Orders (
	OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL, 
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) 
);

CREATE TABLE Products (
	ProductID INT AUTO_INCREMENT PRIMARY KEY,
	ProductName VARCHAR(100) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	Stock INT NOT NULL DEFAULT 0
);

CREATE TABLE OrderDetails (
	OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    ProductID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    Quantity INT NOT NULL DEFAULT 0,
    SubTotal DECIMAL (10,2) NOT NULL
);

INSERT INTO Customers (Name, Email, Address) VALUES 
('Bob', 'bob@gmail.com', 'Delhi'),
('Alice', 'alice@gmail.com', 'Noida'),
('John', 'john@yahoo.com', 'Pune'),
('David', 'david@yahoo.com', 'Mumbai'),
('Tom', 'tom@hotmail.com', 'Bengaluru'),
('James', 'james@gmail.com', 'Kolkata');

SELECT * FROM Customers;

UPDATE Customers
SET Address = 'Ahemdabad'
WHERE CustomerID = 2;

DELETE FROM Customers 
WHERE CustomerID = 6;

SELECT * FROM Customers
WHERE Name = 'Alice';

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, CURDATE() - INTERVAL 5  DAY, 1197.00),   
(2, CURDATE() - INTERVAL 10 DAY, 1999.00),   
(3, CURDATE() - INTERVAL 20 DAY, 2298.00),   
(1, CURDATE() - INTERVAL 45 DAY, 2598.00),   
(4, CURDATE() - INTERVAL 60 DAY, 1693.00),   
(5, CURDATE() - INTERVAL 2  DAY, 1598.00),   
(2, CURDATE() - INTERVAL 1  DAY,  199.00); 

SELECT * FROM Orders
WHERE CustomerID = 1;

UPDATE Orders 
SET TotalAmount = 2799.00
WHERE OrderID = 3;

DELETE FROM Orders
WHERE OrderID = 7;

SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

SELECT MAX(TotalAmount) AS HighestOrder,
       MIN(TotalAmount) AS LowestOrder,
       ROUND(AVG(TotalAmount), 2) AS AverageOrder
FROM Orders;
 

INSERT INTO Products (ProductName, Price, Stock) VALUES
('Wireless Mouse',  799.00,  50),
('Keyboard',       1499.00,  30),
('USB Cable',       199.00, 200),
('Headphones',     1999.00,  25),
('Laptop Stand',   1299.00,  15),
('Webcam',         2499.00,   0),  
('Phone Case',      349.00, 100);

SELECT * FROM Products 
ORDER BY Price DESC;
 
UPDATE Products 
SET Price = 849.00 
WHERE ProductID = 1;
 
DELETE FROM Products 
WHERE ProductID = 6 AND Stock = 0;
 
SELECT * FROM Products 
WHERE Price BETWEEN 500 AND 2000;
 
SELECT MAX(Price) AS MostExpensive, MIN(Price) AS Cheapest FROM Products;

SELECT ProductName, Price FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products)
   OR Price = (SELECT MIN(Price) FROM Products);
   
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 1,  799.00),
(2, 3, 2,  398.00),
(2, 4, 1, 1999.00),
(3, 2, 1, 1499.00),
(4, 1, 1,  799.00),
(4, 5, 2, 2598.00),
(5, 3, 5,  995.00),
(6, 7, 2,  698.00);

SELECT od.OrderDetailID, od.OrderID, p.ProductName, od.Quantity, od.SubTotal
FROM OrderDetails od
JOIN Products p ON p.ProductID = od.ProductID
WHERE od.OrderID = 1;
 
SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;
 
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantity DESC
LIMIT 3;
 
SELECT COUNT(*) AS TimesSold FROM OrderDetails WHERE ProductID = 1;