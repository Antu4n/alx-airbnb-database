-- Step 1: Create partition function on start_date
CREATE PARTITION FUNCTION pf_booking_by_start_date (DATE)
AS RANGE LEFT FOR VALUES (
    '2022-01-01', 
    '2023-01-01', 
    '2024-01-01',
    '2025-01-01'
);

-- Step 2: Create partition scheme
CREATE PARTITION SCHEME ps_booking_by_start_date
AS PARTITION pf_booking_by_start_date
ALL TO ([PRIMARY]); -- Using same filegroup for demo

-- Step 3: Create partitioned version of BOOKING table
CREATE TABLE BOOKING_PARTITIONED (
    booking_id INT NOT NULL,
    property_id INT NOT NULL,
    guest_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    status VARCHAR(20) NOT NULL,
    CONSTRAINT PK_BOOKING_PARTITIONED PRIMARY KEY (start_date, booking_id) 
)
ON ps_booking_by_start_date(start_date);

-- Step 4: Migrate data from BOOKING to BOOKING_PARTITIONED.
INSERT INTO BOOKING_PARTITIONED
SELECT * FROM BOOKING;

SELECT * FROM BOOKING;

SELECT * FROM BOOKING_PARTITIONED;

-- Original booking table
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM BOOKING
WHERE start_date BETWEEN '2025-05-30' AND '2025-09-30';

SELECT *
FROM BOOKING_PARTITIONED
WHERE start_date BETWEEN '2025-05-30' AND '2025-09-30';