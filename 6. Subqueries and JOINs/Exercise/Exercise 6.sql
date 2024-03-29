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
    e.employee_id, first_name
FROM
    employees e
       LEFT JOIN
    employees_projects AS ep ON e.employee_id = ep.employee_id
WHERE ep.employee_id IS NULL
ORDER BY employee_id DESC
LIMIT 3;
 
 -- Exercise 6
 SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    d.name AS 'dept_name'
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
        AND d.name IN ('Sales' , 'Finance')
WHERE
    e.hire_date > '1999-01-01'
ORDER BY e.hire_date ASC;

-- Exercise 7
 SELECT 
 e.employee_id,
 e.first_name,
 p.name AS 'project_name'
 FROM employees e
	JOIN employees_projects ep ON e.employee_id = ep.employee_id
    JOIN projects p ON ep.project_id = p.project_id
 WHERE DATE(p.start_date) > '2002-08-13' AND p.end_date IS NULL
 ORDER BY e.first_name, `project_name`
 LIMIT 5;
 
-- Exercise 8
SELECT 
    e.employee_id,
    e.first_name,
    CASE
        WHEN YEAR(p.start_date) < 2005 THEN p.name
        ELSE NULL
    END AS 'project_name'
FROM
    employees e
        JOIN
    employees_projects ep ON ep.employee_id = e.employee_id
        JOIN
    projects p ON ep.project_id = p.project_id
WHERE
    e.employee_id = 24
ORDER BY project_name;

-- Exercise 9
SELECT 
    e.employee_id,
    e.first_name,
    e.manager_id,
    m.first_name AS 'manager_name'
FROM
    employees e
        JOIN
    employees m ON m.employee_id = e.manager_id
WHERE
    e.manager_id IN (3 , 7)
ORDER BY e.first_name;

-- Exercise 10 
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS 'employee_name',
    CONCAT(m.first_name, ' ', m.last_name) AS 'manager_name',
    d.name AS 'department_name'
FROM
    employees e
        JOIN
    employees m ON m.employee_id = e.manager_id
		JOIN
	departments d ON e.department_id = d.department_id
WHERE
    e.manager_id IS NOT NULL
ORDER BY e.employee_id
LIMIT 5;

-- Exercise 11
SELECT 
    AVG(salary) AS min_average_salary 
FROM employees
GROUP BY department_id
ORDER BY min_average_salary 
LIMIT 1;

-- Exercise 12
 SELECT 
 mc.country_code,
 m.mountain_range,
 p.peak_name,
 p.elevation
 FROM mountains_countries mc
	JOIN mountains m ON mc.mountain_id = m.id
    JOIN peaks p ON p.mountain_id = m.id
 WHERE mc.country_code = 'BG' AND p.elevation > 2835
 ORDER BY p.elevation DESC;

-- Exercise 13
 SELECT 
 mc.country_code,
 COUNT(m.mountain_range) AS 'mountain_range'
 FROM mountains_countries mc
	JOIN mountains m ON mc.mountain_id = m.id
 WHERE mc.country_code IN ('BG', 'RU', 'US')
 GROUP BY mc.country_code
 ORDER BY mountain_range DESC;

-- Exercise 14
 SELECT 
 c.country_name,
 r.river_name
 FROM countries c
 LEFT JOIN countries_rivers cr
 ON c.country_code = cr.country_code
 LEFT JOIN rivers r
 ON cr.river_id = r.id
 WHERE c.continent_code = 'AF'
 ORDER BY c.country_name
 LIMIT 5;
  
-- Exercise 15*
 SELECT
	c.continent_code,
    c.currency_code,
    COUNT(*) AS currency_usage
FROM
	countries c
GROUP BY c.continent_code, c.currency_code
HAVING currency_usage > 1 AND currency_usage = (SELECT
		COUNT(*) AS max_usage
	FROM 
		countries 
	WHERE 
		continent_code = c.continent_code
	GROUP BY currency_code
    ORDER BY max_usage DESC
    LIMIT 1)
ORDER BY c.continent_code, c.currency_code;
 
-- Exercise 16
SELECT COUNT(c.country_code) AS 'country_count'
FROM countries c
LEFT JOIN mountains_countries mc ON mc.country_code = c.country_code
WHERE mc.country_code IS NULL;

-- Exercise 17
 SELECT 
 c.country_name,
 MAX(p.elevation) AS 'highest_peak_elevation',
 MAX(r.length) AS 'longest_river_length'
 FROM countries c
	JOIN mountains_countries m_c ON c.country_code = m_c.country_code
    JOIN mountains m ON m_c.mountain_id = m.id
    JOIN peaks p ON m.id = p.mountain_id
    JOIN countries_rivers c_r ON c_r.country_code = c.country_code
    JOIN rivers r ON r.id = c_r.river_id
GROUP BY c.country_name
ORDER BY `highest_peak_elevation` DESC, `longest_river_length` DESC, c.country_name
LIMIT 5;
 
 
 
 