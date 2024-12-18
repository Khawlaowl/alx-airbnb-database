-- Query 1: INNER JOIN to retrieve all bookings and the respective users
SELECT 
    b.booking_id, 
    u.first_name, 
    u.last_name, 
    b.start_date, 
    b.end_date 
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
ORDER BY 
    b.booking_id;

-- Query 2: LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    p.property_id, 
    p.name AS property_name, 
    r.comment AS review_comment, 
    r.rating 
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id
ORDER BY 
    p.property_id;

-- Query 3: FULL OUTER JOIN to retrieve all users and bookings, even if the user has no booking or a booking is not linked to a user
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    b.booking_id, 
    b.start_date 
FROM 
    User u
FULL OUTER JOIN 
    Booking b ON u.user_id = b.user_id
ORDER BY 
    u.user_id;
