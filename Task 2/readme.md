Week 2 – Category and Product Management

Aim

To create Category and Product tables for an e-commerce database, establish a one-to-many relationship between them, insert product details, perform product operations, and generate category-wise product reports using MySQL.Requirement Analysis

An e-commerce company needs to maintain product information along with the category to which each product belongs. A category can contain many products, while each product belongs to one category.

The database stores category names and descriptions separately from product details. This helps to organise products and maintain category information efficiently.Design Product and Category Tables

### Category Table

The Category table stores the details of product categories.

| Attribute | Data Type | Description |
| --- | --- | --- |
| category_id | INT | Unique identification number for each category |
| category_name | VARCHAR(100) | Name of the category |
| description | VARCHAR(255) | Description of the category |

### Product Table

The Product table stores the details of products.

| Attribute | Data Type | Description |
| --- | --- | --- |
| product_id | INT | Unique identification number for each product |
| product_name | VARCHAR(100) | Name of the product |
| category_id | INT | Category to which the product belongs |
| price | DECIMAL(10,2) | Price of the product |
| stock_quantity | INT | Available quantity of the product |

Define Relationships and Constraints

### Relationship

A one-to-many relationship is established between Category and Product.

* One category can contain many products.
  
* Each product belongs to one category.
  
* The `category_id` column in the Product table acts as a foreign key referencing the Category table.
  

### Constraints Used

* **PRIMARY KEY:** Uniquely identifies each category and product.
  
* **FOREIGN KEY:** Connects each product to an existing category.
  
* **NOT NULL:** Ensures that required names, category references, prices, and stock quantities are provided.
  
* **UNIQUE:** Prevents duplicate category names and product names.
  
* **CHECK:** Ensures that product prices and stock quantities are not negative.
  
* **AUTO_INCREMENT:** Automatically generates category and product IDs.
  

Create Tables and Insert Data

The `ECommerceDB` database is selected for this task. The Category table is created first, followed by the Product table.

Category details are inserted into the Category table. Ten product records are then inserted into the Product table with valid category IDs.Perform Product Operations

* * *

CRUD operations are performed on the Product table.

### 1. Insert

The `INSERT INTO` command is used to add a new product named Web Camera to the Electronics category.

### 2. Read

The `SELECT` command is used to retrieve and display the records stored in the Category and Product tables.

### 3. Update

The `UPDATE` command is used to change the price of a product and update the stock quantity of another product.

### 4. Delete

The `DELETE` command is used to remove a discontinued product named Old Model Headphones from the Product table.Generate Category-wise Product Reports

### 1. Display All Products Under Each Category

The `LEFT JOIN` command displays categories along with their products. It also displays categories even if they do not contain products.

### 2. Count the Number of Products in Each Category

The `COUNT()` function calculates the number of products available in each category.

### 3. Find the Highest-priced Product in Each Category

The `MAX()` function is used with a subquery to identify the highest-priced product in each category. If multiple products have the same highest price, all matching products are displayed.

### 4. Display Categories Having More Than 5 Products

The `GROUP BY` clause groups products by category, and the `HAVING` clause displays only categories containing more than five products.

### 5. Find the Average Product Price for Each Category

The `AVG()` function calculates the average product price in each category.Output

### Output 1: Category and Product Table Creation
<img width="512" height="157" alt="w2 o1" src="https://github.com/user-attachments/assets/cc68530d-8836-4f2f-abba-7d7f6ec6581c" />
<img width="536" height="290" alt="w2 o1-2" src="https://github.com/user-attachments/assets/de3068a7-059f-4703-b750-d66f54ca5a0e" />

### Output 2: Displaying All Products Under Each Category
<img width="612" height="267" alt="w2 o2" src="https://github.com/user-attachments/assets/14d991a8-25c2-4432-b159-ce8792f5c051" />

### Output 3: Product Count in Each Category
<img width="277" height="145" alt="w2 o3" src="https://github.com/user-attachments/assets/7b3e35e2-18bc-4011-be2a-eb35bc7768f3" />

### Output 4: Highest-priced Product in Each Category
<img width="372" height="145" alt="w2 o4" src="https://github.com/user-attachments/assets/5a807d36-3cda-42f8-8af9-0b6a43382e67" />

### Output 5: Average Product Price in Each Category
<img width="266" height="142" alt="w2 o5" src="https://github.com/user-attachments/assets/ac42abe1-2648-4fbe-ade3-b0f02cdb6dba" />

## Result

The Category and Product tables were created successfully with the required constraints. A one-to-many relationship was established between the tables. Product records were inserted, updated, and deleted. Category-wise product reports were generated using SQL queries.
