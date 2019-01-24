def team_menu
puts "Which team would you like to know about?"
array = []
 Team.all.each_with_index do|team, index|
   puts "#{index+1}. #{team.name}"
   array << team
 end
 input = gets.chomp
 #binding.pry
 system "clear"
 if input == "exit"
   exit_program

 elsif input.downcase == "restart"
   get_menu
 elsif (1..30).include?(input.to_i)
   menu_options(array[input.to_i-1])
 else system "clear"
   puts "Not a valid input. Please enter the index of the team you are searching for."
   sleep(2)
team_menu
 # elsif input
 #   puts "That is not a valid input. Try again."
 #   sleep(1.5)
 #   system "clear"
 #   team_menu
  end
end

def menu_options(team)
  system "clear"
  puts "What do you want to know about The #{team.name}?"
  puts "\n Enter the" + " keyword ".red + "or index of your choice"
  puts "1. Which players appeared on the" + " roster".red + " in 2018?"
  puts "2." + " Where ".red + "do they play?" #city #state #venue
  puts "3. What" + " league ".red + "are they in?"
  puts "4. What" + " division ".red + "are they in?"
  puts "5. What is the front office" + " phone ".red + "number?"
  puts "6. What is the url to their" + " website?".red
  puts "7." + " Restart ".red + "program"
  puts "8." + " Exit ".red + "the program"

  input = gets.chomp
  case input
  when "1" , "1.", "roster"
    system "clear"
    getplayers(team)
    #moreteam(team)
  when "2" , "2." , "where"
    system "clear"
    get_city_venue_state(team)
    moreteam(team)
  when "3" , "3.", "league"
    system "clear"
    get_league(team)
    moreteam(team)
  when "4" ,"4." ,"division"
    system "clear"
    get_division(team)
    moreteam(team)
  when "5", "5.", "phone"
    system "clear"
    get_phonenumber(team)
    moreteam(team)
  when "6",  "6.", "website"
    system "clear"
    get_link(team)
    moreteam(team)
  when "restart",  "7", "7.", "Restart"
    system "clear"
    get_menu
  when "exit",  "8", "8."
    system "clear"
    exit_program
  else puts "Not a valid input. Try again."
    sleep (1)
    menu_options(team)
  end

end

def getplayers(team)
  # binding.pry

  puts "The players on the #{team.name} are: "
  array = []
  team.players.each_with_index do |player,index|
    puts "#{index+1}. #{player.full_name}"
    array << player
  end
  # puts "\nWould you like to know more about a player or the team?"
  puts "\nTo see information about one of these players, enter their index now."
  puts "\nOtherwise:\nType " + "more".red + " to see information about the #{team.name}."
  puts "To select a new team or player, enter" + " restart".red
  puts "Enter" + " exit ".red + "to leave the database."
  input = gets.chomp.downcase

  if input == "exit"
    exit_program
  elsif input == "more"
    system "clear"
    menu_options(team)
  elsif input == "restart"
    system "clear"
    get_menu
  elsif (1..array.length).include?(input.to_i)
    player_info_menu(array[input.to_i-1])
  else puts "Not a valid input. Try again."
  sleep(1)
  system "clear"
  getplayers(team)
  end



end

def get_city_venue_state(team)
    puts "The #{team.name} are from #{team.city}, #{team.state}."
    puts "They play in #{team.venue}."
end

def get_league(team)
    puts "The #{team.name} are in the #{team.league}."
    #refactor to expand on NL to national league
end

def get_division(team)
  puts "The #{team.name} are in the #{team.division} division."
end

def get_phonenumber(team)
    puts "The phone number for the #{team.name} is #{team.phonenumber}."
end

def get_link(team)
  puts "The Website for the #{team.name} is #{team.link}."
  puts "Would you like to open their store website (Y/N)"
  input = gets.chomp.downcase
  if input == "y" || input == "yes"
    puts "opening..."
    sleep(0.5)
    system "clear"
    Launchy.open(team.link)
  else
    system "clear"
    #Launchy.open("google.com")
  end
end

def moreteam(team)
  puts "\nWould you like to find out" + " more ".red + "about the #{team.name}?"
  puts "Or maybe info about a" + " different ".red + "team?"
  puts "To select a new team or player, enter" + " restart".red
  puts "Exit ".red + "to leave the database."
  input = gets.chomp.downcase
  if input == "more" || input == "yes"
    system "clear"
    menu_options(team)
  elsif input == "exit"
    exit_program
  elsif input == "different"
    system "clear"
    team_menu
  elsif input == "restart"
    system "clear"
    get_menu
  else
    puts "Not a valid input. Try again."
    sleep(1)
    system "clear"
    moreteam(team)
  end
end
