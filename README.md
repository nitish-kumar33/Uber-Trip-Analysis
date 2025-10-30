# 🚗 Uber Trip Analysis Project

## 🧭 Project Overview
This project analyzes Uber trip data for Jan–Feb 2015 to explore ride trends, fleet activity, and base-level performance using SQL and Power BI.

## 🛠️ Tools and Technologies
- **PostgreSQL** – Data cleaning, transformation, and aggregation  
- **Power BI** – Visualization and KPI dashboard  
- **Excel/CSV** – Data source  

## 📊 Data Source and SQL Analysis
**Dataset:** Uber-Jan-Feb-FOIL.csv  
**Columns:** Base, Date, Active Vehicles, Trips  

**SQL Tasks:**
- Created and populated `uber_trips` table  
- Cleaned data (nulls, type casting, date conversion)  
- Performed aggregations: total trips, base-level trips, monthly summary  
- Explored relationships between active vehicles and trip volumes  

## 📈 Power BI Dashboard
- KPIs: Total Trips (4M), Avg Trips/Day (70K), Active Vehicles (354)  
- Visuals: Daily trend, base performance, month distribution, active vs trips  
- Filters: Date and Base slicers  

## 🔄 Workflow
1. Data import → 2. SQL cleaning → 3. Power BI modeling → 4. Visualization → 5. Insights  

## 💡 Key Insights
- Base B02764 handled ~2M trips (highest)  
- January trips (53.79%) > February (46.21%)  
- Positive correlation between active vehicles and trips  
- Daily ride trends show fluctuating demand  

## ⚙️ Challenges & Learnings
- Fixed date format issues using `TO_DATE()`  
- Removed nulls and optimized data types  
- Designed effective DAX measures and KPIs  

## 🏁 Conclusion
This project highlights a complete analytics pipeline — from raw data cleaning in SQL to insight-driven visualization in Power BI.  
It demonstrates operational analysis that can support decision-making in ride-sharing logistics and fleet management.
