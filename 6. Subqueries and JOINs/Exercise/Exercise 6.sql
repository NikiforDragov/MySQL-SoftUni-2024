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
