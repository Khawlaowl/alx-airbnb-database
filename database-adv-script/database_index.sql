-- Create an index on the user_id column in the Booking table
-- This column is frequently used in JOIN and WHERE clauses
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create an index on the property_id column in the Booking table
-- This column is often used in JOIN and WHERE clauses
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create an index on the start_date column in the Booking table
-- Useful for queries involving date range filtering
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Create an index on the user_id column in the User table
-- This column is frequently used in JOIN and WHERE clauses
CREATE INDEX idx_user_user_id ON User(user_id);

-- Create an index on the property_id column in the Property table
-- This column is frequently used in JOIN and WHERE clauses
CREATE INDEX idx_property_property_id ON Property(property_id);

-- Create an index on the rating column in the Review table
-- Useful for queries that filter or sort by rating
CREATE INDEX idx_review_rating ON Review(rating);

-- Analyze performance before and after indexing
-- Example EXPLAIN query for a JOIN between Booking and User
EXPLAIN ANALYZE 
SELECT 
    b.booking_id, 
    u.first_name, 
    b.start_date 
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id;

-- Example EXPLAIN query for filtering bookings by start_date
EXPLAIN ANALYZE 
SELECT 
    booking_id, 
    user_id, 
    property_id 
FROM 
    Booking 
WHERE 
    start_date BETWEEN '2024-01-01' AND '2024-01-31';

-- Example EXPLAIN query for ranking properties by booking count
EXPLAIN ANALYZE 
SELECT 
    p.property_id, 
    p.name, 
    COUNT(b.booking_id) AS total_bookings 
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name
ORDER BY 
    total_bookings DESC;
