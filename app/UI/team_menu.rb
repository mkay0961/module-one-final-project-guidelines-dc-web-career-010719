def team_menu
puts "Which team would you like to know about?"
 Team.all.each_with_index{|team, index| puts "#{index+1}. #{team.name}"}
 
end
