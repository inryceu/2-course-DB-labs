CREATE TYPE fr_status AS ENUM ('pending', 'accepted', 'blocked');

CREATE TABLE friends (
    user_id INT,
    friend_id INT,
    status fr_status NOT NULL DEFAULT 'pending',
    PRIMARY KEY (user_id, friend_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (friend_id) REFERENCES users(id) ON DELETE CASCADE
);