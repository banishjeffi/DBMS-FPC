# Week 1 – Requirement Analysis and Customer Database Module

## Aim

To analyse the basic requirements of an e-commerce database, identify its main entities, create a database and Customer table with suitable constraints, insert customer records, and perform basic CRUD operations using MySQL.

## Requirement Analysis

An e-commerce system stores information about customers, products, orders, payments, sellers, and reviews. The database should organise this information so that customer details can be stored and retrieved correctly.

For this first task, the work is limited to creating the database and the Customer table. The other entities are identified for the overall system, but their tables are not created in this task.

## Identify Entities

The main entities identified for the e-commerce system are:

1. **Customer:** Stores the details of people who purchase products.
2. **Product:** Stores details of products available for sale.
3. **Order:** Stores information about customer orders.
4. **Payment:** Stores payment details related to orders.
5. **Seller:** Stores details of people or businesses selling products.
6. **Review:** Stores customer feedback and ratings for products.

Only the Customer entity is implemented in this week's task.

## Design Customer Table

The Customer table is designed with the following attributes:

| Attribute | Data Type | Description |
| --- | --- | --- |
| customer_id | INT | Unique identification number for each customer |
| first_name | VARCHAR(50) | Customer's first name |
| last_name | VARCHAR(50) | Customer's last name |
| email | VARCHAR(100) | Customer's email address |
| phone | VARCHAR(15) | Customer's phone number |
| address | VARCHAR(255) | Customer's address |
| city | VARCHAR(50) | Customer's city |
| state | VARCHAR(50) | Customer's state |
| pincode | VARCHAR(10) | Customer's postal code |

### Constraints Used

* **PRIMARY KEY:** The `customer_id` uniquely identifies each customer.
* **AUTO_INCREMENT:** Automatically generates the customer ID.
* **NOT NULL:** Ensures that the first name, last name, and email are provided.
* **UNIQUE:** Prevents the same email address from being entered more than once.

## Create Database

The database named `ECommerceDB` is created using the `CREATE DATABASE` command. The `USE` command selects this database for the following operations.

The `Customer` table is then created inside the database with the attributes and constraints listed above.

## Insert Records

The `INSERT INTO` command is used to add three customer records to the Customer table. The customer ID is generated automatically because it is defined with the `AUTO_INCREMENT` constraint.

## CRUD Operations

CRUD represents the four basic operations performed on database records.

### 1. Create

The `INSERT INTO` command adds new customer records to the Customer table.

### 2. Read

The `SELECT` command retrieves the customer records stored in the table.

### 3. Update

The `UPDATE` command modifies an existing customer's phone number using the customer ID.

### 4. Delete

The `DELETE` command removes the customer record with the specified customer ID.

## Output

### Output 1: Database and Customer Table Creation

<img width="932" height="183" alt="w1 o1" src="https://github.com/user-attachments/assets/ad41fb14-e50c-4dcf-8526-6b538582e1fb" />

### Output 2: Updating Customer Details

<img width="942" height="162" alt="w1 o2" src="https://github.com/user-attachments/assets/49cc31da-a1a7-4166-8bc3-88d4ec1a87a9" />

### Output 3: Deleting a Customer Record

<img width="942" height="133" alt="w1 o3" src="https://github.com/user-attachments/assets/91af4cf6-99c3-481b-bb07-9349e954bf7d" />

## Result

The e-commerce database `eCommerce_DB` and the Customer table were created successfully. Customer records were inserted, displayed, updated, and deleted using basic SQL commands.
