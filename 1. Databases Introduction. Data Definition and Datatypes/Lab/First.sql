SELECT * FROM gamebar.employees;

CREATE TABLE peope (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE employees(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE categories(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE products(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    category_id INT NOT NULL
);

INSERT INTO employees(first_name, last_name) 
VALUES 
('Field', "List"),
("Second", "Entry"),
('Third', 'Employee');

SELECT *
FROM employees;

ALTER TABLE employees
ADD COLUMN middle_name VARCHAR(50) NOT NULL;

ALTER TABLE employees
MODIFY COLUMN middle_name VARCHAR(100);

ALTER TABLE `gamebar`.`products` 
ADD INDEX `fk_category_id_idx` (`category_id` ASC) VISIBLE;
;
ALTER TABLE products 
ADD CONSTRAINT FK_category_id
  FOREIGN KEY (`category_id`)
  REFERENCES categories (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
