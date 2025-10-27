CREATE TABLE game_dev_connection (
    game_id INT,
    dev_id INT,
    PRIMARY KEY (game_id, dev_id),
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (dev_id) REFERENCES devs(id) ON DELETE CASCADE
);