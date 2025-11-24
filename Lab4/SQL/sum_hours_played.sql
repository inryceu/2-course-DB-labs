SELECT game_id, SUM(hours_played) AS total_hours
FROM libraries
GROUP BY game_id;

-- Вибирає загальну кількість годин, проведених у кожній грі