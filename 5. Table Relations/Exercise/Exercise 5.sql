-- Exercise 1
CREATE TABLE passports(
	passport_id INT AUTO_INCREMENT PRIMARY KEY,
    passport_number VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO passports (passport_id, passport_number)
VALUES
(101, 'N34FG21B'),
(102,'K65LO4R7'),
(103,'ZE657QP2');

CREATE TABLE people(
	person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    salary DECIMAL(16,2),
    passport_id INT UNIQUE,
    CONSTRAINT fk_people_passwords
    FOREIGN KEY	(passport_id)
    REFERENCES passports(passport_id)
);

INSERT INTO people (person_id, first_name, salary, passport_id)
VALUES 
(1, 'Roberto',43300, 102),
(2, 'Tom', 56100, 103),
(3, 'Yana', 60200, 101);

-- Exercise 2
CREATE TABLE manufacturers(
	manufacturer_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    established_on DATE
);

INSERT INTO manufacturers (`name`, established_on)
VALUES
('BMW', '1916-03-01'),
('Tesla', '2003-01-01'),
('Lada', '1966-05-01');

CREATE TABLE models(
	model_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    manufacturer_id INT,
    CONSTRAINT fk_models_manufacturer
    FOREIGN KEY (manufacturer_id)
    REFERENCES manufacturers(manufacturer_id)
);

INSERT INTO models(model_id, `name`, manufacturer_id)
VALUES
('101', 'X1', 1),
('102', 'i6', 1),
('103', 'Model S', 2),
('104', 'Model X', 2),
('105', 'Model 3', 2),
('106', 'Nova', 3);









  
