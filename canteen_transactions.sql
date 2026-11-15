
USE canteen_db;

START TRANSACTION;

INSERT INTO orders (item_id, quantity, order_date)
VALUES (1, 2, CURRENT_DATE);

INSERT INTO orders (item_id, quantity, order_date)
VALUES (2, 3, CURRENT_DATE);

SAVEPOINT order_savepoint;

INSERT INTO orders (item_id, quantity, order_date)
VALUES (3, 500, CURRENT_DATE);

ROLLBACK TO order_savepoint;

COMMIT;

SELECT * FROM orders;
