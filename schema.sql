-- Create the games table
CREATE TABLE games (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    image_url TEXT NOT NULL,
    description TEXT NOT NULL
);

-- Create the users table
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

-- Create a table to track user libraries
CREATE TABLE user_games (
    user_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (game_id) REFERENCES games(id)
);

-- Insert sample data into the games table
INSERT INTO games (title, image_url, description) VALUES
('Cyberpunk 2077', 'images/cyberpunk2077.jpg', 'An open-world RPG set in a dystopian future with advanced cybernetics and immersive storytelling.'),
('Call of Duty: Modern Warfare', 'images/callofduty.jpg', 'A first-person shooter with intense combat and a compelling single-player campaign.'),
('The Legend of Zelda: Breath of the Wild', 'images/zelda_breath_of_the_wild.jpg', 'An expansive open-world adventure with stunning visuals and intricate puzzles.'),
('Minecraft', 'images/minecraft.jpg', 'A sandbox game where you can build, explore, and survive in a blocky, procedurally generated world.'),
('Red Dead Redemption 2', 'images/reddeadredemption2.jpg', 'An epic western action-adventure with a richly detailed open world and gripping narrative.'),
('Fortnite', 'images/fortnite.jpg', 'A battle royale game with a unique building mechanic and colorful graphics.'),
('The Witcher 3: Wild Hunt', 'images/witcher3wildhunt.jpg', 'An action RPG featuring a deep story, engaging quests, and a vast fantasy world.'),
('Hades', 'images/hades.jpg', 'A rogue-like dungeon crawler with fast-paced combat and a unique take on Greek mythology.'),
('Among Us', 'images/amongus.jpg', 'A multiplayer party game where players must complete tasks and identify impostors among the crew.'),
('Doom Eternal', 'images/doometernal.jpg', 'A fast-paced first-person shooter with intense combat and a heavy metal soundtrack.'),
('Animal Crossing: New Horizons', 'images/animalcrossing.jpg', 'A life simulation game where you build and manage a community on a deserted island.'),
('Star Wars Jedi: Fallen Order', 'images/starwarsjedifallenorder.jpg', 'An action-adventure game set in the Star Wars universe with lightsaber combat and exploration.'),
('Fall Guys: Ultimate Knockout', 'images/fallguys.jpg', 'A whimsical battle royale game where players compete in obstacle courses and mini-games.'),
('Genshin Impact', 'images/genshinimpact.jpg', 'An open-world action RPG with gacha mechanics and beautiful anime-style graphics.'),
('Overwatch', 'images/overwatch.jpg', 'A team-based shooter with diverse heroes and unique abilities.'),
('Sekiro: Shadows Die Twice', 'images/sekiro.jpg', 'An action-adventure game with challenging combat and a focus on stealth and exploration.'),
('Control', 'images/control.jpg', 'A third-person action-adventure game with telekinetic powers and a mysterious story.'),
('Death Stranding', 'images/deathstranding.jpg', 'An action game with unique delivery mechanics and a narrative set in a post-apocalyptic world.'),
('Hollow Knight', 'images/hollowknight.jpg', 'A Metroidvania-style game with intricate level design and challenging combat.'),
('The Elder Scrolls V: Skyrim', 'images/skyrim.jpg', 'An open-world RPG with a vast fantasy world and endless quests.'),
('Divinity: Original Sin 2', 'images/divinityoriginalsin2.jpg', 'A critically acclaimed RPG with deep tactical combat and a rich narrative.'),
('Far Cry 5', 'images/farcry5.jpg', 'An open-world shooter set in Montana with a focus on freedom of exploration and combat.'),
('Ghost of Tsushima', 'images/ghostoftsushima.jpg', 'An action-adventure game set in feudal Japan with beautiful landscapes and intense swordplay.'),
('Persona 5', 'images/persona5.jpg', 'A stylish JRPG with a gripping story and deep character development.'),
('Bloodborne 2', 'images/bloodborne2.jpg', 'A dark and atmospheric action RPG set in a gothic horror world.'),
('Nier: Automata', 'images/nierautomata.jpg', 'An action RPG with a thought-provoking story and fast-paced combat.'),
('Monster Hunter: World', 'images/monsterhunterworld.jpg', 'An action RPG where you hunt gigantic monsters in a beautifully crafted world.');
