CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(6,2) CHECK (price >= 0),
    release_date DATE NOT NULL,
    age_rating VARCHAR(3) NOT NULL,
    cover VARCHAR(2083) NOT NULL CHECK (cover ~ '^(https?://).+'),
    description TEXT,
    system_requirements JSON NOT NULL,
    base_game_id INT,
    FOREIGN KEY (base_game_id) REFERENCES games(id) ON DELETE SET NULL
);