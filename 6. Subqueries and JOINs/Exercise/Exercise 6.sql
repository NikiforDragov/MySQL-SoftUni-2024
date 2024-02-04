-- Exercise 1
SELECT 
	e.employee_id,
    e.job_title,
    e.address_id,
    a.address_text
FROM employees AS e
	JOIN addresses AS a ON a.address_id =  e.address_id
ORDER BY e.address_id ASC
LIMIT 5;

-- Exercise 2
 SELECT 
	first_name,
    last_name,
    t.name,
    a.address_text
FROM employees AS e
	JOIN addresses AS a ON a.address_id =  e.address_id
    JOIN towns AS t ON a.town_id = t.town_id
ORDER BY first_name ASC, last_name
LIMIT 5;

-- Exercise 3 
SELECT 
	e.employee_id,
    e.first_name,
    e.last_name,
    d.name
FROM employees AS e
	JOIN departments AS d ON e.department_id =  d.department_id AND d.name = 'Sales'
ORDER BY e.employee_id DESC;

-- Exercise 4
 SELECT 
	e.employee_id,
    e.first_name,
    e.salary,
    d.name AS 'department_name'
FROM employees AS e
	JOIN departments AS d ON e.department_id =  d.department_id AND e.salary > 15000
ORDER BY e.department_id DESC
LIMIT 5;

-- Exercise 5
 SELECT 
 e.employee_id,
 first_name
 FROM employees e
 LEFT JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
 ORDER BY employee_id DESC
 LIMIT 3;
 
 -- Exercise 6
 SELECT 
	e.first_name,
    e.last_name,
    e.hire_date,
    d.name AS 'dept_name'
 FROM employees e
 JOIN  departments d ON e.department_id = d.department_id AND d.name IN ('Sales', 'Finance')
 WHERE e.hire_date > '1999-01-01'
 ORDER BY e.hire_date ASC;






