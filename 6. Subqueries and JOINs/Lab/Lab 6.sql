-- 1
SELECT
	employee_id,
    CONCAT(first_name, ' ', last_name) AS 'full_name',
    departments.department_id,
    name AS 'department_name'
FROM departments
	JOIN employees ON departments.manager_id = employees.employee_id
ORDER BY employee_id
LIMIT 5;

-- 2
SELECT 
	a.town_id,
    t.name,
    a.address_text
FROM addresses AS a
	JOIN towns AS t ON a.town_id = t.town_id
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY a.town_id, a.address_id;

-- 3
SELECT 
	employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees
WHERE manager_id IS NULL;

-- 4
SELECT 
    COUNT(*) AS 'count'
FROM
    employees AS e
WHERE
    e.salary > (SELECT 
            AVG(salary)
        FROM
            employees); 