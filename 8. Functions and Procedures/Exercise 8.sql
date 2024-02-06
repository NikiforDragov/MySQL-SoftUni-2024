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

-- Exercise 3
CREATE PROCEDURE usp_get_towns_starting_with(searched VARCHAR(50))
BEGIN
	SELECT
    name AS town_name
    FROM towns
    WHERE LEFT(name, LENGTH(searched)) = searched
    ORDER BY town_name;
END $

CALL usp_get_towns_starting_with('be') $

DROP PROCEDURE usp_get_towns_starting_with $


 -- Exercise 4
 CREATE PROCEDURE usp_get_employees_from_town(town VARCHAR(50))
 BEGIN
	SELECT 
    e.first_name,
    e.last_name
    FROM employees e
    JOIN addresses a ON e.address_id = a.address_id
    JOIN towns t ON t.town_id = a.town_id
    WHERE t.name = town
    ORDER BY e.first_name, e.last_name, e.employee_id;
 END $
 
 CALL usp_get_employees_from_town('Sofia') $
 
-- Exercise 5

CREATE FUNCTION ufn_get_salary_level(salary_limiter DECIMAL(16,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
 DECLARE result VARCHAR (10);
	IF salary_limiter < 30000 THEN
		SET result := 'Low';
	ELSEIF salary_limiter BETWEEN 30000 AND 50000 THEN
		SET result := 'Average';
	ELSE 
		SET result := 'High';
    END IF;
RETURN result;
END $

SELECT ufn_get_salary_level(10000.00) $ 








DELIMITER ;