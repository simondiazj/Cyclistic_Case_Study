-- Cyclistic Case Study
-- Author: Simon Diaz
-- Description: Exploratory Data Analysis (EDA)

-- 1. Total Rides by User Type
SELECT 
  member_casual,
  COUNT(*) AS total_rides
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final`
GROUP BY member_casual;


-- 2. Average Ride Duration (minutes)
SELECT 
  member_casual,
  AVG(ride_length)/60 AS avg_minutes
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final`
GROUP BY member_casual;


-- 3. Rides by Day of Week
SELECT 
  day_of_week,
  member_casual,
  COUNT(*) AS total_rides
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final`
GROUP BY day_of_week, member_casual;


-- 4. Rides by Hour of Day
SELECT 
  hour,
  member_casual,
  COUNT(*) AS total_rides
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final`
GROUP BY hour, member_casual
ORDER BY hour;


-- 5. Bike Type Usage
SELECT 
  rideable_type,
  member_casual,
  COUNT(*) AS total_rides
FROM `rising-cable-468102-u6.cyclistic_data.cyclistic_trips_final`
GROUP BY rideable_type, member_casual;
