def get_menu
  puts "What would you like to know more about?
  1. Teams
  2. Players"
  input = gets.chomp
  if input == "1" || input == "1."
    team_menu
  elsif input == "2" || input == "2."
    player_menu
  else puts "Input 1 or 2"
  end
end
