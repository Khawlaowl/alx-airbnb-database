-- Partition Booking table by start_date
ALTER TABLE Booking PARTITION BY RANGE (start_date) (
    PARTITION p2024_01 VALUES LESS THAN ('2024-02-01'),
    PARTITION p2024_02 VALUES LESS THAN ('2024-03-01'),
    PARTITION p_max VALUES LESS THAN MAXVALUE
);

-- Query performance test
EXPLAIN SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-01-31';

