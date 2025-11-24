SELECT region, AVG(age) AS avg_age
FROM users
GROUP BY region;

-- Вибирає середній вік користувача у регіоні