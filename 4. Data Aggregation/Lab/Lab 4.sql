SELECT * FROM employees;

-- Exercise 1 
SELECT department_id,
COUNT(department_id) AS 'Number of employees'
FROM employees
GROUP BY department_id
ORDER BY department_id, `Number of employees`;

-- Exercise 2
  SELECT 
  department_id,
  ROUND(AVG(salary), 2) AS 'Average Salary'
  FROM employees
  GROUP BY department_id
  ORDER BY department_id;