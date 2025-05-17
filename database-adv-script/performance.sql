
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status AS booking_status,
    b.created_at AS booking_created,
    
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.role,
    
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM BOOKING b
JOIN USERS u ON b.guest_id = u.user_id
JOIN PROPERTY p ON b.property_id = p.property_id
LEFT JOIN PAYMENT pay ON b.booking_id = pay.booking_id;

SET STATISTICS IO ON;
SET STATISTICS TIME ON;


SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount
FROM BOOKING b
JOIN USERS u ON b.guest_id = u.user_id
JOIN PROPERTY p ON b.property_id = p.property_id
LEFT JOIN PAYMENT pay ON b.booking_id = pay.booking_id
WHERE b.created_at >= DATEADD(MONTH, -12, GETDATE());



SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    p.name,
    b.status
FROM 
    BOOKING b
JOIN USERS u ON b.guest_id = u.user_id
JOIN PROPERTY p ON b.property_id = p.property_id
WHERE 
    b.start_date >= '2025-06-01' AND b.end_date <= '2025-12-30'
ORDER BY 
    b.start_date;

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
