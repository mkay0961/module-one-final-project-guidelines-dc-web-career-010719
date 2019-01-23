def get_menu
  system "clear"
  puts "What would you like to know more about?
  1. Teams
  2. Players"
  input = gets.chomp
  if input == "1" || input == "1." || input.downcase.include?("team")
    sleep(0.5)
    system "clear"
    team_menu
  elsif input == "2" || input == "2." || input.downcase.include?("player")
    sleep(0.5)
    system "clear"
    player_menu
  else puts "That is not a valid input. Try again."
    sleep(0.5)
    system "clear"
    get_menu
  end
end


def exit_program
  puts "GOODBYE!!!"
end
