def player_menu
  puts "Which player would you like to know about?"
  puts "Type a portion of their full name, or exit/restart:"
  input = gets.chomp.downcase
    if input.downcase == "exit"
      exit_program

    elsif
      input.downcase == "restart"
      get_menu
    else
      results(input)
    end
  end

  def results(input)
  choices =[]
  count = 0
  results = Player.all.select{|player| player.full_name.downcase.include?(input)}

  results.each do |player|
  hash = {name: "#{count+1}. #{player.full_name}"}
  hash.merge!(value: count)
  count+=1
  choices << hash
  end
  # binding.pry
  choices << {name: "Restart ".red + "program", value: 999}
  choices << {name: "Exit ".red + "the program", value: 888}
  prompt = TTY::Prompt.new
  input = prompt.select("Which team would you like to know about", choices, per_page:30 )
  if input == 888
    exit_program
  elsif input == 999
    system "clear"
    get_menu
  else
    puts results[input]
    player_info_menu(results[input])
  end
end

def player_info_menu(player)
  system "clear"

  prompt = TTY::Prompt.new
  input = prompt.select("What would you like to know about #{player.full_name}?", per_page: 11) do |menu|
    menu.choice "1. What" + " teams ".red + "have they played for?", 1
    menu.choice "2. What" + " position ".red + "do they play?", 2
    menu.choice "3. What is their" +" jersey number".red + "?", 3
    menu.choice "4. How" + " tall ".red + "are they?", 4
    menu.choice "5. How" + " old ".red + "are they?", 5
    menu.choice "6. Which side do they" + " bat ".red + "from?", 6
    menu.choice "7. Which hand do they" + " throw ".red + "from?", 7
    menu.choice "8. What is their" + " nickname".red + "?", 8
    menu.choice "9. What is their" + " twitter ".red + "handle?", 9
    menu.choice "10. Would you like to see some"+" STATS".red + "?", 10
    menu.choice "11." + " Restart ".red + "program", 11
    menu.choice "12." + " Exit ".red + "the program", 12
  end


  case input
  when 1
    system "clear"
    get_team(player)
  when 2
    system "clear"
    get_position(player)
    moreplayer(player)
  when 3
    system "clear"
    get_jersey_num(player)
    moreplayer(player)
  when 4
    system "clear"
    get_height(player)
    moreplayer(player)
  when 5
    system "clear"
    get_age(player)
    moreplayer(player)
  when 6
    system "clear"
    get_bats(player)
    moreplayer(player)
  when 7
    system "clear"
    get_throws(player)
    moreplayer(player)
  when 8
    system "clear"
    get_nickname(player)
    moreplayer(player)
  when 9
    system "clear"
    get_twitter(player)
    moreplayer(player)
  when 10
    get_stats(player.playerid)
  when 11
    get_menu
  when 12
    exit_program
  end
end


def get_team(player)
  prompt = TTY::Prompt.new
  choices =[]
  count = 0
  choices << {name: "Find" +" more ".red + "about #{player.full_name}", value: 777}
  if player.teams.length == 0
    puts "#{player.full_name} was not on an MLB team this season."
  else
  puts "In 2018, #{player.full_name} played for:"
  array = []
  player.teams.each_with_index do |team,index|
    puts "#{index+1}. #{team.name}"
    hash = {name: "Find more about the"+" #{team.name}".red}
    hash.merge!(value: count)
    count+=1
    choices << hash
    array << team
    end
  end
  choices << {name: "Restart ".red + "program", value: 999}
  choices << {name: "Exit ".red + "the program", value: 888}
  input = prompt.select("\nWhat would you like to do?", choices, per_page:30 )
  if input == 888
    exit_program
  elsif input == 777
    system "clear"
    player_info_menu(player)
  elsif input == 999
    system "clear"
    get_menu
  else
    menu_options(array[input])
  end
end

def get_position(player)
  puts "#{player.full_name} primarily played #{player.position}."
end

def get_jersey_num(player)
  puts "#{player.full_name} wore the number #{player.jersey_number}."
end

def get_height(player)
  puts "#{player.full_name} is #{player.height} inches tall."
end

def get_bats(player)
  puts "#{player.full_name} bats #{player.bats}."
end

def get_age(player)
  puts "#{player.full_name} was #{player.age}."
end

def get_throws(player)
  puts "#{player.full_name} throws #{player.throws}."
end

def get_nickname(player)
  if player.nickname.length == 0
    puts "#{player.full_name} does not have a nickname in our database."
  else
  puts "#{player.full_name} also goes by #{player.nickname}."
end
end

def get_twitter(player)
  if player.twitterid.length == 0
    puts "#{player.full_name} does not have a twitter account in our database."
  else
    puts "#{player.full_name} is on twitter at  #{player.twitterid}."
  end
end

def moreplayer(player)


  prompt = TTY::Prompt.new
  input = prompt.select("\nWhat would you like to do?", per_page: 10) do |menu|
    menu.choice "1. Find more about "+ "#{player.full_name}".red+"?", 1
    menu.choice "2. Select a" + " different player".red+"?", 2
    menu.choice "3." + " Restart ".red + "program", 3
    menu.choice "4." + " Exit ".red + "the program", 4
  end
  puts "\nWould you like to find out" + " more ".red + "about #{player.full_name}?"
  if input == 1
    system "clear"
    player_info_menu(player)
  elsif input == 4
    exit_program
  elsif input == 2
    system "clear"
    player_menu
  elsif input == 3
    system "clear"
    get_menu
  end
end
