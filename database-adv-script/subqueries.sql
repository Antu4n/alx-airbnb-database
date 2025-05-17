-- 1. Find all properties that have a rating greater than 4.0
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.price_per_night
FROM 
    property p
WHERE 
    p.property_id IN (
        SELECT 
            r.property_id
        FROM 
            review r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    );

-- Find all users who have made more than 3 bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    users u
WHERE 
    (
        SELECT 
            COUNT(*)
        FROM 
            booking b
        WHERE 
            b.guest_id = u.user_id
    ) > 3;
