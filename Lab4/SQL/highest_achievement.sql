SELECT u.username, j.a_count AS highest_achievement_count
FROM users u
JOIN (
    SELECT uac.user_id AS id, COUNT(uac.achievement_id) AS a_count
    FROM user_achieve_connection uac 
    GROUP BY uac.user_id
) j ON u.id = j.id
ORDER BY j.a_count DESC
LIMIT 1;

-- Вибирає користувача з найбільшою кількістю досягнень