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

-- Exercise 6
CREATE PROCEDURE usp_get_employees_by_salary_level(level_of_salary VARCHAR(10))
BEGIN
    SELECT first_name, last_name
    FROM employees
    WHERE (CASE
               WHEN level_of_salary = 'Low' THEN salary < 30000
               WHEN level_of_salary = 'Average' THEN salary BETWEEN 30000 AND 50000
               WHEN level_of_salary = 'High' THEN salary > 50000
        END)
    ORDER BY first_name DESC, last_name DESC;
END;$ 

CALL usp_get_employees_by_salary_level('Low') $

-- Exercise 7
CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS TINYINT
DETERMINISTIC
BEGIN
	RETURN word REGEXP CONCAT('^[', set_of_letters, ']+$');
END $ 

-- Exercise 8
CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
	SELECT 
    CONCAT(first_name, ' ',last_name) AS full_name
    FROM account_holders
    ORDER BY full_name, id;
END $

CALL usp_get_holders_full_name $

-- Exercise 9
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(target_salary DECIMAL(19,4))
BEGIN
	SELECT ah.first_name, ah.last_name FROM account_holders ah
    JOIN accounts a ON ah.id = a.account_holder_id
    WHERE target_salary < ( SELECT SUM(balance)
							FROM accounts
                            WHERE account_holder_id = ah.id
                            GROUP BY account_holder_id)
	GROUP BY ah.id
	ORDER BY ah.id;
END $

-- Exercise 10
CREATE FUNCTION ufn_calculate_future_value(initial DECIMAL(19,4), interest_rate DOUBLE, numYears INT)
RETURNS DECIMAL(10,4)
READS SQL DATA
BEGIN
	RETURN initial * POW(1 + interest_rate, numYears);
END $

-- Exercise 11
CREATE PROCEDURE usp_calculate_future_value_for_account(acc_id INT, interest DECIMAL(10,4))
BEGIN
SELECT a.id AS account_id,
ah.first_name, ah.last_name,
a.balance AS current_balance,
ufn_calculate_future_value(a.balance, interest, 5) AS balance_in_5_years
FROM account_holders ah
JOIN accounts a ON ah.id = a.account_holder_id
WHERE a.id = acc_id;
END $










DELIMITER ;