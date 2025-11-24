SELECT d.dev_name
FROM devs d
WHERE d.id IN (
    SELECT gdc.dev_id
    FROM game_dev_connection gdc
    JOIN (
        SELECT game_id, AVG(rating) AS avg_rating
        FROM reviews
        GROUP BY game_id
    ) r ON gdc.game_id = r.game_id
    GROUP BY gdc.dev_id
    HAVING AVG(r.avg_rating) > 4
);

-- Вибирає розробників, чиї ігри мають середній рейтинг вище 4