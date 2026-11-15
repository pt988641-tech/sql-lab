
USE canteen_db;

DELIMITER $$

CREATE PROCEDURE show_item_status(IN p_item_id INT)
BEGIN
    DECLARE v_stock INT;

    SELECT stock INTO v_stock
    FROM menu_items
    WHERE item_id = p_item_id;

    IF v_stock = 0 THEN
        SELECT 'Out of stock' AS item_status;
    ELSEIF v_stock < 20 THEN
        SELECT 'Low stock' AS item_status;
    ELSE
        SELECT 'In stock' AS item_status;
    END IF;
END $$

CREATE PROCEDURE restock_all(IN p_amount INT)
BEGIN
    DECLARE counter INT DEFAULT 1;

    WHILE counter <= 6 DO
        UPDATE menu_items
        SET stock = stock + p_amount
        WHERE item_id = counter;

        SET counter = counter + 1;
    END WHILE;
END $$

CREATE PROCEDURE inventory_value(OUT p_total DECIMAL(10,2))
BEGIN
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_stock INT;
    DECLARE v_done INT DEFAULT 0;

    DECLARE item_cursor CURSOR FOR
        SELECT price, stock FROM menu_items;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_done = 1;

    SET p_total = 0;

    OPEN item_cursor;

    my_loop: LOOP
        FETCH item_cursor INTO v_price, v_stock;

        IF v_done = 1 THEN
            LEAVE my_loop;
        END IF;

        SET p_total = p_total + (v_price * v_stock);
    END LOOP my_loop;

    CLOSE item_cursor;
END $$

DELIMITER ;
