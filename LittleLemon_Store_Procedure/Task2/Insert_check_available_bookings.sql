#Customer Insert
INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email)
VALUES
(1, 'Vanessa McCarthy', '757-536-2200', 'v.mccarthy@example.com'),
(2, 'Marcos Romero', '757-536-1144', 'm.romero@example.com'),
(3, 'Hiroki Yamane', '757-536-9988', 'h.yamane@example.com');

#Booking Insert
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);