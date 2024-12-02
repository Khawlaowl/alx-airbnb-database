# Partition Performance Report

## Objective
The objective of this task was to improve query performance for the `Booking` table by implementing table partitioning based on the `start_date` column. 

---

## Approach
1. **Partition Strategy**: 
   - The `Booking` table was partitioned by range, with each partition representing a specific date range.
   - Example partitions:
     - `p2024_01`: Bookings in January 2024.
     - `p2024_02`: Bookings in February 2024.
     - `p_max`: All future dates.

2. **Test Query**:
   A query was executed to fetch bookings within the range of `2024-01-01` to `2024-01-31` before and after partitioning:
   ```sql
   SELECT * 
   FROM Booking 
   WHERE start_date BETWEEN '2024-01-01' AND '2024-01-31';

