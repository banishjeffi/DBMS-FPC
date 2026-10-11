CREATE DATABASE IF NOT EXISTS eCommerce_DB;

USE eCommerce_DB;

CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10)
);

INSERT INTO Customer (first_name, last_name, email, phone, address, city, state, pincode)
VALUES
('Banish','Jeffi','banishjeffi@gmail.com','9444333914','No 1, Charlu St','Chennai','Tamil Nadu','600048'),
('Arun', 'Kumar', 'arun.kumar@example.com', '9876543210', '12 Gandhi Street', 'Chennai', 'Tamil Nadu', '600001'),
('Priya', 'Ravi', 'priya.ravi@example.com', '9876543211', '24 Anna Nagar', 'Chennai', 'Tamil Nadu', '600040'),
('Karthik', 'Raj', 'karthik.raj@example.com', '9876543212', '8 Lake Road', 'Coimbatore', 'Tamil Nadu', '641001');

SELECT * FROM Customer;

UPDATE Customer
SET phone = '9000012345'
WHERE customer_id = 2;

SELECT * FROM Customer;

DELETE FROM Customer
WHERE customer_id = 3;

SELECT * FROM Customer;
