DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;

CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT,
    Region TEXT,
    Age INTEGER
);

CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Category TEXT,
    Price REAL
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER,
    OrderDate TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers VALUES
(1, 'Alice Johnson', 'North', 32),
(2, 'Bob Smith', 'South', 45),
(3, 'Carol White', 'East', 28),
(4, 'David Brown', 'West', 36),
(5, 'Emma Davis', 'North', 52),
(6, 'Frank Miller', 'South', 41),
(7, 'Grace Wilson', 'East', 29),
(8, 'Henry Moore', 'West', 38);

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 799.99),
(2, 'Phone', 'Electronics', 499.99),
(3, 'Tablet', 'Electronics', 599.99),
(4, 'Monitor', 'Accessories', 399.99),
(5, 'Headphones', 'Accessories', 149.99),
(6, 'Keyboard', 'Accessories', 79.99),
(7, 'Desk Chair', 'Furniture', 299.99),
(8, 'Standing Desk', 'Furniture', 499.99);

INSERT INTO Orders VALUES
(1, 1, 1, 2, '2024-01-05'),
(2, 2, 3, 1, '2024-01-08'),
(3, 3, 2, 3, '2024-01-12'),
(4, 4, 5, 2, '2024-01-15'),
(5, 5, 1, 1, '2024-01-18'),
(6, 6, 4, 2, '2024-01-20'),
(7, 7, 7, 1, '2024-01-22'),
(8, 8, 3, 2, '2024-01-25'),
(9, 1, 2, 1, '2024-02-01'),
(10, 3, 6, 3, '2024-02-05'),
(11, 5, 8, 1, '2024-02-08'),
(12, 2, 1, 2, '2024-02-10'),
(13, 4, 3, 1, '2024-02-14'),
(14, 6, 2, 2, '2024-02-18'),
(15, 8, 5, 3, '2024-02-20');

-- Query 1: Customers in North region
SELECT Name, Region, Age
FROM Customers
WHERE Region = 'North';

-- Query 2: All orders with customer and product details
SELECT 
    c.Name AS Customer,
    c.Region,
    p.ProductName AS Product,
    p.Category,
    o.Quantity,
    p.Price,
    (o.Quantity * p.Price) AS Total_Spent,
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
ORDER BY Total_Spent DESC;

-- Query 3: Total spending per customer
SELECT 
    c.Name AS Customer,
    c.Region,
    COUNT(o.OrderID) AS Total_Orders,
    SUM(o.Quantity * p.Price) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerID
ORDER BY Total_Spent DESC;

-- Query 4: Best selling product categories
SELECT 
    p.Category,
    COUNT(o.OrderID) AS Total_Orders,
    SUM(o.Quantity * p.Price) AS Total_Revenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Total_Revenue DESC;
