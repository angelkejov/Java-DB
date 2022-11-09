-- Problem 1
SELECT 
    title
FROM
    `books`
WHERE
    SUBSTRING(title, 1, 3) = 'The';
-- Problem 2
SELECT 
    REPLACE(`title`, 'The', '***')
FROM
    `books`
WHERE
    SUBSTRING(title, 1, 3) = 'The';
-- Problem 3
SELECT 
    ROUND(SUM(`cost`), 2)
FROM
    `books`;
-- Problem 4
SELECT 
    CONCAT(first_name, ' ', last_name) AS `Full Name`,
    TIMESTAMPDIFF(day, born, died) AS days_lived
FROM
    `authors`;
-- Problem 5
