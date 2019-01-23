def player_menu
puts "Which player would you like to know about?"
input = gets.chomp
 # Player.all.each_with_index{|player, index| puts "#{index+1}. #{player.full_name}"}
results = Player.all.select{|player| player.full_name.include?(input)}

  if results.length > 0
   x = results.each_with_index.map{|player, index|  "#{index+1}. #{player.full_name}"}
   puts x
  else
   puts "no players found"
  end


 puts "Select your player by number"
 num = gets.chomp
 selected = x[num.to_i-1]
 puts selected




end
