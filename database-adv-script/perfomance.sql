-- Query 1: Retrieve all bookings along with user details, property details, and payment details
-- Including a WHERE clause for filtering by a specific date range and user status
EXPLAIN ANALYZE 
SELECT 
    b.booking_id, 
    u.first_name, 
    u.last_name, 
    p.name AS property_name, 
    py.amount AS payment_amount, 
    b.start_date, 
    b.end_date 
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment py ON b.booking_id = py.booking_id
WHERE 
    b.start_date >= '2024-01-01' AND b.end_date <= '2024-12-31'
    AND u.status = 'active';

-- Query 2: A similar query for a different purpose to demonstrate variety in WHERE conditions
EXPLAIN ANALYZE 
SELECT 
    b.booking_id, 
    b.start_date, 
    p.name AS property_name, 
    py.amount AS payment_amount 
FROM 
    Booking b
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment py ON b.booking_id = py.booking_id
WHERE 
    py.amount > 100.00 
    AND p.location = 'New York';

-- Explanation:
-- The EXPLAIN ANALYZE keyword measures query performance, showing execution time and cost.
-- WHERE and AND filters are applied for optimized query execution and filtering unnecessary rows.
