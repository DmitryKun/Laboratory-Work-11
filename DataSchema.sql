CREATE TABLE "User" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25),
    dateOfBirth DATE,
    email VARCHAR(50) UNIQUE,
    login VARCHAR(50),
    password VARCHAR(50),
    status VARCHAR(15) CHECK (status IN ('Active', 'Inactive', 'Blocked'))
);

CREATE TABLE Friend (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25),
    dateOfBirth DATE,
    email VARCHAR(50),
    status VARCHAR(15) CHECK (status IN ('Friend', 'Pending', 'Blocked')),
    userId INTEGER REFERENCES "User" (id)
);

CREATE TABLE Settings (
    id SERIAL PRIMARY KEY,
    background INTEGER,
    font INTEGER,
    userId INTEGER REFERENCES "User" (id)
);

CREATE TABLE Chat (
    firstUser INTEGER REFERENCES "User" (id),
    secondUser INTEGER REFERENCES "User" (id)
);

ALTER TABLE "User" ADD CONSTRAINT unique_email UNIQUE (email);
ALTER TABLE "User" ADD CONSTRAINT check_name_characters CHECK (name ~ '^[A-Za-z]+$');
ALTER TABLE "User" ADD CONSTRAINT check_email_format CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$');

ALTER TABLE Friend ADD CONSTRAINT unique_user_email UNIQUE (userId, email);
ALTER TABLE Friend ADD CONSTRAINT check_name_characters CHECK (name ~ '^[A-Za-z]+$');
ALTER TABLE Friend ADD CONSTRAINT check_email_format CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$');
