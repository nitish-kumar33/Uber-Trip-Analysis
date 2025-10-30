
----create table

DROP TABLE IF EXISTS uber_trips CASCADE;

CREATE TABLE uber_trips (
    dispatching_base_num VARCHAR(20),
    date VARCHAR(20),
    active_vehicles VARCHAR(20),
    trips INT
);


----show table
select * from uber_trips;

----load data
COPY uber_trips(dispatching_base_num, date, active_vehicles, trips)
FROM 'C:\Users\NITISH KUMAR\Downloads\Data Analyst & Data Science\data analyst\to do\Uber Trip Analysis\Uber-Jan-Feb-FOIL(Raw).csv'
DELIMITER ','
CSV HEADER;

-----Convert date
ALTER TABLE uber_trips ADD COLUMN trip_date DATE;

UPDATE uber_trips
SET trip_date = TO_DATE(date, 'MM/DD/YYYY');

ALTER TABLE uber_trips DROP COLUMN date;
ALTER TABLE uber_trips RENAME COLUMN trip_date TO date;


---Data Cleaning & Validation
-- 1. Check for null values
SELECT COUNT(*) FROM uber_trips WHERE date IS NULL OR trips IS NULL;

-- 2. Remove rows with missing or invalid entries
DELETE FROM uber_trips WHERE trips IS NULL OR date IS NULL;

-- 3. Convert active_vehicles column to integer if stored as text
ALTER TABLE uber_trips ALTER COLUMN active_vehicles TYPE INT USING active_vehicles::INTEGER;

----Exploratory Data Analysis (SQL)

---Total Trips
SELECT SUM(trips) AS total_trips FROM uber_trips;

----Trips by Date
SELECT date, SUM(trips) AS daily_trips
FROM uber_trips
GROUP BY date
ORDER BY date;

---Trips by Dispatching Base
SELECT dispatching_base_num, SUM(trips) AS total_trips
FROM uber_trips
GROUP BY dispatching_base_num
ORDER BY total_trips DESC;

----Active Vehicles per Base
SELECT dispatching_base_num, AVG(active_vehicles) AS avg_active_vehicles
FROM uber_trips
GROUP BY dispatching_base_num
ORDER BY avg_active_vehicles DESC;

---Relationship Between Active Vehicles and Trips
SELECT active_vehicles, SUM(trips) AS total_trips
FROM uber_trips
GROUP BY active_vehicles
ORDER BY active_vehicles;

---Monthly Trip Summary
SELECT EXTRACT(MONTH FROM date) AS month, SUM(trips) AS total_trips
FROM uber_trips
GROUP BY month
ORDER BY month;



