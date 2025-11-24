SELECT u1.username, u2.username, u1.region
FROM users u1
CROSS JOIN users u2
WHERE u1.region = u2.region AND u1.id < u2.id;

-- Вибирає пари користувачів з однаковим регіоном