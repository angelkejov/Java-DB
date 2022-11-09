-- Problem 1
SELECT 
    department_id, name, manager_id
FROM
    `departments`;

-- Problem 2
SELECT 
    name
FROM
    `departments`
ORDER BY department_id ASC;

-- Problem 3
SELECT 
    first_name, last_name, salary
FROM
    `employees`
ORDER BY employee_id ASC;

-- Problem 4
SELECT 
    first_name, middle_name, last_name
FROM
    `employees`
ORDER BY employee_id ASC;

-- Problem 5
SELECT 
    CONCAT(first_name,
            '.',
            last_name,
            '@softuni.bg') AS `full_email_address`
FROM
    `employees`;

-- Problem 6
SELECT DISTINCT
    salary
FROM
    employees;
-- Problem 7
SELECT 
    *
FROM
    `employees`
WHERE
    job_title = 'Sales Representative';
    
-- Problem 8
SELECT 
    first_name, last_name, job_title
FROM
    `employees`
WHERE
    salary BETWEEN 20000 AND 30000;

-- Problem 9
SELECT 
    CONCAT(first_name,
            ' ',
            middle_name,
            ' ',
            last_name) AS 'Full Name'
FROM
    `employees`
WHERE
    salary = 25000 OR salary = 14000
        OR salary = 12500
        OR salary = 23600;

-- Problem 10
SELECT 
    first_name, last_name
FROM
    `employees`
WHERE
    manager_id IS NULL;

-- Problem 11
SELECT 
    first_name, last_name, salary
FROM
    `employees`
WHERE
    salary > 50000
ORDER BY salary DESC;

-- Problem 12
SELECT 
    first_name, last_name
FROM
    `employees`
ORDER BY salary DESC
LIMIT 5;

-- Problem 13
SELECT 
    first_name, last_name
FROM
    `employees`
WHERE
    department_id != 4;

-- Problem 14
SELECT 
    *
FROM
    `employees`
ORDER BY salary DESC , first_name ASC , last_name DESC , middle_name ASC , employee_id ASC;

-- Problem 15
CREATE VIEW v_employees_salaries AS
    SELECT 
        first_name, last_name, salary
    FROM
        `employees`;
        
-- Problem 16
CREATE VIEW `v_employees_job_titles` AS
    SELECT 
        CONCAT(`first_name`,
                ' ',
                middle_name,
                ' ',
                `last_name`) AS `full_name`,
        `job_title`
    FROM
        `employees`;
        

        
-- Problem 17
