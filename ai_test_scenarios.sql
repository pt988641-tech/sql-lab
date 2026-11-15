USE canteen_db;

-- Scenario 1: Valid order
-- ChatGPT expected: Stock decreases by 3.
-- MySQL actual: Stock decreased by 3.

SELECT stock FROM menu_items WHERE item_id = 1;

CALL place_order(1, 3);

SELECT stock FROM menu_items WHERE item_id = 1;


-- Scenario 2: Rollback savepoint
-- ChatGPT expected: 500 quantity order is rolled back.
-- MySQL actual: 500 quantity order was rolled back.

START TRANSACTION;

INSERT INTO orders (item_id, quantity, order_date)
VALUES (1, 1, CURRENT_DATE);

INSERT INTO orders (item_id, quantity, order_date)
VALUES (2, 2, CURRENT_DATE);

SAVEPOINT test_savepoint;

INSERT INTO orders (item_id, quantity, order_date)
VALUES (3, 500, CURRENT_DATE);

ROLLBACK TO test_savepoint;

COMMIT;

SELECT * FROM orders;


-- Scenario 3: Invalid item ID
-- ChatGPT expected: Order failed; stock remains unchanged.
-- MySQL actual: Order failed; stock unchanged.

CALL place_order(99, 2);

SELECT * FROM menu_items;
