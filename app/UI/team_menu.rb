def team_menu
puts "Which team would you like to know about?"
array = []
 Team.all.each_with_index do|team, index|
   puts "#{index+1}. #{team.name}"
   array << team
 end
 input = gets.chomp
 system "clear"
 puts "What do you want to know about the #{array[input.to_i-1].name}"
 menu_options(array[input.to_i-1])
end

def menu_options(team)
  puts "1. The chosen year roster"
  puts "2. Where do they play?" #city #state #venue
  puts "3. What league are they in?"
  puts "4. What division are they in?"
  puts "5. What is there phone number?"
  puts "6. What is there Website?"



  input = gets.chomp
  case input
  when "1" , "1."
    system "clear"
    getplayers(team)
  when "2" , "2."
    system "clear"
    get_city_venue_state(team)
  when "3" , "3."
    system "clear"
    get_league(team)
  when "4" ,"4."
    system "clear"
    get_division(team)
  when "5" , "5."
    system "clear"
    get_phonenumber(team)
  when "6",  "6."
    system "clear"
    get_link(team)
  end
end

def getplayers(team)
  # binding.pry
  puts "The players on the #{team.name} are: "
  team.players.each_with_index do |player,index|
    puts "#{index+1}. #{player.full_name}"
  end
end

def get_city_venue_state(team)
    puts "The #{team.name} are from #{team.city}, #{team.state}."
    puts "They play in #{team.venue}."
end

def get_league(team)
    puts "The #{team.name} are in the #{team.league}."
    #refactor to expand on NL to national league
end

def get_division(team)
  puts "The #{team.name} are in the #{team.division} division."
end

def get_phonenumber(team)
    puts "The phone number for the #{team.name} is #{team.phonenumber}."
end

def get_link(team)
  puts "The Website for the #{team.name} is #{team.link}."
  puts "Would you like to open there website (Y/N)"
  input = gets.chomp.downcase
  if input == "y" || input == "yes"
    puts "opening..."
    sleep(0.5)
    #Launchy.open(team.link)
    Launchy.open("google.com")
  else
    puts "this should do something"
  end
end
