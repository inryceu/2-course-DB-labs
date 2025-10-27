CREATE TYPE dev_type AS ENUM ('developer', 'publisher', 'both');

CREATE TABLE devs (
    id SERIAL PRIMARY KEY,
    dev_name VARCHAR(50) NOT NULL UNIQUE,
    contacts JSON NOT NULL,
    logo VARCHAR(2083) CHECK (logo ~ '^(https?://).+'),
    dev_type dev_type NOT NULL
);