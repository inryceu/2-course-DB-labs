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

| ID | Use Case | Description |
|----|-----------|-------------|
| UC_Browse | Browse Games | Гравець переглядає каталог доступних ігор на платформі Steam. |
| UC_Search | Search Games by Tag | Гравець здійснює пошук ігор за тегами, жанрами або ключовими словами. |
| UC_View | View Game Details | Гравець переглядає детальну інформацію про гру: опис, рейтинг, розробника, видавця тощо. |
| UC_Wishlist | Add to Wishlist | Гравець додає гру до списку бажаного для подальшої покупки. |
| UC_Purchase | Purchase Game | Гравець купує гру через платіжну систему, після чого отримує доступ до встановлення. |
| UC_Install | Install Game | Гравець встановлює куплену гру на свій пристрій через Steam-клієнт. |
| UC_Play | Play Game | Гравець запускає гру для проходження, взаємодіє з нею через Steam. |
| UC_Track | Track Playtime | Система відстежує тривалість гри користувача та зберігає статистику. |
| UC_WriteReview | Write Review | Гравець пише відгук про гру після покупки або проходження. |
| UC_ReadReview | Read Reviews | Гравець переглядає відгуки інших користувачів про гру. |
| UC_PubPublish | Publish Game | Видавець розміщує нову гру на платформі Steam для продажу. |
| UC_PubCatalog | Manage Game Catalog | Видавець керує каталогом своїх ігор: редагує опис, ціни, статуси. |
| UC_Payment | Process Payment | Платіжна система обробляє фінансову транзакцію при купівлі гри. |
| UC_SyncCloud | Sync Cloud Data | Система синхронізує дані гравця (збереження, налаштування) із хмарним сховищем. |

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
