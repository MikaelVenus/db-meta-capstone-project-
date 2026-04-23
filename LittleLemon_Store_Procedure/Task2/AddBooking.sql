DELIMITER //

CREATE PROCEDURE AddBooking(
    IN b_id INT, 
    IN c_id INT, 
    IN b_date DATE, 
    IN t_number INT
)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (b_id, c_id, b_date, t_number);
    
    SELECT 'New booking added' AS 'Confirmation';
END //

DELIMITER ;

#CALL AddBooking(5, 1, '2022-12-30', 4);