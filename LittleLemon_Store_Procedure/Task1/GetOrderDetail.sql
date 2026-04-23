DELIMITER //

CREATE PROCEDURE GetOrderDetail(IN InputID INT)
BEGIN
    SELECT OrderID, Quantity, TotalCost 
    FROM Orders 
    WHERE OrderID = InputID;
END //

DELIMITER ;

#SET @id = 1;
#CALL GetOrderDetail(@id);