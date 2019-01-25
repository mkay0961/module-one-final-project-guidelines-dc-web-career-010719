require_relative '../config/environment'

Player.destroy_all


class GetPlayers

  URL = "http://lookup-service-prod.mlb.com/json/named.search_player_all.bam?sport_code='mlb'&active_sw='Y'&name_part='%25'"
  def get_players
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_JSON
    return teams = JSON.parse(self.get_players)
  end


end



puts "Time to create the players"
puts "This is going to take a min"
bar = TTY::ProgressBar.new("Seeding Player Database [:bar]", total: 2997,  head: '>')

players = GetPlayers.new
hash2 = players.parse_JSON
count = 0
hash2["search_player_all"]["queryResults"]["row"].each do |player|
  id = player["player_id"]
  url = "http://lookup-service-prod.mlb.com/json/named.player_info.bam?sport_code='mlb'&player_id=" + id
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)
  player = JSON.parse(response.body)
  hash3 = player["player_info"]["queryResults"]["row"]

  full_name = hash3["name_display_first_last"]
  position = hash3["primary_position_txt"]
  jersey_number = hash3["jersey_number"].to_i
  age = hash3["age"].to_i
  bats = hash3["bats"]
  twitter = hash3["twitter_id"]
  throw = hash3["throws"]
  nickname =hash3["name_nick"]
  playerid = hash3["player_id"]
  heightInch = hash3["height_inches"]
  heightFeet = hash3["height_feet"]
  height = (heightFeet.to_i*12)+ heightInch.to_i
  #sleep(0.1)

  # case count
  # when 100
  #   system "clear"
  #   puts "We are on the way to a full database!"
  # when 500
  #   system "clear"
  #   puts "Making progress"
  # when 1000
  #   system "clear"
  #   puts "Wow Making some amaizing progress "
  # when 1500
  #   system "clear"
  #   puts "HALF WAY"
  # when 1700
  #   system "clear"
  #   puts "Almost there"
  # when 2000
  #   system "clear"
  #   puts "So close to being done with players"
  # when 2500
  #   system "clear"
  #   puts "SOOOOOOOO close"
  # end
  Player.find_or_create_by(full_name: full_name, position: position, jersey_number: jersey_number, height: height, age: age, bats: bats, twitterid: twitter, throws: throw, nickname:nickname, playerid: playerid)
  sleep(0.1)
  bar.advance(1)
  count +=1
end

# system "clear"
puts "All the PLAYER were created!!!!"
# sleep(3)
# system "clear"
puts "\n\nENTER 'rake db:seed3'"
