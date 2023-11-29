DROP PROCEDURE IF EXISTS AddBooking; 
DELIMITER // 
CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id INT, IN table_number INT, IN booking_date DATE)
BEGIN 
INSERT INTO bookings (BookingID, CustomerID, TableNumber, BookingDate) VALUES (booking_id, customer_id, table_number, booking_date); 
SELECT "New booking added" AS "Confirmation";
END//
DELIMITER ; 
CALL AddBooking(9, 3, 4, "2022-12-30");