def team_menu
  array = []
  choices = []
  count =0
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "*|  TEAMS  |*"
  end
  puts box
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
   input = prompt.select("Which team would you like to know about", choices, per_page: (TTY::Screen.lines - 5))
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
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "*|  #{team.name}  |*"
  end
  puts box
  prompt = TTY::Prompt.new
  input = prompt.select("What do you want to know about The #{team.name}?", per_page: (TTY::Screen.lines - 5)) do |menu|
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
    moreteam(team)
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
  prompt = TTY::Prompt.new
  choices =[]
  count = 0
  choices << {name: "Find" +" more ".red + "about #{team.name}\n", value: 7777}

  # puts "The players on the #{team.name} are: "

  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "The players on the #{team.name} are"
  end
  puts box
  array = []
  team.players.each_with_index do |player,index|
    hash = {name: "More info on "+"#{player.full_name}".red}
    hash.merge!(value: count)
    count+=1
    choices << hash
    array << player
  end
  choices << {name: "Restart ".red + "program", value: 9999}
  choices << {name: "Exit ".red + "the program", value: 8888}
  input = prompt.select("\nWhat would you like to do?", choices, per_page:(TTY::Screen.lines - (TTY::Screen.lines/2)))
  if input == 8888
    exit_program
  elsif input == 7777
    system "clear"
    menu_options(team)
  elsif input == 9999
    system "clear"
    get_menu
  else
    player_info_menu(array[input])
  end
end


def get_city_venue_state(team)
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
     "The #{team.name} are from #{team.city}, #{team.state}.\n They play in #{team.venue}."
  end
    puts box
end

def get_league(team)
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
     "The #{team.name} are in the #{team.league}."
  end
    puts box
end

def get_division(team)
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
     "The #{team.name} are in the #{team.division} division."
  end
    puts box
end

def get_phonenumber(team)
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
     "The phone number for the #{team.name} is #{team.phonenumber}."
  end
    puts box
end

def get_link(team)
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
     "The Website for the #{team.name} is #{team.link}."
  end
  puts box
  puts "Would you like to open their store website (Y/N)"
  input = gets.chomp.downcase
  if input == "y" || input == "yes"
    puts "opening..."
    sleep(0.5)
    system "clear"
    Launchy.open(team.link)
  else
    system "clear"
  end
end

def moreteam(team)
  prompt = TTY::Prompt.new


  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
     "Players on the #{team.name}"
  end
  # puts box
  input = prompt.select("What would you like to do?", per_page: (TTY::Screen.lines - 5)) do |menu|
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
