/*Find employees earning more than the company's average salary.*/
SELECT 
    *
FROM
    employees e
WHERE
    salary > (SELECT 
            AVG(e.salary)
        FROM
            employees e);
/*List employees working in the same department as 'Alice'.*/
SELECT 
    *
FROM
    employees e
WHERE
    e.department_id = (SELECT 
            e.department_id
        FROM
            employees e
        WHERE
            e.emp_name = 'Alice');
/*Find the highest salary in each department.*/
SELECT 
    e1.department_id, e1.salary
FROM
    employees e1
WHERE
    e1.salary = (SELECT 
            MAX(e2.salary) AS 'high salary'
        FROM
            employees e2
        WHERE
            e1.department_id = e2.department_id);

/*Retrieve employees hired before the oldest IT department employee.*/
SELECT 
    e1.hire_date, e1.department_id, e1.emp_name
FROM
    employees e1
WHERE
    e1.hire_date > (SELECT 
            e.hire_date
        FROM
            employees e
        WHERE
            e.department_id = (SELECT 
                    d.department_id
                FROM
                    departments d
                WHERE
                    d.department_name = 'IT')
        ORDER BY hire_date DESC
        LIMIT 1);
/*Find the department name of 'Hank'.*/
SELECT 
    emp_name, department_name
FROM
    (SELECT 
        e.emp_name, e.department_id, d.department_name
    FROM
        employees e
    JOIN departments d ON e.department_id = d.department_id) AS new_table
WHERE
    new_table.emp_name = 'Hank';
/*List projects handled by employees earning more than $80,000.*/
SELECT 
    p.emp_id, p.project_id, p.project_name, s.salary
FROM
    projects p
        JOIN
    salaries s ON p.emp_id = s.emp_id
WHERE
    s.salary > 80000;

/*Get employees who have no assigned projects.*/
SELECT 
    e.emp_id, e.emp_name
FROM
    employees e
WHERE
    e.emp_id NOT IN (SELECT 
            p.emp_id
        FROM
            projects p
                JOIN
            salaries s ON p.emp_id = s.emp_id);
/*Find the employee with the lowest salary.*/
SELECT 
    e.emp_id, e.emp_name, e.salary
FROM
    employees e
ORDER BY e.salary ASC
LIMIT 1;

/*Find employees whose bonus is greater than the company average.*/
SELECT 
    s.emp_id, s.bonus
FROM
    salaries s
WHERE
    s.bonus > (SELECT 
            AVG(s1.bonus)
        FROM
            salaries s1);
/*Retrieve the names of managers who manage at least one department.*/
SELECT 
    d.manager_id, d.department_name, e.emp_name
FROM
    departments d
        LEFT JOIN
    employees e ON e.emp_id = d.manager_id;



 


       
   
   

    








      





