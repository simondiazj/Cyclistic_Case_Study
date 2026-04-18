# Cyclistic_Case_Study
Project for Cyclistic company, identifying the behavior of regular users versus members for marketing strategy (Google Data Analytics Capstone)
## 🟢Project Framework
This project follows the six-step data analysis process from the Google Data Analytics Certificate: Ask-Prepare-Process-Analize-Share-Act
## 🔵Business Task
The goal of this project is to analyze how casual riders and annual members use Cyclistic bikes differently, and provide recommendations to convert casual riders into members.

### 🔴Key Business Questions
1. How do annual members and casual riders use Cyclistc bikes differently?
2. Why would casual riders buy Cyclist annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?
### 🟡Scope of This Analysis
This project is part of a team-based analysis. The focus of this work is on the first question:

**How do annual members and casual riders use Cyclistic bikes differently?**

## 🔵Objetives
- Analyze usage patterns (duration, frequency, days) among casual users and  annual members.
- Identify patterns to generate insights.
- Share key findings.
- Generate recommendations.

## 🟢Data Source

The dataset used for this project is provided by Divvy Bikes, a bike-sharing system in Chicago, as part of the Cyclistic case study from the Google Data Analytics Certificate.

This analysis includes the **most recent five years of available data**, with the latest records up to **March 2026**.

Data is publicly available at: [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)

Due to file size limitations, the dataset is not stored in this repository and must be downloaded from the official source.

## 🔵Data Privacy and License

The dataset is made available by Divvy Bikes under the following license agreement:
[Divvy Data License Agreement](https://www.divvybikes.com/data-license-agreement)

The data has been anonymized and does not include personally identifiable information (PII).

##  🔴Data Cleaning and Preparation Process

### 1. File Preparation

During the initial data loading process, duplicate file names were identified. Two CSV files corresponding to January 2025 and January 2026 had identical names, which could lead to overwriting or confusion.

To resolve this, the files were renamed to ensure each dataset had a unique and identifiable name before importing into the database.

---

### 2. Data Validation

The dataset was reviewed to ensure that key columns were in the correct format. The `started_at` and `ended_at` fields were confirmed to be in TIMESTAMP format, allowing accurate time-based calculations.

---

### 3. Creating Ride Duration

A new variable, `ride_length`, was created using the difference between `ended_at` and `started_at` to calculate the duration of each trip in seconds.

---

### 4. Removing Invalid Records

Records with ride durations less than or equal to zero were identified as invalid (e.g., trips ending before they started).
A total of 17,007 records (approximately 0.05% of the dataset) were removed to ensure data accuracy.

---

### 5. Removing Duplicates

Duplicate records were identified using `ride_id`.
Duplicates were removed by keeping only one record per `ride_id`, ensuring each trip is uniquely represented.

---

### 6. Data Verification

After cleaning, the dataset was validated to confirm:

* No remaining invalid ride durations
* No duplicate records

---
### 7. Removing Outliers

Ride duration distribution was analyzed using quantiles.
Most trips were under 30 minutes, with extreme values reaching up to several days.

To ensure realistic analysis, trips longer than 2 hours were removed.

---

### 8. Feature Engineering

Additional variables were created to support analysis:

* `ride_length`: trip duration in seconds
* `day_of_week`: day name extracted from `started_at`
* `hour`: hour of the day extracted from `started_at`

## 🟡Key Insights

**Usage Frequency**  
Members account for a higher number of total rides compared to casual users, indicating more frequent and consistent usage of the bike-sharing service.

**Ride Duration**  
Casual riders have a higher average ride duration than members, suggesting a tendency toward longer, less frequent trips.

**Weekly Behavior**  
Casual riders show increased activity during weekends, while members are more active on weekdays, reflecting different usage patterns between the two groups.

**Hourly Behavior**  
Members exhibit clear peak usage during morning and late afternoon hours, while casual riders display a more gradual increase in activity, with peak usage occurring later in the day.

**Bike Type Preference**  
Both user groups show a preference for electric bikes, followed by classic bikes, while electric scooters show minimal usage across both groups.

**Overall Insight**  
Overall, members demonstrate more consistent and frequent usage patterns, while casual riders exhibit longer and more variable ride behavior, particularly during weekends and later hours of the day.
