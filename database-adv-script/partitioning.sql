-- Create a partitioned Booking table based on the start_date column
CREATE TABLE Booking_Partitioned (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date) (
    PARTITION p2023_1 VALUES LESS THAN ('2023-07-01'),
    PARTITION p2023_2 VALUES LESS THAN ('2023-12-31'),
    PARTITION p2024 VALUES LESS THAN ('2024-12-31'),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- Insert data from the original Booking table into the partitioned table
INSERT INTO Booking_Partitioned
SELECT * FROM Booking;

-- Query the partitioned table to ensure data integrity
SELECT * 
FROM Booking_Partitioned 
WHERE start_date BETWEEN '2023-01-01' AND '2023-06-30';

-- Optional: Drop the original table if partitioning is successful and verified
-- DROP TABLE Booking;

-- Explanation:
-- The table is partitioned by `start_date` into ranges to improve query performance for date-based queries.
-- This approach ensures that large datasets can be handled efficiently when querying specific time periods.
