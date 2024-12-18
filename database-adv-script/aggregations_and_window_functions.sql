-- Query 1: Total number of bookings per user
SELECT 
    b.user_id, 
    COUNT(b.booking_id) AS total_bookings 
FROM 
    Booking b
GROUP BY 
    b.user_id;

-- Query 2: Rank properties based on total bookings using RANK()
SELECT 
    p.property_id, 
    p.name AS property_name, 
    COUNT(b.booking_id) AS total_bookings, 
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank 
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name;

-- Query 3: Assign a unique number to each property based on total bookings using ROW_NUMBER()
SELECT 
    p.property_id, 
    p.name AS property_name, 
    COUNT(b.booking_id) AS total_bookings, 
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number 
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name;
