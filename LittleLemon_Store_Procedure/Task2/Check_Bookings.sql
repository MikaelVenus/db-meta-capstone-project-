DELIMITER //

CREATE PROCEDURE CheckBooking(IN BookingDate DATE, IN TableNum INT)
BEGIN
    DECLARE TableStatus VARCHAR(100);

    -- Check if the table is already booked on the specific date
    IF EXISTS (
        SELECT 1 
        FROM Bookings 
        WHERE BookingDate = BookingDate 
        AND TableNumber = TableNum
    ) THEN
        SET TableStatus = CONCAT('Table ', TableNum, ' is already booked.');
    ELSE
        SET TableStatus = CONCAT('Table ', TableNum, ' is available.');
    END IF;

    -- Return the result
    SELECT TableStatus AS 'Booking Status';
END //

DELIMITER ;


#Call CheckBooking("2022-11-12",3)