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

SELECT first_name, last_name, salary
FROM employees
WHERE salary > 50000
ORDER BY salary DESC;

SELECT first_name, last_name
FROM employees
ORDER BY salary DESC
limit 5;

SELECT first_name, last_name
FROM employees
WHERE department_id <> 4;

SELECT * FROM employees
ORDER BY salary DESC, first_name, last_name DESC, middle_name;

CREATE VIEW v_employees_salaries AS
  SELECT first_name,last_name,salary
  FROM employees;
  
SELECT * FROM v_employees_salaries;

CREATE VIEW v_employees_job_titles AS
 SELECT 
 CONCAT_WS(' ',first_name,middle_name,last_name) AS 'full_name',
 job_title
 FROM employees;
 
 SELECT * FROM v_employees_job_titles;
     
SELECT DISTINCT job_title 
FROM employees
ORDER BY job_title;

-- SELECT * FROM employees;










