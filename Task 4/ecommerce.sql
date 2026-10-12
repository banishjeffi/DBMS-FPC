
CREATE DATABASE IF NOT EXISTS ECommerceDB;

USE ECommerceDB;

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount >= 0),
    order_status VARCHAR(20) NOT NULL CHECK (order_status IN ('Pending', 'Shipped', 'Delivered')),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    UNIQUE (order_id, product_id)
);

INSERT INTO Orders (customer_id, order_date, total_amount, order_status)
VALUES (1, CURDATE(), 0.00, 'Pending');

SET @order_id = LAST_INSERT_ID();

INSERT INTO Order_Details (order_id, product_id, quantity, price)
SELECT @order_id, product_id, 1, price
FROM Product
WHERE product_id = 1;

INSERT INTO Order_Details (order_id, product_id, quantity, price)
SELECT @order_id, product_id, 2, price
FROM Product
WHERE product_id = 2;

UPDATE Orders
SET total_amount = (
    SELECT SUM(quantity * price)
    FROM Order_Details
    WHERE order_id = @order_id
)
WHERE order_id = @order_id;

SELECT * FROM Orders;

SELECT * FROM Order_Details;

INSERT INTO Orders (customer_id, order_date, total_amount, order_status)
VALUES (2, CURDATE(), 0.00, 'Pending');

SET @order_id = LAST_INSERT_ID();

INSERT INTO Order_Details (order_id, product_id, quantity, price)
SELECT @order_id, product_id, 1, price
FROM Product
WHERE product_id = 3;

UPDATE Orders
SET total_amount = (
    SELECT SUM(quantity * price)
    FROM Order_Details
    WHERE order_id = @order_id
)
WHERE order_id = @order_id;

UPDATE Orders
SET order_status = 'Delivered'
WHERE order_id = 1;

UPDATE Order_Details
SET quantity = 3
WHERE order_detail_id = 1;

UPDATE Orders
SET total_amount = (
    SELECT SUM(quantity * price)
    FROM Order_Details
    WHERE order_id = 1
)
WHERE order_id = 1;

INSERT INTO Orders (customer_id, order_date, total_amount, order_status)
VALUES (3, CURDATE(), 0.00, 'Pending');

SET @cancelled_order_id = LAST_INSERT_ID();

INSERT INTO Order_Details (order_id, product_id, quantity, price)
SELECT @cancelled_order_id, product_id, 1, price
FROM Product
WHERE product_id = 4;

DELETE FROM Order_Details
WHERE order_id = @cancelled_order_id;

DELETE FROM Orders
WHERE order_id = @cancelled_order_id;

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.order_status
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date, o.order_id;

SELECT
    p.product_name,
    COUNT(od.order_detail_id) AS times_ordered,
    SUM(od.quantity) AS total_quantity_sold
FROM Product p
LEFT JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY p.product_name;

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(order_id) AS order_count
        FROM Orders
        GROUP BY customer_id
    ) AS customer_orders
);

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COALESCE(SUM(o.total_amount), 0) AS total_spending
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY customer_name;

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COALESCE(AVG(o.total_amount), 0) AS average_order_value
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY customer_name;

SELECT SUM(total_amount) AS total_sales
FROM Orders;

SELECT
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.product_name,
    od.quantity,
    od.price,
    od.quantity * od.price AS item_total,
    o.total_amount,
    o.order_status
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Product p ON od.product_id = p.product_id
ORDER BY o.order_id, od.order_detail_id;
