-- Problem 1
SELECT 
    employees.employee_id,
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'full_name',
    departments.department_id,
    departments.name
FROM
    employees
        JOIN
    departments ON employees.employee_id = departments.manager_id
ORDER BY employees.employee_id
LIMIT 5;

-- Problem 2
SELECT 
    towns.town_id, towns.name, addresses.address_text
FROM
    towns
        JOIN
    addresses ON towns.town_id = addresses.town_id
WHERE
    towns.name = 'San Francisco'
        OR towns.name = 'Sofia'
        OR towns.name = 'Carnation'
ORDER BY town_id , address_id;

-- Problem 3
SELECT 
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    departments.department_id,
    employees.salary
FROM
    employees
        JOIN
    departments ON employees.department_id = departments.manager_id
WHERE
    employees.manager_id IS NULL
LIMIT 3;

-- Problem 4
SELECT 
    COUNT(employee_id)
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees);
