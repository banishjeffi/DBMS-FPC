Week 4 – Order Management System

Aim

To design and create Orders and Order_Details tables in an e-commerce database, establish relationships with Customer and Product tables, manage customer orders, perform insert, update, and delete operations, and generate customer order history reports using MySQL.Requirement Analysis

* * *

An e-commerce company needs a system to manage customer orders. Customers can purchase multiple products in a single order, and each order contains information such as order date, purchased products, quantity, price, and total amount.

The Order Management System connects the existing Customer and Product tables. The Orders table stores the overall order information, while the Order_Details table stores the individual products included in each order.Design Orders and Order_Details Tables

* * *

### Orders Table

The Orders table stores the overall information about customer orders.

| Attribute | Data Type | Description |
| --- | --- | --- |
| order_id | INT | Unique identification number for each order |
| customer_id | INT | Customer identification number |
| order_date | DATE | Date of order placement |
| total_amount | DECIMAL(10,2) | Total amount of the order |
| order_status | VARCHAR(20) | Current status of the order |

### Order_Details Table

The Order_Details table stores the individual products included in each order.

| Attribute | Data Type | Description |
| --- | --- | --- |
| order_detail_id | INT | Unique identification number for each order detail |
| order_id | INT | Order identification number |
| product_id | INT | Product identification number |
| quantity | INT | Number of products purchased |
| price | DECIMAL(10,2) | Price of the product at the time of purchase |

Establish Relationships and Constraints

### Relationships

**1. Customer and Orders**

A one-to-many relationship exists between Customer and Orders.

* One customer can place multiple orders.
  
* Each order belongs to one customer.
  
* The `customer_id` column in Orders references the Customer table.
  

**2. Orders and Products**

A many-to-many relationship exists between Orders and Product.

* One order can contain multiple products.
  
* One product can appear in multiple orders.
  
* This relationship is implemented using the Order_Details table.
  

**3. Orders and Order_Details**

A one-to-many relationship exists between Orders and Order_Details.

* One order can contain multiple order detail records.
  
* Each order detail belongs to one order.
  

**4. Product and Order_Details**

A one-to-many relationship exists between Product and Order_Details.

* One product can appear in multiple order details.
  
* Each order detail refers to one product.
  

### Constraints Used

* **PRIMARY KEY:** Uniquely identifies each order and order detail.
  
* **FOREIGN KEY:** Connects Orders with Customer and Order_Details with Orders and Product.
  
* **NOT NULL:** Ensures that required order information is provided.
  
* **CHECK:** Ensures that total amount and product price are not negative and that quantity is greater than zero.
  
* **AUTO_INCREMENT:** Automatically generates order and order detail identification numbers.
  

Manage Customer Product Orders

### 1. Create a New Order for a Customer

The `INSERT INTO` command is used to create a new order for an existing customer. The order date, total amount, and order status are stored in the Orders table.

### 2. Add Multiple Products to an Order

The Order_Details table stores the products purchased by the customer. Each product is stored with its quantity and purchase price.

### 3. Calculate Total Order Amount

The `SUM()` function is used with quantity and price to calculate the total order amount.

The calculation is:

Total Amount = SUM(Quantity × Price)

The calculated amount is updated in the Orders table.

### 4. Update Order Status

The `UPDATE` command is used to modify the order status, such as changing Pending to Delivered.

### 5. View Complete Order Details

The `JOIN` command is used to combine Customer, Orders, Order_Details, and Product tables to display complete order information.Perform Order Operations

* * *

### Insert Operation

The `INSERT INTO` command is used to add new order records and purchased product details.

### Update Operation

The `UPDATE` command is used to modify existing order information.

The following operations are performed:

* Change order status from Pending to Delivered.
  
* Update the quantity of a purchased product.
  
* Recalculate the total order amount after updating the quantity.
  

### Delete Operation

The `DELETE` command is used to remove cancelled orders.

The corresponding records from Order_Details are deleted first, followed by the related record from Orders.Generate Customer Order History Reports

* * *

### Report 1: Customer Order History

This report displays:

* Customer name
  
* Order ID
  
* Order date
  
* Total amount
  
* Order status
  

The Customer and Orders tables are joined to retrieve the order history of customers.

### Report 2: Product-wise Order Report

This report identifies:

* Number of times each product was ordered.
  
* Total quantity of each product sold.
  

The `COUNT()` function calculates the number of order detail records, and the `SUM()` function calculates the total quantity sold.

### Report 3: Customer Purchase Analysis

The following details are calculated:

**1. Customers with Maximum Orders**

The `COUNT()` function is used to calculate the number of orders placed by each customer. The customer or customers having the highest number of orders are displayed.

**2. Total Spending by Each Customer**

The `SUM()` function calculates the total amount spent by each customer.

**3. Average Order Value**

The `AVG()` function calculates the average order amount for each customer.

### Total Sales

The `SUM()` function is used to calculate the total sales amount from all customer orders.Output

* * *

### Output 1: Orders and Order_Details Table Creation
<img width="502" height="100" alt="w4 o1" src="https://github.com/user-attachments/assets/5cfa93f2-7f19-4ab8-9909-1163434162bc" />
<img width="452" height="125" alt="w4 o1-2" src="https://github.com/user-attachments/assets/bd4b4ed9-2c67-498c-9fa5-a9f5489eb276" />

### Output 2: Customer Order History Report
<img width="522" height="100" alt="w4 o2" src="https://github.com/user-attachments/assets/93697d23-1d66-410a-b0f4-fdfc86f32c60" />

### Output 3: Product-wise Order Report
<img width="422" height="272" alt="w4 o3" src="https://github.com/user-attachments/assets/bb0bc680-6649-4bdb-8641-b45b6d87d147" />

### Output 4: Customers with Maximum Orders
<img width="230" height="93" alt="w4 o4" src="https://github.com/user-attachments/assets/58f3eab6-c7ce-43ce-8713-fc6cce4c8571" />

### Output 5: Total Spending by Each Customer
<img width="258" height="126" alt="w4 o5" src="https://github.com/user-attachments/assets/91fb426d-cc5a-4d76-b35c-3a85ca286888" />

### Output 6: Average Order Value
<img width="317" height="121" alt="w4 o6" src="https://github.com/user-attachments/assets/359a3b93-6b41-45d1-a07e-5dd0d02cbdad" />

### Output 7: Total Sales Report
<img width="792" height="131" alt="w4 o7" src="https://github.com/user-attachments/assets/43d2fe38-f1d3-48a4-ad3f-e0b56552f1c6" />

## Result

The Orders and Order_Details tables were created successfully with the required constraints and relationships. Customer orders were created, multiple products were added to orders, and total order amounts were calculated. Order information was updated, cancelled orders were deleted, and customer order history and purchase analysis reports were generated using SQL queries.
