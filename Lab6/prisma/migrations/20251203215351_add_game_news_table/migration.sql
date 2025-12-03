-- CreateTable
CREATE TABLE "game_news" (
    "id" SERIAL NOT NULL,
    "game_id" INTEGER NOT NULL,
    "title" VARCHAR(200) NOT NULL,
    "content" TEXT NOT NULL,
    "published_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "game_news_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "game_news" ADD CONSTRAINT "game_news_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "games"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
