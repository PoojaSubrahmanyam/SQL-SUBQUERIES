# 🚀 SQL Subqueries Project

## 📌 Introduction
This repository contains SQL subqueries demonstrating different query techniques such as single-row subqueries, multi-row subqueries, correlated subqueries, and nested subqueries. These queries help in retrieving complex datasets efficiently.

## 📊 Dataset
The queries in this project use a sample dataset with the following tables:

### 🏢 Employees Table
```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    hire_date DATE,
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Alice', 70000, 1, '2020-06-15', 101),
(2, 'Bob', 80000, 2, '2019-08-22', 102),
(3, 'Charlie', 90000, 1, '2018-03-12', 101),
(4, 'David', 75000, 3, '2021-01-10', 103);
```

### 🏢 Departments Table
```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    manager_id INT
);

INSERT INTO departments VALUES
(1, 'HR', 'Hyderabad', 101),
(2, 'Finance', 'Bangalore', 102),
(3, 'IT', 'Chennai', 103);
```

### 👨‍💼 Managers Table
```sql
CREATE TABLE managers (
    manager_id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO managers VALUES
(101, 'Pooja'),
(102, 'John Doe'),
(103, 'Michael');
```

### 📦 Products Table
```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 1, 50000),
(2, 'Mobile', 1, 20000),
(3, 'Tablet', 1, 30000);
```

### 🎯 Categories Table
```sql
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

INSERT INTO categories VALUES
(1, 'Electronics');
```

### 🧑‍🤝‍🧑 Customers Table
```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

INSERT INTO customers VALUES
(1, 'Rahul'),
(2, 'Sita'),
(3, 'Amit');
```

### 🛒 Orders Table
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

INSERT INTO orders VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-01-20'),
(3, 3, '2024-02-01');
```

## 📌 SQL Queries

### 1️⃣ Find Employee with Highest Salary
```sql
SELECT name, salary  
FROM employees  
WHERE salary = (SELECT MAX(salary) FROM employees);
```

### 2️⃣ Find Employees in Hyderabad-Based Departments
```sql
SELECT name  
FROM employees  
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'Hyderabad');  
```

### 3️⃣ Find Employees Earning Above Their Department's Average Salary
```sql
SELECT name, salary  
FROM employees e1  
WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e1.department_id = e2.department_id);  
```

### 4️⃣ Find Employees Working Under a Specific Manager
```sql
SELECT name  
FROM employees  
WHERE department_id = (SELECT department_id FROM departments WHERE manager_id = (SELECT manager_id FROM managers WHERE name = 'Pooja'));
```

### 5️⃣ Find Employees with Salaries Higher than Their Department's Average
```sql
SELECT name, salary  
FROM employees  
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = employees.department_id);
```

### 6️⃣ Get Departments with More Than 5 Employees
```sql
SELECT department_id  
FROM employees  
GROUP BY department_id  
HAVING COUNT(*) > 5;
```

### 7️⃣ Find Employees Working Under a Specific Manager
```sql
SELECT name  
FROM employees  
WHERE manager_id = (SELECT manager_id FROM managers WHERE name = 'John Doe');
```

### 8️⃣ List Employees Who Joined After the Average Joining Date
```sql
SELECT name, hire_date  
FROM employees  
WHERE hire_date > (SELECT AVG(hire_date) FROM employees);
```

### 9️⃣ Fetch Products Priced Higher Than the Category's Average Price
```sql
SELECT product_name, price  
FROM products  
WHERE price > (SELECT AVG(price) FROM products WHERE category_id = products.category_id);
```

### 🔟 Find Customers Who Placed Orders in the Last 30 Days
```sql
SELECT customer_name  
FROM customers  
WHERE customer_id IN (SELECT customer_id FROM orders WHERE order_date >= CURDATE() - INTERVAL 30 DAY);
```

## 🚀 How to Use
1️⃣ Clone this repository.
2️⃣ Import the sample dataset into your database.
3️⃣ Run the SQL queries in your preferred SQL environment.
4️⃣ Modify them based on your requirements.

## 🤝 Contributing
Feel free to fork and enhance the queries. If you find any improvements, submit a pull request!

## 📜 License
This project is open-source. Use and modify it as needed! 🎉
