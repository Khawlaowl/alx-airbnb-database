# Optimization Report

## Objective
The objective of this task was to analyze and optimize a complex query retrieving bookings, user details, property details, and payment details, with the goal of reducing execution time and improving performance.

---

## Initial Query
The initial query was as follows:
```sql
SELECT 
    b.booking_id, 
    b.start_date, 
    b.end_date, 
    b.total_price, 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    p.property_id, 
    p.name AS property_name, 
    pm.payment_id, 
    pm.amount, 
    pm.payment_date
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pm ON b.booking_id = pm.booking_id;

