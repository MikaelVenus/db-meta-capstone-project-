DELIMITER //

CREATE PROCEDURE CancelBooking(IN b_id INT)
BEGIN
    -- Delete the record that matches the provided BookingID
    DELETE FROM Bookings 
    WHERE BookingID = b_id;
    
    -- Provide a confirmation message similar to the required output
    SELECT CONCAT('Booking ', b_id, ' cancelled') AS 'Confirmation';
END //

DELIMITER ;

#CALL CancelBooking(2);