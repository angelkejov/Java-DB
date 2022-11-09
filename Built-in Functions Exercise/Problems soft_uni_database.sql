-- Problem 1
SELECT 
    first_name, last_name
FROM
    `employees`
WHERE
    SUBSTRING(first_name, 1, 2) = 'Sa';
    
-- Problem 2
SELECT 
    first_name, last_name
FROM
    `employees`
WHERE
    INSTR(last_name, 'ei');

-- Problem 3
SELECT 
    first_name
FROM
    `employees`
WHERE
    (department_id = 3 OR department_id = 10)
        AND YEAR(hire_date) BETWEEN '1995' AND '2005';

-- Problem 4
SELECT 
    first_name, last_name
FROM
    `employees`
WHERE
    NOT INSTR(job_title, 'engineer');

-- Problem 5
SELECT 
    name
FROM
    `towns`
WHERE
    LENGTH(name) = 5 OR LENGTH(name) = 6
ORDER BY name ASC;

-- Problem 6
SELECT 
    town_id, name
FROM
    `towns`
WHERE
    name REGEXP '^[MmKkBbEe]'
ORDER BY name ASC;

-- Problem 7
SELECT 
    town_id, name
FROM
    `towns`
WHERE
    name NOT REGEXP '^[RrBbDd]'
ORDER BY name ASC;

-- Problem 8
CREATE VIEW v_employees_hired_after_2000 AS
    SELECT 
        first_name, last_name
    FROM
        `employees`
    WHERE
        YEAR(hire_date) > 2000;
        
-- Problem 9
SELECT first_name, last_name FROM `employees`
WHERE LENGTH(last_name) = 5;

-- Problem 10

