def get_menu
  puts "What would you like to know more about?
  1. Teams
  2. Players"
  input = gets.chomp
  if input == "1" || input == "1." || input.downcase.include?("team")
    team_menu
  elsif input == "2" || input == "2." || input.downcase.include?("player")
    player_menu
  else puts "That is not a valid input. Try again."
    get_menu
  end
end
