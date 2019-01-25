def player_menu
  system "clear"
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do

    "*|   PLAYERS   |*\nWhich player would you like to know about?"
  end
  puts box
  # puts "Which player would you like to know about?"
  puts "Type a portion of their full name, or exit/restart:"
  input = gets.chomp.downcase
    if input.downcase == "exit"
      exit_program
    elsif
      input.downcase == "restart"
      get_menu
    else
      puts "searching..."
      sleep(2)
      system "clear"
      results(input)
    end
  end

  def results(input)
    choices =[]
    count = 0
    results = Player.all.select{|player| player.full_name.downcase.include?(input)}
    if results.length == 0
      puts "No players found"
      sleep(1)
      system "clear"
      player_menu
    end
    box = TTY::Box.frame(
      width: TTY::Screen.cols - (TTY::Screen.cols/2),
      height: 10,
      align: :center,
      padding: 3
    ) do
      "Player Results"
    end
    puts box
    results.each do |player|
      hash = {name: "#{count+1}. #{player.full_name}"}
      hash.merge!(value: count)
      count+=1
      choices << hash
    end
    choices << {name: "Find a new "+"player".red, value: 7777}
    choices << {name: "Restart ".red + "program", value: 999}
    choices << {name: "Exit ".red + "the program", value: 888}
    prompt = TTY::Prompt.new
    input = prompt.select("Which player would you like to know about", choices, per_page: (TTY::Screen.lines - (TTY::Screen.lines/2)) )
    if input == 888
      exit_program
    elsif input == 999
      system "clear"
      get_menu
    elsif input == 7777
      system "clear"
      player_menu
    else
      puts results[input]
      player_info_menu(results[input])
    end
end

def player_info_menu(player)
  system "clear"
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "*|  #{player.full_name}  |*"
  end
  puts box
  prompt = TTY::Prompt.new
  input = prompt.select("What would you like to know about #{player.full_name}?", per_page: (TTY::Screen.lines - 5)) do |menu|
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
    menu.choice "11. Search for a new"+" player".red + "?", 11
    menu.choice "12." + " Restart ".red + "program", 12
    menu.choice "13." + " Exit ".red + "the program", 13
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
    player_menu
  when 12
    get_menu
  when 13
    exit_program
  end
end


def get_team(player)
  prompt = TTY::Prompt.new
  choices =[]
  count = 0
  choices << {name: "Find" +" more ".red + "about #{player.full_name}", value: 7777}
  if player.teams.length == 0
    puts "#{player.full_name} was not on an MLB team this season."
  else



    str = "In 2018, #{player.full_name} played for: "
    array = []
    player.teams.each_with_index do |team,index|
      str += "\n#{index+1}. #{team.name}"
      hash = {name: "Find more about the"+" #{team.name}".red}
      hash.merge!(value: count)
      count+=1
      choices << hash
      array << team
    end
  end

  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    str
  end
  puts box
  choices << {name: "Restart ".red + "program", value: 9999}
  choices << {name: "Exit ".red + "the program", value: 8888}
  input = prompt.select("\nWhat would you like to do?", choices, per_page: (TTY::Screen.lines - 5) )
  if input == 8888
    exit_program
  elsif input == 7777
    system "clear"
    player_info_menu(player)
  elsif input == 9999
    system "clear"
    get_menu
  else
    menu_options(array[input])
  end
end

def get_position(player)
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "#{player.full_name} primarily played #{player.position}."
  end
  puts box

  # puts "#{player.full_name} primarily played #{player.position}."
end

def get_jersey_num(player)
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "#{player.full_name} wore the number #{player.jersey_number}."
  end
  puts box

  # puts "#{player.full_name} wore the number #{player.jersey_number}."
end

def get_height(player)
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "#{player.full_name} is #{player.height} inches tall."
  end
  puts box

  # puts "#{player.full_name} is #{player.height} inches tall."
end

def get_bats(player)
  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "#{player.full_name} bats #{player.bats}."
  end
  puts box

  # puts "#{player.full_name} bats #{player.bats}."
end

def get_age(player)

  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "#{player.full_name} was #{player.age}."
  end
  puts box

  # puts "#{player.full_name} was #{player.age}."
end

def get_throws(player)

  box = TTY::Box.frame(
    width: TTY::Screen.cols - (TTY::Screen.cols/2),
    height: 10,
    align: :center,
    padding: 3
  ) do
    "#{player.full_name} throws #{player.throws}."
  end
  puts box

  # puts "#{player.full_name} throws #{player.throws}."
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
  input = prompt.select("\nWhat would you like to do?", per_page: (TTY::Screen.lines - 5)) do |menu|
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
