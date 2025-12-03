# Lab 6: Prisma Migrations

### package.json

```json
{
  "name": "lab6",
  "version": "1.0.0",
  "main": "dist/test-prisma.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/test-prisma.js",
    "dev": "tsx test-prisma.ts",
    "prisma:generate": "prisma generate",
    "prisma:migrate": "prisma migrate dev",
    "prisma:studio": "prisma studio"
  },
  "type": "module",
  "devDependencies": {
    "@types/node": "^24.10.1",
    "dotenv": "^17.2.3",
    "prisma": "^6.19.0",
    "ts-node": "^10.9.2",
    "tsx": "^4.21.0",
    "typescript": "^5.9.3"
  },
  "dependencies": {
    "@prisma/client": "^6.19.0"
  }
}
```

### tsconfig.json

```json
{
  // Visit https://aka.ms/tsconfig to read more about this file
  "compilerOptions": {
    // File Layout
    // "rootDir": "./src",
    "outDir": "./dist",

    // Environment Settings
    // See also https://aka.ms/tsconfig/module
    "module": "nodenext",
    "moduleResolution": "NodeNext",
    "esModuleInterop": true,
    "target": "es2020",
    "types": ["node"],
    // For nodejs:
    // "lib": ["esnext"],
    // "types": ["node"],
    // and npm install -D @types/node

    // Other Outputs
    "sourceMap": true,
    "declaration": true,
    "declarationMap": true,

    // Stricter Typechecking Options
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,

    // Style Options
    // "noImplicitReturns": true,
    // "noImplicitOverride": true,
    // "noUnusedLocals": true,
    // "noUnusedParameters": true,
    // "noFallthroughCasesInSwitch": true,
    // "noPropertyAccessFromIndexSignature": true,

    // Recommended Options
    "strict": true,
    "jsx": "react-jsx",
    //"verbatimModuleSyntax": true,
    "isolatedModules": true,
    "noUncheckedSideEffectImports": true,
    "moduleDetection": "force",
    "skipLibCheck": true,
  },
  "ts-node": {
    "esm": true,
    "experimentalSpecifierResolution": "node"
  }
}

```

### prisma.config.ts

```typescript
import "dotenv/config";
import { defineConfig, env } from "prisma/config";

export default defineConfig({
  schema: "prisma/schema.prisma",
  migrations: {
    path: "prisma/migrations",
  },
  engine: "classic",
  datasource: {
    url: env("DATABASE_URL"),
  },
});
```

### .env
### We use links to railway with hosting of our database
```
DATABASE_URL="postgresql://user:password@host:port/database"
```

## Migration 1: Add game_news Table

### Schema Change (migrations-prisma/add_game_news_table.prisma)

```prisma
model game_news {
  id           Int      @id @default(autoincrement())
  game_id      Int
  title        String   @db.VarChar(200)
  content      String
  published_at DateTime @default(now()) @db.Timestamp(6)
  games        games    @relation(fields: [game_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
}

model games {
  game_news game_news[]
}
```

### Command

```powershell
npx prisma migrate dev --name add_game_news_table
```

## Migration 2: Add is_multiplayer Field to games

### Schema Change (migrations-prisma/add_is_multiplayer_to_games.prisma)

```prisma
model games {
  is_multiplayer Boolean @default(false)
}
```

### Command

```powershell
npx prisma migrate dev --name add_is_multiplayer_to_games
```

## Migration 3: Drop description Column from achievements

### Schema Change (migrations-prisma/drop_description_from_achievements.prisma)

```prisma
model achievements {
  id                      Int                       @id @default(autoincrement())
  game_id                 Int
  title                   String                    @db.VarChar(64)
  icon                    String                    @db.VarChar(2083)
  games                   games                     @relation(fields: [game_id], references: [id], onDelete: NoAction, onUpdate: NoAction)
  user_achieve_connection user_achieve_connection[]
}
```

### Command

```powershell
npx prisma migrate dev --name drop_description_from_achievements
```

## Final Schema (prisma/schema.prisma)

```prisma
generator client {
  provider = "prisma-client"
  output   = "../generated/prisma"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

/// This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
model achievements {
  id                      Int                       @id @default(autoincrement())
  game_id                 Int
  title                   String                    @db.VarChar(64)
  icon                    String                    @db.VarChar(2083)
  games                   games                     @relation(fields: [game_id], references: [id], onDelete: NoAction, onUpdate: NoAction)
  user_achieve_connection user_achieve_connection[]
}

/// This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
model devs {
  id                  Int                   @id @default(autoincrement())
  dev_name            String                @unique @db.VarChar(50)
  contacts            Json                  @db.Json
  logo                String?               @db.VarChar(2083)
  dev_type            dev_type
  game_dev_connection game_dev_connection[]
}

/// This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
model events {
  id         Int      @id @default(autoincrement())
  game_id    Int
  discount   Decimal? @db.Decimal(5, 2)
  start_date DateTime @db.Date
  end_date   DateTime @db.Date
  type       ev_type
  games      games    @relation(fields: [game_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
}

model friends {
  user_id                        Int
  friend_id                      Int
  status                         fr_status @default(pending)
  users_friends_friend_idTousers users     @relation("friends_friend_idTousers", fields: [friend_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
  users_friends_user_idTousers   users     @relation("friends_user_idTousers", fields: [user_id], references: [id], onDelete: Cascade, onUpdate: NoAction)

  @@id([user_id, friend_id])
}

model game_dev_connection {
  game_id Int
  dev_id  Int
  devs    devs  @relation(fields: [dev_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
  games   games @relation(fields: [game_id], references: [id], onDelete: Cascade, onUpdate: NoAction)

  @@id([game_id, dev_id])
}

model game_news {
  id           Int      @id @default(autoincrement())
  game_id      Int
  title        String   @db.VarChar(200)
  content      String
  published_at DateTime @default(now()) @db.Timestamp(6)
  games        games    @relation(fields: [game_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
}

model game_tag_connection {
  game_id Int
  tag_id  Int
  games   games @relation(fields: [game_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
  tags    tags  @relation(fields: [tag_id], references: [id], onDelete: Cascade, onUpdate: NoAction)

  @@id([game_id, tag_id])
}

/// This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
model games {
  id                  Int                   @id @default(autoincrement())
  title               String                @unique @db.VarChar(50)
  price               Decimal?              @db.Decimal(6, 2)
  release_date        DateTime              @db.Date
  age_rating          String                @db.VarChar(3)
  cover               String                @db.VarChar(2083)
  description         String?
  system_requirements Json                  @db.Json
  base_game_id        Int?
  is_multiplayer      Boolean               @default(false)
  achievements        achievements[]
  events              events[]
  game_dev_connection game_dev_connection[]
  game_news           game_news[]
  game_tag_connection game_tag_connection[]
  games               games?                @relation("gamesTogames", fields: [base_game_id], references: [id], onUpdate: NoAction)
  other_games         games[]               @relation("gamesTogames")
  libraries           libraries[]
  reviews             reviews[]
  saves               saves[]
}

/// This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
model libraries {
  id              Int            @id @default(autoincrement())
  user_id         Int
  game_id         Int
  hours_played    Int            @default(0)
  ownership       own_type
  download_status download_type?
  games           games          @relation(fields: [game_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
  users           users          @relation(fields: [user_id], references: [id], onDelete: Cascade, onUpdate: NoAction)

  @@unique([user_id, game_id])
}

/// This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
model reviews {
  id      Int     @id @default(autoincrement())
  user_id Int
  game_id Int
  rating  Int
  content String?
  games   games   @relation(fields: [game_id], references: [id], onDelete: NoAction, onUpdate: NoAction)
  users   users   @relation(fields: [user_id], references: [id], onDelete: NoAction, onUpdate: NoAction)

  @@unique([user_id, game_id])
}

model saves {
  id           Int      @id @default(autoincrement())
  user_id      Int
  game_id      Int
  save_data    Json     @db.Json
  last_updated DateTime @default(now()) @db.Timestamp(6)
  games        games    @relation(fields: [game_id], references: [id], onDelete: NoAction, onUpdate: NoAction)
  users        users    @relation(fields: [user_id], references: [id], onDelete: NoAction, onUpdate: NoAction)

  @@unique([user_id, game_id])
}

/// This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
model tags {
  id                  Int                   @id @default(autoincrement())
  tag_name            String                @unique @db.VarChar(25)
  game_tag_connection game_tag_connection[]
}

model user_achieve_connection {
  user_id        Int
  achievement_id Int
  achievements   achievements @relation(fields: [achievement_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
  users          users        @relation(fields: [user_id], references: [id], onDelete: Cascade, onUpdate: NoAction)

  @@id([user_id, achievement_id])
}

/// This table contains check constraints and requires additional setup for migrations. Visit https://pris.ly/d/check-constraints for more info.
model users {
  id                               Int                       @id @default(autoincrement())
  username                         String                    @unique @db.VarChar(20)
  email                            String                    @unique @db.VarChar(255)
  password_hash                    String                    @db.VarChar(255)
  age                              Int
  region                           String                    @db.Char(2)
  avatar                           String?                   @db.VarChar(2083)
  created_at                       DateTime?                 @default(now()) @db.Timestamp(6)
  last_login                       DateTime?                 @db.Timestamp(6)
  friends_friends_friend_idTousers friends[]                 @relation("friends_friend_idTousers")
  friends_friends_user_idTousers   friends[]                 @relation("friends_user_idTousers")
  libraries                        libraries[]
  reviews                          reviews[]
  saves                            saves[]
  user_achieve_connection          user_achieve_connection[]
}

enum dev_type {
  developer
  publisher
  both
}

enum download_type {
  installed
  not_installed
  in_progress
}

enum ev_type {
  sale
  giveaway
  free_weekend @map("free weekend")
}

enum fr_status {
  pending
  accepted
  blocked
}

enum own_type {
  rented
  wishlist
  purchased
}
```

## Test Script (test-prisma.ts)

```typescript
import "dotenv/config";
import { PrismaClient } from "./generated/prisma/client.js";

const prisma = new PrismaClient();

async function main() {
  const existingGame = await prisma.games.findFirst();

  if (!existingGame) {
    console.log("No games found in database. Please add a game first.");
    return;
  }

  console.log("=== Testing Prisma Migrations ===\n");

  console.log("1. Creating news for game:", existingGame.title);
  const news = await prisma.game_news.create({
    data: {
      game_id: existingGame.id,
      title: "Test News Article",
      content: "This is a test news article created via Prisma Client.",
    },
  });
  console.log("Created news:", news);

  console.log("\n2. Fetching game with is_multiplayer field and related news:");
  const gameWithNews = await prisma.games.findUnique({
    where: { id: existingGame.id },
    include: { game_news: true },
  });
  console.log("Game:", {
    id: gameWithNews?.id,
    title: gameWithNews?.title,
    is_multiplayer: gameWithNews?.is_multiplayer,
    news_count: gameWithNews?.game_news.length,
  });

  console.log("\n3. Fetching achievements (description field removed):");
  const achievements = await prisma.achievements.findMany({
    take: 3,
    select: {
      id: true,
      title: true,
      icon: true,
    },
  });
  console.log("Achievements (no description field):", achievements);

  console.log("\n4. All news in database:");
  const allNews = await prisma.game_news.findMany({
    include: { games: { select: { title: true } } },
  });
  console.log(allNews);

  console.log("\n=== All migrations verified successfully! ===");
}

main()
  .catch((e) => {
    console.error(e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
```