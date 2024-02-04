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









