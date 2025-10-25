CREATE TYPE ev_type AS ENUM ('sale', 'giveaway', 'free weekend');

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    game_id INT NOT NULL,
    discount DECIMAL(5,2) CHECK (discount >= 0 AND discount <= 100),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    type ev_type NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);