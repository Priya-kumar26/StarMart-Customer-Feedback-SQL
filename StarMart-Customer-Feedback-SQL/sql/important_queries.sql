-- 1. Average Sentiment Score by Product (StarMart brand)
SELECT p.ProductName, AVG(f.SentimentScore) AS AvgSentiment
FROM Feedback f
JOIN Products p ON f.ProductID = p.ProductID
WHERE p.Brand = 'StarMart'
GROUP BY p.ProductName
ORDER BY AvgSentiment DESC;

-- 2. Top 5 Products by Positive Feedback (Rating >= 4) in StoreID 101
SELECT TOP 5 p.ProductName, COUNT(*) AS PositiveFeedbackCount
FROM Feedback f
JOIN Products p ON f.ProductID = p.ProductID
WHERE f.StoreID = 101 AND f.Rating >= 4
GROUP BY p.ProductName
ORDER BY PositiveFeedbackCount DESC;

-- 3. Monthly Feedback Sentiment Trend for StarMart Stores
SELECT YEAR(f.FeedbackDate) AS Year, MONTH(f.FeedbackDate) AS Month, AVG(f.SentimentScore) AS AvgMonthlySentiment
FROM Feedback f
JOIN Stores s ON f.StoreID = s.StoreID
WHERE s.StoreName LIKE '%StarMart%'
GROUP BY YEAR(f.FeedbackDate), MONTH(f.FeedbackDate)
ORDER BY Year, Month;

-- 4. Customers with Low Ratings (<= 2) but High Purchase Volume in Last 6 Months (identify at-risk customers)
SELECT c.CustomerID, c.Name, COUNT(p.PurchaseID) AS PurchaseCount, AVG(f.Rating) AS AvgRating
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
JOIN Feedback f ON c.CustomerID = f.CustomerID
WHERE f.Rating <= 2 
  AND p.PurchaseDate BETWEEN DATEADD(month, -6, GETDATE()) AND GETDATE()
GROUP BY c.CustomerID, c.Name
HAVING COUNT(p.PurchaseID) > 5
ORDER BY AvgRating ASC;

-- 5. Store-wise Average Customer Satisfaction by Product Category
SELECT s.StoreName, p.Category, AVG(f.Rating) AS AvgRating
FROM Feedback f
JOIN Stores s ON f.StoreID = s.StoreID
JOIN Products p ON f.ProductID = p.ProductID
WHERE p.Brand = 'StarMart'
GROUP BY s.StoreName, p.Category
ORDER BY s.StoreName, AvgRating DESC;
