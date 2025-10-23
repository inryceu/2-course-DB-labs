CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    tag_name VARCHAR(25) NOT NULL UNIQUE CHECK (tag_name ~ '^[a-zA-Z ]{3,25}$')
);