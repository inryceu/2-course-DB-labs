CREATE TABLE achievements (
    id SERIAL PRIMARY KEY,
    game_id INT NOT NULL,
    title VARCHAR(64) NOT NULL,
    description TEXT,
    icon VARCHAR(2083) NOT NULL CHECK (icon ~ '^(https?://).+'),
    FOREIGN KEY (game_id) REFERENCES games(id)
);