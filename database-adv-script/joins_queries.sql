--This fetches only bookings that are linked to existing users, excluding any orphan bookings.
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    booking b
INNER JOIN 
    users u ON b.guest_id = u.user_id;


-- This fetches all properties and their reviews, including properties that have no reviews.
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at
FROM 
    property p
LEFT JOIN 
    review r ON p.property_id = r.property_id;



-- This fetches all users and their bookings, including users who have not made any bookings.
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM 
    users u
FULL OUTER JOIN 
    booking b ON u.user_id = b.guest_id;
