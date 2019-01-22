def team_menu
puts "Which team would you like to know about?"
array = []
 Team.all.each_with_index do|team, index|
   puts "#{index+1}. #{team.name}"
   array << team
 end
 input = gets.chomp
 puts "What do you want to know about the #{array[input.to_i-1].name}"




 menu_options(array[input.to_i-1])
end

def menu_options(team)
  puts "1. The chosen year roster"
  input = gets.chomp
  if input == 1
    getplayers(team)
  end

end

def getplayers(team)
  # binding.pry
  puts "\n\n The players on the #{team.name} are: "
  team.players.each_with_index do |player,index|
    puts "#{index+1}. #{player.full_name}"
  end
end
