SELECT u.username, l.game_id AS second_game
FROM users u
LEFT JOIN libraries l ON u.id = l.user_id AND l.game_id = 2;

-- Показує, які користувачі мають другу гру