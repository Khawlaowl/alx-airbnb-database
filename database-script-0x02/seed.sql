-- Ajout d'utilisateurs
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role) VALUES
    ('uuid1', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', 'guest'),
    ('uuid2', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', 'host');

-- Ajout de propriétés
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES
    ('prop1', 'uuid2', 'Cozy Apartment', 'A lovely apartment in the city center.', 'Paris', 100.00);

-- Ajout de réservations
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
    ('book1', 'prop1', 'uuid1', '2024-12-01', '2024-12-05', 400.00, 'confirmed');

-- Ajout de paiements
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
    ('pay1', 'book1', 400.00, 'credit_card');

-- Ajout d'avis
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
    ('rev1', 'prop1', 'uuid1', 5, 'Great experience!');

-- Ajout de messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
    ('msg1', 'uuid1', 'uuid2', 'Hello, is the property available?');
