## **Steam Clone**

## **_Steam Clone_** — це бекенд модель, яка демонструє роботу Steam: цифровий магазин ігрових продуктів з функціями бібліотеки ігор, соціальної взаємодії та управління користувачами.

**Система дозволяє:**

- купувати, зберігати й запускати ігри,
- додавати друзів,
- залишати відгуки,
- зберігати прогрес у хмарі,
- отримувати досягнення,
- брати участь у розпродажах та івентах.

---

**Основні сутності**

- User — користувач платформи
- Game — гра (базова чи DLC)
- Developer/Publisher — розробники та видавці
- Tag — жанри та категорії
- Library — бібліотека користувача
- Review — відгуки на ігри
- Friendship — система друзів
- Achievement — досягнення в іграх
- CloudSave — хмарні збереження
- Sale/Event — розпродажі та івенти

---

**Usecases** _(will be edited)_

1. **Реєстрація та автентифікація користувача**

- Створення акаунту
- Вхід у систему
- Редагування профілю

2. **Робота з іграми**

- Перегляд каталогу ігор
- Купівля, оренда, додавання у список бажаного
- Завантаження та встановлення ігор

3. **Функції взаємодії**

- Додавання друзів
- Прийняття/відхилення запиту
- Блокування користувачів

4. **Відгуки та рейтинг**

- Написання відгуку з рейтингом
- Перегляд відгуків інших гравців

5. **Хмарні збереження**

- Збереження прогресу гри
- Завантаження збереження на іншому пристрої

6. **Досягнення**

- Отримання досягнень під час гри
- Перегляд колекції досягнень

7. **Розпродажі та івенти**

- Участь у сезонних знижках
- Доступ до безкоштовних вихідних або роздач

---

| Сутність        | Поле           | Тип            | Обмеження                             | Приклад                       |
| --------------- | -------------- | -------------- | ------------------------------------- | ----------------------------- |
| **User**        | username       | VARCHAR(3–20)  | Унікальний, без спецсимволів          | `Gamer123`                    |
|                 | email          | VARCHAR        | Унікальний, формат email              | `user@mail.com`               |
|                 | password_hash  | VARCHAR        | Хешований пароль                      | `$2a$10$...`                  |
|                 | age            | INT            | ≥13                                   | `21`                          |
|                 | region         | VARCHAR(2)     | ISO-код країни                        | `UA`                          |
|                 | avatar         | URL            | Валідне посилання                     | `https://cdn.site/avatar.png` |
| **Game**        | title          | VARCHAR(2–100) | Унікальна назва                       | `Half-Life 2`                 |
|                 | price          | DECIMAL(6,2)   | ≥0                                    | `29.99`                       |
|                 | release_date   | DATE           | Не в майбутньому                      | `2004-11-16`                  |
|                 | age_rating     | ENUM           | ESRB/PEGI                             | `PEGI 18`                     |
|                 | cover          | URL            | Валідне зображення                    | `https://cdn.site/cover.jpg`  |
| **Library**     | ownership_type | ENUM           | wishlist, rented, purchased           | `purchased`                   |
|                 | status         | ENUM           | installed, not installed, in progress | `installed`                   |
|                 | hours_played   | INT            | ≥0                                    | `125`                         |
| **Review**      | rating         | INT(1–10)      | Тільки цілі числа                     | `9`                           |
| **Friendship**  | status         | ENUM           | pending, accepted, blocked            | `accepted`                    |
| **Achievement** | title          | VARCHAR(3–50)  | Унікальна назва в межах гри           | `First Blood`                 |
| **Sale/Event**  | discount       | DECIMAL(3,2)   | 0–1 (частка знижки)                   | `0.50`                        |
|                 | event_type     | ENUM           | sale, free_weekend, giveaway          | `sale`                        |

---

**Приклади валідних даних**

**Користувач**

```
{
  "username": "GamerX",
  "email": "gamerx@example.com",
  "password_hash": "$2a$10$T9fjK...",
  "age": 19,
  "region": "UA",
  "avatar": "https://cdn.site/avatars/123.png",
  "created_at": "2025-01-01T12:00:00",
  "last_login": "2025-09-30T21:45:00"
}
```

**Гра**

```
{
  "title": "Cyberpunk 2077",
  "price": 59.99,
  "release_date": "2020-12-10",
  "age_rating": "PEGI 18",
  "cover": "https://cdn.site/covers/cp2077.jpg",
  "description": "Open-world RPG in Night City.",
  "system_requirements": {
    "OS": "Windows 10",
    "CPU": "Intel i7",
    "RAM": "16 GB",
    "GPU": "RTX 2060"
  },
  "base_game_id": null
}
```

**Бібліотека**

```
{
  "user_id": 1,
  "game_id": 42,
  "ownership_type": "purchased",
  "status": "installed",
  "hours_played": 87,
  "last_played": "2025-09-29T23:00:00"
}
```
