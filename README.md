# The Daily Grind: Sales and Pricing Analysis
<img width="67%" alt="image" src="https://github.com/user-attachments/assets/5d8d41b6-ab12-4354-ae92-2b2129547efe" />
<img width="67%" alt="image" src="https://github.com/user-attachments/assets/e4075879-9fcf-46aa-a354-484fbce660a5" />

**Project Overview:**
This project consists a data-backed pricing strategy to optimize coffee shop inventory. Raw sales data from 2023 to 2025 was proccessed in MySQL. The data is then imported into Power Bi to build an interactive dashboard tracking Year-over-Year performance.

**The Problem:**
Management have noticed a strong drop in profit margins caused by a rising COGS and tariffs.

**Tasks:**
- Review all order data from 2023 to 2025.
- Identify all products with a Gross Margin % (GMP) below 30%.
- Build an interactive Power Bi dashboard showing Year-over-Year GMP, Revenue, Profit, Quantity by Category, Region and Customer Segment.
- Give clear, data-backed recommendations on which items need a price increase or discontinuation.

**Data Processing and Transformation**
- Fixed mismatched dates, calculated missing revenue data and removed invalid customer records.
- Build variance checks to make sure the revenue matched the expected value.
- Used CTE to group customers into 6 different categories (Potential Loyalists, Loyal Customers, Top Customers, New Customers, At Risk, Lost).

**Key Insight and Recommendations:**
- The overall revenue in 2025 grew by 3% to a total of $253.6K, however the total profit dropped by 2.6% to $132.8K.
- The sales quantity is evenly spread across all product categories, between 19% to 22%. So this might mean that a pricing and COGS issue is happenning.
- The "Potential Loyalists" customer segment takes up most of the financial of the business, which contributed $120.78K in revenue and 1.59K items purchased in 2025.
- Discontinue or price-hike: Review the bottom 3 items that have less than 30% margin to either discontinue or raise the price significantly (25% or more)
  - Chemex Filters (100 pack): 16.30% margin.
  - Minimalist Keychain: 16.33% margin.
  - Logo Hoodie (Black): 16.61% margin.
- Raise the price of the Gooseneck Electric Kettle, which is currently at a 29.08% margin, to get it above the 30% margin requirement.
<img width="40%" alt="image" src="https://github.com/user-attachments/assets/00eb7888-2a73-43ba-83d6-1287d93bc3ad" />
<img width="40%" alt="image" src="https://github.com/user-attachments/assets/56ba7085-b035-41c6-8357-54391240255a" />

**Dashboard Features:**
- Dynamis slicers to swap the dashboard visuals to analyze revenue, profit, margin and quantity.
- A RFM analysis to track performance metrics across 6 customer groups.
