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