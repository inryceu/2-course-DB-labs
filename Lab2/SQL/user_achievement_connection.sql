CREATE TABLE user_achieve_connection (
    user_id INT,
    achievement_id INT,
    PRIMARY KEY (game_id, tag_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (achievement_id) REFERENCES achievements(id) ON DELETE CASCADE
);