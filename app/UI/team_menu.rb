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
 elsif input.length > 0
   puts "What do you want to know about the #{array[input.to_i-1].name}"
   menu_options(array[input.to_i-1])
 # elsif input
 #   puts "That is not a valid input. Try again."
 #   sleep(1.5)
 #   system "clear"
 #   team_menu
  end
end

def menu_options(team)
  puts "1. The chosen year" + " roster".red
  puts "2." + " Where ".red + "do they play?" #city #state #venue
  puts "3. What" + " league ".red + "are they in?"
  puts "4. What" + " division ".red + "are they in?"
  puts "5. What is there" + " phone number?".red
  puts "6. What is there" + " website?".red
  puts "7." + " Restart ".red + "program"
  puts "8." + " Exit ".red + "the program"

  input = gets.chomp
  case input
  when "1" , "1.", "roster"
    system "clear"
    getplayers(team)
    moreteam(team)
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
  when "5", "5.", "phone number"
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
  end

end

def getplayers(team)
  # binding.pry
  puts "The players on the #{team.name} are: "
  team.players.each_with_index do |player,index|
    puts "#{index+1}. #{player.full_name}"
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
  puts "Would you like to open there website (Y/N)"
  input = gets.chomp.downcase
  if input == "y" || input == "yes"
    puts "opening..."
    sleep(0.5)
    #Launchy.open(team.link)
    Launchy.open("google.com")
  end
end

def moreteam(team)
  puts "\nWould you like to find out more about the #{team.name}?"
  puts "("+" Y ".red + "for yes," + " Exit ".red + "to exit," + " D ".red + "for a different team)"
  input = gets.chomp.downcase
  if input == "y" || input == "yes"
    system "clear"
    menu_options(team)
  elsif input == "exit"
    exit_program
  elsif input == "d"
    system "clear"
    team_menu
  end
end
