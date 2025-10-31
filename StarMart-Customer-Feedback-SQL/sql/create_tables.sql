-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    JoinDate DATE
);

-- Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(150) NOT NULL,
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    Brand VARCHAR(100)
);

-- Stores table
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY IDENTITY(1,1),
    StoreName VARCHAR(100) NOT NULL,
    Location VARCHAR(150)
);

-- Purchases table
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    StoreID INT NOT NULL,
    ProductID INT NOT NULL,
    PurchaseDate DATE NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    TotalAmount DECIMAL(12, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Feedback table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    StoreID INT NOT NULL,
    FeedbackDate DATE NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment VARCHAR(1000),
    SentimentScore DECIMAL(3, 2), -- e.g., 0.75, 0.90
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);
