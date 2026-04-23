DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN b_id INT, 
    IN b_date DATE
)
BEGIN
    -- Update the date for the record that matches the ID
    UPDATE Bookings 
    SET BookingDate = b_date 
    WHERE BookingID = b_id;
    
    -- Provide a confirmation message
    SELECT CONCAT('Booking ', b_id, ' updated') AS 'Confirmation';
END //

DELIMITER ;

#CALL UpdateBooking(4, '2022-12-20');