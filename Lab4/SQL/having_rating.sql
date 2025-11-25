SELECT game_id, AVG(rating) AS avg_rating
FROM reviews
GROUP BY game_id
HAVING AVG(rating) > 3;

-- Вибирає ігри з середнім рейтингом вище 3