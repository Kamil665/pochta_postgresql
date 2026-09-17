# PostgreSQL — Users & Pochta

Простой учебный проект на **PostgreSQL**, демонстрирующий создание двух связанных таблиц, добавление данных и получение информации с помощью `JOIN`.

## 📌 О проекте

В проекте используются две таблицы:

* `users` — пользователи;
* `pochta` — посылки пользователей.

Таблицы связаны отношением **один-ко-многим (1:N)**:

```text
Один пользователь
       │
       ├── Посылка 1
       ├── Посылка 2
       └── Посылка 3
```

Один пользователь может иметь несколько посылок.

---

## 🗂 Структура базы данных

### Таблица `users`

| Поле    | Тип            | Описание                 |
| ------- | -------------- | ------------------------ |
| `id`    | `SERIAL`       | Уникальный идентификатор |
| `name`  | `VARCHAR(100)` | Имя пользователя         |
| `email` | `VARCHAR(100)` | Электронная почта        |
| `age`   | `INTEGER`      | Возраст                  |

### Таблица `pochta`

| Поле      | Тип            | Описание                         |
| --------- | -------------- | -------------------------------- |
| `id`      | `SERIAL`       | Уникальный идентификатор посылки |
| `user_id` | `INTEGER`      | ID пользователя                  |
| `package` | `VARCHAR(100)` | Название посылки                 |

---

## 🔗 Связь между таблицами

Связь осуществляется через:

```text
users.id
    ↓
pochta.user_id
```

В таблице `users` поле `id` является `PRIMARY KEY`.

В таблице `pochta` поле `user_id` является `FOREIGN KEY`.

```sql
FOREIGN KEY (user_id) REFERENCES users(id)
```

Это означает, что `user_id` в таблице `pochta` должен соответствовать существующему пользователю из таблицы `users`.

---

## 🛠 Используемые технологии

* PostgreSQL
* SQL
* `CREATE TABLE`
* `INSERT INTO`
* `SELECT`
* `JOIN`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `SERIAL`

---

## 📋 Создание таблиц

```sql
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
```

---

## ➕ Добавление пользователей

```sql
INSERT INTO users (name, email, age)
VALUES
    ('Kamil', 'kamil@gmail.com', 21),
    ('Ivan', 'ivan@gmail.com', 20),
    ('Sasha', 'sasha@gmail.com', 23);
```

---

## 📦 Добавление посылок

```sql
INSERT INTO pochta (user_id, package)
VALUES
    (1, 'Телефон'),
    (1, 'Ноутбук'),
    (2, 'Книга'),
    (3, 'Одежда'),
    (3, 'Обувь');
```

---

## 🔍 Получение данных

Получить всех пользователей:

```sql
SELECT * FROM users;
```

Получить все посылки:

```sql
SELECT * FROM pochta;
```

---

## 🔗 Объединение таблиц

Для получения информации о пользователях вместе с их посылками используется `JOIN`:

```sql
SELECT
    users.id,
    users.name,
    users.email,
    users.age,
    pochta.id AS package_id,
    pochta.package
FROM users
JOIN pochta
    ON users.id = pochta.user_id;
```

Результат:

```text
id | name  | email            | age | package_id | package
---+-------+------------------+-----+------------+---------
1  | Kamil | kamil@gmail.com  | 21  | 1          | Телефон
1  | Kamil | kamil@gmail.com  | 21  | 2          | Ноутбук
2  | Ivan  | ivan@gmail.com   | 20  | 3          | Книга
3  | Sasha | sasha@gmail.com  | 23  | 4          | Одежда
3  | Sasha | sasha@gmail.com  | 23  | 5          | Обувь
```

---

## 📊 Итоговая связь

```text
┌─────────────────────────┐
│         users           │
├─────────────────────────┤
│ id       PRIMARY KEY    │
│ name                    │
│ email                   │
│ age                     │
└────────────┬────────────┘
             │
             │ 1
             │
             │ N
┌────────────▼────────────┐
│         pochta          │
├─────────────────────────┤
│ id       PRIMARY KEY    │
│ user_id  FOREIGN KEY    │
│ package                 │
└─────────────────────────┘
```

---

## 🎯 Цель проекта

Цель проекта — изучить основы работы с **PostgreSQL** и научиться:

1. Создавать таблицы.
2. Определять первичные ключи.
3. Создавать внешние ключи.
4. Связывать таблицы между собой.
5. Добавлять данные.
6. Получать данные с помощью `SELECT`.
7. Объединять таблицы с помощью `JOIN`.

---

## 👨‍💻 Автор

**Kamil**

Учебный проект по работе с базами данных и PostgreSQL.
