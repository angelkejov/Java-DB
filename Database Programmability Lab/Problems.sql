-- Problem 1
DELIMITER $$
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE e_count INT;
SET e_count := (SELECT COUNT(employee_id) FROM employees AS e
WHERE t.name = town_name);
RETURN e_count;
END
$$
select ufn_count_employees_by_town('Sofia');