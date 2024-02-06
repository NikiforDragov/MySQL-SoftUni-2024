DELIMITER $

-- Exercise 1
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
	SELECT 
		first_name,
		last_name
    FROM employees
    WHERE salary > 35000
    ORDER BY first_name, last_name, employee_id;
END $

CALL usp_get_employees_salary_above_35000 $ 

-- Exercise 2
 
 CREATE PROCEDURE usp_get_employees_salary_above(above DECIMAL(16,4))
BEGIN
	SELECT 
		first_name,
		last_name
    FROM employees
    WHERE salary >= above
    ORDER BY first_name, last_name, employee_id;
END $

CALL usp_get_employees_salary_above(1500.0000) $












DELIMITER ;