CREATE TYPE own_type AS ENUM ('rented', 'wishlist', 'purchased');
CREATE TYPE download_type AS ENUM ('installed', 'not_installed', 'in_progress');

CREATE TABLE libraries (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    hours_played INT NOT NULL CHECK (hours_played >= 0) DEFAULT 0,
    ownership own_type NOT NULL,
    download_status download_type,
    UNIQUE (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);