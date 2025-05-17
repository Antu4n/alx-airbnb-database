-- USERS Table
CREATE NONCLUSTERED INDEX idx_users_email ON USERS(email);
CREATE NONCLUSTERED INDEX idx_users_role ON USERS(role);
CREATE NONCLUSTERED INDEX idx_users_name ON USERS(first_name, last_name);

-- BOOKING Table
CREATE NONCLUSTERED INDEX idx_booking_guest_id ON BOOKING(guest_id);
CREATE NONCLUSTERED INDEX idx_booking_property_id ON BOOKING(property_id);
CREATE NONCLUSTERED INDEX idx_booking_status ON BOOKING(status);
CREATE NONCLUSTERED INDEX idx_booking_created ON BOOKING(created_at);
CREATE NONCLUSTERED INDEX idx_booking_dates ON BOOKING(start_date, end_date);

-- PROPERTY Table
CREATE NONCLUSTERED INDEX idx_property_location ON PROPERTY(location);
CREATE NONCLUSTERED INDEX idx_property_host ON PROPERTY(host_id);
CREATE NONCLUSTERED INDEX idx_property_price ON PROPERTY(price_per_night);


SELECT u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM USERS u
LEFT JOIN BOOKING b ON u.user_id = b.guest_id
WHERE u.role = 'guest'
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;


SET STATISTICS IO ON;
SET STATISTICS TIME ON;
