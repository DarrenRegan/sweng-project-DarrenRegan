# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
game_genres = [
    {:title => 'Fighting', :difficulty => 10, :description => "Focus on action on combat"},
    {:title => 'Puzzle', :difficulty => 5, :description => "Requires player to solve a problem to advance"},
    {:title => 'FPS', :difficulty => 5, :description => "Use weapons to engage in action, from the characters viewpoint"},
    {:title => 'Roguelikes', :difficulty => 8, :description => "Difficult Dungeon Crawler with random level generations"},
    {:title => 'Sandbox', :difficulty => 1, :description => "Open-world free form game"},
    {:title => 'RTS', :difficulty => 10, :description => "Strategy game, collect resources and maintain an army"},
    {:title => 'MMORPG', :difficulty => 4, :description => "Thousands of players in a world with a similar objective"}]
game_genres.each do |gamegenres|
  Gamegenre.create!(gamegenres)
end
