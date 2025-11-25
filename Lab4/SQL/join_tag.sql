SELECT g.title AS game_title, t.tag_name AS tag
FROM game_tag_connection gtc 
JOIN tags t ON gtc.tag_id = t.id
JOIN games g ON gtc.game_id = g.id;

-- Вибирає ігри з їхніми тегами