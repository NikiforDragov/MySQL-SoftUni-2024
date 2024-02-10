CREATE DATABASE preserves_db;

-- 1 

CREATE table continents(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE countries(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    country_code VARCHAR(10) NOT NULL UNIQUE,
    continent_id INT NOT NULL,
    FOREIGN KEY (continent_id) REFERENCES continents(id)
);

CREATE TABLE preserves(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    area INT,
    type VARCHAR(20),
    established_on DATE
);

CREATE TABLE positions(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    description TEXT,
    is_dangerous BOOLEAN
);

CREATE TABLE workers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    age INT,
    personal_number VARCHAR(20) NOT NULL UNIQUE,
    salary DECIMAL(19,2),
    is_armed BOOLEAN NOT NULL,
    start_date DATE,
    preserve_id INT,
    position_id INT,
    FOREIGN KEY (preserve_id) REFERENCES preserves(id),
    FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE countries_preserves(
	country_id INT NOT NULL,
    preserve_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (preserve_id) REFERENCES preserves(id)
);

-- 2

INSERT INTO preserves (name, latitude, longitude, area, type, established_on)
SELECT 
	CONCAT(name, ' ', 'is in South Hemisphere'),
    latitude,
    longitude,
    area * id,
    LOWER(type),
    established_on
FROM preserves
WHERE latitude < 0;

-- 3 not sended

UPDATE workers
SET salary = salary + 500
WHERE position_id IN (5, 8, 11, 13);

-- 4

DELETE FROM preserves 
WHERE established_on IS NULL;

-- 5 

SELECT 
CONCAT(first_name, ' ', last_name) AS full_name,
DATEDIFF('2024-01-01', start_date) AS days_of_experience
FROM workers
WHERE start_date <= '2024-01-01' AND FLOOR(DATEDIFF('2024-01-01', start_date) / 365) > 5
ORDER BY days_of_experience DESC
LIMIT 10;

-- 6

SELECT
 w.id,
 w.first_name,
 w.last_name,
 p.name AS preserve_name,
 c.country_code AS country_code
FROM workers w
	JOIN preserves p ON p.id = w.preserve_id
    JOIN countries_preserves cp ON cp.preserve_id = w.preserve_id
    JOIN countries c ON c.id = cp.country_id
WHERE w.salary > 5000 AND w.age < 50
ORDER BY country_code; 

-- 7

SELECT 
 p.name,
 COUNT(w.id) AS armed_workers
FROM workers w
	JOIN preserves p ON p.id = w.preserve_id
WHERE w.is_armed = 1
GROUP BY p.name
ORDER BY armed_workers DESC, p.name;

-- 8

SELECT 
p.name,
c.country_code AS country_code,
YEAR(p.established_on) AS founded_in
FROM preserves p
	JOIN countries_preserves cp ON cp.preserve_id = p.id
    JOIN countries c ON c.id = cp.country_id
WHERE MONTH(p.established_on) = 5
ORDER BY p.established_on
LIMIT 5;

-- 9

SELECT 
id,
name,
CASE
	WHEN area <= 100
     THEN 'very small'
    WHEN area > 100 AND area <= 1000
     THEN 'small'
    WHEN area > 1000 AND area <= 10000
     THEN 'medium'
    WHEN area > 10000 AND area <= 50000
     THEN 'large'
    WHEN area > 50000
     THEN 'very large'
END AS category
FROM preserves
ORDER BY area DESC; 

-- 10

DELIMITER $$

CREATE FUNCTION udf_average_salary_by_position_name (name VARCHAR(40))
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
	DECLARE average_salary DECIMAL(19,2);
		SET average_salary := (
			SELECT
			AVG(w.salary) AS position_average_salary
			FROM workers w
			JOIN positions p ON p.id = w.position_id
			WHERE p.name = name
			GROUP BY p.name);
    RETURN average_salary;
END $$

-- 11

CREATE PROCEDURE udp_increase_salaries_by_country(country_name VARCHAR(40)) 
BEGIN
	UPDATE workers w
	JOIN countries_preserves cp ON cp.preserve_id = w.preserve_id
    JOIN countries c ON c.id = cp.country_id
SET w.salary = w.salary * 1.05
WHERE c.name = country_name;
END $$

UPDATE workers w
	JOIN countries_preserves cp ON cp.preserve_id = w.preserve_id
    JOIN countries c ON c.id = cp.country_id
SET w.salary = w.salary * 1.05
WHERE c.name = 'Germany' $$ 

DELIMITER ;

CALL udp_increase_salaries_by_country ('Germany');























