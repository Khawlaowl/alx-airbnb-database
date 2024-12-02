-- Initial query retrieving bookings with user, property, and payment details
SELECT 
    b.booking_id, 
    u.first_name, 
    p.name AS property_name, 
    pay.amount AS payment_amount 
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment pay ON b.booking_id = pay.booking_id;

-- Refactored query: Optimize with specific joins or indexes
EXPLAIN SELECT ... -- Include analysis of performance improvement

