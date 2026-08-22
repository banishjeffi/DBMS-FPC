CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(255),
    city VARCHAR(50),
    password VARCHAR(100)
);
INSERT INTO Customer (customer_name, email, phone, address, city, password)
VALUES
('Banish', 'banishjeffi@gmail.com', '9444333914', 'No 1, Charlu St, Pillaikulam, Vandalur, Chennai-48', 'Chennai', '##########'),
('John', 'john@gmail.com', '1234567890', 'Pammadhukullam Redhills', 'chennai', '######'),
SELECT * FROM Customer;
UPDATE Customer
SET city = 'Chennai',
    address = 'madhuranthagam'
WHERE customer_id = 1;
SELECT * FROM Customer;
DELETE FROM Customer
WHERE customer_id = 5;
SELECT * FROM Customer;
