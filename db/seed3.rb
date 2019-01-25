require_relative '../config/environment'

PlayerTeam.destroy_all


puts "Time to create the Join Table"
puts "This is going to take another min"


count2 =0
Player.all.each do |player|
  url = "http://lookup-service-prod.mlb.com/json/named.player_teams.bam?season='2018'&player_id="
  url +=player.playerid
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)
  x = JSON.parse(response.body)
  if x["player_teams"]["queryResults"]["row"].class == Hash
    if x["player_teams"]["queryResults"]["row"]["sport_code"] == "mlb"
      team = Team.find_by(teamid: x["player_teams"]["queryResults"]["row"]["team_id"])
      PlayerTeam.find_or_create_by(player: player, team: team)
    end
  elsif x["player_teams"]["queryResults"]["row"].class == Array

    x["player_teams"]["queryResults"]["row"].each do |element|
      if element["sport_code"] == "mlb"
        specteam = Team.find_by(teamid: element["team_id"])
        PlayerTeam.find_or_create_by(player: player, team: specteam)
      end
    end
  end
  print "."
  case count2
  when 100
    system "clear"
    puts "We are on the way to a full database!"
  when 500
    system "clear"
    puts "Making progress"
  when 1000
    system "clear"
    puts "Wow Making some amaizing progress "
  when 1500
    system "clear"
    puts "HALF WAY"
  when 1700
    system "clear"
    puts "Almost there"
  when 2000
    system "clear"
    puts "So close to being done with join table"
  when 2500
    system "clear"
    puts "SOOOOOOOO close"
  end
  #sleep(0.1)
  count2+=1
end

system "clear"
puts "The join table was CREATED!!!!!!"
sleep(3)
system "clear"
puts "TIME to run the program"
puts "enter 'ruby bin/run.rb "
