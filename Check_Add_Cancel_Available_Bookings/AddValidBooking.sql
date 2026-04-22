DELIMITER //

CREATE PROCEDURE AddValidBooking(IN BookingDate DATE, IN TableNum INT, IN CustID INT)
BEGIN
    START TRANSACTION;

    -- Use the variable 'CustID' instead of the hardcoded '5'
    INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
    VALUES (BookingDate, TableNum, CustID);

    -- 3. Use a variable to check if the table is now double-booked
    -- We count if there is more than 1 entry for this table on this date
    IF (SELECT COUNT(*) FROM Bookings WHERE BookingDate = BookingDate AND TableNumber = TableNum) > 1 THEN
        -- 4. Table is already booked! Rollback the changes.
        ROLLBACK;
        SELECT CONCAT('Table ', TableNum, ' is already booked - booking cancelled') AS 'Booking status';
    ELSE
        -- 5. Table is free! Commit the changes.
        COMMIT;
        SELECT CONCAT('Booking for table ', TableNum, ' successful') AS 'Booking status';
    END IF;

END //

DELIMITER ;

#CALL AddValidBooking('2022-10-10', 5, 1);