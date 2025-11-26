ALTER TABLE reviews ALTER COLUMN user_id DROP NOT NULL;
--
ALTER TABLE reviews
DROP CONSTRAINT reviews_user_id_fkey,  
ADD CONSTRAINT reviews_user_id_fkey 
FOREIGN KEY (user_id) REFERENCES users(id) 
ON DELETE SET NULL;
--
ALTER TABLE reviews 
DROP CONSTRAINT reviews_game_id_fkey,
ADD CONSTRAINT reviews_game_id_fkey 
FOREIGN KEY (game_id) REFERENCES games(id) 
ON DELETE CASCADE;
--
ALTER TABLE saves
DROP CONSTRAINT saves_game_id_fkey, 
ADD CONSTRAINT saves_game_id_fkey 
FOREIGN KEY (game_id) REFERENCES games(id) 
ON DELETE CASCADE;
--
ALTER TABLE saves
DROP CONSTRAINT saves_user_id_fkey,
ADD CONSTRAINT saves_user_id_fkey 
FOREIGN KEY (user_id) REFERENCES users(id) 
ON DELETE CASCADE;
--
ALTER TABLE achievements
DROP CONSTRAINT achievements_game_id_fkey, 
ADD CONSTRAINT achievements_game_id_fkey 
FOREIGN KEY (game_id) REFERENCES games(id) 
ON DELETE CASCADE;
--