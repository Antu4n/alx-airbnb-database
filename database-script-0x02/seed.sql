INSERT INTO USERS VALUES 
(1, 'Luke', 'Skywalker', 'luke@jedi.com', 'pass123', '1234567890', 'guest', GETDATE()),
(2, 'Leia', 'Organa', 'leia@rebellion.com', 'pass456', '0987654321', 'host', GETDATE()),
(3, 'Han', 'Solo', 'han@falcon.com', 'pass789', NULL, 'admin', GETDATE()),
(4, 'Chewbacca', 'Wookiee', 'chewie@kashyyyk.com', 'roar123', NULL, 'guest', GETDATE());

INSERT INTO PROPERTY VALUES 
(1, 2, 'Rebel Base', 'Secret base in the Yavin system', 'Yavin IV', 150.00, GETDATE(), GETDATE()),
(2, 2, 'Cloud City', 'A city in the clouds on Bespin', 'Bespin', 200.00, GETDATE(),GETDATE());

INSERT INTO BOOKING (booking_id, property_id, guest_id, start_date, end_date, total_price, created_at, status) 
VALUES
(1, 1, 4, '2025-06-01', '2025-06-07', 1200.00, GETDATE(), 'confirmed'),
(2, 2, 1, '2025-07-15', '2025-07-20', 750.00, GETDATE(), 'pending'),
(3, 1, 3, '2025-08-10', '2025-08-14', 800.00, GETDATE(), 'cancelled');

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) 
VALUES
(1, 1, 1200.00, GETDATE(), 'credit_card'),
(2, 2, 750.00, GETDATE(), 'paypal'),
(3, 3, 800.00, GETDATE(), 'stripe');

INSERT INTO REVIEW (review_id, property_id, user_id, rating, comment, created_at) 
VALUES
(1, 1, 4, 5, 'Fantastic stay! The Falcon Nest is a dream.', GETDATE()),
(2, 2, 1, 4, 'Nice place, but a bit too remote for my liking.', GETDATE());

INSERT INTO MESSAGE (message_id, sender_id, receiver_id, property_id, message_body, sent_at) 
VALUES
(1, 4, 2, 1, 'Is Falcon Nest available from 1st June?', GETDATE()),
(2, 1, 2, 2, 'I would like more details about the Wookiee Hut.', GETDATE()),
(3, 3, 2, 1, 'Please confirm the booking details for the Falcon Nest.', GETDATE());

SELECT * FROM USERS;
SELECT * FROM PROPERTY;
SELECT * FROM BOOKING;
SELECT * FROM Payment;
SELECT * FROM REVIEW;
SELECT * FROM MESSAGE;

-- Insert more data into the user, booking, property tables
INSERT INTO USERS (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
(5, 'Obi-Wan', 'Kenobi', 'obiwan@jedi.com', 'hello_there', '1112223333', 'host', GETDATE()),
(6, 'Anakin', 'Skywalker', 'anakin@darkside.com', 'sithlord', '4445556666', 'guest', GETDATE()),
(7, 'Padmé', 'Amidala', 'padme@naboo.com', 'queen123', '7778889999', 'guest', GETDATE()),
(8, 'Yoda', 'Master', 'yoda@dagobah.com', 'forceStrong', NULL, 'admin', GETDATE()),
(9, 'Mace', 'Windu', 'mace@council.com', 'purple123', NULL, 'host', GETDATE()),
(10, 'Lando', 'Calrissian', 'lando@bespin.com', 'smuggler', '5551239876', 'guest', GETDATE()),
(11, 'Rey', 'Skywalker', 'rey@resistance.com', 'lightforce', '3216549870', 'guest', GETDATE()),
(12, 'Finn', 'FN2187', 'finn@firstorder.com', 'stormtroop', '1233211234', 'guest', GETDATE()),
(13, 'Poe', 'Dameron', 'poe@resistance.com', 'xwingpilot', '9874563210', 'guest', GETDATE()),
(14, 'Kylo', 'Ren', 'kylo@darkside.com', 'darkside123', '0001112222', 'host', GETDATE());

INSERT INTO PROPERTY (property_id, host_id, name, description, location, price_per_night, created_at, updates_at)
VALUES
(3, 5, 'Tatooine Hideout', 'Desert retreat in Tatooine', 'Tatooine', 80.00, GETDATE(), GETDATE()),
(4, 9, 'Jedi Temple', 'Historical site on Coruscant', 'Coruscant', 300.00, GETDATE(), GETDATE()),
(5, 14, 'First Order Base', 'Dark and mysterious place', 'Starkiller Base', 500.00, GETDATE(), GETDATE()),
(6, 5, 'Dagobah Swamp Hut', 'Secluded swamp training ground', 'Dagobah', 60.00, GETDATE(), GETDATE()),
(7, 9, 'Windu Watchtower', 'Tall tower with city view', 'Coruscant', 250.00, GETDATE(), GETDATE()),
(8, 14, 'Kylos Castle', 'Modern Sith fortress', 'Unknown Regions', 400.00, GETDATE(), GETDATE()),
(9, 5, 'Lars Homestead', 'Rustic desert stay', 'Tatooine', 90.00, GETDATE(), GETDATE()),
(10, 9, 'Senate Suites', 'Luxury apartments for senators', 'Coruscant', 275.00, GETDATE(), GETDATE()),
(11, 14, 'Dark Throne Room', 'Dark throne room ambiance', 'Exegol', 600.00, GETDATE(), GETDATE()),
(12, 5, 'Mos Eisley Inn', 'Cantina vibes and more', 'Tatooine', 120.00, GETDATE(), GETDATE());

INSERT INTO BOOKING (booking_id, property_id, guest_id, start_date, end_date, total_price, created_at, status)
VALUES
(4, 3, 6, '2025-09-01', '2025-09-05', 400.00, GETDATE(), 'confirmed'),
(5, 4, 7, '2025-10-10', '2025-10-15', 1500.00, GETDATE(), 'pending'),
(6, 5, 8, '2025-11-20', '2025-11-25', 2500.00, GETDATE(), 'cancelled'),
(7, 6, 9, '2025-12-01', '2025-12-07', 420.00, GETDATE(), 'confirmed'),
(8, 7, 10, '2026-01-15', '2026-01-20', 1300.00, GETDATE(), 'pending'),
(9, 8, 11, '2026-02-05', '2026-02-10', 3500.00, GETDATE(), 'cancelled'),
(10, 9, 12, '2026-03-01', '2026-03-05', 500.00, GETDATE(), 'confirmed'),
(11, 10, 13, '2026-04-15', '2026-04-20', 1500.00, GETDATE(), 'pending'),
(12, 11, 14, '2026-05-10', '2026-05-15', 6000.00, GETDATE(), 'cancelled');