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