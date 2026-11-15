USE canteen_db;

DROP TRIGGER IF EXISTS trg_reduce_stock;

DELIMITER //

CREATE TRIGGER trg_reduce_stock
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE menu_items
    SET stock = stock - NEW.quantity
    WHERE item_id = NEW.item_id;
END //

DELIMITER ;
