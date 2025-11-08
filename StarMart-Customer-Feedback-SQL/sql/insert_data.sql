-- Customers Table Sample Data
INSERT INTO Customers (Name, Email, Age, Gender, JoinDate) VALUES
  ('Priya Sharma', 'priya@example.com', 28, 'Female', '2025-01-10'),
  ('Rahul Verma', 'rahul@email.com', 34, 'Male', '2024-12-22'),
  ('Meena Iyer', 'meena@email.com', 41, 'Female', '2025-02-18');

-- Products Table Sample Data
INSERT INTO Products (ProductName, Category, Price, Brand) VALUES
  ('Milk 500ml', 'Dairy', 32.00, 'Aavin'),
  ('Cornflakes', 'Cereal', 110.00, 'Kelloggs'),
  ('Shampoo', 'Personal Care', 140.00, 'Dove');

-- Stores Table Sample Data
INSERT INTO Stores (StoreName, Location) VALUES
  ('StarMart Anna Nagar', 'Chennai'),
  ('StarMart T Nagar', 'Chennai'),
  ('StarMart Velachery', 'Chennai');

-- Purchases Table Sample Data
INSERT INTO Purchases (CustomerID, StoreID, ProductID, PurchaseDate, Quantity, TotalAmount) VALUES
  (1, 1, 1, '2025-11-01', 2, 64.00),
  (2, 2, 2, '2025-11-02', 1, 110.00),
  (3, 3, 3, '2025-11-03', 1, 140.00);

-- Feedback Table Sample Data
INSERT INTO Feedback (CustomerID, ProductID, StoreID, FeedbackDate, Rating, Comment, SentimentScore) VALUES
  (1, 1, 1, '2025-11-01', 5, 'Very fresh milk, quick delivery.', 0.90),
  (2, 2, 2, '2025-11-02', 4, 'Cornflakes crisp and tasty.', 0.80),
  (3, 3, 3, '2025-11-03', 3, 'Shampoo packaging was not great.', 0.60);
