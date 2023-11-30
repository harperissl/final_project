use LittleLemonDB;
INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email)
VALUES
(1, 'Angela', 111111, 'angela@test.com'),
(2, 'Bob', 222222, 'bob@test.com'),
(3, 'Cachy', 333333, ',cachy@test.com'),
(4, 'David', 444444, 'david@test.com'),
(5, 'Ellen', 555555, 'ellen@test.com'),
(6, 'Ford', 666666, 'ford@test.com');

INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
VALUES 	("2022-10-10", 5, 1),
		("2022-11-12", 3, 3),
		("2022-10-11", 2, 2),
		("2022-10-13", 2, 1);
SELECT * FROM bookings;