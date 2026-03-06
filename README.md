# The Daily Grind: Sales and Pricing Analysis
<img width="67%" alt="image" src="https://github.com/user-attachments/assets/5d8d41b6-ab12-4354-ae92-2b2129547efe" />
<img width="67%" alt="image" src="https://github.com/user-attachments/assets/e4075879-9fcf-46aa-a354-484fbce660a5" />

**Project Overview:**
This project includes a data-backed pricing strategy to optimize coffee shop inventory. Raw sales data from 2023 to 2025 was imported into MySQL and processed. The data is then moved into Power Bi to create an interactive dashboard tracking Year-over-Year performance.

**The Problem:**
Management has noticed a strong drop in profit margins caused by a rising COGS and tariffs.

**Tasks:**
- Review all order data from 2023 to 2025.
- Show every product where the Gross Margin Percentage falls under 30%.
- Create a Power Bi dashboard that shows GMP, Revenue, Profit, Quantity by Category, Region and Customer Segment.
- Give clear recommendations using data on which items should be discontinued or have their prices raised.

**Data Cleaning:**
- Fixed mismatched dates, calculated missing revenue data and removed invalid customer records.
- Build variance checks to make sure the revenue matched the expected value.
- Used CTE to group customers into 6 different categories (Potential Loyalists, Loyal Customers, Top Customers, New Customers, At Risk, Lost).

**Key Insight and Recommendations:**
- The total revenue in 2025 went up by 3% to a total of $253.6K. However, the total profit dropped by 2.6% to $132.8K.
- The sales quantity is evenly spread across all product categories, between 19% to 22%. So this might mean that a pricing and COGS issue is happening.
- The Grinders & Brewers only takes up 19.27% of the sales, but generated 55.27% in profit. Meanwhile, Merchandise, Accessories, Consumables only generated less than 20% of the total profit.
- The "Potential Loyalists" customer segment takes up most of the financial of the business, which contributed $120.78K in revenue and 1.59K items purchased in 2025.
- Discontinue or price-hike: Review the bottom 3 items that have less than 30% margin to either discontinue or raise the price significantly (25% or more).
  - Chemex Filters (100 pack): 16.30% margin.
  - Minimalist Keychain: 16.33% margin.
  - Logo Hoodie (Black): 16.61% margin.
- Raise the price of the Gooseneck Electric Kettle, which is currently at a 29.08% margin, to get it above the 30% margin requirement.
<img width="40%" alt="image" src="https://github.com/user-attachments/assets/00eb7888-2a73-43ba-83d6-1287d93bc3ad" />
<img width="40%" alt="image" src="https://github.com/user-attachments/assets/56ba7085-b035-41c6-8357-54391240255a" />

**Dashboard Features:**
- Dynamic slicers to swap the dashboard visuals to analyze revenue, profit, margin and quantity.
- An RFM analysis to track performance metrics across 6 customer groups.
