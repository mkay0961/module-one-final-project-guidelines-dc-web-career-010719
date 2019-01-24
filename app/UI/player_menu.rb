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

results = Player.all.select{|player| player.full_name.downcase.include?(input)}

  if results.length > 0
   x = results.map{|player| player}
   system "clear"
   puts "searching..."
   sleep(0.5)
  system "clear"
   puts "Select player:"
   x.each_with_index{|player, index| puts  "#{index+1}. #{player.full_name}"}
  else
    puts "searching..."
   puts "no players found"
   sleep(2)
   system "clear"
   player_menu
  end

 puts "Select your player by number"
 num = gets.chomp
 selected = x[num.to_i-1]
 puts selected.full_name
 player_info_menu(selected)
end
end


def player_info_menu(player)
  system "clear"
  puts "What would you like to know about #{player.full_name}?"
  puts "\n"
  puts "Select by index, or enter the" + " keyword".red
  puts "\n"
  puts "1. What" + " teams ".red + "have they played for?"
  puts "2. What" + " position ".red + "do they play?"
  puts "3. What is their jersey" + " number?".red
  puts "4. How" + " tall ".red + "are they?"
  puts "5. How" + " old ".red + "are they?"
  puts "6. Which side do they" + " bat ".red + "from?"
  puts "7. Which hand do they" + " throw ".red + "from?"
  puts "8. What is their" + " nickname ".red + "?"
  puts "9. What is their" + " twitter ".red + "handle?"
  puts "10." + " Restart ".red + "program"
  puts "11." + " Exit ".red + "the program"

  input = gets.chomp
  case input.downcase
  when "1", "1.", "team", "teams"
    system "clear"
    get_team(player)
    #moreplayer(player)
    # puts "#{player.full_name} played for:"
    # player.teams.each {|team| puts"#{team.name}"}
  when "2", "2.", "position"
    system "clear"
    get_position(player)
    moreplayer(player)
    # puts "#{player.full_name} primarily played #{player.position}"
  when "3", "3.", "number"
    system "clear"
    get_jersey_num(player)
    moreplayer(player)
    # puts "#{player.full_name} wore the number #{player.jersey_number}"
  when "4", "4.", "tall"
    system "clear"
    get_height(player)
    moreplayer(player)
    # puts "#{player.full_name} is #{player.height} inches tall."
  when "5", "5.", "old"
    system "clear"
    get_age(player)
    moreplayer(player)
    # puts "#{player.full_name} was #{player.age}."
  when "6", "6.", "bat"
    system "clear"
    get_bats(player)
    moreplayer(player)
    # puts "#{player.full_name} bats #{player.bats}."
  when "7", "7.", "throw"
    system "clear"
    get_throws(player)
    moreplayer(player)
    # puts "#{player.full_name} throws #{player.throws}."
  when "8", "8.", "nickname"
    system "clear"
    get_nickname(player)
    moreplayer(player)
    # puts "#{player.full_name} also goes by #{player.nickname}."
  when "9", "9.", "twitter"
    system "clear"
    get_twitter(player)
    moreplayer(player)
    # puts "#{player.full_name} is on twitter at  #{player.twitterid}."
  when "10", "10.", "restart"
    get_menu
  when "11", "11.", "exit"
    exit_program
  end
end


def get_team(player)
  puts "In 2018, #{player.full_name} played for:"
  array = []
  player.teams.each_with_index do |team,index|
    puts "#{index+1}. #{team.name}"
    array << team
  end
  puts "\nWould you like to know more about a team or the player?"
  puts "Player ".red + "for more player info."
  puts "Team index ".red + "for a team."
  puts "Restart ".red + "to select a new team or player."
  puts "Exit ".red + "to exit the database."
  input = gets.chomp.downcase
  if input == "exit"
    exit_program
  elsif input == "player"
    system "clear"
    player_info_menu(player)
  elsif input == "restart"
    system "clear"
    get_menu
  elsif (0..array.length).include?(input.to_i)
    menu_options(array[input.to_i-1])
  end


end

def get_position(player)
  puts "#{player.full_name} primarily played #{player.position}"
end

def get_jersey_num(player)
  puts "#{player.full_name} wore the number #{player.jersey_number}"
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
  puts "#{player.full_name} also goes by #{player.nickname}."
end

def get_twitter(player)
  puts "#{player.full_name} is on twitter at  #{player.twitterid}."
end

def moreplayer(player)
  puts "\nWould you like to find out more about #{player.full_name}?"
  puts "Y ".red + "for yes"
  puts "Exit ".red + "to exit"
  puts "D ".red + "for a different player"
  puts "Restart ".red + "to select a new team or player"
  input = gets.chomp.downcase
  if input == "y" || input == "yes"
    system "clear"
    player_info_menu(player)
  elsif input == "exit"
    exit_program
  elsif input == "d"
    system "clear"
    player_menu
  elsif input == "restart"
    system "clear"
    get_menu
  end
end
