-- Problem 1
SELECT 
    employees.employee_id,
    employees.job_title,
    addresses.address_id,
    addresses.address_text
FROM
    employees
        JOIN
    addresses ON employees.address_id = addresses.address_id
ORDER BY address_id ASC
LIMIT 5;

-- Problem 2
SELECT 
    employees.first_name,
    employees.last_name,
    towns.name,
    addresses.address_text
FROM
    employees
        JOIN
    addresses ON employees.address_id = addresses.address_id
        JOIN
    towns ON addresses.town_id = towns.town_id
ORDER BY employees.first_name ASC , employees.last_name
LIMIT 5;

-- Problem 3
SELECT 
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    departments.name
FROM
    employees
        JOIN
    departments ON employees.department_id = departments.department_id
WHERE
    departments.name = 'Sales'
ORDER BY employees.employee_id DESC;

-- Problem 4
SELECT 
    employees.employee_id,
    employees.first_name,
    employees.salary,
    departments.name
FROM
    employees
        JOIN
    departments ON employees.department_id = departments.department_id
WHERE
    employees.salary > 15000
ORDER BY departments.department_id DESC
LIMIT 5;

-- Problem 5

-- Problem 6
SELECT 
    employees.first_name,
    employees.last_name,
    employees.hire_date,
    departments.name
FROM
    employees
        JOIN
    departments ON employees.department_id = departments.department_id
WHERE
    employees.hire_date > '1999/1/1'
        AND departments.name = 'Sales'
        OR departments.name = 'Finance'
ORDER BY employees.hire_date ASC;

-- Problem 7
SELECT 
    e.employee_id, e.first_name, p.name
FROM
    employees AS e
        JOIN
    employees_projects AS ep ON e.employee_id = ep.employee_id
        JOIN
    projects AS p ON p.project_id = ep.project_id
WHERE
    DATE(p.start_date) > '2002/08/13'
        AND P.END_DATE IS NULL
ORDER BY e.first_name ASC , p.name ASC
LIMIT 5;

-- Problem 8
SELECT 
    e.employee_id,
    e.first_name,
    CASE
        WHEN p.start_date > '2005' THEN NULL
        ELSE p.name
    END AS project_name
FROM
    employees AS e
        JOIN
    employees_projects AS ep ON e.employee_id = ep.employee_id
        JOIN
    projects AS p ON ep.project_id = p.project_id
WHERE
    e.employee_id = 24
ORDER BY p.name ASC;

-- Problem 9
SELECT e.employee_id, e.first_name, e.manager_id

