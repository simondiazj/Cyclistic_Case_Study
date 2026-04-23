-- ============================================
-- Cyclistic Case Study - Data Cleaning (SQL)
-- Author: Simon Diaz
-- ============================================

-- Dataset:
-- rising-cable-468102-u6.cyclistic_data.cyclistic_trips

-- ============================================
-- 1. Calculate Ride Duration (Exploration)
-- ============================================

SELECT 
  ride_id,
  started_at,
  ended_at,
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips`;


-- ============================================
-- 2. Identify Invalid Durations
-- ============================================

SELECT 
  COUNT(*) AS total_rides,
  COUNTIF(TIMESTAMP_DIFF(ended_at, started_at, SECOND) <= 0) AS invalid_rides
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips`;


-- ============================================
-- 3. Remove Invalid Records
-- ============================================

CREATE OR REPLACE TABLE `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_cleaned` AS 
SELECT *
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips`
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 0;


-- ============================================
-- 4. Identify Duplicate Records
-- ============================================

SELECT 
  ride_id,
  COUNT(*) AS record_count
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_cleaned`
GROUP BY ride_id
HAVING COUNT(*) > 1;


-- ============================================
-- 5. Remove Duplicates
-- ============================================

CREATE OR REPLACE TABLE `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_cleaned_v2` AS
SELECT *
FROM (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY started_at) AS row_num
  FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_cleaned`
)
WHERE row_num = 1;


-- ============================================
-- 6. Create Analysis Features
-- ============================================

CREATE OR REPLACE TABLE `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final` AS
SELECT 
  *,
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length,
  FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_cleaned_v2`;


-- ============================================
-- 7. Detect Outliers
-- ============================================

SELECT 
  MIN(ride_length) AS min_duration,
  MAX(ride_length) AS max_duration
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final`;

SELECT 
  APPROX_QUANTILES(ride_length, 10) AS distribution
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final`;


-- ============================================
-- 8. Remove Outliers
-- ============================================

CREATE OR REPLACE TABLE `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final` AS 
SELECT *
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final`
WHERE ride_length BETWEEN 1 AND 7200;


-- ============================================
-- 9. Final Validation
-- ============================================

SELECT 
  MIN(ride_length) AS min_duration,
  MAX(ride_length) AS max_duration,
  AVG(ride_length) AS avg_duration
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final`;
