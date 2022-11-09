-- Problem 10
SELECT 
    country_name, iso_code
FROM
    `countries`
WHERE
    country_name LIKE '%a%a%a%'
ORDER BY iso_code;

-- Problem 11
SELECT 
    a.peak_name,
    b.river_name,
    LOWER(CONCAT(a.peak_name, SUBSTRING(b.river_name, 2))) AS mix
FROM
    peaks a,
    rivers b
WHERE
    LOWER(RIGHT(a.peak_name, 1)) = LOWER(LEFT(b.river_name, 1))
ORDER BY mix;