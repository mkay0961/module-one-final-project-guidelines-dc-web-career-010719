def player_menu
puts "Which player would you like to know about?"
puts "Type a portion of their full name, or exit/restart:"
input = gets.chomp
if input.downcase == "exit"
  exit_program

elsif
  input.downcase == "restart"
  get_menu
else

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
end


def player_info_menu(player)
  system "clear"
puts "\n\n"
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
  puts "10. Restart"
  puts "11. Quit"

  input = gets.chomp
  case input.downcase
  when "1", "1.", "team"
    puts "#{player.full_name} played for:"
    player.teams.each {|team| puts"#{team.name}"}
  when "2", "2.", "position"
    puts "#{player.full_name} primarily played #{player.position}"
  when "3", "3.", "number"
    puts "#{player.full_name} wore the number #{player.jersey_number}"
  when "4", "4.", "tall"
    puts "#{player.full_name} is #{player.height} inches tall."
  when "5", "5.", "old"
    puts "#{player.full_name} was #{player.age}."
  when "6", "6.", "bat"
    puts "#{player.full_name} bats #{player.bats}."
  when "7", "7.", "throw"
    puts "#{player.full_name} throws #{player.throws}."
  when "8", "8.", "nickname"
    puts "#{player.full_name} also goes by #{player.nickname}."
  when "9", "9.", "twitter"
    puts "#{player.full_name} is on twitter at  #{player.twitterid}."
  when "10", "10.", "restart"
    get_menu
  when "11", "11.", "quit"
    exit_program
  end

end
