DELIMITER //

CREATE PROCEDURE CancelOrder(IN OrderIDToDelete INT)
BEGIN
    DELETE FROM Orders 
    WHERE OrderID = OrderIDToDelete;
    
    SELECT CONCAT("Order ", OrderIDToDelete, " is cancelled") AS Confirmation;
END //

DELIMITER ;

#CALL CancelOrder(5);