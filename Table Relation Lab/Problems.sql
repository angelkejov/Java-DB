-- Problem 1
CREATE TABLE mountains (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30)
);

CREATE TABLE peaks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    mountain_id INT,
    CONSTRAINT fk_mountains_peaks FOREIGN KEY (mountain_id)
        REFERENCES mountains (id)
);

-- Problem 2
SELECT v.driver_id, v.vehicle_type,
CONCAT(c.first_name, ' ', c.last_name) AS 'driver_name' FROM campers AS c
JOIN vehicles AS v ON v.driver_id  = c.id;

-- Problem 3
