CREATE DATABASE minions;

USE minions;

CREATE TABLE minions(
	id INT AUTO_INCREMENT,
    name VARCHAR(80),
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE towns(
	town_id INT AUTO_INCREMENT,
    name VARCHAR(80),
    PRIMARY KEY (town_id)
);

ALTER TABLE towns
DROP COLUMN town_id;

ALTER TABLE towns
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE minions
ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_town_id FOREIGN KEY (town_id) REFERENCES towns(id);

INSERT INTO towns(id,name)
VALUES
(1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna');

INSERT INTO minions(id,name,age,town_id)
VALUES
(1,'Kevin',22,1),
(2,'Bob',15,3),
(3,'Steward',NULL,2);

TRUNCATE TABLE minions;

DROP TABLE minions;
DROP TABLE towns;


CREATE TABLE people(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    picture BLOB,
    height DOUBLE(6,2),
    weight DOUBLE(6,2),
    gender CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
    biography BLOB
);

INSERT INTO people(name,picture,height,weight,gender,birthdate,biography) VALUES
('Ivan','test',1.89, 80, 'm','1999-05-15','test'),
('Pesho','test',1.89, 80, 'm','1999-05-15','test'),
('Gosho','test',1.89, 80, 'm','1999-05-15','test'),
('Lili','test',1.89, 80, 'f','1999-05-15','test'),
('Mimi','test',1.89, 80, 'f','1999-05-15','test');

CREATE TABLE users(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(26) NOT NULL,
    profile_picture BLOB,
    last_login_time DATETIME,
    is_deleted BOOLEAN
);

INSERT INTO users(username,password,profile_picture,last_login_time,is_deleted)
VALUES
('Niki99','123','test','2024-01-01',false),
('Pepi12','123','test','2024-01-01',false),
('Viki1','123','test','2024-01-01',false),
('Sisi3','123','test','2024-01-01',false),
('Gse2','123','test','2024-01-01',false);

ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY(id,username);

ALTER TABLE users 
CHANGE last_login_time last_login_time DATETIME DEFAULT NOW();

ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_id PRIMARY KEY (id),
ADD CONSTRAINT uq_usename
UNIQUE(username);

CREATE DATABASE movies;
USE movies;



-- directors (id, director_name, notes) 

CREATE TABLE directors(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    director_name VARCHAR(50) NOT NULL,
    notes TEXT
);

INSERT INTO directors(director_name,notes) VALUES
('Petar','test'),
('see','test'),
('aads','test'),
('dad','test'),
('ert','test');
 
-- •	genres (id, genre_name, notes)

CREATE TABLE genres(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL,
    notes TEXT
); 

INSERT INTO genres(genre_name,notes) VALUES
('fantasy','test'),
('yes','test'),
('comedy','test'),
('bahur','test'),
('opa','test');

-- categories (id, category_name, notes) 

CREATE TABLE categories(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    notes TEXT
);

INSERT INTO categories(category_name,notes) VALUES
('test','test'),
('test','test'),
('test','test'),
('test','test'),
('test','test');

-- •	movies (id, title, director_id, copyright_year, length, genre_id, category_id, rating, notes) 

CREATE TABLE movies(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    director_id INT NOT NULL UNIQUE,
    copyright_year YEAR,
    length TIME,
    genre_id INT NOT NULL UNIQUE,
    category_id INT NOT NULL UNIQUE,
    rating DOUBLE(6,2),
    notes TEXT
);

INSERT INTO movies(title,director_id,copyright_year,length,genre_id,category_id,rating,notes) VALUES
('test',1,'2000','00:05:00',1,1,1.1,'test'),
('test',2,'2012','00:06:00',2,2,1.1,'test'),
('test',3,'2020','00:04:00',3,3,1.1,'test'),
('test',4,'2023','00:03:00',4,4,1.1,'test'),
('test',5,'1999','00:10:00',5,5,1.1,'test');

CREATE DATABASE soft_uni;
USE soft_uni;

-- towns (id, name)
 
CREATE TABLE towns(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name  VARCHAR(80) NOT NULL
);

-- addresses (id, address_text, town_id)

CREATE TABLE addresses(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    address_text VARCHAR(80) NOT NULL,
    town_id INT,
    CONSTRAINT fk_adresses_towns
    FOREIGN KEY (town_id)
    REFERENCES towns(id)
);

-- departments (id, name)

CREATE TABLE departments(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80) NOT NULL
);

-- employees (id, first_name, middle_name, last_name, job_title, department_id, hire_date, salary, address_id)   

CREATE TABLE employees(
	id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(80) NOT NULL,
    middle_name VARCHAR(80),
    last_name VARCHAR(80) NOT NULL,
    job_title VARCHAR(80) NOT NULL,
    department_id INT,
    hire_date DATE NOT NULL,
    salary DECIMAL(19,2) NOT NULL,
    address_id INT,
    CONSTRAINT fk_employees_departments
    FOREIGN KEY (department_id)
    REFERENCES departments(id),
    CONSTRAINT fk_employees_adresses
    FOREIGN KEY (address_id)
    REFERENCES addresses(id)
);

-- •	towns: Sofia, Plovdiv, Varna, Burgas

 INSERT INTO towns(name) VALUES
 ('Sofia'),
 ('Plovdiv'),
 ('Varna'),
 ('Burgas');
 
 -- •	departments: Engineering, Sales, Marketing, Software Development, Quality Assurance
 
  INSERT INTO departments(name) VALUES
 ('Engineering'),
 ('Sales'),
 ('Marketing'),
 ('Software Development'),
 ('Quality Assurance');

-- Ivan Ivanov Ivanov	.NET Developer	Software Development	01/02/2013	3500.00 
-- Petar Petrov Petrov	Senior Engineer	Engineering	02/03/2004	4000.00
-- Maria Petrova Ivanova	Intern	Quality Assurance	28/08/2016	525.25
-- Georgi Terziev Ivanov	CEO	Sales	09/12/2007	3000.00
-- Peter Pan Pan	Intern	Marketing	28/08/2016	599.88 

INSERT INTO employees(first_name, middle_name, last_name, job_title, department_id, hire_date, salary) VALUES
('Ivan','Ivanov','Ivanov','.NET Developer',4, '2013-02-01',3500.00),
('Petar','Petrov','Petrov','Senior Engineer',1, '2004-03-02',4000.00),
('Maria','Petrova','Ivanova','Intern',5, '2016-08-28',525.25),
('Georgi','Terziev','Ivanov','CEO',2, '2007-12-09',3000.00),
('Peter','Pan','Pan','Intern',3, '2016-08-28',599.88);

SELECT name FROM towns
ORDER BY name;

SELECT name FROM departments
ORDER BY name;

SELECT first_name, last_name, job_title, salary FROM employees
ORDER BY salary DESC;

UPDATE employees
SET salary = salary * 1.1
WHERE 1=1;
SELECT salary FROM employees;

create table categories
(
	id INT(11) AUTO_INCREMENT primary key,
	category varchar(50) not null,
	daily_rate int(3),
	weekly_rate int(3),
	monthly_rate int(3),
	weekend_rate int(3)
);
create table cars
(
	id INT AUTO_INCREMENT primary key,
	plate_number varchar(50) not null,
	make varchar(50),
        model varchar(50),
	car_year int(4),
	category_id INT(11),
	doors INT(2),
	picture blob,
	car_condition varchar(50),
	available bool
);
create table employees
(
	id INT AUTO_INCREMENT primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	title varchar(50),
	notes text
);
create table customers
(
	id INT AUTO_INCREMENT primary key,
	driver_licence_number int(11) not null,
	full_name varchar(50),
	address varchar(50),
	city varchar(50),
	zip_code int(5),
	notes text
);
 
create table rental_orders 
(
	id INT AUTO_INCREMENT primary key,
	employee_id int(11) not null,
	customer_id int(11),
	car_id int(11) not null,
	car_condition varchar(50),
	tank_level INT(11),
	kilometrage_start int(11),
	kilometrage_end int(11),
	total_kilometrage int(11),
	start_date date,
	end_date date,
	total_days INT(11),
	rate_applied INT(3),
	tax_rate INT(11),
	order_status varchar(50),
	notes text
);
insert into cars(plate_number)
values ('123'),('1234'),('12345');
insert into categories(category)
values ('Classic'),('Limuzine'),('Sport');
insert into customers(driver_licence_number)
values ('2232'),('232323'),('111');
insert into employees(first_name,last_name)
values ('Ivan', 'Ivanov'),('Ivan1', 'Ivanov1'), ('Ivan2', 'Ivanov2');
insert into rental_orders(employee_id,car_id)
values (1, 1),(1, 2), (2, 3);













