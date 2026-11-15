
DROP DATABASE IF EXISTS canteen_db;

CREATE DATABASE canteen_db;

USE canteen_db;

CREATE TABLE menu_items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

INSERT INTO menu_items
(item_id, item_name, price, stock)
VALUES
(1, 'Samosa', 15, 50),
(2, 'Tea', 10, 80),
(3, 'Sandwich', 40, 30),
(4, 'Burger', 60, 25),
(5, 'Cold Drink', 30, 100),
(6, 'Pizza Slice', 80, 20);

SELECT * FROM menu_items;

SELECT * FROM orders;
