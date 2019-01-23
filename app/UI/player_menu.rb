def player_menu
puts "Which player would you like to know about?"
puts "Type a portion of their full name:"
input = gets.chomp
 # Player.all.each_with_index{|player, index| puts "#{index+1}. #{player.full_name}"}
results = Player.all.select{|player| player.full_name.include?(input)}

  if results.length > 0
   x = results.map{|player| player}
   puts "searching..."
   sleep(0.5)
   puts "Select player:"
   x.each_with_index{|player, index| puts  "#{index+1}. #{player.full_name}"}
  else
    puts "searching..."
   puts "no players found"
   sleep(2)
   system "clear"
   player_menu
  end
# binding.pry

 puts "Select your player by number"
 num = gets.chomp
 selected = x[num.to_i-1]
 puts selected.full_name
 player_info_menu(selected)

end


def player_info_menu(player)
puts "\n\n"
  puts "What would you like to know about #{player.full_name}?"
  puts "\n"
  puts "Select by index, or enter the" + " keyword".red
  puts "\n"
  puts "1. What" + " team ".red + "did he play for this season?"
  puts "2. What" + " position ".red + "do they play?"
  puts "3. What is their jersey" + " number?".red
  puts "4. How" + " tall ".red + "are they?"
  puts "5. How" + " old ".red + "are they?"
  puts "6. Which side do they" + " bat ".red + "from?"
  puts "7. Which hand do they" + " throw ".red + "from?"
  puts "8. What is their" + " nickname ".red + "?"
  puts "9. What is their" + " twitter ".red + "handle?"

  input = gets.chomp
  case input
  when "1"
    puts "#{player.full_name} played for #{player.teams[0].name}"
  when "team"
    puts "#{player.full_name} played for #{player.teams[0].name}"
  when "2"
    puts "#{player.full_name} primarily played #{player.position}"
  when "position"
    puts "#{player.full_name} primarily played #{player.position}"
  when "3"
    puts "#{player.full_name} wore the number #{player.jersey_number}"
  when "number"
    puts "#{player.full_name} wore the number #{player.jersey_number}"
  when "4"
    puts "#{player.full_name} is #{player.height} inches tall."
  when "tall"
    puts "#{player.full_name} is #{player.height} inches tall."
  when "5"
    puts "#{player.full_name} was #{player.age}."
  when "old"
    puts "#{player.full_name} was #{player.age}."
  when "6"
    puts "#{player.full_name} bats #{player.bats}."
  when "bat"
    puts "#{player.full_name} bats #{player.bats}."
  when "7"
    puts "#{player.full_name} throws #{player.throws}."
  when "throw"
    puts "#{player.full_name} was #{player.throws}."
  when "8"
    puts "#{player.full_name} also goes by #{player.nickname}."
  when "nickname"
    puts "#{player.full_name} also goes by #{player.nickname}."
  when "9"
    puts "#{player.full_name} is on twitter at  #{player.twitterid}."
  when "twitter"
    puts "#{player.full_name} is on twitter at  #{player.twitterid}."
  end

end
