DELIMITER $
-- Exercise 1 
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE e_count INT;
    SET e_count := (SELECT COUNT(employee_id) FROM employees AS e
		JOIN addresses AS a ON a.address_id = e.address_id
        JOIN towns AS t ON t.town_id = a.town_id
	WHERE t.name = town_name);
    RETURN e_count;
END $

SELECT ufn_count_employees_by_town('Plovdiv')

-- Exercise 2

DELIMITER $

CREATE PROCEDURE  usp_raise_salaries(department_name VARCHAR(50))
BEGIN
	UPDATE employees AS e
		JOIN departments AS d
	ON e.department_id = d.department_id
    SET salary = salary * 1.05
    WHERE d.name = department_name;
END $

DELIMITER ; 


-- Exercise 3
DELIMITER $





DELIMITER ;





 


