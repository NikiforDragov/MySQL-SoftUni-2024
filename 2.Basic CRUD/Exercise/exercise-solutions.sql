SELECT *
FROM departments
ORDER BY department_id;

SELECT `name` 
FROM departments
ORDER BY department_id;

SELECT first_name,last_name,salary
FROM employees
ORDER BY employee_id;

SELECT first_name,middle_name,last_name
FROM employees
ORDER BY employee_id;

SELECT CONCAT(first_name, '.',last_name,'@','softuni.bg') AS 'full_email_address'
FROM employees;

SELECT * 
FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY employee_id;

SELECT first_name,last_name,job_title
FROM employees
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id;

SELECT CONCAT_WS(' ', first_name,middle_name,last_name) AS 'Full Name'
FROM employees
WHERE salary = 12500 
OR salary = 14000 
OR salary = 23600
OR salary = 25000
ORDER BY employee_id;

SELECT first_name, last_name
FROM employees
WHERE manager_id IS NULL;

SELECT * FROM employees;








