def team_menu
# puts "Which team would you like to know about?"
array = []
choices = []
count =0
 Team.all.each_with_index do|team, index|
   hash = {name: "#{index+1}. #{team.name}"}
   hash.merge!(value: count)
   count+=1
   array << team
   choices << hash


 end
 choices << {name: "Restart ".red + "program", value: 999}
 choices << {name: "Exit ".red + "the program", value: 888}
 prompt = TTY::Prompt.new
 input = prompt.select("Which team would you like to know about", choices, per_page: choices.size )
 puts input
 if input == 888
   exit_program
 elsif input == 999
   system "clear"
   get_menu
 else
    menu_options(array[input])
 end
end

def menu_options(team)
  system "clear"

  prompt = TTY::Prompt.new
  input = prompt.select("What do you want to know about The #{team.name}?", per_page: 8) do |menu|
    menu.choice "1. Which players appeared on the" + " roster".red + " in 2018?", 1
    menu.choice "2." + " Where ".red + "do they play?", 2
    menu.choice "3. What" + " league ".red + "are they in?", 3
    menu.choice "4. What" + " division ".red + "are they in?", 4
    menu.choice "5. What is the front office" + " phone ".red + "number?", 5
    menu.choice "6. What is the url to their" + " website?".red, 6
    menu.choice "7." + " Restart ".red + "program", 7
    menu.choice "8." + " Exit ".red + "the program", 8
  end

  case input
  when 1
    system "clear"
    getplayers(team)
    #moreteam(team)
  when 2
    system "clear"
    get_city_venue_state(team)
    moreteam(team)
  when 3
    system "clear"
    get_league(team)
    moreteam(team)
  when 4
    system "clear"
    get_division(team)
    moreteam(team)
  when 5
    system "clear"
    get_phonenumber(team)
    moreteam(team)
  when 6
    system "clear"
    get_link(team)
    moreteam(team)
  when 7
    system "clear"
    get_menu
  when 8
    system "clear"
    exit_program
  end

end

def getplayers(team)
  # binding.pry
  prompt = TTY::Prompt.new
  choices =[]
  count = 0
  choices << {name: "Find" +" more ".red + "about #{team.name}\n", value: 777}

  puts "The players on the #{team.name} are: "
  array = []
  team.players.each_with_index do |player,index|
    hash = {name: "Info about: "+"#{player.full_name}".red}
    hash.merge!(value: count)
    count+=1
    choices << hash
    array << player
  end
  choices << {name: "Restart ".red + "program", value: 999}
  choices << {name: "Exit ".red + "the program", value: 888}
  input = prompt.select("\nWhat would you like to do?", choices, per_page:20 )



  if input == 888
    exit_program
  elsif input == 777
    system "clear"
    menu_options(team)
  elsif input == 999
    system "clear"
    get_menu
  else
    #binding.pry
    player_info_menu(array[input])
  end

end

def get_city_venue_state(team)
    puts "The #{team.name} are from #{team.city}, #{team.state}."
    puts "They play in #{team.venue}."
end

def get_league(team)
    puts "The #{team.name} are in the #{team.league}."
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
  prompt = TTY::Prompt.new
  input = prompt.select("\nWhat would you like to do?", per_page: 10) do |menu|
    menu.choice "1. Find more about the "+ "#{team.name}".red+"?", 1
    menu.choice "2. Select a" + " different team".red+"?", 2
    menu.choice "3." + " Restart ".red + "program", 3
    menu.choice "4." + " Exit ".red + "the program", 4
  end
  if input == 1
    system "clear"
    menu_options(team)
  elsif input == 4
    exit_program
  elsif input == 2
    system "clear"
    team_menu
  elsif input == 3
    system "clear"
    get_menu
  end
end
