
CREATE DATABASE IF NOT EXISTS ECommerceDB;

USE ECommerceDB;

CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    category_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO Category (category_name, description)
VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Clothes and fashion items'),
('Home Appliances', 'Appliances used at home'),
('Books', 'Printed books and educational materials');

INSERT INTO Product (product_name, category_id, price, stock_quantity)
VALUES
('Wireless Mouse', 1, 599.00, 40),
('Bluetooth Speaker', 1, 1499.00, 25),
('USB Keyboard', 1, 799.00, 30),
('LED Monitor', 1, 8999.00, 15),
('USB Cable', 1, 199.00, 100),
('Cotton Shirt', 2, 899.00, 35),
('Denim Jeans', 2, 1599.00, 20),
('Running Shoes', 2, 2499.00, 18),
('Electric Kettle', 3, 1299.00, 22),
('Python Basics Book', 4, 450.00, 50);

SELECT * FROM Category;

SELECT * FROM Product;

INSERT INTO Product (product_name, category_id, price, stock_quantity)
VALUES ('Web Camera', 1, 1899.00, 12);

UPDATE Product
SET price = 1699.00
WHERE product_id = 2;

UPDATE Product
SET stock_quantity = 45
WHERE product_id = 1;

INSERT INTO Product (product_name, category_id, price, stock_quantity)
VALUES ('Old Model Headphones', 1, 499.00, 0);

DELETE FROM Product
WHERE product_name = 'Old Model Headphones';

SELECT c.category_name, p.product_id, p.product_name, p.price, p.stock_quantity
FROM Category c
LEFT JOIN Product p ON c.category_id = p.category_id
ORDER BY c.category_name, p.product_name;

SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM Category c
LEFT JOIN Product p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY c.category_name;

SELECT c.category_name, p.product_name, p.price
FROM Category c
JOIN Product p ON c.category_id = p.category_id
WHERE p.price = (
    SELECT MAX(p2.price)
    FROM Product p2
    WHERE p2.category_id = c.category_id
)
ORDER BY c.category_name;

SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM Category c
JOIN Product p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
HAVING COUNT(p.product_id) > 5;

SELECT c.category_name, AVG(p.price) AS average_price
FROM Category c
LEFT JOIN Product p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY c.category_name;
