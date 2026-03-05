USE grid_sales;

-- The date format for 2025 is different from the 2023 and 2024 file
SELECT
	OrderID,
	OrderDate
FROM orders_2025
LIMIT 20;

-- Some of the CustomerID and Revenue is missing
SELECT *
FROM orders_2023
-- WHERE CustomerID IS NULL OR CustomerID = ''
WHERE Revenue IS NULL OR CustomerID = '';

-- Create a new table combining all data
CREATE TABLE all_orders AS
SELECT
	o.OrderID,
    o.CustomerID,
    o.ProductID,
    o.OrderDate,
    o.Quantity,
    CASE WHEN Revenue IS NULL OR REVENUE = '' THEN p.Price*o.Quantity ELSE o.Revenue END AS Revenue,
    o.COGS
FROM (
	SELECT
		OrderID,
		CustomerID,
		ProductID,
		CAST(OrderDate AS DATE) AS OrderDate,
		Quantity,
		Revenue,
		COGS
	FROM orders_2023
	UNION ALL
	SELECT
		OrderID,
		CustomerID,
		ProductID,
		CAST(OrderDate AS DATE) AS OrderDate,
		Quantity,
		Revenue,
		COGS
	FROM orders_2024
	UNION ALL
	SELECT
		OrderID,
		CustomerID,
		ProductID,
		STR_TO_DATE(OrderDate, '%m/%d/%Y') AS OrderDate,
		Quantity,
		Revenue,
		COGS
	FROM orders_2025
) o
LEFT JOIN products p ON o.ProductID = p.ProductID
WHERE CustomerID IS NOT NULL AND CustomerID != '';

Select *
FROM all_orders;

SELECT *
FROM all_orders
WHERE Revenue = '' OR CustomerID IS NULL; -- The table now doesn't have any null or empty string in those 2 columns

-- Checking if the revenue makes sense for data integrity
SELECT
	a.OrderID,
	a.Revenue,
    (a.Quantity*p.Price) AS ExprectedRevenue,
    (a.Revenue - (a.Quantity*p.Price)) AS Var
FROM all_orders a
JOIN products p ON a.ProductID = p.ProductID
HAVING Var > 0.01 OR Var < -0.01; -- No results, so it is correct

-- Query to show which customer is loyal, new, ...
CREATE VIEW v_customer_rfm AS
WITH rfm AS (
	SELECT
		CustomerID,
        MAX(OrderDate) AS LastOrderDate,
        DATEDIFF('2025-12-31', MAX(OrderDate)) AS LastPurchaseDate,
        COUNT(DISTINCT(OrderID)) AS Frequency,
        SUM(Revenue) AS Monetary
	FROM all_orders
    GROUP BY CustomerID
),
rfm_scored AS (
	SELECT
		*,
        -- Score from 1 -> 4 (highest)
        NTILE(4) OVER (ORDER BY LastOrderDate DESC) AS R,
        NTILE(4) OVER (ORDER BY Frequency ASC) AS F,
        NTILE(4) OVER (ORDER BY Monetary ASC) AS M
	FROM rfm
)
SELECT
	CustomerID,
    LastOrderDate,
    Frequency,
    Monetary,
    CONCAT(R, F, M) AS RFM,
    CASE
		WHEN (R = 4 AND F = 4 AND M = 4) THEN 'Top Customers'
        WHEN (R >= 3 AND F >= 3 AND M >= 3) THEN 'Loyal Customers'
        WHEN (R >= 3 AND F = 1) THEN 'New Customers'
        WHEN (R = 1 AND F >= 3) THEN 'At Risk'
        WHEN (R = 1 AND F = 1) THEN 'Lost'
        ELSE 'Potential Loyalist'
	END AS CustomerSegment
FROM rfm_scored;

-- Checking the view values if they make sense
SELECT * FROM v_customer_rfm
LIMIT 10;

SELECT * FROM v_customer_rfm 
WHERE CustomerSegment = 'Top Customers' 
ORDER BY Monetary DESC
LIMIT 10;

SELECT 
    CustomerSegment,
    COUNT(*) as TotalCustomers,
    FORMAT(AVG(Monetary), 2) as Avg_Spend
FROM v_Customer_RFM
GROUP BY CustomerSegment
ORDER BY TotalCustomers DESC;

-- Create a main dataset query
SELECT
	a.OrderID,
    a.CustomerID,
    c.Region,
    a.ProductID,
    a.OrderDate,
	DATE_SUB(a.OrderDate, INTERVAL WEEKDAY(a.OrderDate) DAY) AS WeekDate,
    c.CustomerJoinDate,
    a.Quantity,
    a.Revenue,
    a.Revenue - a.COGS AS Profit,
    a.COGS,
    p.ProductName,
    p.ProductCategory,
    p.Price,
    p.Base_Cost
FROM all_orders a
LEFT JOIN customers c ON a.CustomerID = c.CustomerID
LEFT JOIN products p ON a.ProductID = p.ProductID;