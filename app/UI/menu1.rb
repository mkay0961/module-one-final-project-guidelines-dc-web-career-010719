def get_menu
  system "clear"
  puts "This app allows you to search for information about players and their \nteams during the 2018 Season of Major League Baseball!"
  puts "\n\n"
  # puts "What would you like to know more about?
  # 1. Teams
  # 2. Players
  # 3. Exit"
  prompt = TTY::Prompt.new
  input = prompt.select("What would you like to know more about?") do |menu|
    menu.choice "Team", 1
    menu.choice "Player", 2
    menu.choice "Exit", 3
  end
  # puts input



  # input = gets.chomp
  if input == 1
    sleep(0.5)
    system "clear"
    team_menu
  elsif input == 2
    sleep(0.5)
    system "clear"
    player_menu
  elsif input == 3
    system "clear"
    exit_program
  # else puts "That is not a valid input. Try again."
  #   sleep(0.5)
  #   system "clear"
  #   get_menu
  end
end


def exit_program
  system "clear"
  pastel = Pastel.new
  font = TTY::Font.new(:starwars)
  puts pastel.decorate(font.write("GOODBYE!!!"), :black, :on_white, :bold)
  puts pastel.decorate("Thank you for using the MLB Database!".center(86), :black, :on_white, :bold)
  sleep(1)
end
