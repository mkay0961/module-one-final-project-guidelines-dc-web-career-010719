def get_menu
  system "clear"
  puts "This app allows you to search for information about players and their \nteams during the 2018 Season of Major League Baseball!"
  puts "\n\n"
  puts "What would you like to know more about?
  1. Teams
  2. Players
  3. Exit"

  input = gets.chomp
  if input == "1" || input == "1." || input.downcase.include?("team")
    sleep(0.5)
    system "clear"
    team_menu
  elsif input == "2" || input == "2." || input.downcase.include?("player")
    sleep(0.5)
    system "clear"
    player_menu
  elsif input == "exit" || input == "3" || input == "3."
    system "clear"
    exit_program
  else puts "That is not a valid input. Try again."
    sleep(0.5)
    system "clear"
    get_menu
  end
end


def exit_program
  system "clear"
  puts <<-'EOF'

    ____   ___    ___   ____   ____ __   __ _____  _  _
   / ___| / _ \  / _ \ |  _ \ | __ )\ \ / /| ____|| || |
  | |  _ | | | || | | || | | ||  _ \ \ V / |  _|  | || |
  | |_| || |_| || |_| || |_| || |_) | | |  | |___ |_||_|
   \____| \___/  \___/ |____/ |____/  |_|  |_____|(_)(_)


  EOF
  puts "Thank you for using the MLB Database!"
  sleep(2)
end
