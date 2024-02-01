CREATE DATABASE relations;

-- Exercise 1
CREATE TABLE mountains(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE peaks(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    mountain_id INT,
    CONSTRAINT fk_peaks_mountain_id_mountains_id
		FOREIGN KEY (mountain_id)
        REFERENCES mountains(id)
);

-- Exercise 2
SELECT 
	vehicles.driver_id AS 'driver_id',
    vehicle_type,
    CONCAT(campers.first_name, ' ', campers.last_name) AS 'driver_name'
FROM vehicles
	JOIN campers ON campers.id = vehicles.driver_id;

-- Exercise 3
SELECT 
	starting_point AS 'route_starting_point',
    end_point AS 'route_end_point',
    leader_id,
    CONCAT(first_name, ' ', last_name) AS 'leader_name'
FROM routes
	JOIN campers ON routes.leader_id = campers.id;