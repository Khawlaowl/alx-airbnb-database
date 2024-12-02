-- Query to retrieve all bookings with user details, property details, and payment details
SELECT 
    b.booking_id, 
    b.start_date, 
    b.end_date, 
    u.first_name AS user_first_name, 
    u.last_name AS user_last_name, 
    p.name AS property_name, 
    py.payment_status, 
    py.amount 
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment py ON b.booking_id = py.booking_id
WHERE 
    b.start_date >= '2024-01-01' AND b.end_date <= '2024-12-31';

-- Example query with additional filters for optimization testing
SELECT 
    b.booking_id, 
    u.user_id, 
    p.property_id, 
    py.amount 
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment p
