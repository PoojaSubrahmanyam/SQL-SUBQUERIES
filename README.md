# 🚀 SQL Subqueries Project

## 📌 Project Overview
This project consists of various SQL queries designed to analyze employee data within a company's database. The queries showcase the use of **subqueries, joins, aggregate functions, and filtering techniques** to retrieve meaningful insights.

## ⚡ Key Features
- Advanced **subqueries** for complex data retrieval.
- Use of **JOINS** to fetch related data from multiple tables.
- **Aggregation functions** like `AVG()`, `MAX()`, and `MIN()`.
- Efficient **filtering techniques** using `WHERE`, `HAVING`, and `NOT IN`.
- **Sorting and Limiting Results** for better data representation.

## 📂 Database Schema & Sample Data
The project assumes the existence of four key tables with sample data:

```sql
-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees VALUES 
(1, 'Alice', 101, 70000, '2015-06-20'),
(2, 'Bob', 102, 85000, '2018-09-15'),
(3, 'Charlie', 101, 62000, '2016-02-10'),
(4, 'Hank', 103, 95000, '2014-11-25');

-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    manager_id INT
);

INSERT INTO departments VALUES 
(101, 'IT', 1),
(102, 'HR', 2),
(103, 'Finance', 4);

-- Projects Table
CREATE TABLE projects (
    emp_id INT,
    project_id INT,
    project_name VARCHAR(100),
    PRIMARY KEY (emp_id, project_id)
);

INSERT INTO projects VALUES 
(1, 201, 'Cloud Migration'),
(2, 202, 'Recruitment Strategy'),
(3, 203, 'Cybersecurity Policy');

-- Salaries Table
CREATE TABLE salaries (
    emp_id INT PRIMARY KEY,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2)
);

INSERT INTO salaries VALUES 
(1, 70000, 5000),
(2, 85000, 6000),
(3, 62000, 4000),
(4, 95000, 7000);



## 📌 SQL Queries

### 1️⃣ Find Employees Earning More Than the Company’s Average Salary
```sql
SELECT * 
FROM employees e 
WHERE salary > (SELECT AVG(e2.salary) FROM employees e2);
```

### 2️⃣ List Employees Working in the Same Department as 'Alice'
```sql
SELECT *
FROM employees e
WHERE e.department_id = (SELECT department_id FROM employees WHERE emp_name = 'Alice');  
```

### 3️⃣ Find the Highest Salary in Each Department
```sql
SELECT e1.department_id, e1.salary
FROM employees e1
WHERE e1.salary = (SELECT MAX(e2.salary)
                   FROM employees e2
                   WHERE e1.department_id = e2.department_id); 
```

### 4️⃣Retrieve Employees Hired Before the Oldest IT Department Employee
```sql
SELECT e1.hire_date, e1.department_id, e1.emp_name
FROM employees e1
WHERE e1.hire_date < (SELECT MIN(e.hire_date)
                       FROM employees e
                       WHERE e.department_id = (SELECT department_id 
                                                FROM departments 
                                                WHERE department_name = 'IT'));
```

### 5️⃣ Find the Department Name of 'Hank'
```sql
SELECT e.emp_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.emp_name = 'Hank';
```

### 6️⃣ List Projects Handled by Employees Earning More Than $80,000
```sql
SELECT p.emp_id, p.project_id, p.project_name, s.salary
FROM projects p
JOIN salaries s ON p.emp_id = s.emp_id
WHERE s.salary > 80000;
```

### 7️⃣ Get Employees Who Have No Assigned Projects
```sql
SELECT e.emp_id, e.emp_name
FROM employees e
LEFT JOIN projects p ON e.emp_id = p.emp_id
WHERE p.emp_id IS NULL;
```

### 8️⃣Find the Employee with the Lowest Salary
```sql
SELECT e.emp_id, e.emp_name, e.salary
FROM employees e
ORDER BY e.salary ASC
LIMIT 1;
```

### 9️⃣ Find Employees Whose Bonus is Greater Than the Company Average
```sql
SELECT s.emp_id, s.bonus
FROM salaries s
WHERE s.bonus > (SELECT AVG(s1.bonus) FROM salaries s1);
```

### 🔟 Retrieve Names of Managers Managing at Least One Department
```sql
SELECT d.manager_id, d.department_name, e.emp_name
FROM departments d
LEFT JOIN employees e ON e.emp_id = d.manager_id;
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
