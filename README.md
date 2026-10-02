# 📊 Data Digger — SQL Database Project

A practical **MySQL database project** designed to demonstrate relational database concepts, SQL queries, CRUD operations, table relationships, joins, and basic data analysis.

## 📌 Project Overview

**Data Digger** is a relational database project built using MySQL. It manages information about **customers, orders, products, and order details**.

The project demonstrates how SQL can be used to create a structured database, manage records, connect related tables, and generate useful information through queries.

## 🛠️ Technologies Used

* **MySQL**
* **SQL**
* Relational Database Concepts

## 🗂️ Database Structure

The project contains four main tables:

```text
Data_Digger
│
├── Customers
├── Orders
├── Products
└── OrderDetails
```

### 👤 Customers

Stores customer information such as:

* Customer ID
* Name
* Email
* Address

### 🛒 Orders

Stores customer order information including:

* Order ID
* Customer ID
* Order Date
* Total Amount

### 📦 Products

Stores product information including:

* Product ID
* Product Name
* Price
* Stock

### 🧾 OrderDetails

Stores the products included in each order:

* Order Detail ID
* Order ID
* Product ID
* Quantity
* Subtotal

The database uses **primary keys and foreign keys** to establish relationships between the tables.

## 🔑 SQL Concepts Demonstrated

This project covers several important SQL concepts:

* Database and table creation
* Primary Keys
* Foreign Keys
* `INSERT`
* `SELECT`
* `UPDATE`
* `DELETE`
* `WHERE`
* `BETWEEN`
* `ORDER BY`
* `JOIN`
* `GROUP BY`
* `LIMIT`
* Aggregate functions
* Subqueries
* Date-based filtering

## 📈 Data Analysis

The project includes queries for analyzing order and product data.

For example, it calculates the **highest, lowest, and average order amount** using `MAX()`, `MIN()`, and `AVG()`.

It also calculates **total revenue** from order details using `SUM()`.

The project identifies the **top three products by quantity sold** using `JOIN`, `GROUP BY`, `SUM()`, `ORDER BY`, and `LIMIT`.

## 🔗 JOIN Operations

A `JOIN` is used to combine information from the `OrderDetails` and `Products` tables, allowing product names, quantities, and subtotals to be displayed together.

## ⚙️ How to Run

1. Install **MySQL** or **MySQL Workbench**.
2. Clone or download this repository.
3. Open the `Data_Digger.sql` file.
4. Execute the SQL script.
5. Explore the tables and run the included queries.

The SQL file creates the `Data_Digger` database and its required tables before inserting sample records.

## 📁 Project Structure

```text
Data-Digger/
│
├── Data_Digger.sql
└── README.md
```

## 🎯 Learning Outcomes

Through this project, I practiced:

* Designing a relational database
* Creating table relationships
* Performing CRUD operations
* Writing SQL queries
* Using joins and aggregate functions
* Filtering and sorting data
* Performing basic sales and revenue analysis

## 🚀 Future Improvements

Possible improvements include:

* Adding more sample data
* Creating database views
* Adding stored procedures and triggers
* Building a sales dashboard
* Connecting the database with a Python or web application

## 👨‍💻 Author

**Angel Bareja**
