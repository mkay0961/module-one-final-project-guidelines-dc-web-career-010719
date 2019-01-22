def player_menu
puts "Which player would you like to know about?"
 Player.all.each_with_index{|player, index| puts "#{index+1}. #{player.full_name}"}

end
