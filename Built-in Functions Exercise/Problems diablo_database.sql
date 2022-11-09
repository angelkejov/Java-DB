-- Problem 12
SELECT 
    name, DATE_FORMAT(start, '%Y-%m-%d') AS start
FROM
    `games`
WHERE
    YEAR(start) = 2011 OR YEAR(start) = 2012
ORDER BY start , name
LIMIT 50;

-- Problem 13
SELECT 
    user_name,
    SUBSTRING(email,
        LOCATE('@', email) + 1,
        LENGTH(email) - LOCATE('@', email)) AS email_provider
FROM
    `users`
ORDER BY email_provider ASC, user_name;

-- Problem 14
SELECT 
    user_name, ip_address
FROM
    `users`
WHERE
    ip_address LIKE '___.1%.%.___'
ORDER BY user_name;

-- Problem 15
SELECT 
    `name`,
    IF(HOUR(`start`) >= 0
            AND HOUR(`start`) < 12,
        'Morning',
        IF(HOUR(`start`) >= 12
                AND HOUR(`start`) < 18,
            'Afternoon',
            'Evening')) AS `Part of the Day`,
    IF(`duration` <= 3,
        'Extra Short',
        IF(`duration` > 3 AND `duration` <= 6,
            'Short',
            IF(`duration` > 6 AND `duration` <= 10,
                'Long',
                'Extra Long'))) AS `Duration`
FROM
    `games`;