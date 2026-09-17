CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    age INTEGER
);

CREATE TABLE pochta (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    package VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (name, email, age)
VALUES
    ('Kamil', 'kamil@gmail.com', 21),
    ('Ivan', 'ivan@gmail.com', 20),
    ('Sasha', 'sasha@gmail.com', 23);

INSERT INTO pochta (user_id, package)
VALUES
    (1, 'Телефон'),
    (1, 'Ноутбук'),
    (2, 'Книга'),
    (3, 'Одежда'),
    (3, 'Обувь');

SELECT * FROM users;

SELECT * FROM pochta;

SELECT
    users.name,
    users.email,
    users.age,
    pochta.package
FROM users
JOIN pochta
    ON users.id = pochta.user_id;
