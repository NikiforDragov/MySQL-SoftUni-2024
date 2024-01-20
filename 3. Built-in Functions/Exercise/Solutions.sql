-- Part I – Queries for SoftUni Database

-- Exercise 1
SELECT first_name, last_name
FROM  employees
WHERE first_name LIKE 'Sa%'
ORDER BY employee_id;

-- Exercise 2
SELECT first_name, last_name
FROM  employees
WHERE last_name LIKE '%ei%'
ORDER BY employee_id;

-- Exercise 3
SELECT first_name
FROM employees
WHERE 
department_id IN (3,10)
AND EXTRACT(YEAR from hire_date) >= 1995 
AND EXTRACT(YEAR from hire_date) <= 2005
ORDER BY employee_id;

-- Exercise 4
SELECT first_name, last_name
FROM employees
WHERE job_title NOT LIKE '%engineer%'
ORDER BY employee_id;

-- Exercise 5
SELECT `name` 
FROM towns
WHERE CHAR_LENGTH(`name`) 
BETWEEN 5 AND 6
ORDER BY `name`;

-- Exercise 6
SELECT * 
FROM towns
WHERE `name` LIKE 'm%' 
OR `name` LIKE 'k%'
OR `name` LIKE 'b%'
OR `name` LIKE 'e%'
ORDER BY `name`; 

-- Exercise 7
SELECT * 
FROM towns
WHERE `name` NOT LIKE 'r%' 
AND `name` NOT LIKE 'b%'
AND `name` NOT LIKE 'd%'
ORDER BY `name`;

-- Exercise 8
CREATE VIEW v_employees_hired_after_2000 AS
SELECT first_name, last_name
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) > 2000;

SELECT * FROM
v_employees_hired_after_2000;

-- Exercise 9
SELECT first_name, last_name
FROM employees
WHERE CHAR_LENGTH(last_name) = 5;

-- Part II – Queries for Geography Database 

-- Exercise 10
  SELECT country_name, iso_code
  FROM countries
  WHERE country_name LIKE '%a%a%a%'
  ORDER BY iso_code;





















 