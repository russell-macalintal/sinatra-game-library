user_list = {
  "ADMIN" => "ADMIN",
  "Mario" => "Peach",
  "Link" => "Zelda",
  "MasterChief" => "Cortana",
  "SolidSnake" => "Konami",
  "LaraCroft" => "Archaelogist",
  "Agent47" => "Baldy",
  "Pikachu" => "Ash",
  "Sonic" => "Spikes",
  "Gordon" => "Freeman",
  "Arthur" => "Dutch"
}

user_list.each do |name, password|
  User.create(username: name, password: password)
end

games_list = [
  "Legend of Zelda: Breath of the Wild",
  "Super Mario 64",
  "Metal Gear Solid V: The Phantom Pain",
  "Final Fantasy VII",
  "Half-Life 2",
  "Portal",
  "Minecraft",
  "Fortnite",
  "Starcraft 2",
  "Grand Theft Auto V",
  "The Last of Us",
  "Pac-Man",
  "Resident Evil 3",
  "Tetris",
  "Red Dead Redemption 2",
  "Death Stranding",
  "Animal Crossing: New Horizons",
  "Super Smash Brothers Ultimate",
  "Halo: Combat Evolved",
  "GoldenEye 007",
  "DOOM Eternal",
  "Pong",
  "Mortal Kombat",
  "Katamari Damacy",
  "Starfox 64",
  "Civilization IV",
  "Guitar Hero",
  "Fallout",
  "Batman: Arkham City",
  "Call of Duty: Modern Warfare"
]

games_list.each do |name|
  Game.create(name: name)
end

consoles_list = {
  "Switch" => "Nintendo",
  "Wii" => "Nintendo",
  "N64" => "Nintendo",
  "Gamecube" => "Nintendo",
  "Xbox One" => "Microsoft",
  "Xbox 360" => "Microsoft",
  "Xbox" => "Microsoft",
  "Playstation 4" => "Sony",
  "Playstation 3" => "Sony",
  "Playstation 2" => "Sony",
  "Playstation" => "Sony",
  "Dreamcast" => "Sega",
  "PC" => "OEM Manufacturers"
}

consoles_list.each do |name, manuf|
  Console.create(name: name, manufacturer: manuf)
end

User.all.each do |user|
  game_ids = (1..30).to_a.shuffle.pop(10)
  game_ids.each do |id|
    user.games << Game.find(id)
  end
  console_ids = (1..13).to_a.shuffle.pop(5)
  console_ids.each do |id|
    user.consoles << Console.find(id)
  end
end
