# 🚀 SQL Subqueries & Joins - CompanyDB Project  

## 📌 Project Overview  
This project focuses on **SQL subqueries and joins** to analyze a company's employee data.  
Key learning areas:  
- ✅ Subqueries & Nested Queries  
- ✅ INNER JOIN, LEFT JOIN, RIGHT JOIN  
- ✅ Aggregation Functions (SUM, AVG, COUNT, MAX, MIN)  
- ✅ Filtering Data with WHERE, HAVING, GROUP BY  
- ✅ Using ORDER BY & LIMIT for Data Analysis  

---

## 📂 Database Schema  
The dataset consists of **four tables**:  

### **1️⃣ Employees Table**  
```sql
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE
);
### **2️⃣ Departments Table**  
```sql
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_id INT
);
### **3️⃣ Salaries Table**
```sql
Copy
Edit
CREATE TABLE Salaries (
    emp_id INT,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);
### **4️⃣ Projects Table**
```sql
Copy
Edit
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT,
    department_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
