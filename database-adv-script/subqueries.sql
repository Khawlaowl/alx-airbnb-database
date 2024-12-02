-- Query 1: Properties where average rating > 4.0
SELECT 
    property_id, 
    name 
FROM 
    Property 
WHERE 
    property_id IN (
        SELECT 
            r.property_id 
        FROM 
            Review r 
        GROUP BY 
            r.property_id 
        HAVING 
            AVG(r.rating) > 4.0
    );

-- Query 2: Correlated subquery to find users with more than 3 bookings
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name 
FROM 
    User u
WHERE 
    (SELECT COUNT(*) 
     FROM Booking b 
     WHERE b.user_id = u.user_id) > 3;

